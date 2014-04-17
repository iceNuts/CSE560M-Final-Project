#!/bin/sh
# Replace sjeng-10M at your will

######################################################################################

# L1 8K 1 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 8192 4 1 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3
time java HW4 -t sjeng-10M -L1 8192 8 1 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3
time java HW4 -t sjeng-10M -L1 8192 16 1 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3
time java HW4 -t sjeng-10M -L1 8192 32 1 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3

# L1 8K 2 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 8192 4 2 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3
time java HW4 -t sjeng-10M -L1 8192 8 2 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3
time java HW4 -t sjeng-10M -L1 8192 16 2 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3
time java HW4 -t sjeng-10M -L1 8192 32 2 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-8K-victim-3

# L1 8K 1 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5
time java HW4 -t sjeng-10M -L1 8192 8 1 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5
time java HW4 -t sjeng-10M -L1 8192 16 1 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5
time java HW4 -t sjeng-10M -L1 8192 32 1 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5

# L1 8K 2 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 8192 4 2 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5
time java HW4 -t sjeng-10M -L1 8192 8 2 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5
time java HW4 -t sjeng-10M -L1 8192 16 2 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5
time java HW4 -t sjeng-10M -L1 8192 32 2 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-8K-victim-5


######################################################################################

# L1 16K 1 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 16384 4 1 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3
time java HW4 -t sjeng-10M -L1 16384 8 1 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3
time java HW4 -t sjeng-10M -L1 16384 16 1 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3
time java HW4 -t sjeng-10M -L1 16384 32 1 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3

# L1 16K 2 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 16384 4 2 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3
time java HW4 -t sjeng-10M -L1 16384 8 2 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3
time java HW4 -t sjeng-10M -L1 16384 16 2 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3
time java HW4 -t sjeng-10M -L1 16384 32 2 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-16K-victim-3

# L1 16K 1 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 16384 4 1 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5
time java HW4 -t sjeng-10M -L1 16384 8 1 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5
time java HW4 -t sjeng-10M -L1 16384 16 1 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5
time java HW4 -t sjeng-10M -L1 16384 32 1 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5

# L1 16K 2 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 16384 4 2 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5
time java HW4 -t sjeng-10M -L1 16384 8 2 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5
time java HW4 -t sjeng-10M -L1 16384 16 2 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5
time java HW4 -t sjeng-10M -L1 16384 32 2 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-16K-victim-5

######################################################################################
 
# L1 32K 1 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 32768 4 1 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3
time java HW4 -t sjeng-10M -L1 32768 8 1 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3
time java HW4 -t sjeng-10M -L1 32768 16 1 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3
time java HW4 -t sjeng-10M -L1 32768 32 1 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3

# L1 32K 2 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 32768 4 2 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3
time java HW4 -t sjeng-10M -L1 32768 8 2 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3
time java HW4 -t sjeng-10M -L1 32768 16 2 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3
time java HW4 -t sjeng-10M -L1 32768 32 2 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-32K-victim-3

# L1 32K 1 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 32768 4 1 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5
time java HW4 -t sjeng-10M -L1 32768 8 1 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5
time java HW4 -t sjeng-10M -L1 32768 16 1 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5
time java HW4 -t sjeng-10M -L1 32768 32 1 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5

# L1 32K 2 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 32768 4 2 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5
time java HW4 -t sjeng-10M -L1 32768 8 2 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5
time java HW4 -t sjeng-10M -L1 32768 16 2 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5
time java HW4 -t sjeng-10M -L1 32768 32 2 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-32K-victim-5

######################################################################################

# L1 64K 1 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 65536 4 1 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sjeng-10M -L1 65536 8 1 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sjeng-10M -L1 65536 16 1 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sjeng-10M -L1 65536 32 1 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3

# L1 64K 2 way L2 512K 4 way victim 3

time java HW4 -t sjeng-10M -L1 65536 4 2 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sjeng-10M -L1 65536 8 2 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sjeng-10M -L1 65536 16 2 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sjeng-10M -L1 65536 32 2 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3

# L1 64K 1 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 65536 4 1 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sjeng-10M -L1 65536 8 1 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sjeng-10M -L1 65536 16 1 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sjeng-10M -L1 65536 32 1 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5

# L1 64K 2 way L2 512K 4 way victim 5

time java HW4 -t sjeng-10M -L1 65536 4 2 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sjeng-10M -L1 65536 8 2 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sjeng-10M -L1 65536 16 2 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sjeng-10M -L1 65536 32 2 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5


