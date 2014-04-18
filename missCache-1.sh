######################################################################################

# L1 64K 1 way L2 512K 4 way miss 3

time java HW4 -t sphinx3-100M -L1 65536 4 1 -L2 524288 4 4 -miss 3 >> missCache_out/L1-64K-miss-3
time java HW4 -t sphinx3-100M -L1 65536 8 1 -L2 524288 8 4 -miss 3 >> missCache_out/L1-64K-miss-3
time java HW4 -t sphinx3-100M -L1 65536 16 1 -L2 524288 16 4 -miss 3 >> missCache_out/L1-64K-miss-3
time java HW4 -t sphinx3-100M -L1 65536 32 1 -L2 524288 32 4 -miss 3 >> missCache_out/L1-64K-miss-3

# L1 64K 2 way L2 512K 4 way miss 3

time java HW4 -t sphinx3-100M -L1 65536 4 2 -L2 524288 4 4 -miss 3 >> missCache_out/L1-64K-miss-3
time java HW4 -t sphinx3-100M -L1 65536 8 2 -L2 524288 8 4 -miss 3 >> missCache_out/L1-64K-miss-3
time java HW4 -t sphinx3-100M -L1 65536 16 2 -L2 524288 16 4 -miss 3 >> missCache_out/L1-64K-miss-3
time java HW4 -t sphinx3-100M -L1 65536 32 2 -L2 524288 32 4 -miss 3 >> missCache_out/L1-64K-miss-3

# L1 64K 1 way L2 512K 4 way miss 5

time java HW4 -t sphinx3-100M -L1 65536 4 1 -L2 524288 4 4 -miss 5 >> missCache_out/L1-64K-miss-5
time java HW4 -t sphinx3-100M -L1 65536 8 1 -L2 524288 8 4 -miss 5 >> missCache_out/L1-64K-miss-5
time java HW4 -t sphinx3-100M -L1 65536 16 1 -L2 524288 16 4 -miss 5 >> missCache_out/L1-64K-miss-5
time java HW4 -t sphinx3-100M -L1 65536 32 1 -L2 524288 32 4 -miss 5 >> missCache_out/L1-64K-miss-5

# L1 64K 2 way L2 512K 4 way miss 5

time java HW4 -t sphinx3-100M -L1 65536 4 2 -L2 524288 4 4 -miss 5 >> missCache_out/L1-64K-miss-5
time java HW4 -t sphinx3-100M -L1 65536 8 2 -L2 524288 8 4 -miss 5 >> missCache_out/L1-64K-miss-5
time java HW4 -t sphinx3-100M -L1 65536 16 2 -L2 524288 16 4 -miss 5 >> missCache_out/L1-64K-miss-5
time java HW4 -t sphinx3-100M -L1 65536 32 2 -L2 524288 32 4 -miss 5 >> missCache_out/L1-64K-miss-5
