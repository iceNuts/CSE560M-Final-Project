######################################################################################

# L1 64K 1 way L2 512K 4 way victim 3

time java HW4 -t sphinx3-100M -L1 65536 4 1 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sphinx3-100M -L1 65536 8 1 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sphinx3-100M -L1 65536 16 1 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sphinx3-100M -L1 65536 32 1 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3

# L1 64K 2 way L2 512K 4 way victim 3

time java HW4 -t sphinx3-100M -L1 65536 4 2 -L2 524288 4 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sphinx3-100M -L1 65536 8 2 -L2 524288 8 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sphinx3-100M -L1 65536 16 2 -L2 524288 16 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3
time java HW4 -t sphinx3-100M -L1 65536 32 2 -L2 524288 32 4 -victim 3 >> victimBuffer_out/L1-64K-victim-3

# L1 64K 1 way L2 512K 4 way victim 5

time java HW4 -t sphinx3-100M -L1 65536 4 1 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sphinx3-100M -L1 65536 8 1 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sphinx3-100M -L1 65536 16 1 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sphinx3-100M -L1 65536 32 1 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5

# L1 64K 2 way L2 512K 4 way victim 5

time java HW4 -t sphinx3-100M -L1 65536 4 2 -L2 524288 4 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sphinx3-100M -L1 65536 8 2 -L2 524288 8 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sphinx3-100M -L1 65536 16 2 -L2 524288 16 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5
time java HW4 -t sphinx3-100M -L1 65536 32 2 -L2 524288 32 4 -victim 5 >> victimBuffer_out/L1-64K-victim-5

