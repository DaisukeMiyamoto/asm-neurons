	.arch armv8-a
	.file	"calc_hh_c.c"
	.text
	.align	2
	.p2align 3,,7
	.global	v_trap
	.type	v_trap, %function
v_trap:
	fdiv	d2, d0, d1
	ldr	d3, .LC0
	fabs	d4, d2
	fcmpe	d4, d3
	bgt	.L10
	fmov	d3, 5.0e-1
	fmov	d0, 1.0e+0
	fmsub	d0, d2, d3, d0
	fmul	d0, d0, d1
	ret
	.p2align 3
.L10:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	d8, [sp, 16]
	fmov	d8, d0
	fmov	d0, d2
	bl	exp
	fmov	d2, 1.0e+0
	fsub	d0, d0, d2
	fdiv	d0, d8, d0
	ldr	d8, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	v_trap, .-v_trap
	.align	3
.LC0:
	.word	2696277389
	.word	1051772663
	.align	2
	.p2align 3,,7
	.global	calc_alpha_n
	.type	calc_alpha_n, %function
calc_alpha_n:
	stp	x29, x30, [sp, -32]!
	fmov	d1, 1.0e+1
	add	x29, sp, 0
	str	d8, [sp, 16]
	ldr	d8, .LC1
	ldr	d2, .LC2
	fadd	d0, d0, d8
	fneg	d8, d0
	fdiv	d0, d8, d1
	fabs	d3, d0
	fcmpe	d3, d2
	bgt	.L18
	fmov	d3, 5.0e-1
	fmov	d2, 1.0e+0
	ldr	d8, [sp, 16]
	ldp	x29, x30, [sp], 32
	fmsub	d0, d0, d3, d2
	fmul	d0, d0, d1
	ldr	d1, .LC3
	fmul	d0, d0, d1
	ret
	.p2align 3
.L18:
	bl	exp
	fmov	d1, 1.0e+0
	fsub	d0, d0, d1
	ldr	d1, .LC3
	fdiv	d0, d8, d0
	ldr	d8, [sp, 16]
	ldp	x29, x30, [sp], 32
	fmul	d0, d0, d1
	ret
	.size	calc_alpha_n, .-calc_alpha_n
	.align	3
.LC1:
	.word	0
	.word	1078689792
	.align	3
.LC2:
	.word	2696277389
	.word	1051772663
	.align	3
.LC3:
	.word	1202590843
	.word	1065646817
	.align	2
	.p2align 3,,7
	.global	calc_beta_n
	.type	calc_beta_n, %function
calc_beta_n:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	ldr	d1, .LC4
	ldr	d2, .LC5
	fadd	d0, d0, d1
	fneg	d0, d0
	fdiv	d0, d0, d2
	bl	exp
	fmov	d1, 1.25e-1
	ldp	x29, x30, [sp], 16
	fmul	d0, d0, d1
	ret
	.size	calc_beta_n, .-calc_beta_n
	.align	3
.LC4:
	.word	0
	.word	1079001088
	.align	3
.LC5:
	.word	0
	.word	1079246848
	.align	2
	.p2align 3,,7
	.global	calc_alpha_m
	.type	calc_alpha_m, %function
calc_alpha_m:
	stp	x29, x30, [sp, -32]!
	fmov	d1, 1.0e+1
	add	x29, sp, 0
	str	d8, [sp, 16]
	ldr	d8, .LC6
	ldr	d2, .LC7
	fadd	d0, d0, d8
	fneg	d8, d0
	fdiv	d0, d8, d1
	fabs	d3, d0
	fcmpe	d3, d2
	bgt	.L28
	fmov	d3, 5.0e-1
	fmov	d2, 1.0e+0
	ldr	d8, [sp, 16]
	ldp	x29, x30, [sp], 32
	fmsub	d0, d0, d3, d2
	fmul	d0, d0, d1
	ldr	d1, .LC8
	fmul	d0, d0, d1
	ret
	.p2align 3
.L28:
	bl	exp
	fmov	d1, 1.0e+0
	fsub	d0, d0, d1
	ldr	d1, .LC8
	fdiv	d0, d8, d0
	ldr	d8, [sp, 16]
	ldp	x29, x30, [sp], 32
	fmul	d0, d0, d1
	ret
	.size	calc_alpha_m, .-calc_alpha_m
	.align	3
