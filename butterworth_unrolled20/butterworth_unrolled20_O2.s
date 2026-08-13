	.cpu cortex-a7
	.arch armv7-a
	.arch_extension virt
	.arch_extension idiv
	.arch_extension sec
	.arch_extension mp
	.fpu neon-vfpv4
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"butterworth_unrolled20.c"
@ GNU C17 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O2
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
	@ args = 0, pretend = 0, frame = 800048
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:372: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp434,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:372: {
	subw	sp, sp, #1364	@,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	add	r3, sp, #1360	@ tmp862,,
	add	r8, sp, #798720	@ _506,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp439,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp441,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp443,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp445,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	str	r3, [sp, #36]	@ tmp862, %sfp
	add	r3, sp, #80	@ tmp433,,
	str	r2, [r3]	@ tmp434, x[0]
	mov	r4, r3	@ ivtmp.38, tmp433
	addw	r8, r8, #1356	@ _506, _506,
	add	r7, r3, #798720	@ tmp861, ivtmp.38,
	mov	r6, r3	@ ivtmp.48, ivtmp.38
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _547, n
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _548, _547, tmp439
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _548, tmp441
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp864, tmp443
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp445
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp446, _4
	vmov	r3, s0	@ int	@ tmp446, tmp446
	str	r3, [r6, #4]!	@ tmp446, MEM[(int *)_504]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	cmp	r6, r8	@ ivtmp.48, _506
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:387:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	ldr	r3, [sp, #36]	@ tmp862, %sfp
	movs	r0, #1	@,
	sub	r1, r3, #1312	@, tmp862,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:387:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	mov	ip, r0	@ x1, tmp865
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp464,
	add	r7, r7, #1280	@ _500, tmp861,
	movt	lr, 65535	@ tmp464,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:32:     register int y2 = 0;
	mov	r1, r0	@ y2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:31:     register int y1 = 0;
	mov	r2, r0	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:38:         register int y = __QADD(
	movw	r3, #1105	@ tmp452,
	movw	r6, #2210	@ tmp455,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:43:         y = __QADD(y, a1 * y1);
	movw	r5, #18727	@ tmp461,
	b	.L15		@
.L16:
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
.L15:
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:37:         register int input0 = x[i];
	ldr	r9, [r4]	@ input0, MEM[(const int *)_478]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:38:         register int y = __QADD(
	mul	r10, r6, ip	@ _55, tmp455, x1
	mul	r8, r3, r9	@ _53, tmp452, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r8, r10	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:42:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r0, r3, r0	@ _58, tmp452, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r0	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:43:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r5, r2	@ _61, tmp461, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r0	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:44:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _64, tmp464, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r1	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r10, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:53:         register int input1 = x[i + 1];
	ldr	r0, [r4, #4]	@ input1, MEM[(const int *)_478 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r10, r10, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:54:         y = __QADD(
	mul	r9, r6, r9	@ _76, tmp455, input0
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _67,
	it	ne		@
	orrne	r10, r10, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled20.c:54:         y = __QADD(
	mul	r1, r3, r0	@ _75, tmp452, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r1, r9	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:58:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	ip, r3, ip	@ _78, tmp452, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, r9, ip	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:59:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r10	@ _80, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r9	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:60:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _82, tmp464, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, ip, r2	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	ip, r2, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:70:         y = __QADD(
	mul	r0, r6, r0	@ _94, tmp455, input1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _85,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled20.c:69:         register int input2 = x[i + 2];
	ldr	ip, [r4, #8]	@ input2, MEM[(const int *)_478 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:70:         y = __QADD(
	mul	r9, r3, ip	@ _93, tmp452, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r9, r0	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:75:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r2	@ _97, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:76:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r10, lr, r10	@ _99, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r8, r0, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:86:         y = __QADD(
	mul	r10, r6, ip	@ _111, tmp455, input2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r8, #0	@ _102,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled20.c:85:         register int input3 = x[i + 3];
	ldr	r8, [r4, #12]	@ input3, MEM[(const int *)_478 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:86:         y = __QADD(
	mul	ip, r3, r8	@ _110, tmp452, input3
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, ip, r10	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r10, r1	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:91:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r5, r0	@ _114, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:92:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _116, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r1, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:101:         register int input4 = x[i + 4];
	ldr	fp, [r4, #16]	@ input4, MEM[(const int *)_478 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _119,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _118
@ /home/student/ARM_TEST/butterworth_unrolled20.c:102:         y = __QADD(
	mul	r2, r6, r8	@ _128, tmp455, input3
	mul	r8, r3, fp	@ _127, tmp452, input4
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:107:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r1	@ _131, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:108:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _133, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:117:         register int input5 = x[i + 5];
	ldr	r10, [r4, #20]	@ input5, MEM[(const int *)_478 + 20B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:118:         y = __QADD(
	mul	r9, r3, r10	@ _144, tmp452, input5
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _136,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _135
@ /home/student/ARM_TEST/butterworth_unrolled20.c:118:         y = __QADD(
	mul	r0, r6, fp	@ _145, tmp455, input4
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r9, r0	@ result, _144, _145
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _110
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:123:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r5, r2	@ _148, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _148
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:124:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _150, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r1	@ result, result, _150
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r0, #0, #14	@ _153, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:133:         register int input6 = x[i + 6];
	ldr	fp, [r4, #24]	@ input6, MEM[(const int *)_478 + 24B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _152, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:134:         y = __QADD(
	mul	ip, r3, fp	@ _161, tmp452, input6
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _153,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _152
@ /home/student/ARM_TEST/butterworth_unrolled20.c:134:         y = __QADD(
	mul	r1, r6, r10	@ _162, tmp455, input5
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, ip, r1	@ result, _161, _162
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _127
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:139:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r0	@ _165, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _165
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:140:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _167, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2	@ result, result, _167
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r1, #0, #14	@ _170, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:149:         register int input7 = x[i + 7];
	ldr	r10, [r4, #28]	@ input7, MEM[(const int *)_478 + 28B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _169, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:150:         y = __QADD(
	mul	r8, r3, r10	@ _178, tmp452, input7
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _170,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _169
@ /home/student/ARM_TEST/butterworth_unrolled20.c:150:         y = __QADD(
	mul	r2, r6, fp	@ _179, tmp455, input6
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _178, _179
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _144
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:155:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r1	@ _182, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _182
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:156:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _184, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _184
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _187, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:164:         register int input8 = x[i + 8];
	ldr	fp, [r4, #32]	@ input8, MEM[(const int *)_478 + 32B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _186, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:165:         y = __QADD(
	mul	r9, r3, fp	@ _195, tmp452, input8
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _187,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _186
@ /home/student/ARM_TEST/butterworth_unrolled20.c:165:         y = __QADD(
	mul	r0, r6, r10	@ _196, tmp455, input7
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r9, r0	@ result, _195, _196
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _161
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:170:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r5, r2	@ _199, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _199
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:171:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _201, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r1	@ result, result, _201
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r0, #0, #14	@ _204, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:179:         register int input9 = x[i + 9];
	ldr	r10, [r4, #36]	@ input9, MEM[(const int *)_478 + 36B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _203, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:180:         y = __QADD(
	mul	ip, r3, r10	@ _212, tmp452, input9
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _204,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _203
@ /home/student/ARM_TEST/butterworth_unrolled20.c:180:         y = __QADD(
	mul	r1, r6, fp	@ _213, tmp455, input8
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, ip, r1	@ result, _212, _213
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _178
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:185:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r0	@ _216, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _216
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:186:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _218, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2	@ result, result, _218
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r1, #0, #14	@ _221, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:195:         register int input10 = x[i + 10];
	ldr	fp, [r4, #40]	@ input10, MEM[(const int *)_478 + 40B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _220, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:196:         y = __QADD(
	mul	r8, r3, fp	@ _229, tmp452, input10
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _221,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _220
@ /home/student/ARM_TEST/butterworth_unrolled20.c:196:         y = __QADD(
	mul	r2, r6, r10	@ _230, tmp455, input9
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _229, _230
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _195
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:201:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r1	@ _233, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _233
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:202:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _235, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _235
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _238, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:210:         register int input11 = x[i + 11];
	ldr	r10, [r4, #44]	@ input11, MEM[(const int *)_478 + 44B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _237, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:211:         y = __QADD(
	mul	r9, r3, r10	@ _246, tmp452, input11
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _238,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _237
@ /home/student/ARM_TEST/butterworth_unrolled20.c:211:         y = __QADD(
	mul	r0, r6, fp	@ _247, tmp455, input10
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r9, r0	@ result, _246, _247
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _212
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:216:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r5, r2	@ _250, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _250
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:217:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _252, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r1	@ result, result, _252
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r0, #0, #14	@ _255, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:225:         register int input12 = x[i + 12];
	ldr	fp, [r4, #48]	@ input12, MEM[(const int *)_478 + 48B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _254, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:226:         y = __QADD(
	mul	ip, r3, fp	@ _263, tmp452, input12
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _255,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _254
@ /home/student/ARM_TEST/butterworth_unrolled20.c:226:         y = __QADD(
	mul	r1, r6, r10	@ _264, tmp455, input11
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, ip, r1	@ result, _263, _264
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _229
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:231:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r0	@ _267, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _267
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:232:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _269, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2	@ result, result, _269
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r1, #0, #14	@ _272, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:240:         register int input13 = x[i + 13];
	ldr	r10, [r4, #52]	@ input13, MEM[(const int *)_478 + 52B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _271, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:241:         y = __QADD(
	mul	r8, r3, r10	@ _280, tmp452, input13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _272,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _271
@ /home/student/ARM_TEST/butterworth_unrolled20.c:241:         y = __QADD(
	mul	r2, r6, fp	@ _281, tmp455, input12
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _280, _281
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _246
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:246:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r1	@ _284, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _284
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:247:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _286, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _286
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _289, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _288, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:257:         y = __QADD(
	mul	r9, r6, r10	@ _298, tmp455, input13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _289,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _288
@ /home/student/ARM_TEST/butterworth_unrolled20.c:256:         register int input14 = x[i + 14];
	ldr	r0, [r4, #56]	@ input14, MEM[(const int *)_478 + 56B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:257:         y = __QADD(
	mul	r10, r3, r0	@ _297, tmp452, input14
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r10, r9	@ result, _297, _298
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd ip, r9, ip	@ result, result, _263
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:262:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r2	@ _301, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r9	@ result, result, _301
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:263:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _303, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r1	@ result, result, _303
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, ip, #0, #14	@ _306, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	ip, ip, #14	@ _305, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:273:         y = __QADD(
	mul	r0, r6, r0	@ _315, tmp455, input14
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _306,
	it	ne		@
	orrne	ip, ip, #1	@,, y, _305
@ /home/student/ARM_TEST/butterworth_unrolled20.c:272:         register int input15 = x[i + 15];
	ldr	r1, [r4, #60]	@ input15, MEM[(const int *)_478 + 60B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:273:         y = __QADD(
	mul	r9, r3, r1	@ _314, tmp452, input15
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r9, r0	@ result, _314, _315
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _280
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:278:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, ip	@ _318, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _318
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:279:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _320, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _320
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _323, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _322, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:288:         y = __QADD(
	mul	r1, r6, r1	@ _332, tmp455, input15
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _323,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _322
@ /home/student/ARM_TEST/butterworth_unrolled20.c:287:         register int input16 = x[i + 16];
	ldr	r2, [r4, #64]	@ input16, MEM[(const int *)_478 + 64B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:288:         y = __QADD(
	mul	r8, r3, r2	@ _331, tmp452, input16
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r8, r1	@ result, _331, _332
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _297
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:293:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r5, r0	@ _335, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _335
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:294:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	ip, lr, ip	@ _337, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, ip	@ result, result, _337
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	ip, r1, #0, #14	@ _340, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _339, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:303:         y = __QADD(
	mul	r2, r6, r2	@ _349, tmp455, input16
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _340,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _339
@ /home/student/ARM_TEST/butterworth_unrolled20.c:302:         register int input17 = x[i + 17];
	ldr	ip, [r4, #68]	@ input17, MEM[(const int *)_478 + 68B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:303:         y = __QADD(
	mul	r10, r3, ip	@ _348, tmp452, input17
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r10, r2	@ result, _348, _349
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _314
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:308:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r1	@ _352, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _352
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:309:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _354, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _354
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _357, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _356, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:318:         y = __QADD(
	mul	r9, r6, ip	@ _366, tmp455, input17
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _357,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _356
@ /home/student/ARM_TEST/butterworth_unrolled20.c:317:         register int input18 = x[i + 18];
	ldr	r0, [r4, #72]	@ x2, MEM[(const int *)_478 + 72B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:318:         y = __QADD(
	mul	ip, r3, r0	@ _365, tmp452, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r9	@ result, _365, _366
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r8	@ result, result, _331
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:323:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r2	@ _369, tmp461, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r8	@ result, result, _369
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:324:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _371, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, ip, r1	@ result, result, _371
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	ip, r1, #0, #14	@ _374, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _373, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:333:         y = __QADD(
	mul	r9, r6, r0	@ _383, tmp455, x2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _374,
	it	ne		@
	orrne	r1, r1, #1	@,, y2, _373
@ /home/student/ARM_TEST/butterworth_unrolled20.c:332:         register int input19 = x[i + 19];
	ldr	ip, [r4, #76]	@ x1, MEM[(const int *)_478 + 76B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:333:         y = __QADD(
	mul	r8, r3, ip	@ _382, tmp452, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, r9	@ result, _382, _383
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, r10	@ result, result, _348
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:338:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r1	@ _386, tmp461, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, r9	@ result, result, _386
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:339:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _388, tmp464, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, result, _388
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r8, r2, #0, #14	@ _391, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	adds	r4, r4, #80	@ ivtmp.38, ivtmp.38,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _390, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r8, #0	@ _391,
	it	ne		@
	orrne	r2, r2, #1	@,, y1, _390
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	cmp	r4, r7	@ ivtmp.38, _500
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:392:     volatile int y = run_IIR(x, N);
	ldr	r3, [sp, #36]	@ tmp862, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	movs	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:392:     volatile int y = run_IIR(x, N);
	subw	r6, r3, #1316	@ tmp781, tmp862,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, r3, #1296	@ tmp782, tmp862,
	mov	r1, r4	@, tmp782
@ /home/student/ARM_TEST/butterworth_unrolled20.c:392:     volatile int y = run_IIR(x, N);
	str	r2, [r6]	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp866
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:411:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp798,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	ldr	r2, [sp, #36]	@ tmp862, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled20.c:411:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp798,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	add	r1, r2, #794624	@ tmp835, tmp862,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vldr.64	d18, .L17	@ tmp829,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r1, #4092]	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r2, r2, #1312	@ tmp793, tmp862,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:411:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vmul.f64	d17, d17, d18	@ _15, _14, tmp829
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp829
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r2]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r1	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r7, r1, [r4, #4]	@ tmp850, end.tv_nsec, tmp782,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r2, #4]	@ tmp852, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _45, _45, seconds_39, tmp798
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r7, r7, r4	@ seconds_39, tmp850, tmp852
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r4, [r2, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r7, r6	@ tmp804, tmp798, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r1, #31	@ tmp811, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r4	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
	sbc	r2, r2, r4, asr #31	@ nanoseconds_44, tmp811, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp804, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	adr	r3, .L17+16	@,
	ldrd	r2, [r3]	@ tmp840,
	ldr	r7, .L17+24	@ tmp826,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	strd	r2, [sp, #8]	@ tmp840,,
.LPIC2:
	add	r7, pc	@ tmp826
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp867,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L17+8	@ tmp843,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp867, tmp843
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	mov	r0, r7	@ tmp826, tmp826
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:415: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:388:         perror("Unable to start benchmark timer");
	ldr	r0, .L17+28	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:389:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:395:         perror("Unable to stop benchmark timer");
	ldr	r0, .L17+32	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:396:         return 1;
	b	.L4		@
.L18:
	.align	3
.L17:
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
