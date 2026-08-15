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
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"butterworth_unrolled7.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
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
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r8, #13636
	vpush.64	{d8, d9, d10, d11}
	movt	r8, 12
	sub	sp, sp, #798720
	sub	sp, sp, #1344
	mov	r3, #0
	sub	sp, sp, #12
	mov	r6, #1
	add	r8, sp, r8
	add	r5, sp, #1344
	add	r5, r5, #8
	mov	r4, r5
	vldr.64	d11, .L14
	vldr.64	d10, .L14+8
	vldr.64	d9, .L14+16
	vldr.64	d8, .L14+24
	str	r3, [r4, #-1280]!
	mov	r7, r4
.L2:
	vmov	s15, r6	@ int
	add	r6, r6, #1
	vcvt.f64.s32	d16, s15
	vdiv.f64	d0, d16, d11
	vmul.f64	d0, d0, d10
	bl	sin(PLT)
	vmul.f64	d0, d0, d9
	vmul.f64	d0, d0, d8
	vcvt.s32.f64	s0, d0
	vmov	r3, s0	@ int
	str	r3, [r7, #4]!
	cmp	r7, r8
	bne	.L2
	sub	r1, r5, #1312
	mov	r0, #2
	bl	__clock_gettime64(PLT)
	subs	r8, r0, #0
	bne	.L12
	add	r9, r4, #798720
	movw	lr, #58773
	movt	lr, 65535
	mov	r10, r8
	add	r9, r9, #1280
	mov	r2, r8
	mov	r3, r8
	movw	ip, #1105
	movw	r7, #2210
	movw	r6, #18727
.L5:
	ldr	r0, [r4]
	mul	r1, r7, r8
	mul	fp, ip, r0
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, fp, r1
@ 0 "" 2
	.arm
	.syntax unified
	mul	r3, ip, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3
@ 0 "" 2
	.arm
	.syntax unified
	mul	r3, r6, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3
@ 0 "" 2
	.arm
	.syntax unified
	mul	r10, lr, r10
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, r1, #0, #14
	asr	r1, r1, #14
	mul	r0, r7, r0
	cmp	r3, #0
	orrne	r1, r1, #1
	ldr	r3, [r4, #4]
	mul	r10, ip, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r10, r0
@ 0 "" 2
	.arm
	.syntax unified
	mul	r8, ip, r8
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8
@ 0 "" 2
	.arm
	.syntax unified
	mul	r8, r6, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8
@ 0 "" 2
	.arm
	.syntax unified
	mul	r2, lr, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14
	asr	r0, r0, #14
	mul	r3, r7, r3
	cmp	r2, #0
	orrne	r0, r0, #1
	ldr	r2, [r4, #8]
	mul	r8, ip, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r8, r3
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp
@ 0 "" 2
	.arm
	.syntax unified
	mul	fp, r6, r0
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp
@ 0 "" 2
	.arm
	.syntax unified
	mul	r1, lr, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r3, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, r1, #0, #14
	asr	r1, r1, #14
	mul	r2, r7, r2
	cmp	r3, #0
	orrne	r1, r1, #1
	ldr	r3, [r4, #12]
	mul	fp, ip, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, fp, r2
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10
@ 0 "" 2
	.arm
	.syntax unified
	mul	r10, r6, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10
@ 0 "" 2
	.arm
	.syntax unified
	mul	r0, lr, r0
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r0, r2, #0, #14
	ldr	r10, [r4, #16]
	asr	r2, r2, #14
	mul	r3, r7, r3
	cmp	r0, #0
	orrne	r2, r2, #1
	mul	r0, ip, r10
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r0, r3
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r8
@ 0 "" 2
	.arm
	.syntax unified
	mul	r8, r6, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r8
@ 0 "" 2
	.arm
	.syntax unified
	mul	r1, lr, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r3, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, r1, #0, #14
	asr	r1, r1, #14
	mul	r8, r7, r10
	cmp	r3, #0
	orrne	r1, r1, #1
	ldr	r3, [r4, #20]
	mul	r10, ip, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r8
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, fp
@ 0 "" 2
	.arm
	.syntax unified
	mul	r8, r6, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r8
@ 0 "" 2
	.arm
	.syntax unified
	mul	r2, lr, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r2
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r2, r10, #0, #14
	ldr	r8, [r4, #24]
	asr	r10, r10, #14
	mul	fp, r7, r3
	cmp	r2, #0
	orrne	r10, r10, #1
	mul	r2, ip, r8
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0
@ 0 "" 2
	.arm
	.syntax unified
	mul	r0, r6, r10
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0
@ 0 "" 2
	.arm
	.syntax unified
	mul	r1, lr, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r1, r2, #0, #14
	add	r4, r4, #32
	asr	r2, r2, #14
	cmp	r1, #0
	orrne	r2, r2, #1
	cmp	r4, r9
	bne	.L5
	str	r2, [r5, #-1316]
	sub	r1, r5, #1296
	mov	r0, #2
	bl	__clock_gettime64(PLT)
	subs	r6, r0, #0
	bne	.L13
	ldr	r3, [r5, #-1296]
	movw	r2, #13636
	movt	r2, 12
	mov	r0, #51712
	add	r2, sp, r2
	vldr.64	d17, .L14+32
	vldr.32	s15, [r2]	@ int
	ldr	r2, [r5, #-1312]
	vcvt.f64.s32	d16, s15
	ldr	r1, [r5, #-1292]
	subs	r3, r3, r2
	movt	r0, 15258
	vmul.f64	d16, d16, d17
	ldr	r7, .L14+48
.LPIC2:
	add	r7, pc, r7
	vstr.64	d16, [sp, #16]
	ldr	r2, [r5, #-1316]
	vmov	s15, r2	@ int
	vcvt.f64.s32	d16, s15
	vmul.f64	d16, d16, d17
	vstr.64	d16, [sp, #24]
	ldr	r2, [r5, #-1308]
	sbc	r2, r1, r2
	umull	r3, r1, r3, r0
	mla	r1, r0, r2, r1
	ldr	r0, [r5, #-1288]
	ldr	r2, [r5, #-1304]
	subs	ip, r0, r2
	asr	r2, r2, #31
	rsc	r2, r2, r0, asr #31
	adds	r4, r3, ip
	movw	r3, #65529
	adc	r5, r1, r2
	movw	r2, #17721
	movt	r2, 29255
	mov	r0, r4
	movt	r3, 16435
	mov	r1, r5
	strd	r2, [sp, #8]
	bl	__aeabi_ul2d(PLT)
	vmov	d18, r0, r1
	vldr.64	d17, .L14+40
	mov	r1, #3392
	mov	r2, r4
	movt	r1, 3
	mov	r3, r5
	vdiv.f64	d16, d18, d17
	mov	r0, r7
	vstr.64	d16, [sp]
	bl	printf(PLT)
.L1:
	mov	r0, r6
	add	sp, sp, #798720
	add	sp, sp, #1344
	add	sp, sp, #12
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L12:
	ldr	r0, .L14+52
.LPIC0:
	add	r0, pc, r0
	bl	perror(PLT)
.L4:
	mov	r6, #1
	b	.L1
.L13:
	ldr	r0, .L14+56
.LPIC1:
	add	r0, pc, r0
	bl	perror(PLT)
	b	.L4
.L15:
	.align	3
.L14:
	.word	0
	.word	1086556160
	.word	1507148603
	.word	1082368652
	.word	-1717986918
	.word	1072273817
	.word	0
	.word	1087373312
	.word	0
	.word	1058013184
	.word	0
	.word	1091070464
	.word	.LC2-(.LPIC2+8)
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