.LC6:
	.word	0
	.word	1078198272
	.align	3
.LC7:
	.word	2696277389
	.word	1051772663
	.align	3
.LC8:
	.word	2576980378
	.word	1069128089
	.align	2
	.p2align 3,,7
	.global	calc_beta_m
	.type	calc_beta_m, %function
calc_beta_m:
	stp	x29, x30, [sp, -16]!
	fmov	d2, 1.8e+1
	add	x29, sp, 0
	ldr	d1, .LC9
	fadd	d0, d0, d1
	fneg	d0, d0
	fdiv	d0, d0, d2
	bl	exp
	fmov	d1, 4.0e+0
	ldp	x29, x30, [sp], 16
	fmul	d0, d0, d1
	ret
	.size	calc_beta_m, .-calc_beta_m
	.align	3
.LC9:
	.word	0
	.word	1079001088
	.align	2
	.p2align 3,,7
	.global	calc_alpha_h
	.type	calc_alpha_h, %function
calc_alpha_h:
	stp	x29, x30, [sp, -16]!
	fmov	d2, 2.0e+1
	add	x29, sp, 0
	ldr	d1, .LC10
	fadd	d0, d0, d1
	fneg	d0, d0
	fdiv	d0, d0, d2
	bl	exp
	ldr	d1, .LC11
	ldp	x29, x30, [sp], 16
	fmul	d0, d0, d1
	ret
	.size	calc_alpha_h, .-calc_alpha_h
	.align	3
.LC10:
	.word	0
	.word	1079001088
	.align	3
.LC11:
	.word	515396076
	.word	1068624773
	.align	2
	.p2align 3,,7
	.global	calc_beta_h
	.type	calc_beta_h, %function
calc_beta_h:
	stp	x29, x30, [sp, -16]!
	fmov	d2, 1.0e+1
	add	x29, sp, 0
	ldr	d1, .LC12
	fadd	d0, d0, d1
	fneg	d0, d0
	fdiv	d0, d0, d2
	bl	exp
	fmov	d1, 1.0e+0
	ldp	x29, x30, [sp], 16
	fadd	d0, d0, d1
	fdiv	d0, d1, d0
	ret
	.size	calc_beta_h, .-calc_beta_h
	.align	3
.LC12:
	.word	0
	.word	1078034432
	.align	2
	.p2align 3,,7
	.global	calc_dm_core
	.type	calc_dm_core, %function
calc_dm_core:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	d10, d11, [sp, 32]
	fmov	d11, d2
	ldr	d10, .LC13
	stp	d8, d9, [sp, 16]
	fmov	d8, 1.0e+1
	fmov	d9, d0
	ldr	d3, .LC14
	fadd	d10, d0, d10
	str	d12, [sp, 48]
	fmov	d12, d1
	fneg	d10, d10
	fdiv	d0, d10, d8
	fabs	d1, d0
	fcmpe	d1, d3
	bgt	.L42
	fmov	d2, 5.0e-1
	fmov	d1, 1.0e+0
	fmsub	d0, d0, d2, d1
	fmul	d8, d0, d8
.L38:
	ldr	d1, .LC15
	fmov	d0, 1.8e+1
	fadd	d9, d9, d1
	fneg	d9, d9
	fdiv	d0, d9, d0
	bl	exp
	fmov	d2, 4.0e+0
	ldr	d1, .LC16
	fmov	d3, 1.0e+0
	fmul	d0, d0, d2
	fsub	d3, d3, d12
	fmul	d8, d8, d1
	fmul	d0, d0, d12
	ldr	d12, [sp, 48]
	fnmsub	d0, d3, d8, d0
	ldp	d8, d9, [sp, 16]
	fmul	d0, d0, d11
	ldp	d10, d11, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L42:
	bl	exp
	fmov	d8, 1.0e+0
	fsub	d0, d0, d8
	fdiv	d8, d10, d0
	b	.L38
	.size	calc_dm_core, .-calc_dm_core
	.align	3
.LC13:
	.word	0
	.word	1078198272
	.align	3
