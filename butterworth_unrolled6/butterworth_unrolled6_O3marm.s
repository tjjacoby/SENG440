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
	.file	"butterworth_unrolled6.c"
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
	@ args = 0, pretend = 0, frame = 800048
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	movw	r8, #13644	@ _188,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r8, 12	@ _188,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1360	@,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp263,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:155: {
	sub	sp, sp, #4	@,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:158:     for (int n = 0; n < N; n++) {
	mov	r6, #1	@ n,
	add	r8, sp, r8	@ _188,, _188
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	add	r5, sp, #1360	@ tmp492,,
	mov	r4, r5	@ ivtmp.25, tmp492
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp268,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp270,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp272,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp274,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	str	r3, [r4, #-1280]!	@ tmp263, x[0]
	mov	r7, r4	@ ivtmp.35, ivtmp.25
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r6	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled6.c:158:     for (int n = 0; n < N; n++) {
	add	r6, r6, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _227, n
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _228, _227, tmp268
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _228, tmp270
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp494, tmp272
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp274
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp275, _4
	vmov	r3, s0	@ int	@ tmp275, tmp275
	str	r3, [r7, #4]!	@ tmp275, MEM[(int *)_186]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:158:     for (int n = 0; n < N; n++) {
	cmp	r7, r8	@ ivtmp.35, _188
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r5, #1312	@, tmp492,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r1, r0, #0	@ x1, tmp495
	bne	.L12		@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:43:         y = __QADD(y, a1 * y1);
	str	r5, [sp, #36]	@ tmp492, %sfp
	movw	r3, #13560	@ _174,
	mov	r2, r3	@ _174, _174
@ /home/student/ARM_TEST/butterworth_unrolled6.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp293,
	movt	r2, 12	@ _174,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:32:     register int y2 = 0;
	mov	r3, r1	@ y2, x1
	add	r8, r4, r2	@ _174, ivtmp.25, _174
@ /home/student/ARM_TEST/butterworth_unrolled6.c:30:     register int x2 = 0;
	mov	r0, r1	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:44:         y = __QADD(y, a2 * y2);
	movt	lr, 65535	@ tmp293,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:31:     register int y1 = 0;
	mov	r2, r1	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:38:         register int y = __QADD(
	movw	ip, #1105	@ tmp281,
	movw	r7, #2210	@ tmp284,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:43:         y = __QADD(y, a1 * y1);
	movw	r6, #18727	@ tmp290,
	mov	r5, r8	@ _174, _174
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:37:         register int input0 = x[i];
	ldr	r9, [r4]	@ input0, MEM[(const int *)_57]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:38:         register int y = __QADD(
	mul	r10, r7, r1	@ _55, tmp284, x1
	mul	r8, ip, r9	@ _53, tmp281, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r8, r10	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:42:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r0, ip, r0	@ _58, tmp281, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r10, r0	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:43:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r2	@ _61, tmp290, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:44:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r3, lr, r3	@ _64, tmp293, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r0, r3	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r3, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:53:         register int input1 = x[i + 1];
	ldr	r10, [r4, #4]	@ input1, MEM[(const int *)_57 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _67,
	orrne	r3, r3, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled6.c:54:         y = __QADD(
	mul	r0, r7, r9	@ _76, tmp284, input0
	mul	r9, ip, r10	@ _75, tmp281, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r9, r0	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:58:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r1, ip, r1	@ _78, tmp281, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r1	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:59:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r1, r6, r3	@ _80, tmp290, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r1	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:60:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _82, tmp293, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:70:         y = __QADD(
	mul	r1, r7, r10	@ _94, tmp284, input1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _85,
	orrne	r0, r0, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled6.c:69:         register int input2 = x[i + 2];
	ldr	r2, [r4, #8]	@ input2, MEM[(const int *)_57 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:70:         y = __QADD(
	mul	r10, ip, r2	@ _93, tmp281, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r10, r1	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:75:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r8, r6, r0	@ _97, tmp290, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:76:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r3, lr, r3	@ _99, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r3, r1, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:86:         y = __QADD(
	mul	r2, r7, r2	@ _111, tmp284, input2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _102,
	orrne	r1, r1, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled6.c:85:         register int input3 = x[i + 3];
	ldr	r3, [r4, #12]	@ input3, MEM[(const int *)_57 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:86:         y = __QADD(
	mul	r8, ip, r3	@ _110, tmp281, input3
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:91:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r9, r6, r1	@ _114, tmp290, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:92:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _116, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:102:         y = __QADD(
	mul	r3, r7, r3	@ _128, tmp284, input3
@ /home/student/ARM_TEST/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _119,
	orrne	r2, r2, #1	@,, y, _118
@ /home/student/ARM_TEST/butterworth_unrolled6.c:101:         register int input4 = x[i + 4];
	ldr	r0, [r4, #16]	@ x2, MEM[(const int *)_57 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:102:         y = __QADD(
	mul	r9, ip, r0	@ _127, tmp281, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r9, r3	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:107:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r2	@ _131, tmp290, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:108:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _133, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r3, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:118:         y = __QADD(
	mul	fp, r7, r0	@ _145, tmp284, x2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _136,
	orrne	r3, r3, #1	@,, y2, _135
@ /home/student/ARM_TEST/butterworth_unrolled6.c:117:         register int input5 = x[i + 5];
	ldr	r1, [r4, #20]	@ x1, MEM[(const int *)_57 + 20B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:118:         y = __QADD(
	mul	r10, ip, r1	@ _144, tmp281, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd fp, r10, fp	@ result, _144, _145
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r8, fp, r8	@ result, result, _110
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:123:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	fp, r6, r3	@ _148, tmp290, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, fp	@ result, result, _148
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:124:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _150, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, result, _150
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	fp, r2, #0, #14	@ _153, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:35:     for (i = 0; i + 5 < sample_count; i += 6) {
	add	r4, r4, #24	@ ivtmp.25, ivtmp.25,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _152, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	fp, #0	@ _153,
	orrne	r2, r2, #1	@,, y1, _152
@ /home/student/ARM_TEST/butterworth_unrolled6.c:35:     for (i = 0; i + 5 < sample_count; i += 6) {
	cmp	r4, r5	@ ivtmp.25, _174
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	ldr	r5, [sp, #36]	@ tmp492, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled6.c:135:         register int current_input = x[i];
	movw	r0, #13640	@ tmp523,
	movt	r0, 12	@ tmp523,
	add	r0, sp, r0	@ tmp523,, tmp523
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	mul	r1, r7, r1	@ _250, tmp284, x1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:135:         register int current_input = x[i];
	ldr	r0, [r0]	@ current_input, MEM[(const int *)&x + 799992B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	mul	r4, ip, r0	@ _252, tmp281, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r4, r1	@ result, _252, _250
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r9	@ result, result, _127
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:141:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r4, r6, r2	@ _243, tmp290, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r4	@ result, result, _243
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:142:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r3, lr, r3	@ _241, tmp293, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _241
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:135:         register int current_input = x[i];
	.arm
	.syntax unified
	add	r3, sp, #794624	@ tmp384,,
	add	r3, r3, #1360	@ tmp384, tmp384,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	mul	r0, r7, r0	@ _166, tmp284, current_input
@ /home/student/ARM_TEST/butterworth_unrolled6.c:135:         register int current_input = x[i];
	ldr	r4, [r3, #4092]	@ current_input, MEM[(const int *)&x + 799996B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	mul	r3, ip, r4	@ _164, tmp281, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, _164, _166
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _144
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r1, #0, #14	@ _238, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _239, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _238,
	orrne	r1, r1, #1	@,, y_235, _239
@ /home/student/ARM_TEST/butterworth_unrolled6.c:141:         y = __QADD(y, a1 * y1);
	mul	r1, r6, r1	@ _172, tmp290, y_235
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _172
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:142:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _175, tmp293, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _175
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _178, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r5, #1296	@, tmp492,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _177, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _178,
	orrne	r3, r3, #1	@,, y, _177
@ /home/student/ARM_TEST/butterworth_unrolled6.c:175:     volatile int y = run_IIR(x, N);
	str	r3, [r5, #-1316]	@ y, y
@ /home/student/ARM_TEST/butterworth_unrolled6.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r6, r0, #0	@ <retval>, tmp496
	bne	.L13		@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:193:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r4	@ int	@ current_input, current_input
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	vldr.64	d17, .L14+32	@ tmp467,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp442,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r5, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:193:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, current_input
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r5, #-1292]	@ tmp481, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp442,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp467
	ldr	r7, .L14+48	@ tmp464,
.LPIC2:
	add	r7, pc, r7	@ tmp464, tmp464
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:194:         (double)y / (1 << 14)
	ldr	r2, [r5, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp467
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1308]	@ tmp483, start.tv_sec
	sbc	r2, r1, r2	@ seconds_39, tmp481, tmp483
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r1, r3, r0	@ _45, _45, seconds_39, tmp442
	mla	r1, r0, r2, r1	@ tmp448, tmp442, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r0, [r5, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r5, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	ip, r0, r2	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp458, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r0, asr #31	@ nanoseconds_44, tmp458, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, ip	@ _47, _45, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	movw	r3, #65529	@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r5, r1, r2	@ _47, tmp448, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	movw	r2, #17721	@ tmp471,
	movt	r2, 29255	@ tmp471,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	movt	r3, 16435	@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	strd	r2, [sp, #8]	@ tmp471,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp497,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp474,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp497, tmp474
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	mov	r0, r7	@ tmp464, tmp464
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:198: }
	mov	r0, r6	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1360	@,,
	add	sp, sp, #4	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:171:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:172:         return 1;
	mov	r6, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:178:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:179:         return 1;
	b	.L4		@
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
