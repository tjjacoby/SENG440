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
	.eabi_attribute 30, 1
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"butterworth_noOpt.c"
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
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	vpush.64	{d8, d9, d10, d11}
	sub	sp, sp, #798720
	sub	sp, sp, #1352
	add	r6, sp, #1352
	add	r7, sp, #68
	add	r6, r6, #794624
	addw	r6, r6, #4092
	mov	r5, r7
	movs	r4, #0
	vldr.64	d11, .L12
	vldr.64	d10, .L12+8
	vldr.64	d9, .L12+16
	vldr.64	d8, .L12+24
.L2:
	vmov	s15, r4	@ int
	vcvt.f64.s32	d16, s15
	vdiv.f64	d0, d16, d11
	vmul.f64	d0, d0, d10
	bl	sin(PLT)
	vmul.f64	d0, d0, d9
	vmul.f64	d0, d0, d8
	vcvt.s32.f64	s0, d0
	vmov	r3, s0	@ int
	str	r3, [r5, #4]!
	adds	r4, r4, #1
	cmp	r5, r6
	bne	.L2
	add	r1, sp, #56
	movs	r0, #1
	bl	__clock_gettime64(PLT)
	mov	r2, r0
	cbnz	r0, .L10
	mov	r8, r0
	mov	r1, r0
	mov	r9, r0
	movw	r4, #1105
	movw	lr, #2210
	movw	ip, #18727
	movw	r5, #58773
	movt	r5, 65535
	b	.L3
.L10:
	ldr	r0, .L12+56
.LPIC0:
	add	r0, pc
	bl	perror(PLT)
	movs	r6, #1
	b	.L1
.L7:
	mov	r1, r3
	mov	r2, r0
.L3:
	ldr	r0, [r7, #4]!
	mul	r3, r4, r0
	mul	r10, lr, r2
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r9, r4, r9
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r9, ip, r1
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9
@ 0 "" 2
	.thumb
	.syntax unified
	mul	r8, r5, r8
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r8
@ 0 "" 2
	.thumb
	.syntax unified
	asrs	r3, r3, #14
	mov	r9, r2
	mov	r8, r1
	cmp	r7, r6
	bne	.L7
	add	r2, sp, #36
	str	r3, [r2]
	add	r1, sp, #40
	movs	r0, #1
	bl	__clock_gettime64(PLT)
	mov	r6, r0
	cmp	r0, #0
	bne	.L11
	add	r2, sp, #1352
	add	r0, sp, #40
	add	r4, sp, #56
	ldr	r3, [r0]
	ldr	r1, [r0, #4]
	ldr	r7, [r4]
	ldr	r5, [r4, #4]
	subs	r3, r3, r7
	sbc	r7, r1, r5
	mov	r1, #51712
	movt	r1, 15258
	umull	r3, r5, r3, r1
	mla	r5, r1, r7, r5
	ldr	r1, [r0, #8]
	asrs	r0, r1, #31
	ldr	r4, [r4, #8]
	subs	r1, r1, r4
	sbc	r0, r0, r4, asr #31
	adds	r4, r3, r1
	adc	r5, r5, r0
	add	r3, sp, #36
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L12+32
	vmul.f64	d16, d16, d17
	vstr.64	d16, [sp, #24]
	add	r2, r2, #794624
	ldr	r3, [r2, #4092]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmul.f64	d16, d16, d17
	vstr.64	d16, [sp, #16]
	adr	r3, .L12+48
	ldrd	r2, [r3]
	strd	r2, [sp, #8]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_ul2d(PLT)
	vmov	d18, r0, r1
	vldr.64	d17, .L12+40
	vdiv.f64	d16, d18, d17
	vstr.64	d16, [sp]
	mov	r2, r4
	mov	r3, r5
	mov	r1, #3392
	movt	r1, 3
	ldr	r0, .L12+60
.LPIC2:
	add	r0, pc
	bl	printf(PLT)
.L1:
	mov	r0, r6
	add	sp, sp, #798720
	add	sp, sp, #1352
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L11:
	ldr	r0, .L12+64
.LPIC1:
	add	r0, pc
	bl	perror(PLT)
	movs	r6, #1
	b	.L1
.L13:
	.align	3
.L12:
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
	.word	.LC0-(.LPIC0+4)
	.word	.LC2-(.LPIC2+4)
	.word	.LC1-(.LPIC1+4)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