.LC14:
	.word	2696277389
	.word	1051772663
	.align	3
.LC15:
	.word	0
	.word	1079001088
	.align	3
.LC16:
	.word	2576980378
	.word	1069128089
	.align	2
	.p2align 3,,7
	.global	calc_dn_core
	.type	calc_dn_core, %function
calc_dn_core:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	d10, d11, [sp, 32]
	fmov	d11, d2
	ldr	d10, .LC17
	stp	d8, d9, [sp, 16]
	fmov	d8, 1.0e+1
	fmov	d9, d0
	ldr	d3, .LC18
	fadd	d10, d0, d10
	str	d12, [sp, 48]
	fmov	d12, d1
	fneg	d10, d10
	fdiv	d0, d10, d8
	fabs	d1, d0
	fcmpe	d1, d3
	bgt	.L50
	fmov	d2, 5.0e-1
	fmov	d1, 1.0e+0
	fmsub	d0, d0, d2, d1
	fmul	d8, d0, d8
.L46:
	ldr	d1, .LC19
	ldr	d0, .LC20
	fadd	d9, d9, d1
	fneg	d9, d9
	fdiv	d0, d9, d0
	bl	exp
	fmov	d2, 1.25e-1
	ldr	d1, .LC21
	fmov	d3, 1.0e+0
	fmul	d0, d0, d2
	fsub	d3, d3, d12
	fmul	d8, d8, d1
	fmul	d0, d0, d12
	ldr	d12, [sp, 48]
	fnmsub	d0, d3, d8, d0
	ldp	d8, d9, [sp, 16]
	fmul	d0, d0, d11
	ldp	d10, d11, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L50:
	bl	exp
	fmov	d8, 1.0e+0
	fsub	d0, d0, d8
	fdiv	d8, d10, d0
	b	.L46
	.size	calc_dn_core, .-calc_dn_core
	.align	3
.LC17:
	.word	0
	.word	1078689792
	.align	3
.LC18:
	.word	2696277389
	.word	1051772663
	.align	3
.LC19:
	.word	0
	.word	1079001088
	.align	3
.LC20:
	.word	0
	.word	1079246848
	.align	3
.LC21:
	.word	1202590843
	.word	1065646817
	.align	2
	.p2align 3,,7
	.global	calc_dh_core
	.type	calc_dh_core, %function
calc_dh_core:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	d8, d9, [sp, 16]
	fmov	d8, d0
	ldr	d4, .LC22
	fmov	d0, 2.0e+1
	stp	d10, d11, [sp, 32]
	fmov	d10, d1
	fmov	d11, d2
	fadd	d4, d8, d4
	fneg	d4, d4
	fdiv	d0, d4, d0
	bl	exp
	fmov	d9, d0
	ldr	d1, .LC23
	fmov	d0, 1.0e+1
	fadd	d8, d8, d1
	fneg	d8, d8
	fdiv	d0, d8, d0
	bl	exp
	fmov	d3, 1.0e+0
	ldr	d1, .LC24
	fadd	d0, d0, d3
	fsub	d4, d3, d10
	fmul	d9, d9, d1
	fdiv	d3, d3, d0
	fmul	d1, d3, d10
	fnmsub	d0, d4, d9, d1
	ldp	d8, d9, [sp, 16]
	fmul	d0, d0, d11
	ldp	d10, d11, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	calc_dh_core, .-calc_dh_core
	.align	3
.LC22:
	.word	0
	.word	1079001088
	.align	3
.LC23:
	.word	0
	.word	1078034432
	.align	3
.LC24:
	.word	515396076
	.word	1068624773
	.align	2
	.p2align 3,,7
	.global	calc_dv_core
	.type	calc_dv_core, %function
