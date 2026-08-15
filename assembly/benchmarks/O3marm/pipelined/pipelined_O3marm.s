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
	.file	"butterworth_pipelined.c"
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
	movw	r4, #13636	@ _107,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r4, 12	@ _107,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1344	@,,
@ /home/student/seng440/filter/butterworth_pipelined.c:107:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp178,
@ /home/student/seng440/filter/butterworth_pipelined.c:95: {
	sub	sp, sp, #12	@,,
@ /home/student/seng440/filter/butterworth_pipelined.c:100:     for (int n = 0; n < N; n++) {
	mov	r7, #1	@ n,
	add	r4, sp, r4	@ _107,, _107
@ /home/student/seng440/filter/butterworth_pipelined.c:107:         x[n] = (int)(input * (1 << 14));
	add	r6, sp, #1344	@ tmp293,,
	add	r6, r6, #8	@ tmp293, tmp293,
	mov	r5, r6	@ ivtmp.18, tmp293
@ /home/student/seng440/filter/butterworth_pipelined.c:101:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp183,
@ /home/student/seng440/filter/butterworth_pipelined.c:103:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp185,
@ /home/student/seng440/filter/butterworth_pipelined.c:103:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp187,
@ /home/student/seng440/filter/butterworth_pipelined.c:107:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp189,
@ /home/student/seng440/filter/butterworth_pipelined.c:107:         x[n] = (int)(input * (1 << 14));
	str	r3, [r5, #-1280]!	@ tmp178, x[0]
	mov	r8, r5	@ ivtmp.30, ivtmp.18
.L2:
@ /home/student/seng440/filter/butterworth_pipelined.c:101:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r7	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_pipelined.c:100:     for (int n = 0; n < N; n++) {
	add	r7, r7, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_pipelined.c:101:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _132, n
@ /home/student/seng440/filter/butterworth_pipelined.c:101:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _133, _132, tmp183
@ /home/student/seng440/filter/butterworth_pipelined.c:103:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _133, tmp185
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined.c:103:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp295, tmp187
@ /home/student/seng440/filter/butterworth_pipelined.c:107:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp189
@ /home/student/seng440/filter/butterworth_pipelined.c:107:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp190, _4
	vmov	r3, s0	@ int	@ tmp190, tmp190
	str	r3, [r8, #4]!	@ tmp190, MEM[(int *)_105]
@ /home/student/seng440/filter/butterworth_pipelined.c:100:     for (int n = 0; n < N; n++) {
	cmp	r8, r4	@ ivtmp.30, _107
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_pipelined.c:113:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r6, #1312	@, tmp293,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined.c:113:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r7, r0, #0	@ x1, tmp296
	bne	.L12		@,
@ /home/student/seng440/filter/butterworth_pipelined.c:47:     register int current_input = x[0];
	ldr	r1, [r6, #-1280]	@ current_input, MEM[(const int *)&x]
@ /home/student/seng440/filter/butterworth_pipelined.c:48:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r8, #1105	@ tmp197,
@ /home/student/seng440/filter/butterworth_pipelined.c:71:         register int feedback_y2 = a2 * y2;
	movw	r10, #58773	@ tmp207,
@ /home/student/seng440/filter/butterworth_pipelined.c:41:     register int y2 = 0;
	mov	r9, r7	@ y2, x1
@ /home/student/seng440/filter/butterworth_pipelined.c:71:         register int feedback_y2 = a2 * y2;
	movt	r10, 65535	@ tmp207,
@ /home/student/seng440/filter/butterworth_pipelined.c:40:     register int y1 = 0;
	mov	r0, r7	@ y1, x1
@ /home/student/seng440/filter/butterworth_pipelined.c:48:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r3, r8, r1	@ next_feedforward, tmp197, current_input
@ /home/student/seng440/filter/butterworth_pipelined.c:70:         register int feedback_y1 = a1 * y1;
	movw	fp, #18727	@ tmp205,
	b	.L5		@
.L8:
	mov	r0, r2	@ y1, y
.L5:
@ /home/student/seng440/filter/butterworth_pipelined.c:72:         register int y = ((current_feedforward) + (feedback_y1));
	mla	r2, fp, r0, r3	@ y, tmp205, y1, current_feedforward
@ /home/student/seng440/filter/butterworth_pipelined.c:73:         y = ((y) + (feedback_y2));
	mla	ip, r10, r9, r2	@ y, tmp207, y2, y
@ /home/student/seng440/filter/butterworth_pipelined.c:58:         register int next_input = x[i + 1];
	ldr	lr, [r5, #4]!	@ next_input, MEM[(const int *)_89]
@ /home/student/seng440/filter/butterworth_pipelined.c:60:         register int next_b1_product = (b02_1 << 1) * current_input;
	movw	r3, #2210	@ tmp303,
@ /home/student/seng440/filter/butterworth_pipelined.c:74:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, ip, #0, #14	@ _70, y,,
	mov	r9, r0	@ y2, y1
@ /home/student/seng440/filter/butterworth_pipelined.c:74:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _71, _70,
@ /home/student/seng440/filter/butterworth_pipelined.c:60:         register int next_b1_product = (b02_1 << 1) * current_input;
	mul	r3, r3, r1	@ next_b1_product_57, tmp303, current_input
@ /home/student/seng440/filter/butterworth_pipelined.c:74:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r2, #1	@ _71,
@ /home/student/seng440/filter/butterworth_pipelined.c:52:     for (i = 0; i + 1 < sample_count; i++) {
	cmp	r5, r4	@ ivtmp.18, _107
@ /home/student/seng440/filter/butterworth_pipelined.c:63:         register int next_feedforward = ((next_b0_product) + (next_b1_product));
	mla	r3, r8, lr, r3	@ next_feedforward, tmp197, next_input, next_b1_product_57
@ /home/student/seng440/filter/butterworth_pipelined.c:64:         next_feedforward = ((next_feedforward) + (next_b2_product));
	mla	r3, r8, r7, r3	@ next_feedforward, tmp197, x1, next_feedforward
@ /home/student/seng440/filter/butterworth_pipelined.c:74:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, ip, asr #14	@ y, _71, y,
	mov	r7, r1	@ x1, current_input
	mov	r1, lr	@ current_input, next_input
@ /home/student/seng440/filter/butterworth_pipelined.c:52:     for (i = 0; i + 1 < sample_count; i++) {
	bne	.L8		@,
@ /home/student/seng440/filter/butterworth_pipelined.c:85:     register int y = ((current_feedforward) + (a1 * y1));
	mla	r3, fp, r2, r3	@ y, tmp205, y, next_feedforward
@ /home/student/seng440/filter/butterworth_pipelined.c:86:     y = ((y) + (a2 * y2));
	mla	r3, r10, r0, r3	@ y, tmp207, y1, y
@ /home/student/seng440/filter/butterworth_pipelined.c:120:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r6, #1296	@, tmp293,
	mov	r0, #1	@,
@ /home/student/seng440/filter/butterworth_pipelined.c:87:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _80, y,,
@ /home/student/seng440/filter/butterworth_pipelined.c:87:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _81, _80,
	movne	r2, #1	@ _81,
@ /home/student/seng440/filter/butterworth_pipelined.c:87:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r2, r3, asr #14	@ y, _81, y,
@ /home/student/seng440/filter/butterworth_pipelined.c:118:     volatile int y = run_IIR(x, N);
	str	r3, [r6, #-1316]	@ y, y
@ /home/student/seng440/filter/butterworth_pipelined.c:120:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined.c:120:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp297
	bne	.L13		@,
@ /home/student/seng440/filter/butterworth_pipelined.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r6, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/seng440/filter/butterworth_pipelined.c:136:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13636	@ tmp305,
	movt	r2, 12	@ tmp305,
@ /home/student/seng440/filter/butterworth_pipelined.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp238,
@ /home/student/seng440/filter/butterworth_pipelined.c:136:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp305,, tmp305
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	vldr.64	d17, .L14+32	@ tmp263,
@ /home/student/seng440/filter/butterworth_pipelined.c:136:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp306, x[199999]
@ /home/student/seng440/filter/butterworth_pipelined.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r6, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_pipelined.c:136:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp306
@ /home/student/seng440/filter/butterworth_pipelined.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r6, #-1292]	@ tmp282, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_pipelined.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp238,
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp263
	ldr	r7, .L14+48	@ tmp260,
.LPIC2:
	add	r7, pc, r7	@ tmp260, tmp260
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_pipelined.c:137:         (double)y / (1 << 14)
	ldr	r2, [r6, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp263
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_pipelined.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r6, #-1308]	@ tmp284, start.tv_sec
	sbc	r2, r1, r2	@ seconds_38, tmp282, tmp284
@ /home/student/seng440/filter/butterworth_pipelined.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r1, r3, r0	@ _44, _44, seconds_38, tmp238
	mla	r1, r0, r2, r1	@ tmp244, tmp238, seconds_38, _44
@ /home/student/seng440/filter/butterworth_pipelined.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r0, [r6, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_pipelined.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r6, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_pipelined.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	ip, r0, r2	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_pipelined.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp254, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_pipelined.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r0, asr #31	@ nanoseconds_43, tmp254, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_pipelined.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, ip	@ _46, _44, nanoseconds_43
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	movw	r3, #65529	@,
@ /home/student/seng440/filter/butterworth_pipelined.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r1, r2	@ _46, tmp244, nanoseconds_43
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	movw	r2, #17721	@ tmp272,
	movt	r2, 29255	@ tmp272,
@ /home/student/seng440/filter/butterworth_pipelined.c:126:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	movt	r3, 16435	@,
@ /home/student/seng440/filter/butterworth_pipelined.c:126:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	strd	r2, [sp, #8]	@ tmp272,,
@ /home/student/seng440/filter/butterworth_pipelined.c:126:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp298,
@ /home/student/seng440/filter/butterworth_pipelined.c:126:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp275,
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_pipelined.c:126:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp298, tmp275
@ /home/student/seng440/filter/butterworth_pipelined.c:129:     printf(
	mov	r0, r7	@ tmp260, tmp260
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_pipelined.c:141: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1344	@,,
	add	sp, sp, #12	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_pipelined.c:114:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_pipelined.c:115:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_pipelined.c:121:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined.c:122:         return 1;
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
