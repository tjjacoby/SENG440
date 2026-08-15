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
	.file	"butterworth_unrolled8.c"
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
@ /home/student/seng440/filter/butterworth_unrolled8.c:162:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/seng440/filter/butterworth_unrolled8.c:159: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:168:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp266,
@ /home/student/seng440/filter/butterworth_unrolled8.c:159: {
	subw	sp, sp, #1364	@,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:168:         x[n] = (int)(input * (1 << 14));
	add	r7, sp, #1360	@ tmp449,,
	add	r8, sp, #798720	@ _451,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:163:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp271,
@ /home/student/seng440/filter/butterworth_unrolled8.c:164:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp273,
@ /home/student/seng440/filter/butterworth_unrolled8.c:164:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp275,
@ /home/student/seng440/filter/butterworth_unrolled8.c:168:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp277,
@ /home/student/seng440/filter/butterworth_unrolled8.c:168:         x[n] = (int)(input * (1 << 14));
	sub	r3, r7, #1280	@ tmp265, tmp449,
	addw	r8, r8, #1356	@ _451, _451,
	mov	r4, r3	@ ivtmp.25, tmp265
	add	r9, r3, #798720	@ tmp448, ivtmp.25,
	str	r2, [r3]	@ tmp266, x[0]
	mov	r6, r3	@ ivtmp.35, ivtmp.25
.L2:
@ /home/student/seng440/filter/butterworth_unrolled8.c:163:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled8.c:162:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled8.c:163:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _480, n
@ /home/student/seng440/filter/butterworth_unrolled8.c:163:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _481, _480, tmp271
@ /home/student/seng440/filter/butterworth_unrolled8.c:164:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _481, tmp273
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled8.c:164:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp451, tmp275
@ /home/student/seng440/filter/butterworth_unrolled8.c:168:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp277
@ /home/student/seng440/filter/butterworth_unrolled8.c:168:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp278, _4
	vmov	r3, s0	@ int	@ tmp278, tmp278
	str	r3, [r6, #4]!	@ tmp278, MEM[(int *)_449]
@ /home/student/seng440/filter/butterworth_unrolled8.c:162:     for (int n = 0; n < N; n++) {
	cmp	r6, r8	@ ivtmp.35, _451
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled8.c:174:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r7, #1312	@, tmp449,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled8.c:174:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	mov	r8, r0	@ x1, tmp452
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/seng440/filter/butterworth_unrolled8.c:39:         y = ((y) + (a1 * y1));
	str	r7, [sp, #36]	@ tmp449, %sfp
	add	r3, r9, #1280	@ _445, tmp448,
	str	r3, [sp, #32]	@ _445, %sfp
@ /home/student/seng440/filter/butterworth_unrolled8.c:40:         y = ((y) + (a2 * y2));
	movw	lr, #58773	@ tmp292,
	movt	lr, 65535	@ tmp292,
@ /home/student/seng440/filter/butterworth_unrolled8.c:31:     register int y2 = 0;
	mov	r2, r0	@ y2, x1
@ /home/student/seng440/filter/butterworth_unrolled8.c:30:     register int y1 = 0;
	mov	r3, r0	@ y1, x1
@ /home/student/seng440/filter/butterworth_unrolled8.c:29:     register int x2 = 0;
	mov	r9, r0	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled8.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r1, #1105	@ tmp284,
@ /home/student/seng440/filter/butterworth_unrolled8.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r5, #2210	@ tmp286,
@ /home/student/seng440/filter/butterworth_unrolled8.c:39:         y = ((y) + (a1 * y1));
	movw	r0, #18727	@ tmp290,
.L5:
@ /home/student/seng440/filter/butterworth_unrolled8.c:36:         register int input0 = x[i];
	ldr	r6, [r4]	@ input0, MEM[(const int *)_435]
@ /home/student/seng440/filter/butterworth_unrolled8.c:49:         register int input1 = x[i + 1];
	ldr	ip, [r4, #4]	@ input1, MEM[(const int *)_435 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled8.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	r7, r1, r6	@ _52, tmp284, input0
@ /home/student/seng440/filter/butterworth_unrolled8.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	r10, r5, r8, r7	@ y, tmp286, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled8.c:38:         y = ((y) + (b02_1 * x2));
	mla	r10, r1, r9, r10	@ y, tmp284, x2, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:39:         y = ((y) + (a1 * y1));
	mla	r10, r0, r3, r10	@ y, tmp290, y1, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:40:         y = ((y) + (a2 * y2));
	mla	r10, lr, r2, r10	@ y, tmp292, y2, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	r9, r1, ip	@ _74, tmp284, input1
@ /home/student/seng440/filter/butterworth_unrolled8.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	fp, r10, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	fp, fp, #0	@ _67, _66,
@ /home/student/seng440/filter/butterworth_unrolled8.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r6, r5, r6, r9	@ y, tmp286, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled8.c:88:         register int input4 = x[i + 4];
	ldr	r2, [r4, #16]	@ input4, MEM[(const int *)_435 + 16B]
@ /home/student/seng440/filter/butterworth_unrolled8.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	fp, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled8.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	fp, fp, r10, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:51:         y = ((y) + (b02_1 * x2));
	mla	r6, r1, r8, r6	@ y, tmp284, x1, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:52:         y = ((y) + (a1 * y1));
	mla	r6, r0, fp, r6	@ y, tmp290, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:53:         y = ((y) + (a2 * y2));
	mla	r3, lr, r3, r6	@ y, tmp292, y1, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r3, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _85, _84,
	it	ne
	movne	r10, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled8.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r3, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:75:         register int input3 = x[i + 3];
	ldrd	r6, r3, [r4, #8]	@ input2, input3, ivtmp.25,
@ /home/student/seng440/filter/butterworth_unrolled8.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r8, r1, r6	@ _92, tmp284, input2
@ /home/student/seng440/filter/butterworth_unrolled8.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	ip, r5, ip, r8	@ y, tmp286, input1, _92
@ /home/student/seng440/filter/butterworth_unrolled8.c:64:         y = ((y) + (b02_1 * x2));
	add	r7, r7, ip	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:65:         y = ((y) + (a1 * y1));
	mla	r7, r0, r10, r7	@ y, tmp290, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:66:         y = ((y) + (a2 * y2));
	mla	r7, lr, fp, r7	@ y, tmp292, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	fp, r1, r3	@ _109, tmp284, input3
@ /home/student/seng440/filter/butterworth_unrolled8.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	ip, r7, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	ip, ip, #0	@ _102, _101,
@ /home/student/seng440/filter/butterworth_unrolled8.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	r6, r5, r6, fp	@ y, tmp286, input2, _109
@ /home/student/seng440/filter/butterworth_unrolled8.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	ip, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled8.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, ip, r7, asr #14	@ y, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:77:         y = ((y) + (b02_1 * x2));
	add	r6, r6, r9	@ y, _74
@ /home/student/seng440/filter/butterworth_unrolled8.c:78:         y = ((y) + (a1 * y1));
	mla	r6, r0, r7, r6	@ y, tmp290, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:79:         y = ((y) + (a2 * y2));
	mla	r6, lr, r10, r6	@ y, tmp292, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	r10, r1, r2	@ _126, tmp284, input4
@ /home/student/seng440/filter/butterworth_unrolled8.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	ip, r6, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	ip, ip, #0	@ _119, _118,
@ /home/student/seng440/filter/butterworth_unrolled8.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mla	r3, r5, r3, r10	@ y, tmp286, input3, _126
@ /home/student/seng440/filter/butterworth_unrolled8.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	ip, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled8.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	ip, ip, r6, asr #14	@ y, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:90:         y = ((y) + (b02_1 * x2));
	add	r3, r3, r8	@ y, _92
@ /home/student/seng440/filter/butterworth_unrolled8.c:91:         y = ((y) + (a1 * y1));
	mla	r3, r0, ip, r3	@ y, tmp290, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:92:         y = ((y) + (a2 * y2));
	mla	r3, lr, r7, r3	@ y, tmp292, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:127:         register int input7 = x[i + 7];
	ldr	r8, [r4, #28]	@ x1, MEM[(const int *)_435 + 28B]
@ /home/student/seng440/filter/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r7, r3, #0, #14	@ _135, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r7, r7, #0	@ _136, _135,
	it	ne
	movne	r7, #1	@ _136,
@ /home/student/seng440/filter/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, r7, r3, asr #14	@ y, _136, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:114:         register int input6 = x[i + 6];
	ldrd	r3, r9, [r4, #20]	@ input5, x2, ivtmp.25,
@ /home/student/seng440/filter/butterworth_unrolled8.c:34:     for (i = 0; i + 7 < sample_count; i += 8) {
	adds	r4, r4, #32	@ ivtmp.25, ivtmp.25,
@ /home/student/seng440/filter/butterworth_unrolled8.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mul	r6, r1, r3	@ _143, tmp284, input5
@ /home/student/seng440/filter/butterworth_unrolled8.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mla	r2, r5, r2, r6	@ y, tmp286, input4, _143
@ /home/student/seng440/filter/butterworth_unrolled8.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mul	r3, r5, r3	@ _161, tmp286, input5
@ /home/student/seng440/filter/butterworth_unrolled8.c:103:         y = ((y) + (b02_1 * x2));
	add	r2, r2, fp	@ y, _109
@ /home/student/seng440/filter/butterworth_unrolled8.c:104:         y = ((y) + (a1 * y1));
	mla	r2, r0, r7, r2	@ y, tmp290, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:105:         y = ((y) + (a2 * y2));
	mla	r2, lr, ip, r2	@ y, tmp292, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mla	r3, r1, r9, r3	@ y, tmp284, x2, _161
@ /home/student/seng440/filter/butterworth_unrolled8.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	ip, r2, #0, #14	@ _152, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	ip, ip, #0	@ _153, _152,
@ /home/student/seng440/filter/butterworth_unrolled8.c:116:         y = ((y) + (b02_1 * x2));
	add	r3, r3, r10	@ y, _126
@ /home/student/seng440/filter/butterworth_unrolled8.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	ip, #1	@ _153,
@ /home/student/seng440/filter/butterworth_unrolled8.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	ip, ip, r2, asr #14	@ y, _153, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:117:         y = ((y) + (a1 * y1));
	mla	r3, r0, ip, r3	@ y, tmp290, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:118:         y = ((y) + (a2 * y2));
	mla	r3, lr, r7, r3	@ y, tmp292, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _169, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _170, _169,
	it	ne
	movne	r2, #1	@ _170,
@ /home/student/seng440/filter/butterworth_unrolled8.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r3, asr #14	@ y2, _170, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	mul	r3, r5, r9	@ _178, tmp286, x2
@ /home/student/seng440/filter/butterworth_unrolled8.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	mla	r3, r1, r8, r3	@ y, tmp284, x1, _178
@ /home/student/seng440/filter/butterworth_unrolled8.c:129:         y = ((y) + (b02_1 * x2));
	add	r6, r6, r3	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:130:         y = ((y) + (a1 * y1));
	mla	r6, r0, r2, r6	@ y, tmp290, y2, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:131:         y = ((y) + (a2 * y2));
	mla	r6, lr, ip, r6	@ y, tmp292, y, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r3, r6, #0, #14	@ _186, y,,
@ /home/student/seng440/filter/butterworth_unrolled8.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r3, r3, #0	@ _187, _186,
	it	ne
	movne	r3, #1	@ _187,
@ /home/student/seng440/filter/butterworth_unrolled8.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r3, r6, asr #14	@ y1, _187, y,
@ /home/student/seng440/filter/butterworth_unrolled8.c:34:     for (i = 0; i + 7 < sample_count; i += 8) {
	ldr	r6, [sp, #32]	@ _445, %sfp
	cmp	r4, r6	@ ivtmp.25, _445
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled8.c:179:     volatile int y = run_IIR(x, N);
	ldr	r7, [sp, #36]	@ tmp449, %sfp
@ /home/student/seng440/filter/butterworth_unrolled8.c:181:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	movs	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled8.c:179:     volatile int y = run_IIR(x, N);
	subw	r6, r7, #1316	@ tmp368, tmp449,
@ /home/student/seng440/filter/butterworth_unrolled8.c:181:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, r7, #1296	@ tmp369, tmp449,
	mov	r1, r4	@, tmp369
@ /home/student/seng440/filter/butterworth_unrolled8.c:179:     volatile int y = run_IIR(x, N);
	str	r3, [r6]	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:181:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled8.c:181:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp453
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/seng440/filter/butterworth_unrolled8.c:198:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/seng440/filter/butterworth_unrolled8.c:197:         (double)x[N - 1] / (1 << 14),
	add	r2, r7, #794624	@ tmp422, tmp449,
@ /home/student/seng440/filter/butterworth_unrolled8.c:190:     printf(
	vldr.64	d18, .L14+32	@ tmp416,
@ /home/student/seng440/filter/butterworth_unrolled8.c:198:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled8.c:197:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled8.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r7, r7, #1312	@ tmp380, tmp449,
@ /home/student/seng440/filter/butterworth_unrolled8.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp385,
	movt	r0, 15258	@ tmp385,
@ /home/student/seng440/filter/butterworth_unrolled8.c:198:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled8.c:197:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled8.c:190:     printf(
	vmul.f64	d17, d17, d18	@ _15, _14, tmp416
@ /home/student/seng440/filter/butterworth_unrolled8.c:197:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled8.c:190:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp416
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled8.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled8.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp437, end.tv_nsec, tmp369,
@ /home/student/seng440/filter/butterworth_unrolled8.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r7, #4]	@ tmp439, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled8.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _44, _44, seconds_38, tmp385
@ /home/student/seng440/filter/butterworth_unrolled8.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_38, tmp437, tmp439
@ /home/student/seng440/filter/butterworth_unrolled8.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r7, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled8.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp391, tmp385, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled8.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled8.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp398, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled8.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp398, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled8.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
	adc	r6, r6, r2	@ _46, tmp391, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled8.c:187:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled8.c:190:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp427,
	ldr	r7, .L14+56	@ tmp413,
@ /home/student/seng440/filter/butterworth_unrolled8.c:187:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled8.c:190:     printf(
	strd	r2, [sp, #8]	@ tmp427,,
.LPIC2:
	add	r7, pc	@ tmp413
@ /home/student/seng440/filter/butterworth_unrolled8.c:187:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp454,
@ /home/student/seng440/filter/butterworth_unrolled8.c:187:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp430,
@ /home/student/seng440/filter/butterworth_unrolled8.c:190:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled8.c:187:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp454, tmp430
@ /home/student/seng440/filter/butterworth_unrolled8.c:190:     printf(
	mov	r0, r7	@ tmp413, tmp413
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled8.c:202: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled8.c:175:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled8.c:176:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled8.c:182:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled8.c:183:         return 1;
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