calc_dv_core:
	ldp	d5, d7, [x0, 32]
	ldp	d4, d6, [x0, 16]
	fmul	d5, d1, d5
	fsub	d7, d7, d0
	fmul	d4, d2, d4
	fsub	d6, d6, d0
	fmul	d5, d5, d1
	fmul	d4, d4, d2
	fmul	d1, d5, d1
	fmul	d4, d4, d2
	fmul	d3, d1, d3
	ldp	d1, d5, [x0, 48]
	fmul	d4, d4, d2
	fmul	d3, d3, d7
	ldp	d2, d7, [x0]
	fmadd	d4, d4, d6, d3
	fsub	d3, d5, d0
	ldr	d6, [x0, 64]
	fmul	d0, d2, d7
	fmadd	d4, d1, d3, d4
	fadd	d4, d4, d6
	fmul	d0, d4, d0
	ret
	.size	calc_dv_core, .-calc_dv_core
	.align	2
	.p2align 3,,7
	.global	calc_hh_c_core
	.type	calc_hh_c_core, %function
calc_hh_c_core:
	stp	x29, x30, [sp, -144]!
	fmov	d1, 1.0e+1
	add	x29, sp, 0
	stp	d8, d9, [sp, 48]
	ldr	d9, .LC25
	stp	d12, d13, [sp, 80]
	ldr	d13, [x0]
	ldr	d0, [x2]
	stp	d14, d15, [sp, 96]
	ldr	d15, .LC26
	fadd	d9, d13, d9
	stp	x19, x20, [sp, 16]
	str	d0, [x29, 128]
	mov	x20, x3
	ldr	d0, [x3]
	mov	x19, x4
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	fneg	d12, d9
	stp	d10, d11, [sp, 64]
	mov	x21, x2
	str	d0, [x29, 136]
	ldr	d8, [x1]
	fdiv	d0, d12, d1
	ldr	d11, [x4]
	fabs	d2, d0
	fcmpe	d2, d15
	bgt	.L66
	fmov	d9, 1.0e+0
	fmov	d2, 5.0e-1
	fmsub	d0, d0, d2, d9
	fmul	d9, d0, d1
.L57:
	ldr	d14, .LC27
	fmov	d0, 1.8e+1
	fmov	d10, 1.0e+0
	fadd	d14, d13, d14
	fneg	d14, d14
	fdiv	d0, d14, d0
	bl	exp
	ldr	d12, .LC29
	fmov	d1, 4.0e+0
	fmov	d4, 1.0e+1
	ldr	d5, .LC28
	fmul	d0, d0, d1
	fadd	d12, d13, d12
	fmul	d9, d9, d5
	fsub	d5, d10, d8
	fmul	d1, d0, d8
	fneg	d12, d12
	fnmsub	d1, d9, d5, d1
	fdiv	d0, d12, d4
	fmadd	d8, d11, d1, d8
	ldr	d11, [x19]
	fabs	d1, d0
	fcmpe	d1, d15
	bgt	.L67
	fmov	d12, 5.0e-1
	fmsub	d0, d0, d12, d10
	fmul	d12, d0, d4
.L60:
	ldr	d0, .LC30
	fmov	d1, 1.0e+0
	fsub	d9, d1, d8
	str	d1, [x29, 120]
	fdiv	d0, d14, d0
	bl	exp
	fmov	d2, 1.25e-1
	ldr	d3, .LC31
	ldr	d1, [x29, 128]
	fmul	d0, d0, d2
	fmul	d12, d12, d3
	fmul	d2, d0, d8
	fmov	d0, 2.0e+1
	fnmsub	d2, d12, d9, d2
	fdiv	d0, d14, d0
	ldr	d14, [x19]
	fmadd	d11, d11, d2, d1
	bl	exp
	fmov	d12, d0
	ldr	d0, .LC32
	fmov	d2, 1.0e+1
	fadd	d0, d13, d0
	fneg	d0, d0
	fdiv	d0, d0, d2
	bl	exp
	ldr	d1, [x29, 120]
	fadd	d0, d0, d1
	fdiv	d2, d1, d0
	ldr	d1, .LC33
	ldr	d0, [x29, 136]
	fmul	d12, d12, d1
	ldr	d1, [x19, 32]
	fmul	d1, d8, d1
	fmul	d1, d1, d8
	fmul	d3, d1, d8
	ldr	d1, [x19, 16]
	fmul	d1, d11, d1
	fmul	d1, d1, d11
	fmul	d1, d1, d11
	fmul	d2, d2, d8
	fnmsub	d9, d12, d9, d2
	fmul	d2, d1, d11
	ldr	d1, [x19, 40]
	fsub	d4, d1, d13
	fmadd	d9, d14, d9, d0
	ldr	d0, [x19, 24]
	ldp	d14, d15, [sp, 96]
	fsub	d0, d0, d13
	fmul	d1, d3, d9
	ldr	d3, [x19, 64]
	fmul	d1, d1, d4
	fmadd	d1, d2, d0, d1
	ldp	d0, d2, [x19, 48]
	fsub	d2, d2, d13
	fmadd	d1, d0, d2, d1
	ldp	d0, d2, [x19]
	fmul	d0, d0, d2
	fadd	d1, d1, d3
	fmadd	d0, d0, d1, d13
	ldp	d12, d13, [sp, 80]
	str	d8, [x22]
	str	d11, [x21]
	ldp	x21, x22, [sp, 32]
	ldp	d10, d11, [sp, 64]
	str	d9, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L66:
	bl	exp
	fmov	d9, 1.0e+0
	fsub	d0, d0, d9
	fdiv	d9, d12, d0
	b	.L57
	.p2align 3
