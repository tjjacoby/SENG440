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
	.file	"butterworth_unrolled.c"
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
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	movs	r4, #1	@ n,
@ /home/student/seng440/filter/butterworth_unrolled.c:98: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp184,
@ /home/student/seng440/filter/butterworth_unrolled.c:98: {
	subw	sp, sp, #1356	@,,
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	add	r8, sp, #1352	@ tmp312,,
	add	r6, sp, #798720	@ _89,,
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp189,
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp191,
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp193,
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp195,
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	sub	r3, r8, #1280	@ tmp183, tmp312,
	addw	r6, r6, #1348	@ _89, _89,
	mov	r7, r3	@ ivtmp.18, tmp183
	add	r9, r3, #798720	@ tmp313, ivtmp.18,
	str	r2, [r3]	@ tmp184, x[0]
	mov	r5, r3	@ ivtmp.30, ivtmp.18
.L2:
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r4	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	adds	r4, r4, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _144, n
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _145, _144, tmp189
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _145, tmp191
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp315, tmp193
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp195
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp196, _4
	vmov	r3, s0	@ int	@ tmp196, tmp196
	str	r3, [r5, #4]!	@ tmp196, MEM[(int *)_59]
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	cmp	r5, r6	@ ivtmp.30, _89
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:116:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r8, #1312	@, tmp312,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:116:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ current_input
	bne	.L12	@
@ /home/student/seng440/filter/butterworth_unrolled.c:47:         y = ((y) + (a2 * y2));
	movw	r5, #58773	@ tmp211,
	add	lr, r9, #1280	@ _18, tmp313,
	movt	r5, 65535	@ tmp211,
@ /home/student/seng440/filter/butterworth_unrolled.c:36:     register int y2 = 0;
	mov	r2, r0	@ y2, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:35:     register int y1 = 0;
	mov	r9, r0	@ y1, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:33:     register int x1 = 0;
	mov	r4, r0	@ next_input, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r1, #1105	@ tmp203,
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	ip, #2210	@ tmp205,
@ /home/student/seng440/filter/butterworth_unrolled.c:46:         y = ((y) + (a1 * y1));
	movw	r6, #18727	@ tmp209,
.L5:
	mov	fp, r0	@ x2, current_input
	mov	r10, r4	@ x1, next_input
@ /home/student/seng440/filter/butterworth_unrolled.c:42:         register int current_input = x[i];
	ldr	r0, [r7]	@ current_input, MEM[(const int *)_3]
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	adds	r7, r7, #8	@ ivtmp.18, ivtmp.18,
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r3, ip, r4	@ _54, tmp205, next_input
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r3, r1, r0, r3	@ y, tmp203, current_input, _54
@ /home/student/seng440/filter/butterworth_unrolled.c:45:         y = ((y) + (b02_1 * x2));
	mla	r3, r1, fp, r3	@ y, tmp203, x2, y
@ /home/student/seng440/filter/butterworth_unrolled.c:46:         y = ((y) + (a1 * y1));
	mla	r3, r6, r9, r3	@ y, tmp209, y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:47:         y = ((y) + (a2 * y2));
	mla	r3, r5, r2, r3	@ y, tmp211, y2, y
@ /home/student/seng440/filter/butterworth_unrolled.c:58:         register int next_input = x[i + 1];
	ldr	r4, [r7, #-4]	@ next_input, MEM[(const int *)_3 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _67, _66,
	it	ne
	movne	r2, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r3, asr #14	@ y2, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	mul	r3, ip, r0	@ _75, tmp205, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	mla	r3, r1, r4, r3	@ y, tmp203, next_input, _75
@ /home/student/seng440/filter/butterworth_unrolled.c:61:         y = ((y) + (b02_1 * x2));
	mla	r3, r1, r10, r3	@ y, tmp203, x1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:62:         y = ((y) + (a1 * y1));
	mla	r3, r6, r2, r3	@ y, tmp209, y2, y
@ /home/student/seng440/filter/butterworth_unrolled.c:63:         y = ((y) + (a2 * y2));
	mla	r3, r5, r9, r3	@ y, tmp211, y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, r3, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _85, _84,
	it	ne
	movne	r9, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	cmp	lr, r7	@ _18, ivtmp.18
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r9, r9, r3, asr #14	@ y1, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:121:     volatile int y = run_IIR(x, N);
	subw	r6, r8, #1316	@ tmp232, tmp312,
@ /home/student/seng440/filter/butterworth_unrolled.c:123:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, r8, #1296	@ tmp233, tmp312,
	mov	r1, r4	@, tmp233
	movs	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled.c:121:     volatile int y = run_IIR(x, N);
	str	r9, [r6]	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:123:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:123:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp317
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/seng440/filter/butterworth_unrolled.c:140:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	add	r2, r8, #794624	@ tmp286, tmp312,
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	vldr.64	d18, .L14+32	@ tmp280,
@ /home/student/seng440/filter/butterworth_unrolled.c:140:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r8, r8, #1312	@ tmp244, tmp312,
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	ldr	r7, .L14+56	@ tmp277,
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp249,
	movt	r0, 15258	@ tmp249,
@ /home/student/seng440/filter/butterworth_unrolled.c:140:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
.LPIC2:
	add	r7, pc	@ tmp277
	vmul.f64	d17, d17, d18	@ _15, _14, tmp280
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp280
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	ldr	r2, [r8]	@ start.tv_sec, start.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp301, end.tv_nsec, tmp233,
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r8, #4]	@ tmp303, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _44, _44, seconds_38, tmp249
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_38, tmp301, tmp303
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r8, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp255, tmp249, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp262, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp262, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
	adc	r6, r6, r2	@ _46, tmp255, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp291,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	strd	r2, [sp, #8]	@ tmp291,,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp318,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp294,
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp318, tmp294
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	mov	r0, r7	@ tmp277, tmp277
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled.c:144: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1356	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled.c:117:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled.c:118:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled.c:124:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:125:         return 1;
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
