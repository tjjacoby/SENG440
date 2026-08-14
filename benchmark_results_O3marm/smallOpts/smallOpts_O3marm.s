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
	.file	"butterworth_smallOpts.c"
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}	@
	movw	r6, #13636	@ _62,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r6, 12	@ _62,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1344	@,,
@ /home/student/seng440/filter/butterworth_smallOpts.c:78:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp168,
@ /home/student/seng440/filter/butterworth_smallOpts.c:66: {
	sub	sp, sp, #8	@,,
@ /home/student/seng440/filter/butterworth_smallOpts.c:71:     for (int n = 0; n < N; n++) {
	mov	r5, #1	@ n,
	add	r6, sp, r6	@ _62,, _62
@ /home/student/seng440/filter/butterworth_smallOpts.c:78:         x[n] = (int)(input * (1 << 14));
	add	r7, sp, #1344	@ tmp275,,
	add	r7, r7, #8	@ tmp275, tmp275,
	mov	r8, r7	@ tmp274, tmp275
@ /home/student/seng440/filter/butterworth_smallOpts.c:72:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp173,
@ /home/student/seng440/filter/butterworth_smallOpts.c:74:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp175,
@ /home/student/seng440/filter/butterworth_smallOpts.c:74:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp177,
@ /home/student/seng440/filter/butterworth_smallOpts.c:78:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp179,
@ /home/student/seng440/filter/butterworth_smallOpts.c:78:         x[n] = (int)(input * (1 << 14));
	str	r3, [r8, #-1280]!	@ tmp168, x[0]
	mov	r4, r8	@ ivtmp.28, tmp274
.L2:
@ /home/student/seng440/filter/butterworth_smallOpts.c:72:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_smallOpts.c:71:     for (int n = 0; n < N; n++) {
	add	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_smallOpts.c:72:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _98, n
@ /home/student/seng440/filter/butterworth_smallOpts.c:72:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _99, _98, tmp173
@ /home/student/seng440/filter/butterworth_smallOpts.c:74:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _99, tmp175
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_smallOpts.c:74:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp277, tmp177
@ /home/student/seng440/filter/butterworth_smallOpts.c:78:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp179
@ /home/student/seng440/filter/butterworth_smallOpts.c:78:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp180, _4
	vmov	r3, s0	@ int	@ tmp180, tmp180
	str	r3, [r4, #4]!	@ tmp180, MEM[(int *)_56]
@ /home/student/seng440/filter/butterworth_smallOpts.c:71:     for (int n = 0; n < N; n++) {
	cmp	r4, r6	@ ivtmp.28, _62
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_smallOpts.c:84:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r7, #1312	@, tmp275,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_smallOpts.c:84:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r2, r0, #0	@ x1, tmp278
	bne	.L12		@,
@ /home/student/seng440/filter/butterworth_smallOpts.c:48:         y = ((y) + (a2 * y2));
	movw	r5, #58773	@ tmp196,
	sub	r1, r8, #4	@ ivtmp.17, tmp274,
	movt	r5, 65535	@ tmp196,
@ /home/student/seng440/filter/butterworth_smallOpts.c:39:     register int y2 = 0;
	mov	r4, r2	@ y2, x1
@ /home/student/seng440/filter/butterworth_smallOpts.c:38:     register int y1 = 0;
	mov	r0, r2	@ y1, x1
@ /home/student/seng440/filter/butterworth_smallOpts.c:37:     register int x2 = 0;
	mov	lr, r2	@ x2, x1
@ /home/student/seng440/filter/butterworth_smallOpts.c:45:         register int y = ((b02_1 * x[i]) + ((b02_1 << 1) * x1));
	movw	ip, #1105	@ tmp188,
@ /home/student/seng440/filter/butterworth_smallOpts.c:45:         register int y = ((b02_1 * x[i]) + ((b02_1 << 1) * x1));
	movw	r9, #2210	@ tmp190,
@ /home/student/seng440/filter/butterworth_smallOpts.c:47:         y = ((y) + (a1 * y1));
	movw	r8, #18727	@ tmp194,
.L5:
@ /home/student/seng440/filter/butterworth_smallOpts.c:45:         register int y = ((b02_1 * x[i]) + ((b02_1 << 1) * x1));
	ldr	r10, [r1, #4]!	@ _51, MEM[(const int *)_7]
@ /home/student/seng440/filter/butterworth_smallOpts.c:45:         register int y = ((b02_1 * x[i]) + ((b02_1 << 1) * x1));
	mul	r3, r9, r2	@ _54, tmp190, x1
@ /home/student/seng440/filter/butterworth_smallOpts.c:45:         register int y = ((b02_1 * x[i]) + ((b02_1 << 1) * x1));
	mla	r3, ip, r10, r3	@ y, tmp188, _51, _54
@ /home/student/seng440/filter/butterworth_smallOpts.c:46:         y = ((y) + (b02_1 * x2));
	mla	r3, ip, lr, r3	@ y, tmp188, x2, y
@ /home/student/seng440/filter/butterworth_smallOpts.c:47:         y = ((y) + (a1 * y1));
	mla	r3, r8, r0, r3	@ y, tmp194, y1, y
@ /home/student/seng440/filter/butterworth_smallOpts.c:48:         y = ((y) + (a2 * y2));
	mla	r3, r5, r4, r3	@ y, tmp196, y2, y
	mov	r4, r0	@ y2, y1
	mov	lr, r2	@ x2, x1
@ /home/student/seng440/filter/butterworth_smallOpts.c:53:          y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments
	ubfx	r0, r3, #0, #14	@ _66, y,,
	mov	r2, r10	@ x1, _51
@ /home/student/seng440/filter/butterworth_smallOpts.c:53:          y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments
	subs	r0, r0, #0	@ _67, _66,
	movne	r0, #1	@ _67,
@ /home/student/seng440/filter/butterworth_smallOpts.c:43:     for (i = 0; i < sample_count; i++) {
	cmp	r6, r1	@ _62, ivtmp.17
@ /home/student/seng440/filter/butterworth_smallOpts.c:53:          y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments
	orr	r3, r0, r3, asr #14	@ y, _67, y,
	mov	r0, r3	@ y1, y
@ /home/student/seng440/filter/butterworth_smallOpts.c:43:     for (i = 0; i < sample_count; i++) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_smallOpts.c:89:     volatile int y = run_IIR(x, N);
	str	r3, [r7, #-1316]	@ y, y
@ /home/student/seng440/filter/butterworth_smallOpts.c:91:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r7, #1296	@, tmp275,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_smallOpts.c:91:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp279
	bne	.L13		@,
@ /home/student/seng440/filter/butterworth_smallOpts.c:27:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/seng440/filter/butterworth_smallOpts.c:107:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13636	@ tmp286,
	movt	r2, 12	@ tmp286,
@ /home/student/seng440/filter/butterworth_smallOpts.c:30:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp219,
@ /home/student/seng440/filter/butterworth_smallOpts.c:107:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp286,, tmp286
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	vldr.64	d17, .L14+32	@ tmp244,
@ /home/student/seng440/filter/butterworth_smallOpts.c:107:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp287, x[199999]
@ /home/student/seng440/filter/butterworth_smallOpts.c:27:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_smallOpts.c:107:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp287
@ /home/student/seng440/filter/butterworth_smallOpts.c:27:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r0, [r7, #-1292]	@ tmp263, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_smallOpts.c:30:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp219,
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp244
@ /home/student/seng440/filter/butterworth_smallOpts.c:30:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _44, _44, seconds_38, tmp219
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_smallOpts.c:108:         (double)y / (1 << 14)
	ldr	r2, [r7, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp244
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_smallOpts.c:27:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7, #-1308]	@ tmp265, start.tv_sec
	sbc	r2, r0, r2	@ seconds_38, tmp263, tmp265
@ /home/student/seng440/filter/butterworth_smallOpts.c:30:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r1, r2, r6	@ tmp225, tmp219, seconds_38, _44
@ /home/student/seng440/filter/butterworth_smallOpts.c:28:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r7, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_smallOpts.c:28:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r7, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	ldr	r7, .L14+48	@ tmp241,
@ /home/student/seng440/filter/butterworth_smallOpts.c:28:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r2	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_smallOpts.c:28:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp235, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_smallOpts.c:28:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp235, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_smallOpts.c:30:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	movw	r3, #65529	@,
@ /home/student/seng440/filter/butterworth_smallOpts.c:30:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r6, r2	@ _46, tmp225, nanoseconds_43
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	movw	r2, #17721	@ tmp253,
	movt	r2, 29255	@ tmp253,
@ /home/student/seng440/filter/butterworth_smallOpts.c:97:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	movt	r3, 16435	@,
@ /home/student/seng440/filter/butterworth_smallOpts.c:97:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	strd	r2, [sp, #8]	@ tmp253,,
.LPIC2:
	add	r7, pc, r7	@ tmp241, tmp241
@ /home/student/seng440/filter/butterworth_smallOpts.c:97:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp280,
@ /home/student/seng440/filter/butterworth_smallOpts.c:97:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp256,
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_smallOpts.c:97:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp280, tmp256
@ /home/student/seng440/filter/butterworth_smallOpts.c:100:     printf(
	mov	r0, r7	@ tmp241, tmp241
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_smallOpts.c:112: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1344	@,,
	add	sp, sp, #8	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_smallOpts.c:85:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_smallOpts.c:86:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_smallOpts.c:92:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_smallOpts.c:93:         return 1;
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
