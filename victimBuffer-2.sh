######################################################################################
 
# L1 32K 1 way L2 512K 4 way miss 2

time java HW4 -t sphinx3-100M -L1 32768 4 1 -L2 524288 4 4 -victim 2 >> missCache_out/L1-32K-victim-2
time java HW4 -t sphinx3-100M -L1 32768 8 1 -L2 524288 8 4 -victim 2 >> missCache_out/L1-32K-victim-2
time java HW4 -t sphinx3-100M -L1 32768 16 1 -L2 524288 16 4 -victim 2 >> missCache_out/L1-32K-victim-2
time java HW4 -t sphinx3-100M -L1 32768 32 1 -L2 524288 32 4 -victim 2 >> missCache_out/L1-32K-victim-2

# L1 32K 2 way L2 512K 4 way miss 2

time java HW4 -t sphinx3-100M -L1 32768 4 2 -L2 524288 4 4 -victim 2 >> missCache_out/L1-32K-victim-2
time java HW4 -t sphinx3-100M -L1 32768 8 2 -L2 524288 8 4 -victim 2 >> missCache_out/L1-32K-victim-2
time java HW4 -t sphinx3-100M -L1 32768 16 2 -L2 524288 16 4 -victim 2 >> missCache_out/L1-32K-victim-2
time java HW4 -t sphinx3-100M -L1 32768 32 2 -L2 524288 32 4 -victim 2 >> missCache_out/L1-32K-victim-2

