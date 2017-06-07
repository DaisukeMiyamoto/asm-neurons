# asm-neurons
Assembler implementation of several computational neuron models

# Izhikevich model

- ARMv8 (aarch64)
```
$ cd izhikevich
$ make arm
$ ./iz_arm.out 
# 10000 Step, 10000 Cells
# C  : Time=1.18 sec (1186.2 MFLOPS)
# ASM: Time=1.18 sec (1186.0 MFLOPS)
```
