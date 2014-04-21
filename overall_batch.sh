mkdir overall

time java HW4 -t gcc-50M -L1 8192 4 1 -L2 524288 4 4 >> overall/gcc.log
time java HW4 -t gcc-50M -L1 8192 4 1 -L2 524288 4 4 -miss 5 >> overall/gcc.log
time java HW4 -t gcc-50M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> overall/gcc.log


time java HW4 -t go-100M -L1 8192 4 1 -L2 524288 4 4 >> overall/go.log
time java HW4 -t go-100M -L1 8192 4 1 -L2 524288 4 4 -miss 5 >> overall/go.log
time java HW4 -t go-100M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> overall/go.log


time java HW4 -t hmmer-100M -L1 8192 4 1 -L2 524288 4 4 >> overall/hmmer.log
time java HW4 -t hmmer-100M -L1 8192 4 1 -L2 524288 4 4 -miss 5 >> overall/hmmer.log
time java HW4 -t hmmer-100M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> overall/hmmer.log

time java HW4 -t libquantum-100M -L1 8192 4 1 -L2 524288 4 4 >> overall/libquantum.log
time java HW4 -t libquantum-100M -L1 8192 4 1 -L2 524288 4 4 -miss 5 >> overall/libquantum.log
time java HW4 -t libquantum-100M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> overall/libquantum.log


time java HW4 -t mcf-100M -L1 8192 4 1 -L2 524288 4 4 >> overall/mcf.log
time java HW4 -t mcf-100M -L1 8192 4 1 -L2 524288 4 4 -miss 5 >> overall/mcf.log
time java HW4 -t mcf-100M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> overall/mcf.log

time java HW4 -t sphinx3-100M -L1 8192 4 1 -L2 524288 4 4 >> overall/sphinx.log
time java HW4 -t sphinx3-100M -L1 8192 4 1 -L2 524288 4 4 -miss 5 >> overall/sphinx.log
time java HW4 -t sphinx3-100M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> overall/sphinx.log

time java HW4 -t art-100M -L1 8192 4 1 -L2 524288 4 4 >> overall/art.log
time java HW4 -t art-100M -L1 8192 4 1 -L2 524288 4 4 -miss 5 >> overall/art.log
time java HW4 -t art-100M -L1 8192 4 1 -L2 524288 4 4 -victim 5 >> overall/art.log




