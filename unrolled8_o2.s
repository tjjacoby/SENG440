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
	.align	1
	.p2align 2,,3
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movs	r5, #1
	vpush.64	{d8, d9, d10, d11}
	sub	sp, sp, #798720
	movs	r2, #0
	subw	sp, sp, #1356
	add	fp, sp, #1352
	add	r8, sp, #798720
	vldr.64	d11, .L14
	vldr.64	d10, .L14+8
	vldr.64	d9, .L14+16
	vldr.64	d8, .L14+24
	sub	r3, fp, #1280
	addw	r8, r8, #1348
	mov	r4, r3
	add	r7, r3, #798720
	str	r2, [r3]
	mov	r6, r3
.L2:
	vmov	s15, r5	@ int
	adds	r5, r5, #1
	vcvt.f64.s32	d16, s15
	vdiv.f64	d0, d16, d11
	vmul.f64	d0, d0, d10
	bl	sin(PLT)
	vmul.f64	d0, d0, d9
	vmul.f64	d0, d0, d8
	vcvt.s32.f64	s0, d0
	vmov	r3, s0	@ int
	str	r3, [r6, #4]!
	cmp	r6, r8
	bne	.L2
	sub	r1, fp, #1312
	movs	r0, #2
	bl	__clock_gettime64(PLT)
	cmp	r0, #0
	bne	.L12
	movw	lr, #58773
	add	r7, r7, #1280
	movt	lr, 65535
	mov	r1, r0
	mov	r2, r0
	mov	r9, r0
	movw	ip, #1105
	movw	r6, #2210
	movw	r5, #18727
.L5:
	ldr	r3, [r4]
	mul	r10, r6, r0
	mul	r8, ip, r3
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r8, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r9, ip, r9
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r10, r9
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r10, r5, r2
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r9, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r1, lr, r1
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r9, r1
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r1, r9, #0, #14
	asr	r9, r9, #14
	mul	r3, r6, r3
	cmp	r1, #0
	it	ne
	orrne	r9, r9, #1
	ldr	r1, [r4, #4]
	mul	r1, ip, r1
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r1, r3
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r0, ip, r0
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r0
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r0, r5, r9
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r0
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r2, lr, r2
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14
	asrs	r3, r3, #14
	cmp	r2, #0
	it	ne
	orrne	r3, r3, #1
	ldrd	r2, r10, [r4, #4]
	mul	r0, r6, r2
	mul	r2, ip, r10
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r2, r0
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r8, r5, r3
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r9, lr, r9
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r9
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r8, r0, #0, #14
	asrs	r0, r0, #14
	mul	r10, r6, r10
	cmp	r8, #0
	it	ne
	orrne	r0, r0, #1
	ldr	r8, [r4, #12]
	mul	r9, ip, r8
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r9, r10
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r10, r1
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r10, r5, r0
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r3, lr, r3
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r3, r1, #0, #14
	asrs	r1, r1, #14
	mul	r10, r6, r8
	cmp	r3, #0
	it	ne
	orrne	r1, r1, #1
	ldr	r3, [r4, #16]
	mul	r8, ip, r3
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r8, r10
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r10, r2
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r10, r5, r1
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r0, lr, r0
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14
	asrs	r2, r2, #14
	mul	r3, r6, r3
	cmp	r0, #0
	it	ne
	orrne	r2, r2, #1
	ldr	r0, [r4, #20]
	mul	r10, ip, r0
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r10, r3
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r9, r5, r2
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r1, lr, r1
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r1, r3, #0, #14
	ldr	r9, [r4, #24]
	asrs	r3, r3, #14
	mul	r0, r6, r0
	cmp	r1, #0
	it	ne
	orrne	r3, r3, #1
	mul	r1, ip, r9
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r0, r5, r3
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r2, lr, r2
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r2, r1, #0, #14
	ldr	r0, [r4, #28]
	asrs	r1, r1, #14
	mul	r8, r6, r9
	cmp	r2, #0
	it	ne
	orrne	r1, r1, #1
	mul	r2, ip, r0
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r8, r5, r1
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r3, lr, r3
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r3
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r3, r2, #0, #14
	adds	r4, r4, #32
	asrs	r2, r2, #14
	cmp	r3, #0
	it	ne
	orrne	r2, r2, #1
	cmp	r4, r7
	bne	.L5
	subw	r6, fp, #1316
	sub	r4, fp, #1296
	mov	r1, r4
	movs	r0, #2
	str	r2, [r6]
	bl	__clock_gettime64(PLT)
	mov	r5, r0
	cmp	r0, #0
	bne	.L13
	ldr	r3, [r6]
	add	r1, fp, #794624
	vldr.64	d18, .L14+32
	vmov	s15, r3	@ int
	ldr	r3, [r1, #4092]
	sub	r2, fp, #1312
	mov	r0, #51712
	movt	r0, 15258
	vcvt.f64.s32	d17, s15
	vmov	s15, r3	@ int
	vmul.f64	d17, d17, d18
	vcvt.f64.s32	d16, s15
	vmul.f64	d16, d16, d18
	vstr.64	d17, [sp, #24]
	vstr.64	d16, [sp, #16]
	ldr	r1, [r2]
	ldr	r3, [r4]
	subs	r3, r3, r1
	ldrd	r7, r1, [r4, #4]
	ldr	r4, [r2, #4]
	umull	r3, r6, r3, r0
	sbc	r7, r7, r4
	ldr	r4, [r2, #8]
	mla	r6, r0, r7, r6
	asrs	r2, r1, #31
	subs	r0, r1, r4
	sbc	r2, r2, r4, asr #31
	adds	r4, r3, r0
	adc	r6, r6, r2
	mov	r0, r4
	adr	r3, .L14+48
	ldrd	r2, [r3]
	ldr	r7, .L14+56
	mov	r1, r6
	strd	r2, [sp, #8]
.LPIC2:
	add	r7, pc
	bl	__aeabi_ul2d(PLT)
	vmov	d18, r0, r1
	vldr.64	d17, .L14+40
	mov	r1, #3392
	mov	r2, r4
	movt	r1, 3
	mov	r3, r6
	vdiv.f64	d16, d18, d17
	mov	r0, r7
	vstr.64	d16, [sp]
	bl	printf(PLT)
.L1:
	mov	r0, r5
	add	sp, sp, #798720
	addw	sp, sp, #1356
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L12:
	ldr	r0, .L14+60
.LPIC0:
	add	r0, pc
	bl	perror(PLT)
.L4:
	movs	r5, #1
	b	.L1
.L13:
	ldr	r0, .L14+64
.LPIC1:
	add	r0, pc
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
	.word	1917273401
	.word	1077149689
	.word	.LC2-(.LPIC2+4)
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
