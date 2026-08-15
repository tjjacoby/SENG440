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
	.file	"butterworth_unrolled4.c"
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
	movw	r8, #13644	@ _358,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r8, 12	@ _358,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1360	@,,
@ /home/student/seng440/filter/butterworth_unrolled4.c:116:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp208,
@ /home/student/seng440/filter/butterworth_unrolled4.c:107: {
	sub	sp, sp, #4	@,,
@ /home/student/seng440/filter/butterworth_unrolled4.c:110:     for (int n = 0; n < N; n++) {
	mov	r5, #1	@ n,
	add	r8, sp, r8	@ _358,, _358
@ /home/student/seng440/filter/butterworth_unrolled4.c:116:         x[n] = (int)(input * (1 << 14));
	add	r6, sp, #1360	@ tmp344,,
	mov	r4, r6	@ ivtmp.21, tmp344
@ /home/student/seng440/filter/butterworth_unrolled4.c:111:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp213,
@ /home/student/seng440/filter/butterworth_unrolled4.c:112:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp215,
@ /home/student/seng440/filter/butterworth_unrolled4.c:112:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp217,
@ /home/student/seng440/filter/butterworth_unrolled4.c:116:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp219,
@ /home/student/seng440/filter/butterworth_unrolled4.c:116:         x[n] = (int)(input * (1 << 14));
	str	r3, [r4, #-1280]!	@ tmp208, x[0]
	mov	r7, r4	@ ivtmp.31, ivtmp.21
.L2:
@ /home/student/seng440/filter/butterworth_unrolled4.c:111:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled4.c:110:     for (int n = 0; n < N; n++) {
	add	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled4.c:111:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _284, n
@ /home/student/seng440/filter/butterworth_unrolled4.c:111:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _285, _284, tmp213
@ /home/student/seng440/filter/butterworth_unrolled4.c:112:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _285, tmp215
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled4.c:112:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp346, tmp217
@ /home/student/seng440/filter/butterworth_unrolled4.c:116:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp219
@ /home/student/seng440/filter/butterworth_unrolled4.c:116:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp220, _4
	vmov	r3, s0	@ int	@ tmp220, tmp220
	str	r3, [r7, #4]!	@ tmp220, MEM[(int *)_356]
@ /home/student/seng440/filter/butterworth_unrolled4.c:110:     for (int n = 0; n < N; n++) {
	cmp	r7, r8	@ ivtmp.31, _358
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled4.c:122:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r6, #1312	@, tmp344,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled4.c:122:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r3, r0, #0	@ x1, tmp347
	bne	.L12		@,
@ /home/student/seng440/filter/butterworth_unrolled4.c:39:         y = ((y) + (a1 * y1));
	str	r6, [sp, #36]	@ tmp344, %sfp
	add	r2, r4, #798720	@ _352, ivtmp.21,
	add	r2, r2, #1280	@ _352, _352,
@ /home/student/seng440/filter/butterworth_unrolled4.c:40:         y = ((y) + (a2 * y2));
	movw	r8, #58773	@ tmp234,
	movt	r8, 65535	@ tmp234,
@ /home/student/seng440/filter/butterworth_unrolled4.c:31:     register int y2 = 0;
	mov	r1, r3	@ y2, x1
@ /home/student/seng440/filter/butterworth_unrolled4.c:30:     register int y1 = 0;
	mov	lr, r3	@ y1, x1
@ /home/student/seng440/filter/butterworth_unrolled4.c:29:     register int x2 = 0;
	mov	fp, r3	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled4.c:39:         y = ((y) + (a1 * y1));
	mov	r5, r3	@ y2, y2
@ /home/student/seng440/filter/butterworth_unrolled4.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r7, #1105	@ tmp226,
@ /home/student/seng440/filter/butterworth_unrolled4.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r10, #2210	@ tmp228,
@ /home/student/seng440/filter/butterworth_unrolled4.c:39:         y = ((y) + (a1 * y1));
	movw	r9, #18727	@ tmp232,
	mov	r3, r2	@ _352, _352
.L5:
@ /home/student/seng440/filter/butterworth_unrolled4.c:36:         register int input0 = x[i];
	ldr	r2, [r4]	@ input0, MEM[(const int *)_346]
@ /home/student/seng440/filter/butterworth_unrolled4.c:34:     for (i = 0; i + 3 < sample_count; i += 4) {
	add	r4, r4, #16	@ ivtmp.21, ivtmp.21,
@ /home/student/seng440/filter/butterworth_unrolled4.c:49:         register int input1 = x[i + 1];
	ldr	r6, [r4, #-12]	@ input1, MEM[(const int *)_346 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled4.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	ip, r7, r2	@ _52, tmp226, input0
@ /home/student/seng440/filter/butterworth_unrolled4.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	r0, r10, fp, ip	@ y, tmp228, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled4.c:38:         y = ((y) + (b02_1 * x2));
	mla	r1, r7, r1, r0	@ y, tmp226, x2, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:39:         y = ((y) + (a1 * y1));
	mla	r1, r9, lr, r1	@ y, tmp232, y1, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:40:         y = ((y) + (a2 * y2));
	mla	r1, r8, r5, r1	@ y, tmp234, y2, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	r0, r7, r6	@ _74, tmp226, input1
@ /home/student/seng440/filter/butterworth_unrolled4.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r5, r1, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled4.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r5, r5, #0	@ _67, _66,
@ /home/student/seng440/filter/butterworth_unrolled4.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r2, r10, r2, r0	@ y, tmp228, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled4.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r5, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled4.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r5, r5, r1, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled4.c:51:         y = ((y) + (b02_1 * x2));
	mla	r2, r7, fp, r2	@ y, tmp226, x1, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:52:         y = ((y) + (a1 * y1));
	mla	r2, r9, r5, r2	@ y, tmp232, y, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:53:         y = ((y) + (a2 * y2));
	mla	r1, r8, lr, r2	@ y, tmp234, y1, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r6, r10, r6	@ _93, tmp228, input1
@ /home/student/seng440/filter/butterworth_unrolled4.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r1, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled4.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _85, _84,
@ /home/student/seng440/filter/butterworth_unrolled4.c:75:         register int input3 = x[i + 3];
	ldr	fp, [r4, #-4]	@ x1, MEM[(const int *)_346 + 12B]
@ /home/student/seng440/filter/butterworth_unrolled4.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r2, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled4.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r1, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled4.c:62:         register int input2 = x[i + 2];
	ldr	r1, [r4, #-8]	@ x2, MEM[(const int *)_346 + 8B]
@ /home/student/seng440/filter/butterworth_unrolled4.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	r6, r7, r1, r6	@ y, tmp226, x2, _93
@ /home/student/seng440/filter/butterworth_unrolled4.c:64:         y = ((y) + (b02_1 * x2));
	add	ip, ip, r6	@ y, _52, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:65:         y = ((y) + (a1 * y1));
	mla	ip, r9, r2, ip	@ y, tmp232, y, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:66:         y = ((y) + (a2 * y2));
	mla	ip, r8, r5, ip	@ y, tmp234, y, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r5, ip, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled4.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r5, r5, #0	@ _102, _101,
	movne	r5, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled4.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r5, r5, ip, asr #14	@ y2, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled4.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	ip, r10, r1	@ _110, tmp228, x2
@ /home/student/seng440/filter/butterworth_unrolled4.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	ip, r7, fp, ip	@ y, tmp226, x1, _110
@ /home/student/seng440/filter/butterworth_unrolled4.c:77:         y = ((y) + (b02_1 * x2));
	add	r0, r0, ip	@ y, _74, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:78:         y = ((y) + (a1 * y1));
	mla	r0, r9, r5, r0	@ y, tmp232, y2, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:79:         y = ((y) + (a2 * y2));
	mla	r0, r8, r2, r0	@ y, tmp234, y, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	lr, r0, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled4.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	lr, lr, #0	@ _119, _118,
	movne	lr, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled4.c:34:     for (i = 0; i + 3 < sample_count; i += 4) {
	cmp	r4, r3	@ ivtmp.21, _352
@ /home/student/seng440/filter/butterworth_unrolled4.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	lr, lr, r0, asr #14	@ y1, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled4.c:34:     for (i = 0; i + 3 < sample_count; i += 4) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled4.c:127:     volatile int y = run_IIR(x, N);
	ldr	r6, [sp, #36]	@ tmp344, %sfp
@ /home/student/seng440/filter/butterworth_unrolled4.c:129:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled4.c:127:     volatile int y = run_IIR(x, N);
	str	lr, [r6, #-1316]	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled4.c:129:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r6, #1296	@, tmp344,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled4.c:129:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp348
	bne	.L13		@,
@ /home/student/seng440/filter/butterworth_unrolled4.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r6, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled4.c:145:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13644	@ tmp371,
	movt	r2, 12	@ tmp371,
@ /home/student/seng440/filter/butterworth_unrolled4.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp289,
@ /home/student/seng440/filter/butterworth_unrolled4.c:145:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp371,, tmp371
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	vldr.64	d17, .L14+32	@ tmp314,
@ /home/student/seng440/filter/butterworth_unrolled4.c:145:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp372, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled4.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r6, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled4.c:145:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp372
@ /home/student/seng440/filter/butterworth_unrolled4.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r6, #-1292]	@ tmp333, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled4.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp289,
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp314
	ldr	r7, .L14+48	@ tmp311,
.LPIC2:
	add	r7, pc, r7	@ tmp311, tmp311
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled4.c:146:         (double)y / (1 << 14)
	ldr	r2, [r6, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp314
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_unrolled4.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r6, #-1308]	@ tmp335, start.tv_sec
	sbc	r2, r1, r2	@ seconds_38, tmp333, tmp335
@ /home/student/seng440/filter/butterworth_unrolled4.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r1, r3, r0	@ _44, _44, seconds_38, tmp289
	mla	r1, r0, r2, r1	@ tmp295, tmp289, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled4.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r0, [r6, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled4.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r6, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled4.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	ip, r0, r2	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled4.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp305, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled4.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r0, asr #31	@ nanoseconds_43, tmp305, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled4.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, ip	@ _46, _44, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	movw	r3, #65529	@,
@ /home/student/seng440/filter/butterworth_unrolled4.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r1, r2	@ _46, tmp295, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	movw	r2, #17721	@ tmp323,
	movt	r2, 29255	@ tmp323,
@ /home/student/seng440/filter/butterworth_unrolled4.c:135:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	movt	r3, 16435	@,
@ /home/student/seng440/filter/butterworth_unrolled4.c:135:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	strd	r2, [sp, #8]	@ tmp323,,
@ /home/student/seng440/filter/butterworth_unrolled4.c:135:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp349,
@ /home/student/seng440/filter/butterworth_unrolled4.c:135:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp326,
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled4.c:135:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp349, tmp326
@ /home/student/seng440/filter/butterworth_unrolled4.c:138:     printf(
	mov	r0, r7	@ tmp311, tmp311
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled4.c:150: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1360	@,,
	add	sp, sp, #4	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled4.c:123:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled4.c:124:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled4.c:130:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled4.c:131:         return 1;
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
