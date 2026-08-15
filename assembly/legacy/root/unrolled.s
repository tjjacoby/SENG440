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
	.file	"butterworth_unrolled.c"
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
	movs	r4, #1
	vpush.64	{d8, d9, d10, d11}
	sub	sp, sp, #798720
	movs	r2, #0
	subw	sp, sp, #1356
	add	r7, sp, #1352
	add	r9, sp, #798720
	vldr.64	d11, .L14
	vldr.64	d10, .L14+8
	vldr.64	d9, .L14+16
	vldr.64	d8, .L14+24
	sub	r3, r7, #1280
	addw	r9, r9, #1348
	mov	r6, r3
	add	r8, r3, #798720
	str	r2, [r3]
	mov	r5, r3
.L2:
	vmov	s15, r4	@ int
	adds	r4, r4, #1
	vcvt.f64.s32	d16, s15
	vdiv.f64	d0, d16, d11
	vmul.f64	d0, d0, d10
	bl	sin(PLT)
	vmul.f64	d0, d0, d9
	vmul.f64	d0, d0, d8
	vcvt.s32.f64	s0, d0
	vmov	r3, s0	@ int
	str	r3, [r5, #4]!
	cmp	r9, r5
	bne	.L2
	sub	r1, r7, #1312
	movs	r0, #2
	bl	__clock_gettime64(PLT)
	cmp	r0, #0
	bne	.L12
	movw	r5, #58773
	add	r8, r8, #1280
	movt	r5, 65535
	mov	r2, r0
	mov	r9, r0
	mov	r4, r0
	movw	r1, #1105
	movw	lr, #2210
	movw	ip, #18727
.L5:
	mov	r10, r0
	ldr	r0, [r6]
	mul	fp, lr, r4
	mul	r3, r1, r0
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r10, r1, r10
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r10, ip, r9
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r2, r5, r2
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	fp, r3, #0, #14
	mov	r10, r4
	asrs	r3, r3, #14
	ldr	r4, [r6, #4]
	cmp	fp, #0
	ite	eq
	moveq	r2, r3
	orrne	r2, r3, #1
	mul	r3, r1, r4
	mul	fp, lr, r0
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r10, r1, r10
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r10, ip, r2
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r9, r5, r9
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9
@ 0 "" 2
	.thumb
	.syntax unified
	ubfx	r10, r3, #0, #14
	adds	r6, r6, #8
	asrs	r3, r3, #14
	cmp	r10, #0
	ite	eq
	moveq	r9, r3
	orrne	r9, r3, #1
	cmp	r8, r6
	bne	.L5
	subw	r6, r7, #1316
	sub	r4, r7, #1296
	mov	r1, r4
	movs	r0, #2
	str	r9, [r6]
	bl	__clock_gettime64(PLT)
	mov	r5, r0
	cmp	r0, #0
	bne	.L13
	ldr	r3, [r6]
	add	r2, r7, #794624
	vldr.64	d18, .L14+32
	vmov	s15, r3	@ int
	ldr	r3, [r2, #4092]
	sub	r7, r7, #1312
	mov	r0, #51712
	movt	r0, 15258
	vcvt.f64.s32	d17, s15
	vmov	s15, r3	@ int
	vmul.f64	d17, d17, d18
	vcvt.f64.s32	d16, s15
	vmul.f64	d16, d16, d18
	vstr.64	d17, [sp, #24]
	vstr.64	d16, [sp, #16]
	ldr	r2, [r7]
	ldr	r3, [r4]
	subs	r3, r3, r2
	ldrd	r1, r2, [r4, #4]
	ldr	r4, [r7, #4]
	umull	r3, r6, r3, r0
	sbc	r4, r1, r4
	ldr	r1, [r7, #8]
	mla	r6, r0, r4, r6
	subs	r0, r2, r1
	asr	r2, r2, #31
	sbc	r2, r2, r1, asr #31
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
