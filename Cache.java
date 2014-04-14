
public class Cache {

    public int capacity; // in Bytes
    public int blockSize; // in Bytes
    public int associativity; // 1 for 1-way set associative, etc.
    
    // Modify the constructor to properly initialize these variables
    public int nSets; 
    public int nTotalCacheLines; 
    public int nOffsetBits;
    public int nIndexBits;
    public int nTagBits;
	
	//Customized
	public int dirtyCount = 0;
    public int accessTime = 0;
    public int loadCount = 0;
        
    // don't touch!
    public final int addressSize = 32; // in bits
    
    // tags are big numbers, store them as longs
    // 2D Arrays: first dimension = which set, second dimension = which way
    // (at first, begin with a direct mapped cache; use [0] for the second dimension)
    public long[][] cacheTags = null; 
    public boolean[][] dirtyBits = null;
    // only 1 dimension b/c LRU field is for the entire set
    // ignore this until you begin support for the n-way set associative cache
    public int[][] LRU_way= null;
    
    // whether the most recent cache access resulted in a dirity eviction
    public boolean dirtyEvic_f = false;

    public boolean victim_f = false;
    
    public Cache(int capacity, int blockSize, int associativity) {

	dirtyCount = 0;
    accessTime = 0;

	this.capacity = capacity; // in B
	this.blockSize = blockSize; // in B
	this.associativity = associativity; // 1, 2, 3... etc.
	
	// FIX THIS CODE!
	// first, set the 5 "n" variables. THESE ARE ALL WRONG
	nSets = this.capacity/(this.blockSize*this.associativity); 
	nTotalCacheLines = this.capacity/this.blockSize; 
	nOffsetBits = log2(this.blockSize);
	nIndexBits = log2(this.capacity) - (log2(this.blockSize) + log2(this.associativity));
	nTagBits = this.addressSize - nOffsetBits - nIndexBits;
	
	// next create the cache tags
	// Note; this is also incorrect (it shouldn't be a 1 x 1 cache)
	cacheTags = new long[nSets][this.associativity];
	dirtyBits = new boolean[nSets][this.associativity];
	LRU_way = new int[nSets][associativity];
	
	// initializes cache tags to 0, dirty bits to false, and LRU bits to 0
	// this code is correct EXCEPT the for-loops should not stop at [1][1]
	for (int i = 0; i < nSets; i++) {
	    for (int j = 0; j < this.associativity; j++) {
			cacheTags[i][j] = 0;
			dirtyBits[i][j] = false;
			LRU_way[i][j] = 0;
	    }
		}
    }
	
    public long getTag(long addr) {
		return addr >> (this.addressSize - this.nTagBits);
	}
    
    public int getIndex(long addr) {
		long j = (addr >> this.nOffsetBits);
				
		long k = (1 << this.nIndexBits) - 1;
								
		return (int)(j & k); 
    }
    
    public long getBlockAddress(long addr) {
		long k = (addr >> this.nOffsetBits) << this.nOffsetBits;		
		return k;
    }
    
