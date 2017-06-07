        .arch armv8-a
        .file   "calc_iz_asm1.s"
        .text
        .align  2
        .p2align 3,,7
        .global calc_iz_asm1
        .type   calc_iz_asm1, %function
calc_iz_asm1:
        sub     w0, w0, #1            // w0 = max_step - 1
        mul     w6, w0, w1            // w6 = max_step * n_cell
        cmp     w6, 0
        ble     .L1
        sbfiz   x1, x1, 3, 32
        mov     x0, 0                 // x0 = 0
        add     x5, x3, x1
        add     x1, x4, x1
        .p2align 2

.loop:
        ldp     d6, d1, [x2, 40]      // d6 = I, d1 = V_1
        ldr     d3, [x3, x0, lsl 3]   // d3 = v
        ldp     d0, d7, [x2, 56]      // d0 = V_2, d7 = V_3
        ldr     d2, [x2, 16]          // d2 = B
        fmul    d1, d3, d1            // d1 = d3 * d1: d1 = v * V_1
        ldr     d4, [x4, x0, lsl 3]   // d4 = u
        ldp     d5, d16, [x2]         // d5 = DT, d16 = A
        fmul    d0, d3, d0            // d0 = d3 * d0: d0 = v * V_2
        fnmsub  d2, d3, d2, d4        // d2 = d3 * d2 - d4: d2 = v * B - u
        fmadd   d0, d3, d1, d0        // d0 = d3 * d1 + d0: d0 = v * (v * V_1) + (v * V_2)
        fmul    d1, d2, d16           // d1 = d2 * d16: d1 = A * (v * B - u)
        fadd    d0, d0, d7            // d0 = d0 + d7
        fmadd   d1, d5, d1, d4        // d1 = d5 * d1 + d4
        fsub    d0, d0, d4            // d0 = d0 - d4
        fadd    d0, d0, d6            // d0 = d0 + d6
        fmadd   d0, d0, d5, d3        // d0 = d0 * d5 + d3
        str     d0, [x5, x0, lsl 3]   // d0 -> next_v
        str     d1, [x1, x0, lsl 3]   // d1 -> next_u
        ldr     d1, [x5, x0, lsl 3]   // d1 = next_v
        ldr     d0, [x2, 72]          // d0 = TH

        fcmpe   d1, d0
        ble     .skip

        ldr     x7, [x2, 24]
        str     x7, [x5, x0, lsl 3]
        ldr     d0, [x1, x0, lsl 3]
        ldr     d1, [x2, 32]
        fadd    d0, d0, d1
        str     d0, [x1, x0, lsl 3]

.skip:
        add     x0, x0, 1            // x0++
        cmp     w6, w0
        bgt     .loop
.L1:
        ret
        .size   calc_iz_asm1, .-calc_iz_asm1
        .ident  "GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits
