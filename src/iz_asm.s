	.arch armv8-a
	.file	"iz.c"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 3,,7
	.global	main
	.type	main, %function

main:
	stp	x29, x30, [sp, -64]!
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	add	x29, sp, 0
	mov	w0, 1

	stp	x19, x20, [sp, 16]
	mov	w19, 2000
	mov	x20, x1

	fmov	d0, xzr

	adr	x10, IZ_V_INIT
	ldr	d20, [x10]
	adr	x10, IZ_U_INIT
	ldr	d21, [x10]

	b	.check
	.p2align 3
.loop:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	fmov	d0, d20
	bl	printf

	adr	x10, DT
	ldr	d10, [x10]
	adr	x10, IZ_A
	ldr	d11, [x10]
	adr	x10, IZ_B
	ldr	d12, [x10]
	adr	x10, IZ_C
	ldr	d13, [x10]
	adr	x10, IZ_D
	ldr	d14, [x10]
	adr	x10, IZ_I
	ldr	d15, [x10]
	adr	x10, IZ_V_1
	ldr	d16, [x10]
	adr	x10, IZ_V_2
	ldr	d17, [x10]
	adr	x10, IZ_V_3
	ldr	d18, [x10]
	adr	x10, IZ_TH
	ldr	d19, [x10]

	// dv = (iz_v_1 * iz_v * iz_v + iz_v_2 * iz_v + iz_v_3 - iz_u + iz_i) * dt;
	fmul	d2, d20, d20
	fmul	d2, d2, d16
	fmul	d3, d17, d20
	fadd	d2, d2, d3
	fadd	d2, d2, d18
	fsub	d2, d2, d21
	fadd	d2, d2, d15
	fmul	d2, d2, d10

	// du = (iz_a * (iz_b * iz_v - iz_u)) * dt;
	fmul	d4, d12, d20
	fsub	d4, d4, d21
	fmul	d4, d4, d11
	fmul	d4, d4, d10
	
	// iz_v += dv;
	fadd	d20, d20, d2

	// iz_u += du;
	fadd	d21, d21, d4

	// if (iz_v > iz_th)
	fcmp	d19, d20
	b.gt 	.check

	//iz_v = iz_c;
	fmov	d20, d13
	//iz_u += iz_d;
	fadd	d21, d21, d14

.check:
	subs	w19, w19, #1
	mov	x1, x20
	mov	w0, 1
	bne	.loop

	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 32]
	ldp	d10, d11, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	
	.size	main, .-main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%f\n"

	.data
MAXSTEP:	.dword 10
DT:		.double 0.1
IZ_A:		.double 0.02
IZ_B:		.double 0.2
IZ_C:		.double -65.0
IZ_D:		.double 8.0
IZ_I:		.double 10.0
IZ_V_1:		.double 0.04
IZ_V_2:		.double 5.0
IZ_V_3:		.double 140.0
IZ_TH:		.double 30.0
IZ_V_INIT:	.double -65.0
IZ_U_INIT:	.double -13.0
	
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
