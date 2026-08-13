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
	.file	"butterworth_unrolled4.c"
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
	add	r10, sp, r9
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
	add	fp, r7, #4
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
	vmov	s0, fp	@ int
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
	cmp	r6, r10
	bne	.L2
	sub	r1, r5, #1312
	mov	r0, #1
	bl	__clock_gettime64(PLT)
	cmp	r0, #0
	bne	.L18
	add	ip, r4, #798720
	movw	r6, #58773
	movt	r6, 65535
	add	fp, ip, #1280
	mov	r1, r0
	mov	r2, r0
	mov	lr, r0
	movw	ip, #1105
	movw	r8, #2210
	movw	r7, #18727
.L5:
	ldr	r3, [r4]
	mul	r9, r8, r0
	mul	r10, ip, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r10, r9
@ 0 "" 2
	.arm
	.syntax unified
	mul	lr, ip, lr
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd lr, r9, lr
@ 0 "" 2
	.arm
	.syntax unified
	mul	r9, r7, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd lr, lr, r9
@ 0 "" 2
	.arm
	.syntax unified
	mul	r1, r6, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r9, lr, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	lr, r9, #0, #14
	asr	r1, r9, #14
	ldr	r9, [r4, #4]
	cmp	lr, #0
	orrne	r1, r1, #1
	mul	r3, r8, r3
	mul	r9, ip, r9
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd lr, r9, r3
@ 0 "" 2
	.arm
	.syntax unified
	mul	r0, ip, r0
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, lr, r0
@ 0 "" 2
	.arm
	.syntax unified
	mul	lr, r7, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r3, lr
@ 0 "" 2
	.arm
	.syntax unified
	mul	r2, r6, r2
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r0, r2
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	lr, r3, #0, #14
	asr	r3, r3, #14
	cmp	lr, #0
	orrne	r3, r3, #1
	ldmib	r4, {r2, lr}
	mul	r0, r8, r2
	mul	r2, ip, lr
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r2, r0
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r0, r10
@ 0 "" 2
	.arm
	.syntax unified
	mul	r2, r7, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r10, r2
@ 0 "" 2
	.arm
	.syntax unified
	mul	r1, r6, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r0, r1
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r2, r10, #0, #14
	asr	r1, r10, #14
	ldr	r0, [r4, #12]
	cmp	r2, #0
	orrne	r1, r1, #1
	mul	r10, r8, lr
	mul	r2, ip, r0
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r2, r9
@ 0 "" 2
	.arm
	.syntax unified
	mul	r9, r7, r1
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r10, r9
@ 0 "" 2
	.arm
	.syntax unified
	mul	r3, r6, r3
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r2, r3
@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r9, r10, #0, #14
	add	r4, r4, #16
	asr	r2, r10, #14
	cmp	r9, #0
	orrne	r2, r2, #1
	cmp	r4, fp
	bne	.L5
	str	r2, [r5, #-1316]
	sub	r1, r5, #1296
	mov	r0, #1
	bl	__clock_gettime64(PLT)
	subs	fp, r0, #0
	bne	.L19
	ldr	r6, [r5, #-1296]
	movw	ip, #13636
	movt	ip, 12
	mov	r0, #51712
	add	r8, sp, ip
	vldr.64	d11, .L20+40
	vldr.32	s17, [r8]	@ int
	ldr	r7, [r5, #-1292]
	vcvt.f64.s32	d10, s17
	ldr	lr, [r5, #-1312]
	movt	r0, 15258
	subs	r1, r6, lr
	vmul.f64	d9, d10, d11
	umull	r4, r2, r1, r0
	ldr	ip, .L20+56
	vstr.64	d9, [sp, #16]
	ldr	r3, [r5, #-1316]
	vmov	s19, r3	@ int
	movw	r3, #65529
	movt	r3, 16435
	vcvt.f64.s32	d8, s19
	vmul.f64	d3, d8, d11
	vstr.64	d3, [sp, #24]
	ldr	r10, [r5, #-1308]
	ldr	r8, [r5, #-1288]
	ldr	r5, [r5, #-1304]
	sbc	r9, r7, r10
	mla	r6, r0, r9, r2
	subs	lr, r8, r5
	movw	r2, #17721
	asr	r1, r5, #31
	rsc	r0, r1, r8, asr #31
	adds	r10, r4, lr
	adc	r9, r6, r0
	mov	r0, r10
	movt	r2, 29255
	mov	r1, r9
	strd	r2, [sp, #8]
.LPIC2:
	add	r7, pc, ip
	bl	__aeabi_ul2d(PLT)
	vmov	d4, r0, r1
	vldr.64	d17, .L20+48
	mov	r1, #3392
	mov	r2, r10
	movt	r1, 3
	mov	r3, r9
	vdiv.f64	d5, d4, d17
	mov	r0, r7
	vstr.64	d5, [sp]
	bl	printf(PLT)
.L1:
	mov	r0, fp
	add	sp, sp, #798720
	add	sp, sp, #1344
	add	sp, sp, #12
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L18:
	ldr	r3, .L20+60
.LPIC0:
	add	r0, pc, r3
	bl	perror(PLT)
.L4:
	mov	fp, #1
	b	.L1
.L19:
	ldr	fp, .L20+64
.LPIC1:
	add	r0, pc, fp
	bl	perror(PLT)
	b	.L4
.L21:
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
	.word	0
	.word	1091070464
	.word	.LC2-(.LPIC2+8)
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
