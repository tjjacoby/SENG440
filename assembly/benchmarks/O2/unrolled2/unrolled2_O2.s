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
	.file	"butterworth_pipelined2.c"
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
@ /home/student/seng440/filter/butterworth_pipelined2.c:107:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/seng440/filter/butterworth_pipelined2.c:104: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp206,
@ /home/student/seng440/filter/butterworth_pipelined2.c:104: {
	subw	sp, sp, #1364	@,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	add	r10, sp, #1360	@ tmp361,,
	add	r7, sp, #798720	@ _164,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:108:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp211,
@ /home/student/seng440/filter/butterworth_pipelined2.c:109:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp213,
@ /home/student/seng440/filter/butterworth_pipelined2.c:109:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp215,
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp217,
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	sub	r3, r10, #1280	@ tmp205, tmp361,
	addw	r7, r7, #1356	@ _164, _164,
	mov	r4, r3	@ ivtmp.20, tmp205
	add	fp, r3, #798720	@ tmp362, ivtmp.20,
	str	r2, [r3]	@ tmp206, x[0]
	mov	r6, r3	@ ivtmp.32, ivtmp.20
.L2:
@ /home/student/seng440/filter/butterworth_pipelined2.c:108:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_pipelined2.c:107:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_pipelined2.c:108:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _220, n
@ /home/student/seng440/filter/butterworth_pipelined2.c:108:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _221, _220, tmp211
@ /home/student/seng440/filter/butterworth_pipelined2.c:109:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _221, tmp213
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:109:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp364, tmp215
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp217
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp218, _4
	vmov	r3, s0	@ int	@ tmp218, tmp218
	str	r3, [r6, #4]!	@ tmp218, MEM[(int *)_162]
@ /home/student/seng440/filter/butterworth_pipelined2.c:107:     for (int n = 0; n < N; n++) {
	cmp	r6, r7	@ ivtmp.32, _164
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:119:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r10, #1312	@, tmp361,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:119:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ next_input
	bne	.L12	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:49:             register int y = ((current_feedforward) + (a1 * y1));
	str	r10, [sp, #36]	@ tmp361, %sfp
@ /home/student/seng440/filter/butterworth_pipelined2.c:37:     register int current_input = x[0];
	sub	r3, r10, #1280	@ tmp226, tmp361,
@ /home/student/seng440/filter/butterworth_pipelined2.c:38:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	lr, #1105	@ tmp227,
@ /home/student/seng440/filter/butterworth_pipelined2.c:50:             y = ((y) + (a2 * y2));
	movw	r6, #58773	@ tmp235,
@ /home/student/seng440/filter/butterworth_pipelined2.c:37:     register int current_input = x[0];
	ldr	r3, [r3]	@ next_input, MEM[(const int *)&x]
	add	fp, fp, #1272	@ _157, tmp362,
@ /home/student/seng440/filter/butterworth_pipelined2.c:50:             y = ((y) + (a2 * y2));
	movt	r6, 65535	@ tmp235,
@ /home/student/seng440/filter/butterworth_pipelined2.c:34:     register int y2 = 0;
	mov	ip, r0	@ y2, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:38:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r2, lr, r3	@ current_feedforward, tmp227, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:33:     register int y1 = 0;
	mov	r1, r0	@ y1, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:46:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	movw	r8, #2210	@ tmp231,
@ /home/student/seng440/filter/butterworth_pipelined2.c:49:             register int y = ((current_feedforward) + (a1 * y1));
	movw	r7, #18727	@ tmp233,
.L5:
@ /home/student/seng440/filter/butterworth_pipelined2.c:49:             register int y = ((current_feedforward) + (a1 * y1));
	mla	r2, r7, r1, r2	@ y, tmp233, y1, current_feedforward
@ /home/student/seng440/filter/butterworth_pipelined2.c:50:             y = ((y) + (a2 * y2));
	mla	r2, r6, ip, r2	@ y, tmp235, y2, y
	mov	r10, r0	@ x1, next_input
	mov	r9, r3	@ current_input, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:45:             register int next_input = x[i + 1];
	ldr	r0, [r4, #4]	@ next_input, MEM[(const int *)_154 + 4B]
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	ip, r2, #0, #14	@ _70, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	ip, ip, #0	@ _71, _70,
@ /home/student/seng440/filter/butterworth_pipelined2.c:46:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mul	r5, lr, r0	@ _55, tmp227, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	ip, #1	@ _71,
@ /home/student/seng440/filter/butterworth_pipelined2.c:46:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mla	r3, r8, r3, r5	@ next_feedforward, tmp231, next_input, _55
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	ip, ip, r2, asr #14	@ y2, _71, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:47:             next_feedforward = ((next_feedforward) + (b02_1 * x1));
	mla	r3, lr, r10, r3	@ next_feedforward_61, tmp227, x1, next_feedforward
@ /home/student/seng440/filter/butterworth_pipelined2.c:66:             register int y = ((current_feedforward) + (a1 * y1));
	mla	r3, r7, ip, r3	@ y, tmp233, y2, next_feedforward_61
@ /home/student/seng440/filter/butterworth_pipelined2.c:67:             y = ((y) + (a2 * y2));
	mla	r3, r6, r1, r3	@ y, tmp235, y1, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:63:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mul	r2, r8, r0	@ _79, tmp231, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:68:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r1, r3, #0, #14	@ _88, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:68:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r1, r1, #0	@ _89, _88,
	it	ne
	movne	r1, #1	@ _89,
@ /home/student/seng440/filter/butterworth_pipelined2.c:68:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r1, r1, r3, asr #14	@ y1, _89, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:62:             register int next_input = x[i + 2];
	ldr	r3, [r4, #8]!	@ next_input, MEM[(const int *)_154 + 8B]
@ /home/student/seng440/filter/butterworth_pipelined2.c:42:     for (i = 0; i + 2 < sample_count; i += 2) {
	cmp	r4, fp	@ ivtmp.20, _157
@ /home/student/seng440/filter/butterworth_pipelined2.c:63:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mla	r2, lr, r3, r2	@ next_feedforward, tmp227, next_input, _79
@ /home/student/seng440/filter/butterworth_pipelined2.c:64:             next_feedforward = ((next_feedforward) + (b02_1 * x1));
	mla	r2, lr, r9, r2	@ current_feedforward, tmp227, current_input, next_feedforward
@ /home/student/seng440/filter/butterworth_pipelined2.c:42:     for (i = 0; i + 2 < sample_count; i += 2) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:81:         register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	ldr	r10, [sp, #36]	@ tmp361, %sfp
@ /home/student/seng440/filter/butterworth_pipelined2.c:84:         register int y = ((current_feedforward) + (a1 * y1));
	mla	r2, r7, r1, r2	@ y, tmp233, y1, current_feedforward
@ /home/student/seng440/filter/butterworth_pipelined2.c:80:         register int next_input = x[i + 1];
	add	r0, r10, #794624	@ tmp262, tmp361,
@ /home/student/seng440/filter/butterworth_pipelined2.c:85:         y = ((y) + (a2 * y2));
	mla	r2, r6, ip, r2	@ y, tmp235, y2, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:80:         register int next_input = x[i + 1];
	ldr	r4, [r0, #4092]	@ next_input, MEM[(const int *)&x + 799996B]
@ /home/student/seng440/filter/butterworth_pipelined2.c:81:         register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mul	r3, r8, r3	@ _140, tmp231, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r0, r2, #0, #14	@ _149, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r0, r0, #0	@ _150, _149,
@ /home/student/seng440/filter/butterworth_pipelined2.c:81:         register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mla	r3, lr, r4, r3	@ next_feedforward, tmp227, next_input, _140
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r0, #1	@ _150,
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r0, r2, asr #14	@ y_152, _150, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	movs	r0, #1	@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:82:         next_feedforward = ((next_feedforward) + (b02_1 * x1));
	add	r3, r3, r5	@ next_feedforward_143, _55
@ /home/student/seng440/filter/butterworth_pipelined2.c:96:     register int y = ((current_feedforward) + (a1 * y1));
	mla	r3, r7, r2, r3	@ y, tmp233, y_152, next_feedforward_143
@ /home/student/seng440/filter/butterworth_pipelined2.c:97:     y = ((y) + (a2 * y2));
	mla	r3, r6, r1, r3	@ y, tmp235, y1, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:124:     volatile int y = run_IIR(x, N);
	subw	r7, r10, #1316	@ tmp288, tmp361,
@ /home/student/seng440/filter/butterworth_pipelined2.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r6, r10, #1296	@ tmp289, tmp361,
@ /home/student/seng440/filter/butterworth_pipelined2.c:98:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _124, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r1, r6	@, tmp289
@ /home/student/seng440/filter/butterworth_pipelined2.c:98:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _125, _124,
	it	ne
	movne	r2, #1	@ _125,
@ /home/student/seng440/filter/butterworth_pipelined2.c:98:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r2, r3, asr #14	@ y, _125, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:124:     volatile int y = run_IIR(x, N);
	str	r3, [r7]	@ y, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp366
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:142:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r4	@ int	@ next_input, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:143:         (double)y / (1 << 14)
	ldr	r3, [r7]	@ y.0_13, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r10, r10, #1312	@ tmp300, tmp361,
@ /home/student/seng440/filter/butterworth_pipelined2.c:135:     printf(
	vldr.64	d18, .L14+32	@ tmp336,
	ldr	r7, .L14+56	@ tmp333,
@ /home/student/seng440/filter/butterworth_pipelined2.c:142:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:143:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/seng440/filter/butterworth_pipelined2.c:135:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp340,
.LPIC2:
	add	r7, pc	@ tmp333
	vmul.f64	d16, d16, d18	@ _12, _11, tmp336
@ /home/student/seng440/filter/butterworth_pipelined2.c:143:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_pipelined2.c:135:     printf(
	strd	r2, [sp, #8]	@ tmp340,,
	vmul.f64	d17, d17, d18	@ _15, _14, tmp336
	vstr.64	d16, [sp, #16]	@ _12,
	vstr.64	d17, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_pipelined2.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldrd	r3, r4, [r6]	@ end.tv_sec, tmp350, tmp289
	ldr	r1, [r10]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r6, #8]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_pipelined2.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r3, r3, r1	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_pipelined2.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp305,
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r6, r0, [r10, #4]	@ tmp352, start.tv_nsec, tmp300,
@ /home/student/seng440/filter/butterworth_pipelined2.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp305,
@ /home/student/seng440/filter/butterworth_pipelined2.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r4, r6	@ seconds_38, tmp350, tmp352
@ /home/student/seng440/filter/butterworth_pipelined2.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _44, _44, seconds_38, tmp305
	mla	r6, r1, r4, r6	@ tmp311, tmp305, seconds_38, _44
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r1, r2, r0	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp318, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r0, asr #31	@ nanoseconds_43, tmp318, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_pipelined2.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r1	@ _46, _44, nanoseconds_43
	adc	r6, r6, r2	@ _46, tmp311, nanoseconds_43
@ /home/student/seng440/filter/butterworth_pipelined2.c:132:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
	mov	r1, r6	@, _46
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp367,
@ /home/student/seng440/filter/butterworth_pipelined2.c:132:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp343,
@ /home/student/seng440/filter/butterworth_pipelined2.c:135:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_pipelined2.c:132:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp367, tmp343
@ /home/student/seng440/filter/butterworth_pipelined2.c:135:     printf(
	mov	r0, r7	@ tmp333, tmp333
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_pipelined2.c:147: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_pipelined2.c:120:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_pipelined2.c:121:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_pipelined2.c:127:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:128:         return 1;
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
