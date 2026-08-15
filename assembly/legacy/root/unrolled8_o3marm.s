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
	.file	"butterworth_unrolled8.c"
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
	mov	r3, #0
	vpush.64	{d8, d9, d10, d11}
	sub	sp, sp, #798720
	movw	r9, #13636
	movt	r9, 12
	sub	sp, sp, #1344
	sub	sp, sp, #12
	mov	r7, #2
	add	fp, sp, r9
	add	r5, sp, #1344
	add	r5, r5, #8
	mov	r4, r5
	vldr.64	d0, .L20
	vldr.64	d9, .L20+8
	str	r3, [r4, #-1280]!
	bl	sin(PLT)
	vmul.f64	d16, d0, d9
	mov	r6, r4
	vldr.64	d8, .L20+16
	vldr.64	d11, .L20+24
	vldr.64	d10, .L20+32
	vmul.f64	d0, d16, d8
	vcvt.s32.f64	s15, d0
	vmov	r0, s15	@ int
	str	r0, [r6, #4]!
.L2:
	vmov	s1, r7	@ int
	add	r8, r7, #1
	add	r10, r7, #4
	vcvt.f64.s32	d1, s1
	vdiv.f64	d2, d1, d11
	vmul.f64	d0, d2, d10
	bl	sin(PLT)
	vmov	s3, r8	@ int
	vmul.f64	d3, d0, d9
	vcvt.f64.s32	d17, s3
	vdiv.f64	d4, d17, d11
	vmul.f64	d5, d3, d8
	vcvt.s32.f64	s5, d5
	vstr.32	s5, [r6, #4]	@ int
	vmul.f64	d0, d4, d10
	bl	sin(PLT)
	add	r1, r7, #2
	vmov	s7, r1	@ int
	vmul.f64	d6, d0, d9
	vcvt.f64.s32	d7, s7
	vdiv.f64	d18, d7, d11
	vmul.f64	d19, d6, d8
	vcvt.s32.f64	s9, d19
	vstr.32	s9, [r6, #8]	@ int
	vmul.f64	d0, d18, d10
	bl	sin(PLT)
	add	r2, r7, #3
	vmov	s11, r2	@ int
	vmul.f64	d20, d0, d9
	vcvt.f64.s32	d21, s11
	vdiv.f64	d22, d21, d11
	vmul.f64	d23, d20, d8
	vcvt.s32.f64	s13, d23
	vstr.32	s13, [r6, #12]	@ int
	vmul.f64	d0, d22, d10
	bl	sin(PLT)
	vmul.f64	d24, d0, d9
	vmov	s0, r10	@ int
	vcvt.f64.s32	d25, s0
	vmul.f64	d27, d24, d8
	vdiv.f64	d26, d25, d11
	vcvt.s32.f64	s15, d27
	vstr.32	s15, [r6, #16]	@ int
	vmul.f64	d0, d26, d10
	bl	sin(PLT)
	add	r3, r7, #5
	add	r7, r7, #6
	vmul.f64	d28, d0, d9
	vmov	s1, r3	@ int
	vcvt.f64.s32	d29, s1
	vmul.f64	d31, d28, d8
	vdiv.f64	d30, d29, d11
	vcvt.s32.f64	s2, d31
	vstr.32	s2, [r6, #20]	@ int
	vmul.f64	d0, d30, d10
	bl	sin(PLT)
	vmul.f64	d16, d0, d9
	vmul.f64	d0, d16, d8
	vcvt.s32.f64	s4, d0
	vmov	r9, s4	@ int
	str	r9, [r6, #24]!
	cmp	r6, fp
	bne	.L2
	sub	r1, r5, #1312
	mov	r0, #2
	bl	__clock_gettime64(PLT)
	subs	r10, r0, #0
	bne	.L18
	add	ip, r4, #798720
	movw	lr, #58773
	movt	lr, 65535
	add	r9, ip, #1280
	mov	fp, r10
	mov	r3, r10
	mov	r8, r10
	movw	ip, #1105
	movw	r7, #2210
	movw	r6, #18727
.L5:
	ldr	r1, [r4]
	mul	r2, r7, r10
	mul	r0, ip, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r0, r2
@ 0 "" 2
	.arm
	.syntax unified
	mul	r8, ip, r8
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8
@ 0 "" 2
	.arm
	.syntax unified
	mul	r8, r6, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8
@ 0 "" 2
	.arm
	.syntax unified
	mul	fp, lr, fp
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r8, r2, #0, #14
	asr	r2, r2, #14
	mul	r1, r7, r1
	cmp	r8, #0
	orrne	r2, r2, #1
	ldr	r8, [r4, #4]
	mul	fp, ip, r8
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, fp, r1
@ 0 "" 2
	.arm
	.syntax unified
	mul	r10, ip, r10
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10
@ 0 "" 2
	.arm
	.syntax unified
	mul	r10, r6, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10
@ 0 "" 2
	.arm
	.syntax unified
	mul	r3, lr, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r1, r3
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, r10, #0, #14
	asr	r1, r10, #14
	mul	r8, r7, r8
	cmp	r3, #0
	orrne	r1, r1, #1
	ldr	r3, [r4, #8]
	mul	r10, ip, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r10, r8
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r8, r0
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
	qadd r8, r0, r2
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r2, r8, #0, #14
	asr	r0, r8, #14
	mul	r3, r7, r3
	cmp	r2, #0
	orrne	r0, r0, #1
	ldr	r2, [r4, #12]
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
	qadd fp, r3, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, fp, #0, #14
	asr	r1, fp, #14
	mul	r2, r7, r2
	cmp	r3, #0
	orrne	r1, r1, #1
	ldr	r3, [r4, #16]
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
	qadd r10, r2, r0
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r0, r10, #0, #14
	asr	r2, r10, #14
	ldr	r10, [r4, #20]
	cmp	r0, #0
	orrne	r2, r2, #1
	mul	r3, r7, r3
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
	qadd r8, r3, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, r8, #0, #14
	asr	r1, r8, #14
	ldr	r8, [r4, #24]
	cmp	r3, #0
	orrne	r1, r1, #1
	mul	r10, r7, r10
	mul	r3, ip, r8
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r3, r10
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd fp, r10, fp
@ 0 "" 2
	.arm
	.syntax unified
	mul	r3, r6, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, fp, r3
@ 0 "" 2
	.arm
	.syntax unified
	mul	r2, lr, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd fp, r10, r2
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, fp, #0, #14
	ldr	r10, [r4, #28]
	asr	fp, fp, #14
	mul	r2, r7, r8
	cmp	r3, #0
	orrne	fp, fp, #1
	mul	r3, ip, r10
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r3, r0
@ 0 "" 2
	.arm
	.syntax unified
	mul	r2, r6, fp
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r0, r2
@ 0 "" 2
	.arm
	.syntax unified
	mul	r1, lr, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r3, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14
	add	r4, r4, #32
	asr	r3, r0, #14
	cmp	r2, #0
	orrne	r3, r3, #1
	cmp	r4, r9
	bne	.L5
	str	r3, [r5, #-1316]
	sub	r1, r5, #1296
	mov	r0, #2
	bl	__clock_gettime64(PLT)
	subs	r9, r0, #0
	bne	.L19
	ldr	lr, [r5, #-1296]
	movw	ip, #13636
	movt	ip, 12
	mov	r10, #51712
	add	r7, sp, ip
	vldr.64	d11, .L20+40
	vldr.32	s17, [r7]	@ int
	ldr	r6, [r5, #-1292]
	vcvt.f64.s32	d10, s17
	ldr	r8, [r5, #-1312]
	movt	r10, 15258
	subs	fp, lr, r8
	vmul.f64	d9, d10, d11
	umull	r3, r4, fp, r10
	ldr	ip, .L20+48
.LPIC2:
	add	r7, pc, ip
	vstr.64	d9, [sp, #16]
	ldr	r1, [r5, #-1316]
	vmov	s19, r1	@ int
	vcvt.f64.s32	d8, s19
	vmul.f64	d3, d8, d11
	vstr.64	d3, [sp, #24]
	ldr	r0, [r5, #-1308]
	sbc	r2, r6, r0
	ldr	r6, [r5, #-1288]
	ldr	r5, [r5, #-1304]
	mla	lr, r10, r2, r4
	subs	r8, r6, r5
	movw	r2, #17721
	asr	fp, r5, #31
	rsc	r10, fp, r6, asr #31
	adds	r4, r3, r8
	movw	r3, #65529
	adc	r6, lr, r10
	mov	r0, r4
	movt	r2, 29255
	mov	r1, r6
	movt	r3, 16435
	b	.L21
.L22:
	.align	3
.L20:
	.word	-1843976422
	.word	1068504511
	.word	-1717986918
	.word	1072273817
	.word	0
	.word	1087373312
	.word	0
	.word	1086556160
	.word	1507148603
	.word	1082368652
	.word	0
	.word	1058013184
	.word	.LC2-(.LPIC2+8)
.L21:
	strd	r2, [sp, #8]
	bl	__aeabi_ul2d(PLT)
	vmov	d4, r0, r1
	vldr.64	d17, .L23
	mov	r1, #3392
	mov	r2, r4
	movt	r1, 3
	mov	r3, r6
	vdiv.f64	d5, d4, d17
	mov	r0, r7
	vstr.64	d5, [sp]
	bl	printf(PLT)
.L1:
	mov	r0, r9
	add	sp, sp, #798720
	add	sp, sp, #1344
	add	sp, sp, #12
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L18:
	ldr	r1, .L23+8
.LPIC0:
	add	r0, pc, r1
	bl	perror(PLT)
.L4:
	mov	r9, #1
	b	.L1
.L19:
	ldr	r9, .L23+12
.LPIC1:
	add	r0, pc, r9
	bl	perror(PLT)
	b	.L4
.L24:
	.align	3
.L23:
	.word	0
	.word	1091070464
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
