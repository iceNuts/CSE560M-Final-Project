######################################################################################

# L1 8K 1 way L2 512K 4 way miss 2

time java HW4 -t sphinx3-100M -L1 8192 4 1 -L2 524288 4 4 -miss 2 >> missCache_out/L1-8K-miss-2
time java HW4 -t sphinx3-100M -L1 8192 8 1 -L2 524288 8 4 -miss 2 >> missCache_out/L1-8K-miss-2
time java HW4 -t sphinx3-100M -L1 8192 16 1 -L2 524288 16 4 -miss 2 >> missCache_out/L1-8K-miss-2
time java HW4 -t sphinx3-100M -L1 8192 32 1 -L2 524288 32 4 -miss 2 >> missCache_out/L1-8K-miss-2

# L1 8K 2 way L2 512K 4 way miss 2

time java HW4 -t sphinx3-100M -L1 8192 4 2 -L2 524288 4 4 -miss 2 >> missCache_out/L1-8K-miss-2
time java HW4 -t sphinx3-100M -L1 8192 8 2 -L2 524288 8 4 -miss 2 >> missCache_out/L1-8K-miss-2
time java HW4 -t sphinx3-100M -L1 8192 16 2 -L2 524288 16 4 -miss 2 >> missCache_out/L1-8K-miss-2
time java HW4 -t sphinx3-100M -L1 8192 32 2 -L2 524288 32 4 -miss 2 >> missCache_out/L1-8K-miss-2
