	.cpu cortex-a7
	.arch armv7-a
	.arch_extension virt
	.arch_extension idiv
	.arch_extension sec
	.arch_extension mp
	.fpu neon-vfpv4
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
	.file	"butterworth_unrolled8.c"
	.text
	.section	.rodata
	.align	2
	.type	b02_1, %object
	.size	b02_1, 4
b02_1:
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
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	elapsed_nanoseconds, %function
elapsed_nanoseconds:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10, fp}
	sub	sp, sp, #48
	add	r7, sp, #0
	str	r0, [r7, #28]
	str	r1, [r7, #24]
	ldr	r3, [r7, #24]
	ldrd	r0, [r3]
	ldr	r3, [r7, #28]
	ldrd	r2, [r3]
	subs	r6, r0, r2
	str	r6, [r7, #8]
	sbc	r3, r1, r3
	str	r3, [r7, #12]
	ldrd	r2, [r7, #8]
	strd	r2, [r7, #40]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #8]
	asrs	r2, r3, #31
	mov	r10, r3
	mov	fp, r2
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #8]
	asrs	r2, r3, #31
	mov	r8, r3
	mov	r9, r2
	subs	r3, r10, r8
	str	r3, [r7]
	sbc	r3, fp, r9
	str	r3, [r7, #4]
	ldrd	r2, [r7]
	strd	r2, [r7, #32]
	ldr	r2, [r7, #44]
	mov	r3, #51712
	movt	r3, 15258
	mul	r2, r3, r2
	ldr	r3, [r7, #40]
	movs	r1, #0
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, [r7, #40]
	mov	r3, #51712
	movt	r3, 15258
	umull	r4, r5, r1, r3
	adds	r3, r2, r5
	mov	r5, r3
	ldrd	r2, [r7, #32]
	adds	r1, r4, r2
	str	r1, [r7, #16]
	adc	r3, r5, r3
	str	r3, [r7, #20]
	ldrd	r2, [r7, #16]
	mov	r0, r2
	mov	r1, r3
	adds	r7, r7, #48
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp}
	bx	lr
	.size	elapsed_nanoseconds, .-elapsed_nanoseconds
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	run_IIR, %function
run_IIR:
	@ args = 0, pretend = 0, frame = 432
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}
	sub	sp, sp, #436
	add	r7, sp, #0
	add	r3, r7, #432
	sub	r3, r3, #428
	str	r0, [r3]
	add	r3, r7, #432
	sub	r3, r3, #432
	str	r1, [r3]
	mov	r9, #0
	movs	r6, #0
	movs	r5, #0
	mov	r8, #0
	mov	r10, #0
	b	.L4
.L36:
	mov	r3, r10
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r0, [r3]
	movw	r3, #1105
	mul	r1, r3, r0
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r2, r3, r9
	add	r3, r7, #432
	sub	r3, r3, #364
	str	r1, [r3]
	add	r3, r7, #432
	sub	r3, r3, #368
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #364
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #368
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #372
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #372
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #1105
	mul	r2, r3, r6
	add	r3, r7, #432
	sub	r3, r3, #352
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #356
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #352
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #356
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #360
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #360
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #18727
	mul	r2, r3, r5
	add	r3, r7, #432
	sub	r3, r3, #340
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #344
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #340
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #344
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #348
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #348
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r2, r3, r8
	add	r3, r7, #432
	sub	r3, r3, #328
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #332
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #328
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #332
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #336
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #336
	ldr	r3, [r3]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r0
	mov	r8, r5
	mov	r5, r4
	mov	r3, r10
	adds	r3, r3, #1
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r0, [r3]
	movw	r3, #1105
	mul	r1, r3, r0
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r2, r3, r9
	add	r3, r7, #432
	sub	r3, r3, #316
	str	r1, [r3]
	add	r3, r7, #432
	sub	r3, r3, #320
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #316
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #320
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #324
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #324
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #1105
	mul	r2, r3, r6
	add	r3, r7, #432
	sub	r3, r3, #304
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #308
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #304
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #308
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #312
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #312
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #18727
	mul	r2, r3, r5
	add	r3, r7, #432
	sub	r3, r3, #292
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #296
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #292
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #296
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #300
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #300
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r2, r3, r8
	add	r3, r7, #432
	sub	r3, r3, #280
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #284
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #280
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #284
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #288
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #288
	ldr	r3, [r3]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r0
	mov	r8, r5
	mov	r5, r4
	mov	r3, r10
	adds	r3, r3, #2
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r0, [r3]
	movw	r3, #1105
	mul	r1, r3, r0
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r2, r3, r9
	add	r3, r7, #432
	sub	r3, r3, #268
	str	r1, [r3]
	add	r3, r7, #432
	sub	r3, r3, #272
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #268
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #272
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #276
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #276
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #1105
	mul	r2, r3, r6
	add	r3, r7, #432
	sub	r3, r3, #256
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #260
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #256
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #260
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #264
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #264
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r5, r3
	str	r4, [r7, #188]
	str	r3, [r7, #184]
	ldr	r3, [r7, #188]
	ldr	r2, [r7, #184]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #180]
	ldr	r3, [r7, #180]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [r7, #200]
	str	r3, [r7, #196]
	ldr	r3, [r7, #200]
	ldr	r2, [r7, #196]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #192]
	ldr	r3, [r7, #192]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r0
	mov	r8, r5
	mov	r5, r4
	mov	r3, r10
	adds	r3, r3, #3
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r1, [r3]
	movw	r3, #1105
	mul	r2, r3, r1
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r3, r3, r9
	str	r2, [r7, #212]
	str	r3, [r7, #208]
	ldr	r3, [r7, #212]
	ldr	r2, [r7, #208]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #204]
	ldr	r3, [r7, #204]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r6, r3
	str	r4, [r7, #224]
	str	r3, [r7, #220]
	ldr	r3, [r7, #224]
	ldr	r2, [r7, #220]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #216]
	ldr	r3, [r7, #216]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r5, r3
	str	r4, [r7, #236]
	str	r3, [r7, #232]
	ldr	r3, [r7, #236]
	ldr	r2, [r7, #232]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #228]
	ldr	r3, [r7, #228]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [r7, #248]
	str	r3, [r7, #244]
	ldr	r3, [r7, #248]
	ldr	r2, [r7, #244]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #240]
	ldr	r3, [r7, #240]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r1
	mov	r8, r5
	mov	r5, r4
	mov	r3, r10
	adds	r3, r3, #4
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r1, [r3]
	movw	r3, #1105
	mul	r2, r3, r1
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r3, r3, r9
	str	r2, [r7, #260]
	str	r3, [r7, #256]
	ldr	r3, [r7, #260]
	ldr	r2, [r7, #256]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #252]
	ldr	r3, [r7, #252]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r6, r3
	str	r4, [r7, #272]
	str	r3, [r7, #268]
	ldr	r3, [r7, #272]
	ldr	r2, [r7, #268]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #264]
	ldr	r3, [r7, #264]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r5, r3
	str	r4, [r7, #284]
	str	r3, [r7, #280]
	ldr	r3, [r7, #284]
	ldr	r2, [r7, #280]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #276]
	ldr	r3, [r7, #276]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [r7, #296]
	str	r3, [r7, #292]
	ldr	r3, [r7, #296]
	ldr	r2, [r7, #292]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #288]
	ldr	r3, [r7, #288]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r1
	mov	r8, r5
	mov	r5, r4
	mov	r3, r10
	adds	r3, r3, #5
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r1, [r3]
	movw	r3, #1105
	mul	r2, r3, r1
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r3, r3, r9
	str	r2, [r7, #308]
	str	r3, [r7, #304]
	ldr	r3, [r7, #308]
	ldr	r2, [r7, #304]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #300]
	ldr	r3, [r7, #300]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r6, r3
	str	r4, [r7, #320]
	str	r3, [r7, #316]
	ldr	r3, [r7, #320]
	ldr	r2, [r7, #316]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #312]
	ldr	r3, [r7, #312]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r5, r3
	str	r4, [r7, #332]
	str	r3, [r7, #328]
	ldr	r3, [r7, #332]
	ldr	r2, [r7, #328]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #324]
	ldr	r3, [r7, #324]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [r7, #344]
	str	r3, [r7, #340]
	ldr	r3, [r7, #344]
	ldr	r2, [r7, #340]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #336]
	ldr	r3, [r7, #336]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r1
	mov	r8, r5
	mov	r5, r4
	mov	r3, r10
	adds	r3, r3, #6
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r1, [r3]
	movw	r3, #1105
	mul	r2, r3, r1
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r3, r3, r9
	str	r2, [r7, #356]
	str	r3, [r7, #352]
	ldr	r3, [r7, #356]
	ldr	r2, [r7, #352]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #348]
	ldr	r3, [r7, #348]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r6, r3
	str	r4, [r7, #368]
	str	r3, [r7, #364]
	ldr	r3, [r7, #368]
	ldr	r2, [r7, #364]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #360]
	ldr	r3, [r7, #360]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r5, r3
	str	r4, [r7, #380]
	str	r3, [r7, #376]
	ldr	r3, [r7, #380]
	ldr	r2, [r7, #376]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #372]
	ldr	r3, [r7, #372]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [r7, #392]
	str	r3, [r7, #388]
	ldr	r3, [r7, #392]
	ldr	r2, [r7, #388]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #384]
	ldr	r3, [r7, #384]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r1
	mov	r8, r5
	mov	r5, r4
	movw	r3, #1105
	mul	r3, r6, r3
	str	r4, [r7, #404]
	str	r3, [r7, #400]
	ldr	r3, [r7, #404]
	ldr	r2, [r7, #400]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #396]
	ldr	r3, [r7, #396]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r5, r3
	str	r4, [r7, #416]
	str	r3, [r7, #412]
	ldr	r3, [r7, #416]
	ldr	r2, [r7, #412]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #408]
	ldr	r3, [r7, #408]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [r7, #428]
	str	r3, [r7, #424]
	ldr	r3, [r7, #428]
	ldr	r2, [r7, #424]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #420]
	ldr	r3, [r7, #420]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r1
	mov	r8, r5
	mov	r5, r4
	add	r10, r10, #8
.L4:
	add	r3, r10, #7
	add	r2, r7, #432
	sub	r2, r2, #432
	ldr	r2, [r2]
	cmp	r2, r3
	bgt	.L36
	b	.L37
.L42:
	mov	r3, r10
	lsls	r3, r3, #2
	add	r2, r7, #432
	sub	r2, r2, #428
	ldr	r2, [r2]
	add	r3, r3, r2
	ldr	r0, [r3]
	movw	r3, #1105
	mul	r1, r3, r0
	movw	r3, #1105
	lsls	r3, r3, #1
	mul	r2, r3, r9
	add	r3, r7, #432
	sub	r3, r3, #412
	str	r1, [r3]
	add	r3, r7, #432
	sub	r3, r3, #416
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #412
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #416
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #420
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #420
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #1105
	mul	r2, r3, r6
	add	r3, r7, #432
	sub	r3, r3, #400
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #404
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #400
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #404
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #408
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #408
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #18727
	mul	r2, r3, r5
	add	r3, r7, #432
	sub	r3, r3, #388
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #392
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #388
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #392
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #396
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #396
	ldr	r3, [r3]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r2, r3, r8
	add	r3, r7, #432
	sub	r3, r3, #376
	str	r4, [r3]
	add	r3, r7, #432
	sub	r3, r3, #380
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #376
	ldr	r3, [r3]
	add	r2, r7, #432
	sub	r2, r2, #380
	ldr	r2, [r2]
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #432
	sub	r3, r3, #384
	str	r2, [r3]
	add	r3, r7, #432
	sub	r3, r3, #384
	ldr	r3, [r3]
	mov	r4, r3
	asrs	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	ite	ne
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r6, r9
	mov	r9, r0
	mov	r8, r5
	mov	r5, r4
	add	r10, r10, #1
.L37:
	add	r3, r7, #432
	sub	r3, r3, #432
	ldr	r3, [r3]
	cmp	r10, r3
	blt	.L42
	mov	r3, r5
	mov	r0, r3
	add	r7, r7, #436
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10}
	bx	lr
	.size	run_IIR, .-run_IIR
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Unable to start benchmark timer\000"
	.align	2
.LC1:
	.ascii	"Unable to stop benchmark timer\000"
	.align	2
.LC2:
	.ascii	"samples,elapsed_ns,ns_per_sample,time,input,output\012"
	.ascii	"%d,%llu,%.3f,%.6f,%.6f,%.6f\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800088
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #798720
	sub	sp, sp, #1400
	add	r7, sp, #32
	movs	r3, #0
	add	r2, r7, #798720
	addw	r2, r2, #1364
	str	r3, [r2]
	b	.L45
.L46:
	add	r3, r7, #798720
	addw	r3, r3, #1364
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d17, s15
	vldr.64	d18, .L51
	vdiv.f64	d16, d17, d18
	add	r3, r7, #798720
	add	r3, r3, #1328
	vstr.64	d16, [r3]
	add	r3, r7, #798720
	add	r3, r3, #1328
	vldr.64	d16, [r3]
	vldr.64	d17, .L51+8
	vmul.f64	d16, d16, d17
	vmov.f64	d0, d16
	bl	sin(PLT)
	vmov.f64	d16, d0
	vldr.64	d17, .L51+16
	vmul.f64	d16, d16, d17
	add	r3, r7, #798720
	add	r3, r3, #1320
	vstr.64	d16, [r3]
	add	r3, r7, #798720
	add	r3, r3, #1320
	vldr.64	d16, [r3]
	vldr.64	d17, .L51+24
	vmul.f64	d16, d16, d17
	vcvt.s32.f64	s15, d16
	vmov	r1, s15	@ int
	add	r3, r7, #1368
	sub	r3, r3, #1328
	add	r2, r7, #798720
	addw	r2, r2, #1364
	ldr	r2, [r2]
	str	r1, [r3, r2, lsl #2]
	add	r3, r7, #798720
	addw	r3, r3, #1364
	ldr	r3, [r3]
	adds	r3, r3, #1
	add	r2, r7, #798720
	addw	r2, r2, #1364
	str	r3, [r2]
.L45:
	add	r3, r7, #798720
	addw	r3, r3, #1364
	ldr	r2, [r3]
	movw	r3, #3391
	movt	r3, 3
	cmp	r2, r3
	ble	.L46
	add	r3, r7, #1368
	sub	r3, r3, #1344
	mov	r1, r3
	movs	r0, #2
	bl	__clock_gettime64(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L47
	ldr	r3, .L51+48
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	perror(PLT)
	movs	r3, #1
	b	.L50
.L47:
	add	r3, r7, #1368
	sub	r3, r3, #1328
	mov	r1, #3392
	movt	r1, 3
	mov	r0, r3
	bl	run_IIR(PLT)
	mov	r2, r0
	add	r3, r7, #1368
	subw	r3, r3, #1364
	str	r2, [r3]
	add	r3, r7, #1368
	sub	r3, r3, #1360
	mov	r1, r3
	movs	r0, #2
	bl	__clock_gettime64(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L49
	ldr	r3, .L51+52
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	perror(PLT)
	movs	r3, #1
	b	.L50
.L49:
	add	r2, r7, #1368
	sub	r2, r2, #1360
	add	r3, r7, #1368
	sub	r3, r3, #1344
	mov	r1, r2
	mov	r0, r3
	bl	elapsed_nanoseconds(PLT)
	add	r3, r7, #798720
	add	r3, r3, #1352
	strd	r0, [r3]
	add	r3, r7, #798720
	add	r3, r3, #1352
	ldrd	r0, [r3]
	bl	__aeabi_ul2d(PLT)
	vmov	d18, r0, r1
	vldr.64	d17, .L51+32
	vdiv.f64	d16, d18, d17
	add	r3, r7, #798720
	add	r3, r3, #1344
	vstr.64	d16, [r3]
	adr	r3, .L51+40
	ldrd	r2, [r3]
	add	r1, r7, #798720
	add	r1, r1, #1336
	strd	r2, [r1]
	add	r3, r7, #1368
	sub	r3, r3, #1328
	add	r3, r3, #798720
	ldr	r3, [r3, #1276]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d17, s15
	vldr.64	d18, .L51+24
	vdiv.f64	d16, d17, d18
	add	r3, r7, #1368
	subw	r3, r3, #1364
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d18, s15
	vldr.64	d19, .L51+24
	vdiv.f64	d17, d18, d19
	vstr.64	d17, [sp, #24]
	vstr.64	d16, [sp, #16]
	add	r3, r7, #798720
	add	r3, r3, #1336
	ldrd	r2, [r3]
	strd	r2, [sp, #8]
	add	r3, r7, #798720
	add	r3, r3, #1344
	ldrd	r2, [r3]
	strd	r2, [sp]
	add	r3, r7, #798720
	add	r3, r3, #1352
	ldrd	r2, [r3]
	mov	r1, #3392
	movt	r1, 3
	ldr	r0, .L51+56
.LPIC2:
	add	r0, pc
	bl	printf(PLT)
	movs	r3, #0
.L50:
	mov	r0, r3
	add	r7, r7, #798720
	add	r7, r7, #1368
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L52:
	.align	3
.L51:
	.word	0
	.word	1086556160
	.word	1507148603
	.word	1082368652
	.word	-1717986918
	.word	1072273817
	.word	0
	.word	1087373312
	.word	0
	.word	1091070464
	.word	1917273401
	.word	1077149689
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC2-(.LPIC2+4)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
