	.arch armv8-a
	.file	"calc_hh_c.c"
	.text
	.align	2
	.p2align 3,,7
	.global	calc_hh_c_core
	.type	calc_hh_c_core, %function
calc_hh_c_core:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	d8, d9, [sp, 48]
	ldr	d9, .LC0
	stp	d10, d11, [sp, 64]
	fmov	d10, 1.0e+1
	ldr	d11, [x0]
	stp	d12, d13, [sp, 80]
	ldr	d12, .LC1
	stp	x19, x20, [sp, 16]
	mov	x20, x3
	fadd	d9, d11, d9
	stp	x21, x22, [sp, 32]
	stp	d14, d15, [sp, 96]
	mov	x22, x1
	mov	x21, x2
	mov	x19, x4
	ldr	d2, [x1]
	fneg	d9, d9
	ldr	d15, [x2]
	ldr	d8, [x3]
	fdiv	d0, d9, d10
	fabs	d1, d0
	fcmpe	d1, d12
	bgt	.L14
	fmov	d3, 5.0e-1
	fmov	d1, 1.0e+0
	fmsub	d0, d0, d3, d1
	fmul	d10, d0, d10
.L4:
	ldr	d14, .LC2
	fmov	d0, 1.8e+1
	fmov	d9, 1.0e+0
	str	d2, [x29, 120]
	fadd	d14, d11, d14
	fneg	d14, d14
	fdiv	d0, d14, d0
	bl	exp
	ldr	d13, .LC4
	fmov	d1, 4.0e+0
	ldr	d2, [x29, 120]
	ldr	d3, .LC3
	fmul	d0, d0, d1
	fadd	d13, d11, d13
	fmul	d3, d10, d3
	fsub	d10, d9, d2
	fmul	d1, d0, d2
	fneg	d4, d13
	fmov	d13, 1.0e+1
	fnmsub	d10, d10, d3, d1
	ldr	d1, [x19]
	fdiv	d0, d4, d13
	fmadd	d10, d10, d1, d2
	fabs	d1, d0
	fcmpe	d1, d12
	bgt	.L15
	fmov	d1, 5.0e-1
	fmsub	d0, d0, d1, d9
	fmul	d13, d0, d13
.L7:
	ldr	d0, .LC5
	fmov	d12, 1.0e+0
	fdiv	d0, d14, d0
	bl	exp
	fmov	d1, 1.25e-1
	ldr	d9, .LC6
	fmul	d0, d0, d1
	fmul	d13, d13, d9
	fsub	d9, d12, d15
	fmul	d1, d0, d15
	fmov	d0, 2.0e+1
	fnmsub	d9, d9, d13, d1
	ldr	d1, [x19]
	fdiv	d0, d14, d0
	fmadd	d9, d9, d1, d15
	bl	exp
	fmov	d13, d0
	ldr	d0, .LC7
	fmov	d1, 1.0e+1
	fadd	d0, d11, d0
	fneg	d0, d0
	fdiv	d0, d0, d1
	bl	exp
	fadd	d0, d0, d12
	fsub	d3, d12, d8
	ldr	d1, [x19, 16]
	ldr	d4, [x19]
	ldp	d14, d15, [sp, 96]
	fdiv	d12, d12, d0
	fmul	d1, d9, d1
	ldr	d0, .LC8
	fmul	d1, d1, d9
	fmul	d13, d13, d0
	ldr	d0, [x19, 40]
	fmul	d1, d1, d9
	fsub	d0, d0, d11
	fmul	d2, d1, d9
	ldr	d1, [x19, 32]
	fmul	d1, d10, d1
	fmul	d1, d1, d10
	fmul	d1, d1, d10
	fmul	d12, d12, d8
	fnmsub	d12, d3, d13, d12
	fmadd	d8, d12, d4, d8
	ldp	d12, d13, [sp, 80]
	fmul	d1, d1, d8
	fmul	d1, d1, d0
	ldr	d0, [x19, 24]
	fsub	d0, d0, d11
	fmadd	d1, d2, d0, d1
	ldp	d0, d2, [x19, 48]
	fsub	d2, d2, d11
	fmadd	d1, d0, d2, d1
	ldr	d0, [x19, 8]
	ldr	d2, [x19, 64]
	str	d10, [x22]
	fmul	d0, d4, d0
	fadd	d1, d1, d2
	fmadd	d0, d0, d1, d11
	ldp	d10, d11, [sp, 64]
	str	d9, [x21]
	ldp	x21, x22, [sp, 32]
	str	d8, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L14:
	str	d2, [x29, 120]
	bl	exp
	fmov	d10, 1.0e+0
	ldr	d2, [x29, 120]
	fsub	d0, d0, d10
	fdiv	d10, d9, d0
	b	.L4
	.p2align 3
