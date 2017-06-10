asm-neurons
---

[![Build Status](https://travis-ci.org/DaisukeMiyamoto/asm-neurons.svg?branch=master)](https://travis-ci.org/DaisukeMiyamoto/asm-neurons)

Assembler implementation of several computational neuron models

# Izhikevich model

## usage
- x86
```
$ cd src
$ make
$ ./iz.out 
```

- ARMv8 (aarch64)
```
$ cd src
$ make arm
$ ./iz_arm.out 
```

## assembler file conditions
- `calc_iz_asm1.s`: same as `gcc -S` output code from `calc_iz_c.c`
- `calc_iz_asm2.s`: reduce load/store
- `calc_iz_asm3.s`: use SIMD instruction

## benchmark results
- Jetson TX1 (Tegra, NVIDIA)
    ```
    # 10000 Step, 10000 Cells
    # C   : Time=1.20 sec (1169.0 MFLOPS)
    # ASM1: Time=1.20 sec (1170.6 MFLOPS)
    diff = 0.000000
    # ASM2: Time=0.87 sec (1603.7 MFLOPS)
    diff = 0.000000
    # ASM3: Time=0.86 sec (1630.0 MFLOPS)
    diff = 0.000008
    ```
- Raspberry Pi3
    ```
    $ ./iz_arm.out 5000 5000
    # 5000 Step, 5000 Cells
    # C   : Time=2.15 sec (162.6 MFLOPS)
    # ASM1: Time=2.14 sec (163.6 MFLOPS)
    diff = 0.000000
    # ASM2: Time=2.12 sec (165.5 MFLOPS)
    diff = 0.000000
    # ASM3: Time=1.67 sec (209.4 MFLOPS)
    ```

# Hodgkin-Huxley model

## usage
- x86
```
$ cd src
$ make
$ ./hh.out 
```

- ARMv8 (aarch64)
```
$ cd src
$ make arm
$ ./hh_arm.out 
```

## assembler file conditions
- `calc_hh_asm1.s`: same as `gcc -S` output code from `calc_hh_c.c`


## benchmark results
- Jetson TX1 (Tegra, NVIDIA)