.L67:
	bl	exp
	fsub	d0, d0, d10
	fdiv	d12, d12, d0
	b	.L60
	.size	calc_hh_c_core, .-calc_hh_c_core
	.align	3
.LC25:
	.word	0
	.word	1078198272
	.align	3
.LC26:
	.word	2696277389
	.word	1051772663
	.align	3
.LC27:
	.word	0
	.word	1079001088
	.align	3
.LC28:
	.word	2576980378
	.word	1069128089
	.align	3
.LC29:
	.word	0
	.word	1078689792
	.align	3
.LC30:
	.word	0
	.word	1079246848
	.align	3
.LC31:
	.word	1202590843
	.word	1065646817
	.align	3
.LC32:
	.word	0
	.word	1078034432
	.align	3
.LC33:
	.word	515396076
	.word	1068624773
	.align	2
	.p2align 3,,7
	.global	calc_hh_c
	.type	calc_hh_c, %function
calc_hh_c:
	stp	x29, x30, [sp, -208]!
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
	ldr	d0, .LC34
	mov	x1, x21
	mov	w0, w26
	bl	init_double
	ldr	d0, .LC35
	mov	x1, x20
	mov	w0, w26
	bl	init_double
	ldr	d0, .LC36
	mov	x1, x19
	mov	w0, w26
	bl	init_double
	cmp	w27, 1
	ble	.L70
	sub	w24, w26, #1
	sub	w0, w27, #1
	add	x24, x24, 1
	str	w0, [x29, 188]
	mov	w25, 0
	lsl	x0, x24, 3
	str	x0, [x29, 168]
	.p2align 2
.L78:
	cmp	w26, 0
	ble	.L79
	ldr	x0, [x29, 176]
	mov	x27, 0
	fmov	d12, 1.0e+0
	sub	x23, x22, x0
	b	.L77
	.p2align 3
.L84:
	fmov	d1, 5.0e-1
	fmsub	d0, d0, d1, d12
	fmov	d1, 1.0e+1
	fmul	d15, d0, d1
.L73:
	ldr	d0, .LC39
	fadd	d9, d10, d0
	fmov	d0, 1.8e+1
	fneg	d9, d9
	fdiv	d0, d9, d0
	bl	exp
	fsub	d5, d12, d13
	ldr	d1, .LC41
	fadd	d8, d10, d1
	fmov	d1, 4.0e+0
	fmul	d0, d0, d1
	ldr	d1, .LC40
	fneg	d8, d8
	fmul	d1, d15, d1
	fmul	d0, d0, d13
	ldr	d15, [x28]
	fnmsub	d1, d1, d5, d0
	fmov	d0, 1.0e+1
	fdiv	d0, d8, d0
	fmadd	d13, d11, d1, d13
	ldr	d1, .LC38
	fabs	d4, d0
	fcmpe	d4, d1
	bgt	.L87
	fmov	d1, 5.0e-1
	fmsub	d0, d0, d1, d12
	fmov	d1, 1.0e+1
	fmul	d8, d0, d1
