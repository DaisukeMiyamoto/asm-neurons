        .arch armv8-a
        .file   "calc_iz_asm3.s"
        .text
        .align  2
        .p2align 3,,7
        .global calc_iz_asm3
        .type   calc_iz_asm3, %function
calc_iz_asm3:
        sub     w0, w0, #1            // w0 = max_step - 1
        mul     w6, w0, w1            // w6 = max_step * n_cell
        cmp     w6, 0
        ble     .L1
        sbfiz   x1, x1, 3, 32
        mov     x0, 0                 // x0 = 0
        add     x5, x3, x1
        add     x1, x4, x1
        .p2align 2

        ldp     d10, d11, [x2]        // d10 = DT, d11 = A
        ldp     d12, d13, [x2, 16]    // d12 = B, d13 = C
        ldp     d14, d15, [x2, 32]    // d14 = D, d15 = I
        ldp     d16, d17, [x2, 48]    // d16 = V_1, d17 = V_2
        ldp     d18, d19, [x2, 64]    // d18 = V_3, d19 = TH

.loop:
        ldr     d0, [x3, x0, lsl 3]   // d0 <- v
        ldr     d1, [x4, x0, lsl 3]   // d1 <- u

        fmul    d2, d0, d16           // d2 = v * V1
        fmul    d3, d0, d17           // d3 = v * V2
        fmadd   d5, d0, d2, d3        // d5 = v * (v * V1) + (v * V2)
        fadd    d5, d5, d18           // d5 = d5 + V3
        fsub    d5, d5, d1            // d5 = d5 - u
        fadd    d5, d5, d15           // d5 = d5 + I

        fnmsub  d4, d0, d12, d1       // d4 = v * B - u
        fmul    d4, d4, d11           // d4 = d4 * A
        fmadd   d1, d4, d10, d1       // d1 = d4 * dt + u

        fmadd   d0, d5, d10, d0       // d0 = d5 * dt + v

        fcmpe   d0, d19
        ble     .skip

        fmov    d0, d13
        fadd    d1, d1, d14

.skip:
        str     d0, [x5, x0, lsl 3]   // d0 -> next_v
        str     d1, [x1, x0, lsl 3]   // d1 -> next_u

        add     x0, x0, 1             // x0++
        cmp     w6, w0
        bgt     .loop
.L1:
        ret
        .size   calc_iz_asm3, .-calc_iz_asm3
        .ident  "GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits
