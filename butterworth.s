	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"butterworth.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"y_fixed[%2d] = %+9.5f\012\000"
	.section	.text.startup,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #16384
	vpush.64	{d8}
	sub	sp, sp, #124
	sub	r8, sp, #4
	add	r1, sp, #116
	mov	r3, r8
.L2:
	str	r2, [r3, #4]!
	cmp	r1, r3
	bne	.L2
	ldr	r10, .L8+8
	mov	r3, #49152
	movt	r3, 65535
	movw	r9, #58773
	movt	r9, 65535
	mov	fp, #0
	mov	r6, r3
	mov	r2, r3
	vldr.64	d8, .L8
.LPIC0:
	add	r10, pc
	mov	r5, r3
.L3:
	ldr	r7, [r8, #4]!
	movw	r4, #2210
	movw	lr, #1105
	movw	ip, #18727
	mul	r4, r5, r4
	mov	r1, fp
	mov	r0, r10
	add	fp, fp, #1
	mla	r4, lr, r7, r4
	mla	r4, lr, r2, r4
	mla	r4, ip, r6, r4
	mla	r4, r9, r3, r4
	asrs	r4, r4, #14
	vmov	s15, r4	@ int
	vcvt.f64.s32	d7, s15
	vmul.f64	d7, d7, d8
	vmov	r2, r3, d7
	bl	printf(PLT)
	mov	r2, r5
	mov	r3, r6
	mov	r5, r7
	mov	r6, r4
	cmp	fp, #30
	bne	.L3
	movs	r0, #0
	add	sp, sp, #124
	@ sp needed
	vldm	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L9:
	.align	3
.L8:
	.word	0
	.word	1058013184
	.word	.LC0-(.LPIC0+4)
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
