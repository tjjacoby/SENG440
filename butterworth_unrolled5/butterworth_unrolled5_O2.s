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
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:155: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp224,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:155: {
	subw	sp, sp, #1356	@,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1352	@ tmp412,,
	add	r7, sp, #798720	@ _151,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp229,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp231,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp233,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp235,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	sub	r3, fp, #1280	@ tmp223, tmp412,
	addw	r7, r7, #1348	@ _151, _151,
	mov	r4, r3	@ ivtmp.23, tmp223
	add	r9, r3, #798720	@ tmp411, ivtmp.23,
	str	r2, [r3]	@ tmp224, x[0]
	mov	r6, r3	@ ivtmp.33, ivtmp.23
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _202, n
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _203, _202, tmp229
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _203, tmp231
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp414, tmp233
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp235
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp236, _4
	vmov	r3, s0	@ int	@ tmp236, tmp236
	str	r3, [r6, #4]!	@ tmp236, MEM[(int *)_142]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	cmp	r6, r7	@ ivtmp.33, _151
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, fp, #1312	@, tmp412,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp254,
	add	r9, r9, #1280	@ _57, tmp411,
	movt	lr, 65535	@ tmp254,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:32:     register int y2 = 0;
	mov	r2, r0	@ y2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:31:     register int y1 = 0;
	mov	r7, r0	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:30:     register int x2 = 0;
	mov	r1, r0	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:38:         register int y = __QADD(
	movw	ip, #1105	@ tmp242,
	movw	r6, #2210	@ tmp245,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:43:         y = __QADD(y, a1 * y1);
	movw	r5, #18727	@ tmp251,
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:37:         register int input0 = x[i];
	ldr	r8, [r4]	@ input0, MEM[(const int *)_7]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:38:         register int y = __QADD(
	mul	r3, r6, r0	@ _55, tmp245, x1
	mul	r10, ip, r8	@ _53, tmp242, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r10, r3	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:42:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r1, ip, r1	@ _58, tmp242, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r3, r1	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:43:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r3, r5, r7	@ _61, tmp251, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:44:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _64, tmp254, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r1, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:54:         y = __QADD(
	mul	r2, r6, r8	@ _76, tmp245, input0
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _67,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled5.c:53:         register int input1 = x[i + 1];
	ldr	r3, [r4, #4]	@ input1, MEM[(const int *)_7 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:54:         y = __QADD(
	mul	r8, ip, r3	@ _75, tmp242, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:58:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r0, ip, r0	@ _78, tmp242, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:59:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r5, r1	@ _80, tmp251, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:60:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r7, lr, r7	@ _82, tmp254, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r7	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:70:         y = __QADD(
	mul	r3, r6, r3	@ _94, tmp245, input1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _85,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled5.c:69:         register int input2 = x[i + 2];
	ldr	r0, [r4, #8]	@ input2, MEM[(const int *)_7 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:70:         y = __QADD(
	mul	r7, ip, r0	@ _93, tmp242, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r7, r3	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:75:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r5, r2	@ _97, tmp251, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:76:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _99, tmp254, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r3, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:86:         y = __QADD(
	mul	r10, r6, r0	@ _111, tmp245, input2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _102,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled5.c:85:         register int input3 = x[i + 3];
	ldr	r1, [r4, #12]	@ x2, MEM[(const int *)_7 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:86:         y = __QADD(
	mul	r0, ip, r1	@ _110, tmp242, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:91:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r3	@ _114, tmp251, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:92:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _116, tmp254, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r0, r2	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:102:         y = __QADD(
	mul	r10, r6, r1	@ _128, tmp245, x2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _119,
	it	ne		@
	orrne	r2, r2, #1	@,, y2, _118
@ /home/student/ARM_TEST/butterworth_unrolled5.c:101:         register int input4 = x[i + 4];
	ldr	r0, [r4, #16]	@ x1, MEM[(const int *)_7 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:102:         y = __QADD(
	mul	r8, ip, r0	@ _127, tmp242, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, r10	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r7, r8, r7	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:107:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r2	@ _131, tmp251, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r7, r7, r8	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:108:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _133, tmp254, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r7, r7, r3	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r7, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	adds	r4, r4, #20	@ ivtmp.23, ivtmp.23,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r7, r7, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _136,
	it	ne		@
	orrne	r7, r7, #1	@,, y1, _135
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	cmp	r4, r9	@ ivtmp.23, _57
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:175:     volatile int y = run_IIR(x, N);
	subw	r6, fp, #1316	@ tmp331, tmp412,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, fp, #1296	@ tmp332, tmp412,
	mov	r1, r4	@, tmp332
	movs	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:175:     volatile int y = run_IIR(x, N);
	str	r7, [r6]	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp416
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:194:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	add	r2, fp, #794624	@ tmp385, tmp412,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	vldr.64	d18, .L14+32	@ tmp379,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:194:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	fp, fp, #1312	@ tmp343, tmp412,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	ldr	r7, .L14+56	@ tmp376,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp348,
	movt	r0, 15258	@ tmp348,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:194:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
.LPIC2:
	add	r7, pc	@ tmp376
	vmul.f64	d17, d17, d18	@ _15, _14, tmp379
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp379
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	ldr	r2, [fp]	@ start.tv_sec, start.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp400, end.tv_nsec, tmp332,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [fp, #4]	@ tmp402, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _45, _45, seconds_39, tmp348
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_39, tmp400, tmp402
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [fp, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp354, tmp348, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp361, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_44, tmp361, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp354, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp390,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	strd	r2, [sp, #8]	@ tmp390,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp417,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp393,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp417, tmp393
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	mov	r0, r7	@ tmp376, tmp376
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:198: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1356	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:171:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:172:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:178:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
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
	.word	1917273401
	.word	1077149689
	.word	.LC2-(.LPIC2+4)
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
