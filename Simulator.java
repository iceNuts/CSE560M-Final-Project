import java.lang.String;
import java.util.zip.GZIPInputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class Simulator
{    

    public String testTrace = "sjeng-1K"; // default

    // cache stuff
    public CacheStats L1_CacheStats = null;
    public CacheStats L2_CacheStats = null;
    public CacheStats L2_Global_CacheStats = null;
    public CacheStats L1_Buffer_CompositeStats = null;
    public int missCacheTraffic = 0;
    public int victimBufferTraffic = 0;

    public Cache L1_Cache = null;
    public Cache L2_Cache = null;

    public Cache missCache = null;
    public Cache victimBuffer = null;

    public boolean missCache_f = false;
    public boolean victimBuffer_f = false;

    // print options, by default off
    public boolean verbose_f = false;
    public boolean debug_f = false;

    // optionally limit the simulation to the first N insns
    // do not break this functionality when you complete the code!
    public boolean insnLimit_f = false;
    public int uopLimit = 0;
	
    // don't touch! you'll be sorry....
    public BufferedReader traceReader = null;
	
    // Program Stats
    public long totalUops = 0;
	
	// Customized Variables
	public int storeCount = 0;
	public int totalMemRef = 0;

    public int latencyCount = 0;
    public int wbCount = 0;

    /*
     * Simple constructor for the simulator.
     */
    public Simulator() {
	L1_CacheStats = new CacheStats();
	L2_CacheStats = new CacheStats();
    L2_Global_CacheStats = new CacheStats();
    L1_Buffer_CompositeStats =  new CacheStats();
	storeCount = 0;
    }

    /*
     * set up the trace
     */
    public void initTrace() throws IOException {
	String tracePath = "traces/"+testTrace+".trace.gz";
	// ugly, but JAVA IO is not the point
	traceReader = new BufferedReader(new InputStreamReader(new GZIPInputStream(new FileInputStream(tracePath))));
    }

    /*
     * Goes through the trace line by line (i.e., instruction by instruction) and 
     * simulates the program being executed on a processor.
     * 
     * This method is currently stripped down. It will just read in each instruction 
     * one at a time, and does not make any predictions. 
     */

    public void processTrace() throws IOException  {
        String line = "";    
        Uop currUop = null;
        
		initTrace();

        wbCount = 0;
        latencyCount = 0;
        
        while (true) {
	    line = traceReader.readLine();
	    if (line == null) {
		break;
	    }
	    if (insnLimit_f && totalUops == uopLimit) {
		System.out.format("Reached insn limit of %d. Ending Simulation...\n", uopLimit);
		break;
	    }
	    currUop = new Uop(line);
	    totalUops++;
	    
	    // BEGIN WHERE YOU SHOULD MAKE CHANGES TO THIS FILE
	    
	    // Print this before you access the cache

		if(currUop.type == Uop.UopType.insn_LOAD || currUop.type == Uop.UopType.insn_STORE)
		{
			totalMemRef++;
		    // access the cache
		    // update the cache stats
		    long []wb_tag = new long[1];
		    // Clear flag
		    wb_tag[0] = -1;
		    
		    boolean L1_hit_f = L1_Cache.access(currUop.addressForMemoryOp, wb_tag, currUop.type == Uop.UopType.insn_LOAD);
		    L1_CacheStats.updateStat(L1_hit_f);
            latencyCount += 1;

            if (L1_hit_f || (!missCache_f && !victimBuffer_f))
                L1_Buffer_CompositeStats.updateStat(L1_hit_f);

		    // L1 Miss
            boolean L2_hit_f = true;
            long []wb_tag2 = new long[1];
		    if (L1_hit_f == false)
		    {
		    	// Do something? L2 VictimBuffer? Miss Cache?

		    	if (1/* whatever load or store is */)//(currUop.type == Uop.UopType.insn_LOAD) 
                {

                    // There is a miss cache
                    if (missCache_f)
                    {
                        long wbTag = 0;
                        wb_tag2[0] = -1;
                        boolean missCache_hit = missCache.access(
                         currUop.addressForMemoryOp, 
                         wb_tag2,
                         currUop.type == Uop.UopType.insn_LOAD
                        );
                        latencyCount += 1;
                        wbTag = wb_tag2[0];
                        L1_Buffer_CompositeStats.updateStat(missCache_hit);

                        if (missCache_hit == false && currUop.type == Uop.UopType.insn_LOAD) 
                        {
                            // Clear flag
                            wb_tag2[0] = -1;
                            L2_hit_f =  L2_Cache.access(currUop.addressForMemoryOp, wb_tag2, true);
                            L2_CacheStats.updateStat(L2_hit_f);
                            latencyCount += 23;
                            if (L2_hit_f == false)
                                latencyCount += 100;
                        } 

                        // we need to write back
                        if (wbTag != -1) 
                        {
                            L2_Cache.access(wbTag, wb_tag2, false);
                            wbCount++;
                        } 

                    }
                    else if (victimBuffer_f)
                    {
                        victimBuffer.victim_f = true;
                        boolean victimBuffer_hit = victimBuffer.access(
                         currUop.addressForMemoryOp, 
                         wb_tag2,
                         currUop.type == Uop.UopType.insn_LOAD
                        );
                        latencyCount += 1;
                        L1_Buffer_CompositeStats.updateStat(victimBuffer_hit);
                        if (victimBuffer_hit == true)
                        {
                            // swap wb_tag[0] with currUop.addressForMemoryOp
                        }
                        else if (victimBuffer_hit == false) 
                        {
                            // Clear flag
                            wb_tag2[0] = -1;
                            L2_hit_f =  L2_Cache.access(currUop.addressForMemoryOp, wb_tag2, true);
                            L2_CacheStats.updateStat(L2_hit_f);
                            latencyCount += 23;
                            if (L2_hit_f == false)
                                latencyCount += 100;
                            // write back wb_tag[0] to victim buffer

                            // write back wb_tag2[0] to L2 Cache
                        } 
                    }
                    // NO miss cache available
                    else 
                    {
                        // Clear flag
                        wb_tag2[0] = -1;
                        L2_hit_f =  L2_Cache.access(currUop.addressForMemoryOp, wb_tag2, true);
                        L2_CacheStats.updateStat(L2_hit_f);
                        latencyCount += 23;
                        if (L2_hit_f == false)
                            latencyCount += 100;

                        // write back wb_tag[0] to L2
                    }
		    	}
		    	
		    }
            // default to be hit/if miss then count
            L2_Global_CacheStats.updateStat(L2_hit_f);
			
		    // Print this after you access the cache
		    if (debug_f) 
			System.out.format("%s\t%s\t%s\t%s\n", 
					  Long.toHexString(L1_Cache.getBlockAddress(currUop.addressForMemoryOp)),
					  currUop.isLoad() ? "L" : "S", 
					  L1_hit_f ? "hit" : "miss", 
					  L1_hit_f ? "--" : L1_Cache.dirtyEvic_f ? "dirty" : "clean");
			if(currUop.type == Uop.UopType.insn_STORE)
				storeCount++;
		}

	    // END WHERE YOU SHOULD MAKE CHANGES TO THIS FILE
	    
            // prints the insn
	    if (verbose_f)
		System.out.format("%s\n", line);
	    
        }
		
    	L1_CacheStats.calculateRates();
		L1_CacheStats.total_bytes_transferred_wt = 4*storeCount + (int)L1_CacheStats.totalMisses()*L1_Cache.blockSize;
		L1_CacheStats.total_bytes_transferred_wb = (L1_Cache.loadCount + L1_Cache.dirtyCount) * L1_Cache.blockSize;
		
		L2_CacheStats.calculateRates();
		L2_CacheStats.total_bytes_transferred_wt = 4*storeCount + (int)L2_CacheStats.totalMisses()*L2_Cache.blockSize;
		L2_CacheStats.total_bytes_transferred_wb = (L2_Cache.loadCount + L2_Cache.dirtyCount) * L2_Cache.blockSize;
        L2_Global_CacheStats.calculateRates();

        L1_Buffer_CompositeStats.calculateRates();

        if (missCache_f)
            missCacheTraffic =  (missCache.loadCount + missCache.dirtyCount) * missCache.blockSize;
        if (victimBuffer_f)
            victimBufferTraffic = (victimBuffer.loadCount + victimBuffer.dirtyCount) * victimBuffer.blockSize;
    }
    
    
    /*
     * Prints out basic stats + the accuracy of the branch predictor
     */
    public void printTraceStats() {
	
    	System.out.format("Processed %d trace lines.\n", totalUops);
    	System.out.format("Num Uops (micro-ops): \t\t\t%d\n", totalUops);
			
		System.out.println("--------------L1 Stats--------------");
		L1_CacheStats.print(); 
        System.out.format("---L1 Activity:%d---", L1_Cache.accessTime);

        System.out.println();

		System.out.println("--------------L2 LOCAL Stats--------------");
        L2_CacheStats.print(); 

        System.out.println();

        System.out.println("--------------L2 GLOBAL Stats--------------");
        L2_Global_CacheStats.print();

        System.out.format("---L2 Activity:%d---", L2_Cache.accessTime);

        System.out.println();

        System.out.format("---Latency:%f---\n", latencyCount/(double)totalMemRef);

        System.out.format("---MissCache Traffic:%d---\n", missCacheTraffic);
        if (missCache_f)
            System.out.format("---MissCache Access:%d---\n", missCache.accessTime);

	    System.out.format("---VictimBuffer Traffic:%d---\n\n", victimBufferTraffic);
        if (victimBuffer_f)
            System.out.format("---VictimBuffer Access:%d---\n\n", victimBuffer.accessTime);

        System.out.println("---L1 & Buffer(if exist) Composite Stats:%f---");
        L1_Buffer_CompositeStats.print();

    }

    public void printHeader() {
	if (!debug_f) {
	    System.out.format("HW 4 Printout for i-forgot-to-replace-this-string-with-my-wustlkey\n");
	    System.out.format("-----------------------------------------------------\n");
	}
    	System.out.format("Trace name  \t\t\t\t%s\n", testTrace);
    System.out.println("--------------L1 INFO--------------");
	L1_Cache.printConfig();
	System.out.println("--------------L2 INFO--------------");
	L2_Cache.printConfig();
    System.out.println("--------------Miss Cache INFO--------------");
    if (missCache != null)
        missCache.printConfig();
    else
        System.out.println("NO MISSCACHE");
    System.out.println("--------------VictimBuffer INFO--------------");
    if (victimBuffer != null)
        victimBuffer.printConfig();
    else
        System.out.println("NO VICTIMBUFFER");
	System.out.format("Instruction Limit\t\t\t%s\n", insnLimit_f ? Integer.toString(uopLimit) : "none");	
    }
    
}
