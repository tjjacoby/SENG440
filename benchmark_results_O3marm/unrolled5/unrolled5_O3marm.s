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
	@ args = 0, pretend = 0, frame = 800048
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	movw	r7, #13644	@ _423,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r7, 12	@ _423,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1360	@,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:142:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp222,
@ /home/student/seng440/filter/butterworth_unrolled5.c:133: {
	sub	sp, sp, #4	@,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:136:     for (int n = 0; n < N; n++) {
	mov	r5, #1	@ n,
	add	r7, sp, r7	@ _423,, _423
@ /home/student/seng440/filter/butterworth_unrolled5.c:142:         x[n] = (int)(input * (1 << 14));
	add	r10, sp, #1360	@ tmp367,,
	mov	r4, r10	@ ivtmp.22, tmp367
@ /home/student/seng440/filter/butterworth_unrolled5.c:137:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp227,
@ /home/student/seng440/filter/butterworth_unrolled5.c:138:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp229,
@ /home/student/seng440/filter/butterworth_unrolled5.c:138:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp231,
@ /home/student/seng440/filter/butterworth_unrolled5.c:142:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp233,
@ /home/student/seng440/filter/butterworth_unrolled5.c:142:         x[n] = (int)(input * (1 << 14));
	str	r3, [r4, #-1280]!	@ tmp222, x[0]
	mov	r6, r4	@ ivtmp.32, ivtmp.22
.L2:
@ /home/student/seng440/filter/butterworth_unrolled5.c:137:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled5.c:136:     for (int n = 0; n < N; n++) {
	add	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled5.c:137:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _333, n
@ /home/student/seng440/filter/butterworth_unrolled5.c:137:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _334, _333, tmp227
@ /home/student/seng440/filter/butterworth_unrolled5.c:138:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _334, tmp229
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled5.c:138:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp369, tmp231
@ /home/student/seng440/filter/butterworth_unrolled5.c:142:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp233
@ /home/student/seng440/filter/butterworth_unrolled5.c:142:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp234, _4
	vmov	r3, s0	@ int	@ tmp234, tmp234
	str	r3, [r6, #4]!	@ tmp234, MEM[(int *)_421]
@ /home/student/seng440/filter/butterworth_unrolled5.c:136:     for (int n = 0; n < N; n++) {
	cmp	r6, r7	@ ivtmp.32, _423
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled5.c:148:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r10, #1312	@, tmp367,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled5.c:148:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r8, r0, #0	@ x1, tmp370
	bne	.L12		@,
@ /home/student/seng440/filter/butterworth_unrolled5.c:39:         y = ((y) + (a1 * y1));
	str	r10, [sp, #36]	@ tmp367, %sfp
	add	r3, r4, #798720	@ _417, ivtmp.22,
	add	r3, r3, #1280	@ _417, _417,
@ /home/student/seng440/filter/butterworth_unrolled5.c:40:         y = ((y) + (a2 * y2));
	movw	r5, #58773	@ tmp248,
	str	r3, [sp, #32]	@ _417, %sfp
@ /home/student/seng440/filter/butterworth_unrolled5.c:31:     register int y2 = 0;
	mov	ip, r8	@ y2, x1
@ /home/student/seng440/filter/butterworth_unrolled5.c:40:         y = ((y) + (a2 * y2));
	movt	r5, 65535	@ tmp248,
@ /home/student/seng440/filter/butterworth_unrolled5.c:30:     register int y1 = 0;
	mov	r3, r8	@ y1, x1
@ /home/student/seng440/filter/butterworth_unrolled5.c:29:     register int x2 = 0;
	mov	r9, r8	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled5.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r0, #1105	@ tmp240,
@ /home/student/seng440/filter/butterworth_unrolled5.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r7, #2210	@ tmp242,
@ /home/student/seng440/filter/butterworth_unrolled5.c:39:         y = ((y) + (a1 * y1));
	movw	r6, #18727	@ tmp246,
.L5:
@ /home/student/seng440/filter/butterworth_unrolled5.c:36:         register int input0 = x[i];
	ldr	r1, [r4]	@ input0, MEM[(const int *)_410]
@ /home/student/seng440/filter/butterworth_unrolled5.c:34:     for (i = 0; i + 4 < sample_count; i += 5) {
	add	r4, r4, #20	@ ivtmp.22, ivtmp.22,
@ /home/student/seng440/filter/butterworth_unrolled5.c:49:         register int input1 = x[i + 1];
	ldr	r2, [r4, #-16]	@ input1, MEM[(const int *)_410 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled5.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	fp, r0, r1	@ _52, tmp240, input0
@ /home/student/seng440/filter/butterworth_unrolled5.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	lr, r7, r8, fp	@ y, tmp242, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled5.c:38:         y = ((y) + (b02_1 * x2));
	mla	lr, r0, r9, lr	@ y, tmp240, x2, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:39:         y = ((y) + (a1 * y1));
	mla	lr, r6, r3, lr	@ y, tmp246, y1, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:40:         y = ((y) + (a2 * y2));
	mla	ip, r5, ip, lr	@ y, tmp248, y2, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	r10, r0, r2	@ _74, tmp240, input1
@ /home/student/seng440/filter/butterworth_unrolled5.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	lr, ip, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	lr, lr, #0	@ _67, _66,
@ /home/student/seng440/filter/butterworth_unrolled5.c:75:         register int input3 = x[i + 3];
	ldr	r9, [r4, #-8]	@ x2, MEM[(const int *)_410 + 12B]
@ /home/student/seng440/filter/butterworth_unrolled5.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	lr, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled5.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r1, r7, r1, r10	@ y, tmp242, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled5.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	lr, lr, ip, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled5.c:51:         y = ((y) + (b02_1 * x2));
	mla	r1, r0, r8, r1	@ y, tmp240, x1, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:52:         y = ((y) + (a1 * y1));
	mla	r1, r6, lr, r1	@ y, tmp246, y, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:53:         y = ((y) + (a2 * y2));
	mla	r3, r5, r3, r1	@ y, tmp248, y1, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:88:         register int input4 = x[i + 4];
	ldr	r8, [r4, #-4]	@ x1, MEM[(const int *)_410 + 16B]
@ /home/student/seng440/filter/butterworth_unrolled5.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	ip, r3, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	ip, ip, #0	@ _85, _84,
	movne	ip, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled5.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	ip, ip, r3, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled5.c:62:         register int input2 = x[i + 2];
	ldr	r3, [r4, #-12]	@ input2, MEM[(const int *)_410 + 8B]
@ /home/student/seng440/filter/butterworth_unrolled5.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r1, r0, r3	@ _92, tmp240, input2
@ /home/student/seng440/filter/butterworth_unrolled5.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	r2, r7, r2, r1	@ y, tmp242, input1, _92
@ /home/student/seng440/filter/butterworth_unrolled5.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	r3, r7, r3	@ _110, tmp242, input2
@ /home/student/seng440/filter/butterworth_unrolled5.c:64:         y = ((y) + (b02_1 * x2));
	add	r2, fp, r2	@ y, _52, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:65:         y = ((y) + (a1 * y1));
	mla	r2, r6, ip, r2	@ y, tmp246, y, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:66:         y = ((y) + (a2 * y2));
	mla	r2, r5, lr, r2	@ y, tmp248, y, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	r3, r0, r9, r3	@ y, tmp240, x2, _110
@ /home/student/seng440/filter/butterworth_unrolled5.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	lr, r2, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	lr, lr, #0	@ _102, _101,
@ /home/student/seng440/filter/butterworth_unrolled5.c:77:         y = ((y) + (b02_1 * x2));
	add	r3, r10, r3	@ y, _74, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	lr, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled5.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, lr, r2, asr #14	@ y, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled5.c:78:         y = ((y) + (a1 * y1));
	mla	r3, r6, r2, r3	@ y, tmp246, y, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:79:         y = ((y) + (a2 * y2));
	mla	r3, r5, ip, r3	@ y, tmp248, y, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	ip, r3, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	ip, ip, #0	@ _119, _118,
	movne	ip, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled5.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	ip, ip, r3, asr #14	@ y2, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled5.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	r3, r7, r9	@ _127, tmp242, x2
@ /home/student/seng440/filter/butterworth_unrolled5.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mla	r3, r0, r8, r3	@ y, tmp240, x1, _127
@ /home/student/seng440/filter/butterworth_unrolled5.c:90:         y = ((y) + (b02_1 * x2));
	add	r1, r1, r3	@ y, _92, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:91:         y = ((y) + (a1 * y1));
	mla	r1, r6, ip, r1	@ y, tmp246, y2, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:92:         y = ((y) + (a2 * y2));
	mla	r1, r5, r2, r1	@ y, tmp248, y, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:34:     for (i = 0; i + 4 < sample_count; i += 5) {
	ldr	r2, [sp, #32]	@ _417, %sfp
@ /home/student/seng440/filter/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r3, r1, #0, #14	@ _135, y,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r3, r3, #0	@ _136, _135,
	movne	r3, #1	@ _136,
@ /home/student/seng440/filter/butterworth_unrolled5.c:34:     for (i = 0; i + 4 < sample_count; i += 5) {
	cmp	r4, r2	@ ivtmp.22, _417
@ /home/student/seng440/filter/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r3, r1, asr #14	@ y1, _136, y,
@ /home/student/seng440/filter/butterworth_unrolled5.c:34:     for (i = 0; i + 4 < sample_count; i += 5) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled5.c:153:     volatile int y = run_IIR(x, N);
	ldr	r10, [sp, #36]	@ tmp367, %sfp
@ /home/student/seng440/filter/butterworth_unrolled5.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled5.c:153:     volatile int y = run_IIR(x, N);
	str	r3, [r10, #-1316]	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled5.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r10, #1296	@, tmp367,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled5.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp371
	bne	.L13		@,
@ /home/student/seng440/filter/butterworth_unrolled5.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r10, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled5.c:171:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13644	@ tmp394,
	movt	r2, 12	@ tmp394,
@ /home/student/seng440/filter/butterworth_unrolled5.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp312,
@ /home/student/seng440/filter/butterworth_unrolled5.c:171:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp394,, tmp394
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	vldr.64	d17, .L14+32	@ tmp337,
@ /home/student/seng440/filter/butterworth_unrolled5.c:171:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp395, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled5.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r10, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled5.c:171:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp395
@ /home/student/seng440/filter/butterworth_unrolled5.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r0, [r10, #-1292]	@ tmp356, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled5.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp312,
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp337
@ /home/student/seng440/filter/butterworth_unrolled5.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _44, _44, seconds_38, tmp312
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	ldr	r7, .L14+48	@ tmp334,
.LPIC2:
	add	r7, pc, r7	@ tmp334, tmp334
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled5.c:172:         (double)y / (1 << 14)
	ldr	r2, [r10, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp337
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_unrolled5.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r10, #-1308]	@ tmp358, start.tv_sec
	sbc	r2, r0, r2	@ seconds_38, tmp356, tmp358
@ /home/student/seng440/filter/butterworth_unrolled5.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r1, r2, r6	@ tmp318, tmp312, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled5.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r10, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled5.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r10, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled5.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r2	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled5.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp328, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled5.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp328, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled5.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	movw	r3, #65529	@,
@ /home/student/seng440/filter/butterworth_unrolled5.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r6, r2	@ _46, tmp318, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	movw	r2, #17721	@ tmp346,
	movt	r2, 29255	@ tmp346,
@ /home/student/seng440/filter/butterworth_unrolled5.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	movt	r3, 16435	@,
@ /home/student/seng440/filter/butterworth_unrolled5.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	strd	r2, [sp, #8]	@ tmp346,,
@ /home/student/seng440/filter/butterworth_unrolled5.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp372,
@ /home/student/seng440/filter/butterworth_unrolled5.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp349,
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled5.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp372, tmp349
@ /home/student/seng440/filter/butterworth_unrolled5.c:164:     printf(
	mov	r0, r7	@ tmp334, tmp334
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled5.c:176: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1360	@,,
	add	sp, sp, #4	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled5.c:149:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled5.c:150:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled5.c:156:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled5.c:157:         return 1;
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
