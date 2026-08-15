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
	.file	"butterworth_unrolled5.c"
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
	movw	r8, #13636	@ _214,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r8, 12	@ _214,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1344	@,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp222,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:155: {
	sub	sp, sp, #12	@,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	mov	r6, #1	@ n,
	add	r8, sp, r8	@ _214,, _214
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	add	r5, sp, #1344	@ tmp399,,
	add	r5, r5, #8	@ tmp399, tmp399,
	mov	r4, r5	@ ivtmp.23, tmp399
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp227,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp229,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp231,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp233,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	str	r3, [r4, #-1280]!	@ tmp222, x[0]
	mov	r7, r4	@ ivtmp.33, ivtmp.23
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r6	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	add	r6, r6, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _202, n
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _203, _202, tmp227
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _203, tmp229
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp401, tmp231
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp233
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp234, _4
	vmov	r3, s0	@ int	@ tmp234, tmp234
	str	r3, [r7, #4]!	@ tmp234, MEM[(int *)_212]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	cmp	r7, r8	@ ivtmp.33, _214
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r5, #1312	@, tmp399,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	lr, r0, #0	@ x1, tmp402
	bne	.L12		@,
	add	r10, r4, #798720	@ _208, ivtmp.23,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:44:         y = __QADD(y, a2 * y2);
	movw	r6, #58773	@ tmp252,
	movt	r6, 65535	@ tmp252,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:32:     register int y2 = 0;
	mov	fp, lr	@ y2, x1
	add	r10, r10, #1280	@ _208, _208,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:31:     register int y1 = 0;
	mov	r1, lr	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:30:     register int x2 = 0;
	mov	r3, lr	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:38:         register int y = __QADD(
	movw	ip, #1105	@ tmp240,
	movw	r8, #2210	@ tmp243,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:43:         y = __QADD(y, a1 * y1);
	movw	r7, #18727	@ tmp249,
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:37:         register int input0 = x[i];
	ldr	r2, [r4]	@ input0, MEM[(const int *)_196]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:38:         register int y = __QADD(
	mul	r0, r8, lr	@ _55, tmp243, x1
	mul	r9, ip, r2	@ _53, tmp240, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r9, r0	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:42:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r3, ip, r3	@ _58, tmp240, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r3	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:43:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r3, r7, r1	@ _61, tmp249, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r3	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:44:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	fp, r6, fp	@ _64, tmp252, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, fp	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r3, r0, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:54:         y = __QADD(
	mul	r2, r8, r2	@ _76, tmp243, input0
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _67,
	orrne	r0, r0, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled5.c:53:         register int input1 = x[i + 1];
	ldr	r3, [r4, #4]	@ input1, MEM[(const int *)_196 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:54:         y = __QADD(
	mul	fp, ip, r3	@ _75, tmp240, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, fp, r2	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:58:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	lr, ip, lr	@ _78, tmp240, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, lr	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:59:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	lr, r7, r0	@ _80, tmp249, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, lr	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:60:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, r6, r1	@ _82, tmp252, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r1	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r2, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:69:         register int input2 = x[i + 2];
	ldr	lr, [r4, #8]	@ input2, MEM[(const int *)_196 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:70:         y = __QADD(
	mul	r3, r8, r3	@ _94, tmp243, input1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _85,
	orrne	r2, r2, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled5.c:70:         y = __QADD(
	mul	r1, ip, lr	@ _93, tmp240, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r1, r3	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:75:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r9, r7, r2	@ _97, tmp249, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:76:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, r6, r0	@ _99, tmp252, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r3, r0	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r3, r0, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:86:         y = __QADD(
	mul	r9, r8, lr	@ _111, tmp243, input2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _102,
	orrne	r0, r0, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled5.c:85:         register int input3 = x[i + 3];
	ldr	r3, [r4, #12]	@ x2, MEM[(const int *)_196 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:86:         y = __QADD(
	mul	lr, ip, r3	@ _110, tmp240, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd lr, lr, r9	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd fp, lr, fp	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:91:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	lr, r7, r0	@ _114, tmp249, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd fp, fp, lr	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:92:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, r6, r2	@ _116, tmp252, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd fp, fp, r2	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, fp, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:101:         register int input4 = x[i + 4];
	ldr	lr, [r4, #16]	@ x1, MEM[(const int *)_196 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	fp, fp, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:102:         y = __QADD(
	mul	r9, r8, r3	@ _128, tmp243, x2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _119,
	orrne	fp, fp, #1	@,, y2, _118
@ /home/student/ARM_TEST/butterworth_unrolled5.c:102:         y = __QADD(
	mul	r2, ip, lr	@ _127, tmp240, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r9	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r2, r1	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:107:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r2, r7, fp	@ _131, tmp249, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:108:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, r6, r0	@ _133, tmp252, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r1, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	add	r4, r4, #20	@ ivtmp.23, ivtmp.23,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _136,
	orrne	r1, r1, #1	@,, y1, _135
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	cmp	r4, r10	@ ivtmp.23, _208
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:175:     volatile int y = run_IIR(x, N);
	str	r1, [r5, #-1316]	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r0, #1	@,
	sub	r1, r5, #1296	@, tmp399,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r6, r0, #0	@ <retval>, tmp403
	bne	.L13		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r5, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13636	@ tmp410,
	movt	r2, 12	@ tmp410,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp344,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp410,, tmp410
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	vldr.64	d17, .L14+32	@ tmp369,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp411, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp411
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r5, #-1292]	@ tmp388, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp344,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp369
	ldr	r7, .L14+48	@ tmp366,
.LPIC2:
	add	r7, pc, r7	@ tmp366, tmp366
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:194:         (double)y / (1 << 14)
	ldr	r2, [r5, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp369
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1308]	@ tmp390, start.tv_sec
	sbc	r2, r1, r2	@ seconds_39, tmp388, tmp390
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r1, r3, r0	@ _45, _45, seconds_39, tmp344
	mla	r1, r0, r2, r1	@ tmp350, tmp344, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r0, [r5, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r5, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	ip, r0, r2	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp360, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r0, asr #31	@ nanoseconds_44, tmp360, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, ip	@ _47, _45, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	movw	r3, #65529	@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r5, r1, r2	@ _47, tmp350, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	movw	r2, #17721	@ tmp378,
	movt	r2, 29255	@ tmp378,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	movt	r3, 16435	@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	strd	r2, [sp, #8]	@ tmp378,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp404,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp381,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp404, tmp381
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	mov	r0, r7	@ tmp366, tmp366
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:198: }
	mov	r0, r6	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1344	@,,
	add	sp, sp, #12	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:171:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:172:         return 1;
	mov	r6, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:178:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:179:         return 1;
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