.L76:
	ldr	d0, .LC42
	fsub	d11, d12, d13
	fdiv	d0, d9, d0
	bl	exp
	fmov	d5, 2.0e+1
	fmov	d4, 1.25e-1
	ldr	d1, .LC43
	ldr	d7, [x28]
	fmul	d4, d0, d4
	fdiv	d0, d9, d5
	fmul	d8, d8, d1
	str	d7, [x29, 192]
	fmul	d4, d4, d13
	fnmsub	d8, d8, d11, d4
	fmadd	d8, d15, d8, d14
	bl	exp
	fmov	d9, d0
	ldr	d0, .LC44
	fmov	d1, 1.0e+1
	fadd	d0, d10, d0
	fneg	d0, d0
	fdiv	d0, d0, d1
	bl	exp
	fadd	d0, d0, d12
	ldr	d1, .LC45
	ldp	d14, d18, [x28, 32]
	str	d13, [x21, x27, lsl 3]
	fdiv	d0, d12, d0
	str	d8, [x20, x27, lsl 3]
	fmul	d6, d9, d1
	ldr	d9, [x28, 64]
	ldp	d15, d17, [x28, 16]
	fmul	d14, d13, d14
	ldp	d5, d16, [x28, 48]
	fsub	d18, d18, d10
	ldp	d19, d4, [x28]
	fmul	d14, d14, d13
	fmul	d15, d8, d15
	fsub	d17, d17, d10
	fsub	d16, d16, d10
	fmul	d14, d14, d13
	fmul	d4, d19, d4
	fmul	d15, d15, d8
	fmul	d15, d15, d8
	fmul	d15, d15, d8
	fmul	d1, d0, d13
	fnmsub	d11, d6, d11, d1
	ldp	d7, d0, [x29, 192]
	fmadd	d13, d7, d11, d0
	fmul	d14, d14, d13
	str	d13, [x19, x27, lsl 3]
	fmul	d14, d14, d18
	fmadd	d14, d15, d17, d14
	fmadd	d14, d5, d16, d14
	fadd	d14, d14, d9
	fmadd	d14, d4, d14, d10
	str	d14, [x22, x27, lsl 3]
	add	x27, x27, 1
	cmp	x27, x24
	beq	.L88
.L77:
	ldr	d0, [x19, x27, lsl 3]
	ldr	d10, [x23, x27, lsl 3]
	ldr	d2, .LC38
	ldr	d13, [x21, x27, lsl 3]
	str	d0, [x29, 200]
	ldr	d0, .LC37
	ldr	d14, [x20, x27, lsl 3]
	ldr	d11, [x28]
	fadd	d15, d10, d0
	fmov	d0, 1.0e+1
	fneg	d8, d15
	fdiv	d0, d8, d0
	fabs	d1, d0
	fcmpe	d1, d2
	ble	.L84
	bl	exp
	fsub	d0, d0, d12
	fdiv	d15, d8, d0
	b	.L73
	.p2align 3
.L87:
	bl	exp
	fsub	d0, d0, d12
	fdiv	d8, d8, d0
	b	.L76
	.p2align 3
.L88:
	ldr	x0, [x29, 168]
	add	x22, x22, x0
.L79:
	ldr	w0, [x29, 188]
	add	w25, w25, 1
	cmp	w0, w25
	bne	.L78
.L70:
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
	ldp	x29, x30, [sp], 208
	b	free
	.size	calc_hh_c, .-calc_hh_c
	.align	3
.LC34:
	.word	2049366767
	.word	1068177911
	.align	3
.LC35:
	.word	2368040696
	.word	1070879953
	.align	3
.LC36:
	.word	3566806162
	.word	1071846251
	.align	3
.LC37:
	.word	0
	.word	1078198272
	.align	3
.LC38:
	.word	2696277389
	.word	1051772663
	.align	3
.LC39:
	.word	0
	.word	1079001088
	.align	3
.LC40:
	.word	2576980378
	.word	1069128089
	.align	3
.LC41:
	.word	0
	.word	1078689792
	.align	3
.LC42:
	.word	0
	.word	1079246848
	.align	3
.LC43:
	.word	1202590843
	.word	1065646817
	.align	3
.LC44:
	.word	0
	.word	1078034432
	.align	3
.LC45:
	.word	515396076
	.word	1068624773
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
