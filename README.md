# Saber-tmvp4-tmvp

This code accompanies the paper "TMVP-based Multiplication for Polynomial Quotient Rings and Application to Saber on ARM Cortex-tmvp".

This repository contains our TMVP-based implementations for LightSaber, Saber, and FireSaber for Cortex-tmvp.

Please clone this repository recursively to include [libopencm3](http://libopencm3.org/).
```
    git clone --recursive https://github.com/NTRU-tmvp4-tmvp/NTRU-tmvp4-tmvp
```
## Testing and Benchmarking LightSaber, Saber, and FireSaber

To run all benchmarks for all schemes run `benchmarks.py`.

You can build binaries by running
`make IMPLEMENTATION_PATH=crypto_kem/{scheme}/{implementation} bin/crypto_kem_{scheme}_{implementation}_{test}.bin`

Hence, the testing binaries can be built with
```
make IMPLEMENTATION_PATH=crypto_kem/lightsaber/tmvp bin/crypto_kem_lightsaber_tmvp_speed.bin
make IMPLEMENTATION_PATH=crypto_kem/saber/tmvp bin/crypto_kem_saber_tmvp_speed.bin
make IMPLEMENTATION_PATH=crypto_kem/firesaber/tmvp bin/crypto_kem_firesaber_tmvp_speed.bin

make IMPLEMENTATION_PATH=crypto_kem/lightsaber/blockrec bin/crypto_kem_lightsaber_blockrec_speed.bin
make IMPLEMENTATION_PATH=crypto_kem/saber/blockrec bin/crypto_kem_saber_blockrec_speed.bin
make IMPLEMENTATION_PATH=crypto_kem/firesaber/blockrec bin/crypto_kem_firesaber_blockrec_speed.bin

make IMPLEMENTATION_PATH=crypto_kem/lightsaber/tmvp bin/crypto_kem_lightsaber_tmvp_stack.bin
make IMPLEMENTATION_PATH=crypto_kem/saber/tmvp bin/crypto_kem_saber_tmvp_stack.bin
make IMPLEMENTATION_PATH=crypto_kem/firesaber/tmvp bin/crypto_kem_firesaber_tmvp_stack.bin

make IMPLEMENTATION_PATH=crypto_kem/lightsaber/blockrec bin/crypto_kem_lightsaber_blockrec_stack.bin
make IMPLEMENTATION_PATH=crypto_kem/saber/blockrec bin/crypto_kem_saber_blockrec_stack.bin
make IMPLEMENTATION_PATH=crypto_kem/firesaber/blockrec bin/crypto_kem_firesaber_blockrec_stack.bin

make IMPLEMENTATION_PATH=crypto_kem/lightsaber/tmvp bin/crypto_kem_lightsaber_tmvp_test.bin
make IMPLEMENTATION_PATH=crypto_kem/saber/tmvp bin/crypto_kem_saber_tmvp_test.bin
make IMPLEMENTATION_PATH=crypto_kem/firesaber/tmvp bin/crypto_kem_firesaber_tmvp_test.bin

make IMPLEMENTATION_PATH=crypto_kem/lightsaber/blockrec bin/crypto_kem_lightsaber_blockrec_test.bin
make IMPLEMENTATION_PATH=crypto_kem/saber/blockrec bin/crypto_kem_saber_blockrec_test.bin
make IMPLEMENTATION_PATH=crypto_kem/firesaber/blockrec bin/crypto_kem_firesaber_blockrec_test.bin

```
To flash the binaries to the board, and to receive and print the output from the board run `read_guest.py {binary}`.

## Licence

Most parts of the codes in this repository are taken from [PQM4](https://github.com/mupq/pqm4),  [polymul-z2mx-m4](https://github.com/mupq/polymul-z2mx-m4), and https://github.com/KULeuven-COSIC/TCHES2020_SABER/tree/master/Cortex-M4.
See [license of PQM4](https://github.com/mupq/pqm4#license), and 
[license of polymul-z2mx-m4](https://github.com/mupq/polymul-z2mx-m4/blob/master/LICENSE) for detailed information.

# Saber-tmvp4-m4
