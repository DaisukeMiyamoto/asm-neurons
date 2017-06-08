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

        ld1r    {v10.2d}, [x2], 8           // DT
        ld1r    {v11.2d}, [x2], 8           // A
        ld1r    {v12.2d}, [x2], 8           // B
        ld1r    {v13.2d}, [x2], 8           // C
        ld1r    {v14.2d}, [x2], 8           // D
        ld1r    {v15.2d}, [x2], 8           // I
        ld1r    {v16.2d}, [x2], 8           // V_1
        ld1r    {v17.2d}, [x2], 8           // V_2
        ld1r    {v18.2d}, [x2], 8           // V_3
        ld1r    {v19.2d}, [x2], 8           // TH
.loop:
        ld1     {v0.2d}, [x3], 16
        ld1     {v1.2d}, [x4], 16

        fmul    v2.2d, v0.2d, v16.2d                // d2 = v * V1
        //fmadd    v3.2d, v0.2d, v17.2d, v18.2d     // d3 = v * V2 + V3
        fmul    v3.2d, v0.2d, v17.2d                // d3 = v * v_2
        fadd    v3.2d, v3.2d, v18.2d                // d3 = d3 + V_3
        fmla    v3.2d, v0.2d, v2.2d                 // d5 = v * (v * V1) + (v * V2)
        fsub    v3.2d, v3.2d, v1.2d                 // d5 = d5 - u
        fadd    v3.2d, v3.2d, v15.2d                // d5 = d5 + I

        //fnmsub  v4.2d, v0.2d, v12.2d, v1.2d       // d4 = v * B - u
        fmul    v4.2d, v0.2d, v12.2d
        fsub    v4.2d, v4.2d, v1.2d
        fmul    v4.2d, v4.2d, v11.2d                // d4 = d4 * A
        fmla    v1.2d, v4.2d, v10.2d                // d1 = d4 * dt + u

        fmla    v0.2d, v3.2d, v10.2d                // d0 = d5 * dt + v


        fcmpe   d0, d19
        ble     .skip1

        ins     v0.2d[0], v13.2d[0]
        fadd    d2, d1, d14
        ins     v1.2d[0], v2.2d[0]
.skip1:

        ins     v2.2d[0], v0.2d[1]
        fcmpe   d2, d19
        ble     .skip2

        ins     v0.2d[1], v13.2d[0]
        ins     v2.2d[0], v1.2d[1]
        fadd    d2, d2, d14
        ins     v1.2d[1], v2.2d[0]
.skip2:

        st1     {v0.2d}, [x5], 16
        st1     {v1.2d}, [x1], 16

        add     x0, x0, 2             // x0++
        cmp     w6, w0
        bgt     .loop

.L1:
        ret
        .size   calc_iz_asm3, .-calc_iz_asm3
        .ident  "GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits
