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
@ options passed: -marm -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -march=armv7ve+simd -O3
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	movw	r8, #13636	@ _604,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r8, 12	@ _604,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1344	@,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp432,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:372: {
	sub	sp, sp, #12	@,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	mov	r6, #1	@ n,
	add	r8, sp, r8	@ _604,, _604
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	add	r5, sp, #1344	@ tmp849,,
	add	r5, r5, #8	@ tmp849, tmp849,
	mov	r4, r5	@ ivtmp.38, tmp849
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp437,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp439,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp441,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp443,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	str	r3, [r4, #-1280]!	@ tmp432, x[0]
	mov	r7, r4	@ ivtmp.48, ivtmp.38
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r6	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	add	r6, r6, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _547, n
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _548, _547, tmp437
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _548, tmp439
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp851, tmp441
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp443
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp444, _4
	vmov	r3, s0	@ int	@ tmp444, tmp444
	str	r3, [r7, #4]!	@ tmp444, MEM[(int *)_602]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	cmp	r7, r8	@ ivtmp.48, _604
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:387:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r5, #1312	@, tmp849,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:387:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L12		@,
	add	r9, r4, #798720	@ _598, ivtmp.38,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp462,
	movt	lr, 65535	@ tmp462,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:32:     register int y2 = 0;
	mov	r8, r0	@ y2, x1
	add	r9, r9, #1280	@ _598, _598,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:31:     register int y1 = 0;
	mov	r2, r0	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:30:     register int x2 = 0;
	mov	ip, r0	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:38:         register int y = __QADD(
	movw	r3, #1105	@ tmp450,
	movw	r7, #2210	@ tmp453,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:43:         y = __QADD(y, a1 * y1);
	movw	r6, #18727	@ tmp459,
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
	ldr	r1, [r4]	@ input0, MEM[(const int *)_576]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:38:         register int y = __QADD(
	mul	r10, r7, r0	@ _55, tmp453, x1
	mul	fp, r3, r1	@ _53, tmp450, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, fp, r10	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:42:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	ip, r3, ip	@ _58, tmp450, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd ip, r10, ip	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:43:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r2	@ _61, tmp459, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r10	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:44:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r8, lr, r8	@ _64, tmp462, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r8	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r8, ip, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	ip, ip, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:54:         y = __QADD(
	mul	r10, r7, r1	@ _76, tmp453, input0
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r8, #0	@ _67,
	orrne	ip, ip, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled20.c:53:         register int input1 = x[i + 1];
	ldr	r8, [r4, #4]	@ input1, MEM[(const int *)_576 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:54:         y = __QADD(
	mul	r1, r3, r8	@ _75, tmp450, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r1, r10	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:58:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r0, r3, r0	@ _78, tmp450, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r10, r0	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:59:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, ip	@ _80, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:60:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _82, tmp462, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:69:         register int input2 = x[i + 2];
	ldr	r10, [r4, #8]	@ input2, MEM[(const int *)_576 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _85,
	orrne	r0, r0, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled20.c:70:         y = __QADD(
	mul	r2, r7, r8	@ _94, tmp453, input1
	mul	r8, r3, r10	@ _93, tmp450, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:75:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	fp, r6, r0	@ _97, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:76:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	ip, lr, ip	@ _99, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, ip	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	ip, r2, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:86:         y = __QADD(
	mul	fp, r7, r10	@ _111, tmp453, input2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _102,
	orrne	r2, r2, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled20.c:85:         register int input3 = x[i + 3];
	ldr	ip, [r4, #12]	@ input3, MEM[(const int *)_576 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:86:         y = __QADD(
	mul	r10, r3, ip	@ _110, tmp450, input3
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd fp, r10, fp	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, fp, r1	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:91:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	fp, r6, r2	@ _114, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, fp	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:92:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _116, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r1, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:101:         register int input4 = x[i + 4];
	ldr	fp, [r4, #16]	@ input4, MEM[(const int *)_576 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _119,
	orrne	r1, r1, #1	@,, y, _118
@ /home/student/ARM_TEST/butterworth_unrolled20.c:102:         y = __QADD(
	mul	r0, r7, ip	@ _128, tmp453, input3
	mul	ip, r3, fp	@ _127, tmp450, input4
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, ip, r0	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:107:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r8, r6, r1	@ _131, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:108:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _133, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:117:         register int input5 = x[i + 5];
	ldr	r8, [r4, #20]	@ input5, MEM[(const int *)_576 + 20B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _136,
	orrne	r0, r0, #1	@,, y, _135
@ /home/student/ARM_TEST/butterworth_unrolled20.c:118:         y = __QADD(
	mul	r2, r7, fp	@ _145, tmp453, input4
	mul	fp, r3, r8	@ _144, tmp450, input5
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, fp, r2	@ result, _144, _145
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10	@ result, result, _110
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:123:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r0	@ _148, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10	@ result, result, _148
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:124:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _150, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r1	@ result, result, _150
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r2, #0, #14	@ _153, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:133:         register int input6 = x[i + 6];
	ldr	r10, [r4, #24]	@ input6, MEM[(const int *)_576 + 24B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _152, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _153,
	orrne	r2, r2, #1	@,, y, _152
@ /home/student/ARM_TEST/butterworth_unrolled20.c:134:         y = __QADD(
	mul	r1, r7, r8	@ _162, tmp453, input5
	mul	r8, r3, r10	@ _161, tmp450, input6
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r8, r1	@ result, _161, _162
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, ip	@ result, result, _127
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:139:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	ip, r6, r2	@ _165, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, ip	@ result, result, _165
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:140:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _167, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _167
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r1, #0, #14	@ _170, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:149:         register int input7 = x[i + 7];
	ldr	ip, [r4, #28]	@ input7, MEM[(const int *)_576 + 28B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _169, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _170,
	orrne	r1, r1, #1	@,, y, _169
@ /home/student/ARM_TEST/butterworth_unrolled20.c:150:         y = __QADD(
	mul	r0, r7, r10	@ _179, tmp453, input6
	mul	r10, r3, ip	@ _178, tmp450, input7
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r10, r0	@ result, _178, _179
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, fp	@ result, result, _144
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:155:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	fp, r6, r1	@ _182, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, fp	@ result, result, _182
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:156:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _184, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _184
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _187, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:164:         register int input8 = x[i + 8];
	ldr	fp, [r4, #32]	@ input8, MEM[(const int *)_576 + 32B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _186, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _187,
	orrne	r0, r0, #1	@,, y, _186
@ /home/student/ARM_TEST/butterworth_unrolled20.c:165:         y = __QADD(
	mul	r2, r7, ip	@ _196, tmp453, input7
	mul	ip, r3, fp	@ _195, tmp450, input8
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, ip, r2	@ result, _195, _196
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8	@ result, result, _161
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:170:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r8, r6, r0	@ _199, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8	@ result, result, _199
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:171:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _201, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r1	@ result, result, _201
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r2, #0, #14	@ _204, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:179:         register int input9 = x[i + 9];
	ldr	r8, [r4, #36]	@ input9, MEM[(const int *)_576 + 36B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _203, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _204,
	orrne	r2, r2, #1	@,, y, _203
@ /home/student/ARM_TEST/butterworth_unrolled20.c:180:         y = __QADD(
	mul	r1, r7, fp	@ _213, tmp453, input8
	mul	fp, r3, r8	@ _212, tmp450, input9
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, fp, r1	@ result, _212, _213
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _178
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:185:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r2	@ _216, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _216
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:186:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _218, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _218
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r1, #0, #14	@ _221, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:195:         register int input10 = x[i + 10];
	ldr	r10, [r4, #40]	@ input10, MEM[(const int *)_576 + 40B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _220, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _221,
	orrne	r1, r1, #1	@,, y, _220
@ /home/student/ARM_TEST/butterworth_unrolled20.c:196:         y = __QADD(
	mul	r0, r7, r8	@ _230, tmp453, input9
	mul	r8, r3, r10	@ _229, tmp450, input10
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r8, r0	@ result, _229, _230
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _195
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:201:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	ip, r6, r1	@ _233, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _233
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:202:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _235, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _235
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _238, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:210:         register int input11 = x[i + 11];
	ldr	ip, [r4, #44]	@ input11, MEM[(const int *)_576 + 44B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _237, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _238,
	orrne	r0, r0, #1	@,, y, _237
@ /home/student/ARM_TEST/butterworth_unrolled20.c:211:         y = __QADD(
	mul	r2, r7, r10	@ _247, tmp453, input10
	mul	r10, r3, ip	@ _246, tmp450, input11
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r10, r2	@ result, _246, _247
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, _212
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:216:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	fp, r6, r0	@ _250, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, _250
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:217:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _252, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r1	@ result, result, _252
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r2, #0, #14	@ _255, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:225:         register int input12 = x[i + 12];
	ldr	fp, [r4, #48]	@ input12, MEM[(const int *)_576 + 48B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _254, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _255,
	orrne	r2, r2, #1	@,, y, _254
@ /home/student/ARM_TEST/butterworth_unrolled20.c:226:         y = __QADD(
	mul	r1, r7, ip	@ _264, tmp453, input11
	mul	ip, r3, fp	@ _263, tmp450, input12
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, ip, r1	@ result, _263, _264
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _229
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:231:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r8, r6, r2	@ _267, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _267
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:232:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _269, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _269
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r1, #0, #14	@ _272, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:240:         register int input13 = x[i + 13];
	ldr	r8, [r4, #52]	@ input13, MEM[(const int *)_576 + 52B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _271, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _272,
	orrne	r1, r1, #1	@,, y, _271
@ /home/student/ARM_TEST/butterworth_unrolled20.c:241:         y = __QADD(
	mul	r0, r7, fp	@ _281, tmp453, input12
	mul	fp, r3, r8	@ _280, tmp450, input13
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, fp, r0	@ result, _280, _281
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _246
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:246:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r1	@ _284, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _284
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:247:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _286, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _286
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _289, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _288, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:257:         y = __QADD(
	mul	r8, r7, r8	@ _298, tmp453, input13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _289,
	orrne	r0, r0, #1	@,, y, _288
@ /home/student/ARM_TEST/butterworth_unrolled20.c:256:         register int input14 = x[i + 14];
	ldr	r2, [r4, #56]	@ input14, MEM[(const int *)_576 + 56B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:257:         y = __QADD(
	mul	r10, r3, r2	@ _297, tmp450, input14
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r10, r8	@ result, _297, _298
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd ip, r8, ip	@ result, result, _263
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:262:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r8, r6, r0	@ _301, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r8	@ result, result, _301
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:263:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _303, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r1	@ result, result, _303
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, ip, #0, #14	@ _306, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	ip, ip, #14	@ _305, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:273:         y = __QADD(
	mul	r2, r7, r2	@ _315, tmp453, input14
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _306,
	orrne	ip, ip, #1	@,, y, _305
@ /home/student/ARM_TEST/butterworth_unrolled20.c:272:         register int input15 = x[i + 15];
	ldr	r1, [r4, #60]	@ input15, MEM[(const int *)_576 + 60B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:273:         y = __QADD(
	mul	r8, r3, r1	@ _314, tmp450, input15
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _314, _315
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, _280
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:278:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	fp, r6, ip	@ _318, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, _318
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:279:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _320, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r2, r0	@ result, result, _320
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _323, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _322, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:288:         y = __QADD(
	mul	r1, r7, r1	@ _332, tmp453, input15
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _323,
	orrne	r0, r0, #1	@,, y, _322
@ /home/student/ARM_TEST/butterworth_unrolled20.c:287:         register int input16 = x[i + 16];
	ldr	r2, [r4, #64]	@ input16, MEM[(const int *)_576 + 64B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:288:         y = __QADD(
	mul	fp, r3, r2	@ _331, tmp450, input16
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, fp, r1	@ result, _331, _332
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _297
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:293:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r0	@ _335, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _335
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:294:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	ip, lr, ip	@ _337, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, ip	@ result, result, _337
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	ip, r1, #0, #14	@ _340, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _339, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:303:         y = __QADD(
	mul	r2, r7, r2	@ _349, tmp453, input16
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _340,
	orrne	r1, r1, #1	@,, y, _339
@ /home/student/ARM_TEST/butterworth_unrolled20.c:303:         y = __QADD(
	ldr	ip, [r4, #68]	@ tmp859, MEM[(const int *)_576 + 68B]
	mul	r10, r3, ip	@ _348, tmp450, tmp859
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r10, r2	@ result, _348, _349
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8	@ result, result, _314
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:308:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	ip, r6, r1	@ _352, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, ip	@ result, result, _352
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:309:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _354, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _354
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _357, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _356, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:317:         register int input18 = x[i + 18];
	ldr	ip, [r4, #72]	@ x2, MEM[(const int *)_576 + 72B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _357,
	orrne	r2, r2, #1	@,, y, _356
@ /home/student/ARM_TEST/butterworth_unrolled20.c:318:         y = __QADD(
	ldr	r0, [r4, #68]	@ tmp860, MEM[(const int *)_576 + 68B]
	mul	r8, r3, ip	@ _365, tmp450, x2
	mul	r0, r7, r0	@ _366, tmp453, tmp860
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, r0	@ result, _365, _366
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, fp	@ result, result, _331
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:323:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r0, r6, r2	@ _369, tmp459, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, r0	@ result, result, _369
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:324:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _371, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, r1	@ result, result, _371
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r8, #0, #14	@ _374, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:332:         register int input19 = x[i + 19];
	ldr	r0, [r4, #76]	@ x1, MEM[(const int *)_576 + 76B]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r8, r8, #14	@ _373, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:333:         y = __QADD(
	mul	fp, r7, ip	@ _383, tmp453, x2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _374,
	orrne	r8, r8, #1	@,, y2, _373
@ /home/student/ARM_TEST/butterworth_unrolled20.c:333:         y = __QADD(
	mul	r1, r3, r0	@ _382, tmp450, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, fp	@ result, _382, _383
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _348
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:338:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r8	@ _386, tmp459, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _386
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:339:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _388, tmp462, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r1, r2	@ result, result, _388
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r2, #0, #14	@ _391, result,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	add	r4, r4, #80	@ ivtmp.38, ivtmp.38,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _390, result,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _391,
	orrne	r2, r2, #1	@,, y1, _390
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	cmp	r4, r9	@ ivtmp.38, _598
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:392:     volatile int y = run_IIR(x, N);
	str	r2, [r5, #-1316]	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r5, #1296	@, tmp849,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r6, r0, #0	@ <retval>, tmp853
	bne	.L13		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r5, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13636	@ tmp862,
	movt	r2, 12	@ tmp862,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp794,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp862,, tmp862
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vldr.64	d17, .L17	@ tmp819,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp863, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp863
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r5, #-1292]	@ tmp838, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp794,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp819
	ldr	r7, .L17+16	@ tmp816,
.LPIC2:
	add	r7, pc, r7	@ tmp816, tmp816
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:411:         (double)y / (1 << 14)
	ldr	r2, [r5, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp819
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1308]	@ tmp840, start.tv_sec
	sbc	r2, r1, r2	@ seconds_39, tmp838, tmp840
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r1, r3, r0	@ _45, _45, seconds_39, tmp794
	mla	r1, r0, r2, r1	@ tmp800, tmp794, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r0, [r5, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r5, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	ip, r0, r2	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp810, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r0, asr #31	@ nanoseconds_44, tmp810, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, ip	@ _47, _45, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	movw	r3, #65529	@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r5, r1, r2	@ _47, tmp800, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	movw	r2, #17721	@ tmp828,
	movt	r2, 29255	@ tmp828,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	movt	r3, 16435	@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	strd	r2, [sp, #8]	@ tmp828,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp854,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L17+8	@ tmp831,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp854, tmp831
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	mov	r0, r7	@ tmp816, tmp816
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:415: }
	mov	r0, r6	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1344	@,,
	add	sp, sp, #12	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:388:         perror("Unable to start benchmark timer");
	ldr	r0, .L17+20	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:389:         return 1;
	mov	r6, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:395:         perror("Unable to stop benchmark timer");
	ldr	r0, .L17+24	@,
.LPIC1:
	add	r0, pc, r0	@,
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
	.word	.LC2-(.LPIC2+8)
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
