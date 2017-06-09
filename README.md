# asm-neurons
Assembler implementation of several computational neuron models

# Izhikevich model

## usage

- ARMv8 (aarch64)
```
$ cd izhikevich
$ make arm
$ ./iz_arm.out 
# 10000 Step, 10000 Cells
# C  : Time=1.18 sec (1186.2 MFLOPS)
# ASM: Time=1.18 sec (1186.0 MFLOPS)
```

## describe
- `calc_iz_asm1.s`: same as `gcc -S` output code from `calc_iz_c.c`
- `calc_iz_asm2.s`: reduce load/store
- `calc_iz_asm3.s`: use SIMD instruction

# Hodgkin-Huxley model

