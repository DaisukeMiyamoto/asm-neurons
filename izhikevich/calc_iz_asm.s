        .arch armv8-a
        .file   "calc_iz_asm.s"
        .text
        .align  2
        .p2align 3,,7
        .global calc_iz_asm
        .type   calc_iz_asm, %function
calc_iz_asm:
        sub     w0, w0, #1
        mul     w6, w0, w1
        cmp     w6, 0
        ble     .L1
        sbfiz   x1, x1, 3, 32
        mov     x0, 0
        add     x5, x3, x1
        add     x1, x4, x1
        .p2align 2
.L5:
        ldp     d6, d1, [x2, 40]
        ldr     d3, [x3, x0, lsl 3]
        ldp     d0, d7, [x2, 56]
        ldr     d2, [x2, 16]
        fmul    d1, d3, d1
        ldr     d4, [x4, x0, lsl 3]
        ldp     d5, d16, [x2]
        fmul    d0, d3, d0
        fnmsub  d2, d3, d2, d4
        fmadd   d0, d3, d1, d0
        fmul    d1, d2, d16
        fadd    d0, d0, d7
        fmadd   d1, d5, d1, d4
        fsub    d0, d0, d4
        fadd    d0, d0, d6
        fmadd   d0, d0, d5, d3
        str     d0, [x5, x0, lsl 3]
        str     d1, [x1, x0, lsl 3]
        ldr     d1, [x5, x0, lsl 3]
        ldr     d0, [x2, 72]
        fcmpe   d1, d0
        ble     .L3
        ldr     x7, [x2, 24]
        str     x7, [x5, x0, lsl 3]
        ldr     d0, [x1, x0, lsl 3]
        ldr     d1, [x2, 32]
        fadd    d0, d0, d1
        str     d0, [x1, x0, lsl 3]
.L3:
        add     x0, x0, 1
        cmp     w6, w0
        bgt     .L5
.L1:
        ret
        .size   calc_iz_asm, .-calc_iz_asm
        .ident  "GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits
