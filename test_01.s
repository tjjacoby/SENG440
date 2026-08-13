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
	.file	"test_01.c"
	.text
	.align	1
	.global	addition_seng440
	.syntax unified
	.thumb
	.thumb_func
	.type	addition_seng440, %function
addition_seng440:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	addition_seng440, .-addition_seng440
	.section	.rodata
	.align	2
.LC0:
	.ascii	"arg_1 = \000"
	.align	2
.LC1:
	.ascii	"%i\000"
	.align	2
.LC2:
	.ascii	"arg_2 = \000"
	.align	2
.LC3:
	.ascii	"sum = %i\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	ldr	r3, .L5
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	add	r3, r7, #8
	mov	r1, r3
	ldr	r3, .L5+4
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r3, .L5+8
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	adds	r3, r7, #4
	mov	r1, r3
	ldr	r3, .L5+12
.LPIC3:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #4]
	mov	r1, r2
	mov	r0, r3
	bl	addition_seng440(PLT)
	str	r0, [r7, #12]
	ldr	r1, [r7, #12]
	ldr	r3, .L5+16
.LPIC4:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC2-(.LPIC2+4)
	.word	.LC1-(.LPIC3+4)
	.word	.LC3-(.LPIC4+4)
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