.L15:
	str	d4, [x29, 120]
	bl	exp
	ldr	d4, [x29, 120]
	fsub	d0, d0, d9
	fdiv	d13, d4, d0
	b	.L7
	.size	calc_hh_c_core, .-calc_hh_c_core
	.align	3
.LC0:
	.word	0
	.word	1078198272
	.align	3
.LC1:
	.word	2696277389
	.word	1051772663
	.align	3
.LC2:
	.word	0
	.word	1079001088
	.align	3
.LC3:
	.word	2576980378
	.word	1069128089
	.align	3
.LC4:
	.word	0
	.word	1078689792
	.align	3
.LC5:
	.word	0
	.word	1079246848
	.align	3
.LC6:
	.word	1202590843
	.word	1065646817
	.align	3
.LC7:
	.word	0
	.word	1078034432
	.align	3
.LC8:
	.word	515396076
	.word	1068624773
	.align	2
	.p2align 3,,7
	.global	calc_hh_c
	.type	calc_hh_c, %function
calc_hh_c:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x27, x28, [sp, 80]
	mov	w27, w0
	sbfiz	x0, x1, 3, 32
	stp	d8, d9, [sp, 96]
	mov	x28, x2
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	stp	d14, d15, [sp, 144]
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	add	x22, x3, x0
	stp	x25, x26, [sp, 64]
	mov	w26, w1
	stp	x23, x24, [sp, 48]
	str	x0, [x29, 176]
	bl	malloc
	mov	x21, x0
	mov	x0, x19
	bl	malloc
	mov	x20, x0
	mov	x0, x19
	bl	malloc
	mov	x19, x0
	ldr	d0, .LC9
	mov	x1, x21
	mov	w0, w26
	bl	init_double
	ldr	d0, .LC10
	mov	x1, x20
	mov	w0, w26
	bl	init_double
	ldr	d0, .LC11
	mov	x1, x19
	mov	w0, w26
	bl	init_double
	cmp	w27, 1
	ble	.L18
	sub	w24, w26, #1
	sub	w0, w27, #1
	add	x24, x24, 1
	str	w0, [x29, 188]
	mov	w25, 0
	lsl	x0, x24, 3
	str	x0, [x29, 168]
	.p2align 2
.L26:
	cmp	w26, 0
	ble	.L27
	ldr	x0, [x29, 176]
	mov	x27, 0
	fmov	d10, 1.0e+1
	fmov	d15, 1.0e+0
	sub	x23, x22, x0
	b	.L25
	.p2align 3
.L32:
	fmov	d1, 5.0e-1
	fmsub	d0, d0, d1, d15
	fmul	d8, d0, d10
.L21:
	ldr	d0, .LC14
	fadd	d9, d14, d0
	fmov	d0, 1.8e+1
	fneg	d9, d9
	fdiv	d0, d9, d0
	bl	exp
	fsub	d7, d15, d13
	ldr	d1, .LC16
	ldr	d6, [x28]
	fadd	d2, d14, d1
	fmov	d1, 4.0e+0
	fmul	d0, d0, d1
	ldr	d1, .LC15
	fmul	d4, d8, d1
	fneg	d8, d2
	fmul	d0, d0, d13
	ldr	d1, .LC13
	fnmsub	d4, d4, d7, d0
	fdiv	d0, d8, d10
	fmadd	d13, d4, d6, d13
	fabs	d2, d0
	fcmpe	d2, d1
	bgt	.L35
	fmov	d1, 5.0e-1
	fmsub	d0, d0, d1, d15
	fmul	d8, d0, d10
.L24:
	ldr	d0, .LC17
	fdiv	d0, d9, d0
	bl	exp
	fsub	d6, d15, d12
	fmov	d7, 2.0e+1
	fmov	d2, 1.25e-1
	ldr	d1, .LC18
	ldr	d5, [x28]
	fmul	d2, d0, d2
	fdiv	d0, d9, d7
	fmul	d8, d8, d1
	fmul	d2, d2, d12
	fnmsub	d8, d8, d6, d2
	fmadd	d8, d8, d5, d12
	bl	exp
	fmov	d9, d0
	ldr	d0, .LC19
	fadd	d0, d14, d0
	fneg	d0, d0
	fdiv	d0, d0, d10
	bl	exp
	fadd	d0, d0, d15
	ldr	d1, .LC20
	fsub	d20, d15, d11
	ldp	d12, d17, [x28, 16]
	str	d13, [x21, x27, lsl 3]
	fdiv	d7, d15, d0
	ldr	d16, [x28, 64]
	fmul	d2, d9, d1
	str	d8, [x20, x27, lsl 3]
	ldp	d1, d18, [x28, 32]
	fmul	d12, d8, d12
	ldp	d19, d5, [x28]
	fsub	d17, d17, d14
	ldp	d6, d9, [x28, 48]
	fmul	d0, d13, d1
	fmul	d12, d12, d8
	fsub	d18, d18, d14
	fmul	d5, d19, d5
	fmul	d0, d0, d13
	fsub	d9, d9, d14
	fmul	d12, d12, d8
	fmul	d0, d0, d13
	fmul	d12, d12, d8
	fmul	d4, d7, d11
	fnmsub	d2, d2, d20, d4
	fmadd	d11, d2, d19, d11
	fmul	d0, d0, d11
	str	d11, [x19, x27, lsl 3]
	fmul	d0, d0, d18
	fmadd	d12, d12, d17, d0
	fmadd	d12, d6, d9, d12
	fadd	d12, d12, d16
	fmadd	d12, d5, d12, d14
	str	d12, [x22, x27, lsl 3]
	add	x27, x27, 1
	cmp	x27, x24
	beq	.L36
.L25:
	ldr	d0, .LC12
	ldr	d14, [x23, x27, lsl 3]
	ldr	d1, .LC13
	ldr	d13, [x21, x27, lsl 3]
	ldr	d11, [x19, x27, lsl 3]
	fadd	d8, d14, d0
	ldr	d12, [x20, x27, lsl 3]
	fneg	d9, d8
	fdiv	d0, d9, d10
	fabs	d2, d0
	fcmpe	d2, d1
	ble	.L32
	bl	exp
	fsub	d0, d0, d15
	fdiv	d8, d9, d0
	b	.L21
	.p2align 3
.L35:
	bl	exp
	fsub	d0, d0, d15
	fdiv	d8, d8, d0
	b	.L24
	.p2align 3
.L36:
	ldr	x0, [x29, 168]
	add	x22, x22, x0
.L27:
	ldr	w0, [x29, 188]
	add	w25, w25, 1
	cmp	w0, w25
	bne	.L26
.L18:
	mov	x0, x21
	bl	free
	mov	x0, x20
	bl	free
	ldp	d8, d9, [sp, 96]
	mov	x0, x19
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	ldp	d14, d15, [sp, 144]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	b	free
	.size	calc_hh_c, .-calc_hh_c
	.align	3
.LC9:
	.word	2049366767
	.word	1068177911
	.align	3
.LC10:
	.word	2368040696
	.word	1070879953
	.align	3
.LC11:
	.word	3566806162
	.word	1071846251
	.align	3
.LC12:
	.word	0
	.word	1078198272
	.align	3
.LC13:
	.word	2696277389
	.word	1051772663
	.align	3
.LC14:
	.word	0
	.word	1079001088
	.align	3
.LC15:
	.word	2576980378
	.word	1069128089
	.align	3
.LC16:
	.word	0
	.word	1078689792
	.align	3
.LC17:
	.word	0
	.word	1079246848
	.align	3
.LC18:
	.word	1202590843
	.word	1065646817
	.align	3
.LC19:
	.word	0
	.word	1078034432
	.align	3
.LC20:
	.word	515396076
	.word	1068624773
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
