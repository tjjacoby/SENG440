	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"butterworth.c"
	.text
	.section	.rodata
	.align	2
	.type	b0, %object
	.size	b0, 4
b0:
	.word	1105
	.align	2
	.type	b1, %object
	.size	b1, 4
b1:
	.word	2210
	.align	2
	.type	b2, %object
	.size	b2, 4
b2:
	.word	1105
	.align	2
	.type	a1, %object
	.size	a1, 4
a1:
	.word	18727
	.align	2
	.type	a2, %object
	.size	a2, 4
a2:
	.word	-6763
	.align	2
.LC0:
	.ascii	"y_fixed[%2d] = %+9.5f\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #152
	add	r7, sp, #0
	mov	r3, #49152
	movt	r3, 65535
	str	r3, [r7, #148]
	mov	r3, #49152
	movt	r3, 65535
	str	r3, [r7, #144]
	mov	r3, #49152
	movt	r3, 65535
	str	r3, [r7, #140]
	mov	r3, #49152
	movt	r3, 65535
	str	r3, [r7, #136]
	movs	r3, #0
	str	r3, [r7, #132]
	b	.L2
.L3:
	ldr	r3, [r7, #132]
	lsls	r3, r3, #2
	adds	r3, r3, #152
	add	r3, r3, r7
	mov	r2, #16384
	str	r2, [r3, #-148]
	ldr	r3, [r7, #132]
	adds	r3, r3, #1
	str	r3, [r7, #132]
.L2:
	ldr	r3, [r7, #132]
	cmp	r3, #29
	ble	.L3
	movs	r3, #0
	str	r3, [r7, #128]
	b	.L4
.L5:
	ldr	r3, [r7, #128]
	lsls	r3, r3, #2
	adds	r3, r3, #152
	add	r3, r3, r7
	ldr	r3, [r3, #-148]
	movw	r2, #1105
	mul	r2, r3, r2
	movw	r1, #2210
	ldr	r3, [r7, #148]
	mul	r3, r1, r3
	add	r2, r2, r3
	movw	r1, #1105
	ldr	r3, [r7, #144]
	mul	r3, r1, r3
	add	r2, r2, r3
	movw	r1, #18727
	ldr	r3, [r7, #140]
	mul	r3, r1, r3
	add	r2, r2, r3
	movw	r3, #58773
	movt	r3, 65535
	ldr	r1, [r7, #136]
	mul	r3, r1, r3
	add	r3, r3, r2
	asrs	r3, r3, #14
	str	r3, [r7, #124]
	ldr	r3, [r7, #124]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L7
	vdiv.f64	d5, d7, d6
	vmov	r2, r3, d5
	ldr	r1, [r7, #128]
	ldr	r0, .L7+8
.LPIC0:
	add	r0, pc
	bl	printf(PLT)
	ldr	r3, [r7, #148]
	str	r3, [r7, #144]
	ldr	r3, [r7, #128]
	lsls	r3, r3, #2
	adds	r3, r3, #152
	add	r3, r3, r7
	ldr	r3, [r3, #-148]
	str	r3, [r7, #148]
	ldr	r3, [r7, #140]
	str	r3, [r7, #136]
	ldr	r3, [r7, #124]
	str	r3, [r7, #140]
	ldr	r3, [r7, #128]
	adds	r3, r3, #1
	str	r3, [r7, #128]
.L4:
	ldr	r3, [r7, #128]
	cmp	r3, #29
	ble	.L5
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #152
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	3
.L7:
	.word	0
	.word	1087373312
	.word	.LC0-(.LPIC0+4)
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits


