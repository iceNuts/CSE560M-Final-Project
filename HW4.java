/*
 * WARNING: When we grade your assignment, we will not use this file, so
 * any changes you make to this file will be discarded.
 */

import java.io.IOException;

public class HW4
{ 

    static boolean defaultCache_f = true;

    public static void printUsage() {
	
	System.out.println("Usage: java HW3 [-hv] -t <tracename> -l <insnLimit>");
	System.out.println("Options:");
	System.out.println("  -h|help                 Print this help message");
	System.out.println("  -v|verbose              Optional verbose flag");
	System.out.println("  -debug                  Optional debug prints $ contents");
	System.out.println("  -cache <cap> <assoc> <bsize> cache configuration");
	System.out.println("  -t|trace <tracename>    Name of trace (exclude trace.gz) ");
	System.out.println("  -l|limit <n>            Simulate only first n insns ");
	System.out.println("\nExamples:");
	System.out.println("  shell>  java HW3 -v -t sjeng-1K -l 500");
	System.out.println("  shell>  java HW3 -verbose -trace sjeng-1M ");
	System.out.println("  shell>  java HW3 -cache 128, 32, 1 -debug");
	System.out.println("  shell>  java HW3 -cache 256, 64, 2 -debug");

    }

    public static boolean parseArgs(String [] args, Simulator sim) throws IOException {

	int i = 0;
	String arg;
    int blk_size = 0;
		
	// use the command line arguments to customize the simulator each run
	while (i < args.length) {
	    
            arg = args[i++];
	    
	    // -help
            if (arg.equals("-help") || arg.equals("-h")) {
                printUsage();
		return false;
            }
	    
	    // -verbose
            if (arg.equals("-verbose") || arg.equals("-v")) {
                System.out.println("verbose mode on");
                sim.verbose_f = true;
            }

	    // -debug
            if (arg.equals("-debug")) {
                System.out.println("debug mode on");
                sim.debug_f = true;
            }

	    // -cache C B A
            if (arg.equals("-L1")) {
            int capacity = Integer.parseInt(args[i++]);
		    blk_size = Integer.parseInt(args[i++]);
			sim.L1_Cache = new Cache(capacity, 
					blk_size, 
					Integer.parseInt(args[i++])); 

			defaultCache_f = false;
            }


            if (arg.equals("-L2")) {
		
			sim.L2_Cache = new Cache(Integer.parseInt(args[i++]), 
					Integer.parseInt(args[i++]), 
					Integer.parseInt(args[i++])); 

			defaultCache_f = false;
            }

            if (arg.equals("-miss")) {
        
            int way = Integer.parseInt(args[i++]);
            sim.missCache = new Cache(blk_size*way, 
                    blk_size, 
                    way); 

            sim.missCache_f = true;
            }

            if (arg.equals("-victim")) {
        
            int way = Integer.parseInt(args[i++]);
            sim.victimBuffer = new Cache(blk_size*way, 
                    blk_size, 
                    way); 

            sim.victimBuffer_f = true;
            }

	    // -t sjeng-1K
	    if (arg.equals("-trace") || arg.equals("-t")) {
		sim.testTrace = args[i++];
	    }

	    // -limit 100
	    if (arg.equals("-limit") || arg.equals("-l")) {
		sim.insnLimit_f = true;
		sim.uopLimit = Integer.parseInt(args[i++]);
	    }

	}
	return true;

    }
    
    public static void main(String [] args) throws IOException {
	
    	Simulator sim = new Simulator();
	
	if (parseArgs(args, sim)) {
	    
	    // if the command line doesn't specify a branch predictor,
	    // we go with the default
	    if (defaultCache_f) {
		sim.L1_Cache = new Cache(128, 32, 1); // default 8, 1, 2
		sim.L2_Cache = new Cache(4096, 32, 2);
	    }
	    
	    sim.printHeader();
	    sim.processTrace(); // this is still where the action takes place
	    sim.printTraceStats();
	}
    }
    
}
