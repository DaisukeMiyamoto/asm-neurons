# asm-neurons
Assembler implementation of several computational neuron models

# Izhikevich model

## usage

- ARMv8 (aarch64)
```
$ cd izhikevich
$ make arm
$ ./iz_arm.out 
```

## describe
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


# Hodgkin-Huxley model