    /* this method takes a PC and a flag as to whether the access is a load or store
     * functionality in no particular order: 
     * 	(1) look up the address in the cache
     * 	(2) update the cacheTags if necessary
     * 	(3) set the dirtyEvic_f flag accordingly
     * 	(4) update the LRU_way field accordingly
     * return true if there was a hit, false if there was a miss
     * Use the "get" helper functions above. They will make your life easier.
     */
    public boolean access(long addr, long[] wb_tag, boolean isLoad) {
	
	// FIX ME for question 8
    accessTime++;
	
	long addr_tag = getTag(addr);
	int addr_index = getIndex(addr);
	long addr_block = getBlockAddress(addr);
		
	
	boolean[] hit = new boolean[this.associativity];
	int touchedWay = -1;
	boolean hit_f = false;
	for (int i = 0; i < this.associativity; i++)
	{
		hit[i] = cacheTags[addr_index][i] == addr_tag;
		if (hit[i] == true) {
			hit_f = true;
			touchedWay = i;
			break;
		}
	}
	// this is a miss
	if (touchedWay < 0)
	{
		touchedWay = getLRU(addr_index);
	}
	
	boolean dirty = dirtyBits[addr_index][touchedWay];
	dirtyEvic_f = dirty;
	long wb = ((cacheTags[addr_index][touchedWay] << this.nIndexBits) | addr_index) << this.nOffsetBits; // tag + addr_index + touchedWay

	// this is for store
	if (!isLoad) {
		if (!hit_f && dirty) {
			// we need to write back
			this.dirtyCount++;
			wb_tag[0] = wb;
		} 
		dirtyBits[addr_index][touchedWay] = true;
	}
	// this is for load 
	else {
		if (!hit_f) {
            loadCount++;
			dirtyBits[addr_index][touchedWay] = false;
			if (dirty) {
				// we need to write back
				this.dirtyCount++;;
				wb_tag[0] = wb;
			}
		}
	}
	if (victim_f == false) {
	   cacheTags[addr_index][touchedWay] = addr_tag;
	   updateLRU(addr_index, touchedWay);
    }   
	return hit_f;
    }

    /*
    * Before, hw4 uses a fake LRU policy
    * Now we are counting cache access 
    */
    public int getLRU(int theSet) {
    	int maxTouchedWay = -1;
    	int touchedWayCount = -1*Integer.MAX_VALUE;
    	for (int i = 0; i < this.associativity; i++) {
    		if (touchedWayCount < this.LRU_way[theSet][i]) {
    			touchedWayCount = this.LRU_way[theSet][i];
    			maxTouchedWay = i;
    		}
    	}
    	return maxTouchedWay;
    }

    
    /*
     * LRU cannot be maintained with a single counter if there are
     * more than 2 ways. So we'll just use an approximation: 
     * 	If there is just one way, the LRU bit is always 0. 
     * 	If there are two ways, the LRU bit is always the way you DIDN'T just touch. 
     *  If there are more than 2 ways, the LRU bit is always 1 higher (w/wrap-around)
     *  	than the way you just touched.
     * For example, if there are 4 ways, and you touch way 0, then the new LRU should be 1.
     * 		If you touch way 3, the new LRU should be 0.
     * theSet: identifies the set in the cache we're talking about
     * touchedWay: identifies the way we just touched.
     */
    public void updateLRU(int theSet, int touchedWay) {
		for (int i = 0; i < this.associativity; i++) {
			this.LRU_way[theSet][i]++;
		}
		this.LRU_way[theSet][touchedWay] = 0;
    }
    
    public void printConfig(){
	System.out.format("Cache size  = %dB. Each block = %dB.\n"+
			  "%d-way set associative cache.\n", 
			  capacity, blockSize, associativity);
	System.out.format("Tag = %d bits, Index = %d bits, Offset = %d bits\n",
			  nTagBits, nIndexBits, nOffsetBits);
	System.out.format("There are %d sets total in the cache.\n"+
			  "At this associativity, that means a total of %d cache lines.\n"
			  +"(Assuming a %d-bit address.)\n",
			  nSets, nTotalCacheLines, addressSize);
    }

    public void printHeader() {
    	System.out.format("[SetNum: {WayNum: Tag,cl/dirty} LRU=WayNum]\t|"+
			  " Block-Addr\tType\tH/M\tEvicState\n");
    }
    
    public void printCache() {
	// this is NOT correct, but the formatting should help you
	System.out.format("[S0: {W0: %s, C} LRU=0]\t| ", Long.toHexString(cacheTags[0][0]));		
    }
    
    /* 
     * You may find this useful.
     */
    static public int log2(double x) {
	
    	return (int)(Math.log(x)/Math.log(2)+1e-10);
    	
    }

}
