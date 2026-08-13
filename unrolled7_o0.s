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
	.file	"butterworth_unrolled7.c"
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
	.align	2
	.syntax unified
	.arm
	.type	elapsed_nanoseconds, %function
elapsed_nanoseconds:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, fp}
	add	fp, sp, #24
	sub	sp, sp, #52
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	ldr	r3, [fp, #-52]
	ldrd	r0, [r3]
	ldr	r3, [fp, #-48]
	ldrd	r2, [r3]
	subs	ip, r0, r2
	str	ip, [fp, #-68]
	sbc	r3, r1, r3
	str	r3, [fp, #-64]
	ldrd	r2, [fp, #-68]
	strd	r2, [fp, #-36]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #8]
	asr	r2, r3, #31
	mov	r8, r3
	mov	r9, r2
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #8]
	asr	r2, r3, #31
	mov	r6, r3
	mov	r7, r2
	subs	r3, r8, r6
	str	r3, [fp, #-76]
	sbc	r3, r9, r7
	str	r3, [fp, #-72]
	ldrd	r2, [fp, #-76]
	strd	r2, [fp, #-44]
	ldr	r2, [fp, #-32]
	mov	r3, #51712
	movt	r3, 15258
	mul	r2, r3, r2
	ldr	r3, [fp, #-36]
	mov	r1, #0
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, [fp, #-36]
	mov	r3, #51712
	movt	r3, 15258
	umull	r4, r5, r1, r3
	add	r3, r2, r5
	mov	r5, r3
	ldrd	r2, [fp, #-44]
	adds	r1, r4, r2
	str	r1, [fp, #-60]
	adc	r3, r5, r3
	str	r3, [fp, #-56]
	ldrd	r2, [fp, #-60]
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp}
	bx	lr
	.size	elapsed_nanoseconds, .-elapsed_nanoseconds
	.align	2
	.syntax unified
	.arm
	.type	run_IIR, %function
run_IIR:
	@ args = 0, pretend = 0, frame = 392
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10, fp}
	add	fp, sp, #28
	sub	sp, sp, #392
	str	r0, [fp, #-416]
	str	r1, [fp, #-420]
	mov	r6, #0
	mov	r7, #0
	mov	r5, #0
	mov	r8, #0
	mov	r9, #0
	b	.L4
.L33:
	mov	r3, r9
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-356]
	str	r3, [fp, #-360]
	ldr	r3, [fp, #-356]
	ldr	r2, [fp, #-360]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-364]
	ldr	r3, [fp, #-364]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-344]
	str	r3, [fp, #-348]
	ldr	r3, [fp, #-344]
	ldr	r2, [fp, #-348]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-352]
	ldr	r3, [fp, #-352]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-332]
	str	r3, [fp, #-336]
	ldr	r3, [fp, #-332]
	ldr	r2, [fp, #-336]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-340]
	ldr	r3, [fp, #-340]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-320]
	str	r3, [fp, #-324]
	ldr	r3, [fp, #-320]
	ldr	r2, [fp, #-324]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-328]
	ldr	r3, [fp, #-328]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	mov	r3, r9
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-308]
	str	r3, [fp, #-312]
	ldr	r3, [fp, #-308]
	ldr	r2, [fp, #-312]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-316]
	ldr	r3, [fp, #-316]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-296]
	str	r3, [fp, #-300]
	ldr	r3, [fp, #-296]
	ldr	r2, [fp, #-300]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-304]
	ldr	r3, [fp, #-304]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-284]
	str	r3, [fp, #-288]
	ldr	r3, [fp, #-284]
	ldr	r2, [fp, #-288]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-292]
	ldr	r3, [fp, #-292]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-272]
	str	r3, [fp, #-276]
	ldr	r3, [fp, #-272]
	ldr	r2, [fp, #-276]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-280]
	ldr	r3, [fp, #-280]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	mov	r3, r9
	add	r3, r3, #2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-260]
	str	r3, [fp, #-264]
	ldr	r3, [fp, #-260]
	ldr	r2, [fp, #-264]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-268]
	ldr	r3, [fp, #-268]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-248]
	str	r3, [fp, #-252]
	ldr	r3, [fp, #-248]
	ldr	r2, [fp, #-252]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-256]
	ldr	r3, [fp, #-256]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-236]
	str	r3, [fp, #-240]
	ldr	r3, [fp, #-236]
	ldr	r2, [fp, #-240]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-244]
	ldr	r3, [fp, #-244]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-224]
	str	r3, [fp, #-228]
	ldr	r3, [fp, #-224]
	ldr	r2, [fp, #-228]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-232]
	ldr	r3, [fp, #-232]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	mov	r3, r9
	add	r3, r3, #3
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-212]
	str	r3, [fp, #-216]
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-216]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-220]
	ldr	r3, [fp, #-220]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-200]
	str	r3, [fp, #-204]
	ldr	r3, [fp, #-200]
	ldr	r2, [fp, #-204]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-208]
	ldr	r3, [fp, #-208]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-188]
	str	r3, [fp, #-192]
	ldr	r3, [fp, #-188]
	ldr	r2, [fp, #-192]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-196]
	ldr	r3, [fp, #-196]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-176]
	str	r3, [fp, #-180]
	ldr	r3, [fp, #-176]
	ldr	r2, [fp, #-180]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-184]
	ldr	r3, [fp, #-184]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	mov	r3, r9
	add	r3, r3, #4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-164]
	str	r3, [fp, #-168]
	ldr	r3, [fp, #-164]
	ldr	r2, [fp, #-168]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-172]
	ldr	r3, [fp, #-172]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-152]
	str	r3, [fp, #-156]
	ldr	r3, [fp, #-152]
	ldr	r2, [fp, #-156]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-160]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-140]
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-144]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-148]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-128]
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-128]
	ldr	r2, [fp, #-132]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-136]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	mov	r3, r9
	add	r3, r3, #5
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-116]
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-116]
	ldr	r2, [fp, #-120]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-124]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-104]
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-104]
	ldr	r2, [fp, #-108]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-92]
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-92]
	ldr	r2, [fp, #-96]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-80]
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-84]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	mov	r3, r9
	add	r3, r3, #6
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-68]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-72]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-56]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-60]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-44]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-48]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	add	r9, r9, #8
.L4:
	add	r3, r9, #6
	ldr	r2, [fp, #-420]
	cmp	r2, r3
	bgt	.L33
	b	.L34
.L39:
	mov	r3, r9
	lsl	r3, r3, #2
	ldr	r2, [fp, #-416]
	add	r3, r2, r3
	ldr	r10, [r3]
	movw	r3, #1105
	mul	r2, r3, r10
	movw	r3, #1105
	lsl	r3, r3, #1
	mul	r3, r3, r6
	str	r2, [fp, #-404]
	str	r3, [fp, #-408]
	ldr	r3, [fp, #-404]
	ldr	r2, [fp, #-408]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-412]
	ldr	r3, [fp, #-412]
	mov	r4, r3
	movw	r3, #1105
	mul	r3, r3, r7
	str	r4, [fp, #-392]
	str	r3, [fp, #-396]
	ldr	r3, [fp, #-392]
	ldr	r2, [fp, #-396]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-400]
	ldr	r3, [fp, #-400]
	mov	r4, r3
	movw	r3, #18727
	mul	r3, r3, r5
	str	r4, [fp, #-380]
	str	r3, [fp, #-384]
	ldr	r3, [fp, #-380]
	ldr	r2, [fp, #-384]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-388]
	ldr	r3, [fp, #-388]
	mov	r4, r3
	movw	r3, #58773
	movt	r3, 65535
	mul	r3, r3, r8
	str	r4, [fp, #-368]
	str	r3, [fp, #-372]
	ldr	r3, [fp, #-368]
	ldr	r2, [fp, #-372]
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-376]
	ldr	r3, [fp, #-376]
	mov	r4, r3
	asr	r3, r4, #14
	ubfx	r2, r4, #0, #14
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #0
	uxtb	r2, r2
	orr	r4, r3, r2
	mov	r7, r6
	mov	r6, r10
	mov	r8, r5
	mov	r5, r4
	add	r9, r9, #1
.L34:
	ldr	r3, [fp, #-420]
	cmp	r9, r3
	blt	.L39
	mov	r3, r5
	mov	r0, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp}
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
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800088
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #798720
	sub	sp, sp, #1392
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L43:
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d17, s15
	vldr.64	d18, .L48
	vdiv.f64	d16, d17, d18
	vstr.64	d16, [fp, #-44]
	vldr.64	d16, [fp, #-44]
	vldr.64	d17, .L48+8
	vmul.f64	d16, d16, d17
	vmov.f64	d0, d16
	bl	sin(PLT)
	vmov.f64	d16, d0
	vldr.64	d17, .L48+16
	vmul.f64	d16, d16, d17
	vstr.64	d16, [fp, #-52]
	vldr.64	d16, [fp, #-52]
	vldr.64	d17, .L48+24
	vmul.f64	d16, d16, d17
	vcvt.s32.f64	s15, d16
	sub	r3, fp, #798720
	sub	r3, r3, #4
	mov	r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vmov	r2, s15	@ int
	str	r2, [r3, #-1328]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L42:
	ldr	r2, [fp, #-8]
	movw	r3, #3391
	movt	r3, 3
	cmp	r2, r3
	ble	.L43
	sub	r3, fp, #798720
	sub	r3, r3, #4
	sub	r3, r3, #1344
	mov	r1, r3
	mov	r0, #2
	bl	__clock_gettime64(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L44
	ldr	r3, .L48+40
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	perror(PLT)
	mov	r3, #1
	b	.L47
.L44:
	sub	r3, fp, #798720
	sub	r3, r3, #4
	sub	r3, r3, #1328
	mov	r1, #3392
	movt	r1, 3
	mov	r0, r3
	bl	run_IIR(PLT)
	mov	r3, r0
	sub	r2, fp, #798720
	sub	r2, r2, #4
	str	r3, [r2, #-1364]
	sub	r3, fp, #798720
	sub	r3, r3, #4
	sub	r3, r3, #1360
	mov	r1, r3
	mov	r0, #2
	bl	__clock_gettime64(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L46
	ldr	r3, .L48+44
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	perror(PLT)
	mov	r3, #1
	b	.L47
.L46:
	sub	r2, fp, #798720
	sub	r2, r2, #4
	sub	r2, r2, #1360
	sub	r3, fp, #798720
	sub	r3, r3, #4
	sub	r3, r3, #1344
	mov	r1, r2
	mov	r0, r3
	bl	elapsed_nanoseconds(PLT)
	strd	r0, [fp, #-20]
	ldrd	r0, [fp, #-20]
	bl	__aeabi_ul2d(PLT)
	vmov	d18, r0, r1
	vldr.64	d17, .L48+32
	vdiv.f64	d16, d18, d17
	vstr.64	d16, [fp, #-28]
	movw	r2, #17721
	movt	r2, 29255
	movw	r3, #65529
	movt	r3, 16435
	strd	r2, [fp, #-36]
	sub	r3, fp, #798720
	sub	r3, r3, #4
	add	r3, r3, #794624
	ldr	r3, [r3, #4044]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d17, s15
	vldr.64	d18, .L48+24
	vdiv.f64	d16, d17, d18
	sub	r3, fp, #798720
	sub	r3, r3, #4
	ldr	r3, [r3, #-1364]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d18, s15
	vldr.64	d19, .L48+24
	vdiv.f64	d17, d18, d19
	vstr.64	d17, [sp, #24]
	vstr.64	d16, [sp, #16]
	ldrd	r2, [fp, #-36]
	strd	r2, [sp, #8]
	ldrd	r2, [fp, #-28]
	strd	r2, [sp]
	ldrd	r2, [fp, #-20]
	mov	r1, #3392
	movt	r1, 3
	ldr	r0, .L48+48
.LPIC2:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r3, #0
.L47:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L49:
	.align	3
.L48:
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
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LC2-(.LPIC2+8)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
