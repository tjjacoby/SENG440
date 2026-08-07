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
	.file	"butterworth_pipelined_unrolled2.c"
@ GNU C17 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O3
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
@ butterworth_pipelined_unrolled2.c:129:     for (int n = 0; n < N; n++) {
	movs	r4, #1	@ n,
@ butterworth_pipelined_unrolled2.c:126: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ butterworth_pipelined_unrolled2.c:135:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp208,
@ butterworth_pipelined_unrolled2.c:126: {
	subw	sp, sp, #1364	@,,
@ butterworth_pipelined_unrolled2.c:135:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1360	@ tmp384,,
	add	r8, sp, #798720	@ _175,,
@ butterworth_pipelined_unrolled2.c:130:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp213,
@ butterworth_pipelined_unrolled2.c:131:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp215,
@ butterworth_pipelined_unrolled2.c:131:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp217,
@ butterworth_pipelined_unrolled2.c:135:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp219,
@ butterworth_pipelined_unrolled2.c:135:         x[n] = (int)(input * (1 << 14));
	sub	r3, fp, #1280	@ tmp207, tmp384,
	addw	r8, r8, #1356	@ _175, _175,
	mov	r5, r3	@ ivtmp.22, tmp207
	add	r6, r3, #798720	@ tmp385, ivtmp.22,
	str	r2, [r3]	@ tmp208, x[0]
	mov	r7, r3	@ ivtmp.34, ivtmp.22
.L2:
@ butterworth_pipelined_unrolled2.c:130:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r4	@ int	@ n, n
@ butterworth_pipelined_unrolled2.c:129:     for (int n = 0; n < N; n++) {
	adds	r4, r4, #1	@ n, n,
@ butterworth_pipelined_unrolled2.c:130:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _109, n
@ butterworth_pipelined_unrolled2.c:130:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _106, _109, tmp213
@ butterworth_pipelined_unrolled2.c:131:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _106, tmp215
	bl	sin(PLT)	@
@ butterworth_pipelined_unrolled2.c:131:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp387, tmp217
@ butterworth_pipelined_unrolled2.c:135:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp219
@ butterworth_pipelined_unrolled2.c:135:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp220, _4
	vmov	r3, s0	@ int	@ tmp220, tmp220
	str	r3, [r7, #4]!	@ tmp220, MEM[(int *)_177]
@ butterworth_pipelined_unrolled2.c:129:     for (int n = 0; n < N; n++) {
	cmp	r8, r7	@ _175, ivtmp.34
	bne	.L2		@,
@ butterworth_pipelined_unrolled2.c:141:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	sub	r1, fp, #1312	@, tmp384,
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
@ butterworth_pipelined_unrolled2.c:141:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	cmp	r0, #0	@ next_input
	bne	.L12	@
@ butterworth_pipelined_unrolled2.c:38:     register int current_input = x[0];
	sub	r3, fp, #1280	@ tmp228, tmp384,
@ butterworth_pipelined_unrolled2.c:39:     register int current_feedforward = __QADD(
	movw	r1, #1105	@ tmp231,
@ butterworth_pipelined_unrolled2.c:38:     register int current_input = x[0];
	ldr	r4, [r3]	@ next_input, MEM[(const int *)&x]
@ butterworth_pipelined_unrolled2.c:39:     register int current_feedforward = __QADD(
	mul	r3, r1, r4	@ _49, tmp231, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, _49, next_input
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, next_input
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:59:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	str	fp, [sp, #36]	@ tmp384, %sfp
	add	r2, r6, #1272	@ _182, tmp385,
	str	r2, [sp, #32]	@ _182, %sfp
@ butterworth_pipelined_unrolled2.c:60:             y = __QADD(y, a2 * y2);
	movw	r7, #58773	@ tmp248,
	movt	r7, 65535	@ tmp248,
@ butterworth_pipelined_unrolled2.c:35:     register int y2 = 0;
	mov	lr, r0	@ y2, next_input
@ butterworth_pipelined_unrolled2.c:34:     register int y1 = 0;
	mov	r2, r0	@ y1, next_input
@ butterworth_pipelined_unrolled2.c:50:             register int next_feedforward = __QADD(
	movw	r9, #2210	@ tmp239,
@ butterworth_pipelined_unrolled2.c:59:             register int y = __QADD(current_feedforward, a1 * y1);
	movw	r8, #18727	@ tmp245,
.L5:
	mov	ip, r0	@ x1, next_input
@ butterworth_pipelined_unrolled2.c:49:             register int next_input = x[i + 1];
	ldr	r0, [r5, #4]	@ next_input, MEM[(const int *)_185 + 4B]
@ butterworth_pipelined_unrolled2.c:50:             register int next_feedforward = __QADD(
	mul	r6, r9, r4	@ _60, tmp239, next_input
	mul	r10, r1, r0	@ _58, tmp231, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r6, r10, r6	@ result, _58, _60
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:54:             next_feedforward = __QADD(
	.thumb
	.syntax unified
	mul	ip, r1, ip	@ _63, tmp231, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r6, r6, ip	@ result, result, _63
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:59:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r8, r2	@ _66, tmp245, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, r3, ip	@ result, current_feedforward, _66
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:60:             y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	lr, r7, lr	@ _70, tmp248, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, ip, lr	@ result, result, _70
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:61:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, ip, #0, #14	@ _73, result,,
@ butterworth_pipelined_unrolled2.c:61:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	ip, ip, #14	@ _72, result,
@ butterworth_pipelined_unrolled2.c:73:             register int next_feedforward = __QADD(
	mul	fp, r9, r0	@ _82, tmp239, next_input
@ butterworth_pipelined_unrolled2.c:61:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _73,
	ite	eq		@
	moveq	lr, ip	@, y2, _72
	orrne	lr, ip, #1	@,, y2, _72
	mov	ip, r4	@ current_input, next_input
@ butterworth_pipelined_unrolled2.c:72:             register int next_input = x[i + 2];
	ldr	r4, [r5, #8]!	@ next_input, MEM[(const int *)_185 + 8B]
@ butterworth_pipelined_unrolled2.c:73:             register int next_feedforward = __QADD(
	mul	r3, r1, r4	@ _81, tmp231, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, _81, _82
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:77:             next_feedforward = __QADD(
	.thumb
	.syntax unified
	mul	ip, r1, ip	@ _84, tmp231, current_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, ip	@ result, result, _84
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:82:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r8, lr	@ _86, tmp245, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, r6, ip	@ result, result, _86
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:83:             y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r7, r2	@ _88, tmp248, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, ip, r2	@ result, result, _88
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:84:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r6, ip, #0, #14	@ _91, result,,
@ butterworth_pipelined_unrolled2.c:84:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	ip, ip, #14	@ _90, result,
@ butterworth_pipelined_unrolled2.c:84:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r6, #0	@ _91,
	ite	eq		@
	moveq	r2, ip	@, y1, _90
	orrne	r2, ip, #1	@,, y1, _90
@ butterworth_pipelined_unrolled2.c:46:     for (i = 0; i + 2 < sample_count; i += 2) {
	ldr	r6, [sp, #32]	@ _182, %sfp
	cmp	r6, r5	@ _182, ivtmp.22
	bne	.L5		@,
@ butterworth_pipelined_unrolled2.c:97:         register int next_feedforward = __QADD(
	ldr	fp, [sp, #36]	@ tmp384, %sfp
	mul	r4, r9, r4	@ _104, tmp239, next_input
@ butterworth_pipelined_unrolled2.c:96:         register int next_input = x[i + 1];
	add	r0, fp, #794624	@ tmp278, tmp384,
	ldr	r6, [r0, #4092]	@ next_input, MEM[(const int *)&x + 799996B]
@ butterworth_pipelined_unrolled2.c:97:         register int next_feedforward = __QADD(
	mul	r1, r6, r1	@ _102, next_input, tmp231
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r4	@ result, _102, _104
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _58
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:106:         register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r8, r2	@ _110, tmp245, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, current_feedforward, _110
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:107:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	lr, r7, lr	@ _114, tmp248, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, lr	@ result, result, _114
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:108:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r3, #0, #14	@ _117, result,,
@ butterworth_pipelined_unrolled2.c:108:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _116, result,
@ butterworth_pipelined_unrolled2.c:108:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _117,
	it	ne		@
	orrne	r3, r3, #1	@,, y_120, _116
@ butterworth_pipelined_unrolled2.c:118:     register int y = __QADD(current_feedforward, a1 * y1);
	mul	r3, r8, r3	@ _122, tmp245, y_120
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r1, r3	@ result, result, _122
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:119:     y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r7, r2	@ _124, tmp248, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _124
@ 0 "" 2
@ butterworth_pipelined_unrolled2.c:120:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _127, result,,
@ butterworth_pipelined_unrolled2.c:146:     volatile int y = run_IIR(x, N);
	subw	r7, fp, #1316	@ tmp311, tmp384,
@ butterworth_pipelined_unrolled2.c:120:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _126, result,
@ butterworth_pipelined_unrolled2.c:148:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	sub	r4, fp, #1296	@ tmp312, tmp384,
	mov	r1, r4	@, tmp312
	movs	r0, #2	@,
@ butterworth_pipelined_unrolled2.c:120:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _127,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _126
@ butterworth_pipelined_unrolled2.c:146:     volatile int y = run_IIR(x, N);
	str	r3, [r7]	@ y, y
@ butterworth_pipelined_unrolled2.c:148:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ butterworth_pipelined_unrolled2.c:148:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp389
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ butterworth_pipelined_unrolled2.c:164:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r6	@ int	@ next_input, next_input
@ butterworth_pipelined_unrolled2.c:165:         (double)y / (1 << 14)
	ldr	r3, [r7]	@ y.0_13, y
@ butterworth_pipelined_unrolled2.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	fp, fp, #1312	@ tmp323, tmp384,
@ butterworth_pipelined_unrolled2.c:157:     printf(
	vldr.64	d18, .L14+32	@ tmp359,
	ldr	r7, .L14+56	@ tmp356,
@ butterworth_pipelined_unrolled2.c:164:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, next_input
@ butterworth_pipelined_unrolled2.c:165:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ butterworth_pipelined_unrolled2.c:157:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp363,
.LPIC2:
	add	r7, pc	@ tmp356
	vmul.f64	d16, d16, d18	@ _12, _11, tmp359
@ butterworth_pipelined_unrolled2.c:165:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ butterworth_pipelined_unrolled2.c:157:     printf(
	strd	r2, [sp, #8]	@ tmp363,,
	vmul.f64	d17, d17, d18	@ _15, _14, tmp359
	vstr.64	d16, [sp, #16]	@ _12,
	vstr.64	d17, [sp, #24]	@ _15,
@ butterworth_pipelined_unrolled2.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldrd	r3, r6, [r4]	@ end.tv_sec, tmp373, tmp312
	ldr	r1, [fp]	@ start.tv_sec, start.tv_sec
@ butterworth_pipelined_unrolled2.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r4, #8]	@ end.tv_nsec, end.tv_nsec
@ butterworth_pipelined_unrolled2.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r3, r3, r1	@ seconds_39, end.tv_sec, start.tv_sec
@ butterworth_pipelined_unrolled2.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp328,
@ butterworth_pipelined_unrolled2.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r4, r0, [fp, #4]	@ tmp375, start.tv_nsec, tmp323,
@ butterworth_pipelined_unrolled2.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp328,
@ butterworth_pipelined_unrolled2.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r6, r4	@ seconds_39, tmp373, tmp375
@ butterworth_pipelined_unrolled2.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _45, _45, seconds_39, tmp328
	mla	r6, r1, r4, r6	@ tmp334, tmp328, seconds_39, _45
@ butterworth_pipelined_unrolled2.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r1, r2, r0	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ butterworth_pipelined_unrolled2.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp341, end.tv_nsec,
@ butterworth_pipelined_unrolled2.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r0, asr #31	@ nanoseconds_44, tmp341, start.tv_nsec,
@ butterworth_pipelined_unrolled2.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r1	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp334, nanoseconds_44
@ butterworth_pipelined_unrolled2.c:154:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
	mov	r1, r6	@, _47
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp390,
@ butterworth_pipelined_unrolled2.c:154:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp366,
@ butterworth_pipelined_unrolled2.c:157:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ butterworth_pipelined_unrolled2.c:154:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp390, tmp366
@ butterworth_pipelined_unrolled2.c:157:     printf(
	mov	r0, r7	@ tmp356, tmp356
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ butterworth_pipelined_unrolled2.c:169: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ butterworth_pipelined_unrolled2.c:142:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ butterworth_pipelined_unrolled2.c:143:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ butterworth_pipelined_unrolled2.c:149:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_pipelined_unrolled2.c:150:         return 1;
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
