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
	.file	"butterworth_unrolled10.c"
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
@ /home/student/seng440/filter/butterworth_unrolled10.c:235:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/seng440/filter/butterworth_unrolled10.c:232: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:241:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp294,
@ /home/student/seng440/filter/butterworth_unrolled10.c:232: {
	subw	sp, sp, #1364	@,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:241:         x[n] = (int)(input * (1 << 14));
	add	r10, sp, #1360	@ tmp494,,
	add	r7, sp, #798720	@ _547,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:236:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp299,
@ /home/student/seng440/filter/butterworth_unrolled10.c:237:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp301,
@ /home/student/seng440/filter/butterworth_unrolled10.c:237:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp303,
@ /home/student/seng440/filter/butterworth_unrolled10.c:241:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp305,
@ /home/student/seng440/filter/butterworth_unrolled10.c:241:         x[n] = (int)(input * (1 << 14));
	sub	r3, r10, #1280	@ tmp293, tmp494,
	addw	r7, r7, #1356	@ _547, _547,
	mov	r4, r3	@ ivtmp.27, tmp293
	add	r8, r3, #798720	@ tmp495, ivtmp.27,
	str	r2, [r3]	@ tmp294, x[0]
	mov	r6, r3	@ ivtmp.37, ivtmp.27
.L2:
@ /home/student/seng440/filter/butterworth_unrolled10.c:236:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled10.c:235:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled10.c:236:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _578, n
@ /home/student/seng440/filter/butterworth_unrolled10.c:236:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _579, _578, tmp299
@ /home/student/seng440/filter/butterworth_unrolled10.c:237:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _579, tmp301
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled10.c:237:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp497, tmp303
@ /home/student/seng440/filter/butterworth_unrolled10.c:241:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp305
@ /home/student/seng440/filter/butterworth_unrolled10.c:241:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp306, _4
	vmov	r3, s0	@ int	@ tmp306, tmp306
	str	r3, [r6, #4]!	@ tmp306, MEM[(int *)_545]
@ /home/student/seng440/filter/butterworth_unrolled10.c:235:     for (int n = 0; n < N; n++) {
	cmp	r6, r7	@ ivtmp.37, _547
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled10.c:247:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r10, #1312	@, tmp494,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled10.c:247:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	mov	r6, r0	@ x1, tmp498
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/seng440/filter/butterworth_unrolled10.c:39:         y = ((y) + (a1 * y1));
	str	r10, [sp, #36]	@ tmp494, %sfp
	add	r3, r8, #1280	@ _541, tmp495,
	str	r3, [sp, #32]	@ _541, %sfp
@ /home/student/seng440/filter/butterworth_unrolled10.c:40:         y = ((y) + (a2 * y2));
	movw	ip, #58773	@ tmp320,
	movt	ip, 65535	@ tmp320,
@ /home/student/seng440/filter/butterworth_unrolled10.c:30:     register int y1 = 0;
	mov	r2, r0	@ y1, x1
@ /home/student/seng440/filter/butterworth_unrolled10.c:29:     register int x2 = 0;
	mov	r7, r0	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled10.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ tmp312,
@ /home/student/seng440/filter/butterworth_unrolled10.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r0, #2210	@ tmp314,
@ /home/student/seng440/filter/butterworth_unrolled10.c:39:         y = ((y) + (a1 * y1));
	movw	lr, #18727	@ tmp318,
	mov	r8, r6	@ y2, y2
.L5:
@ /home/student/seng440/filter/butterworth_unrolled10.c:36:         register int input0 = x[i];
	ldr	r1, [r4]	@ input0, MEM[(const int *)_529]
@ /home/student/seng440/filter/butterworth_unrolled10.c:49:         register int input1 = x[i + 1];
	ldr	fp, [r4, #4]	@ input1, MEM[(const int *)_529 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled10.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	r5, r3, r1	@ _52, tmp312, input0
@ /home/student/seng440/filter/butterworth_unrolled10.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	r9, r0, r6, r5	@ y, tmp314, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled10.c:38:         y = ((y) + (b02_1 * x2));
	mla	r9, r3, r7, r9	@ y, tmp312, x2, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:39:         y = ((y) + (a1 * y1));
	mla	r9, lr, r2, r9	@ y, tmp318, y1, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:40:         y = ((y) + (a2 * y2));
	mla	r9, ip, r8, r9	@ y, tmp320, y2, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	r10, r3, fp	@ _74, tmp312, input1
@ /home/student/seng440/filter/butterworth_unrolled10.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r7, r9, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r7, r7, #0	@ _67, _66,
@ /home/student/seng440/filter/butterworth_unrolled10.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r1, r0, r1, r10	@ y, tmp314, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled10.c:88:         register int input4 = x[i + 4];
	ldr	r8, [r4, #16]	@ input4, MEM[(const int *)_529 + 16B]
@ /home/student/seng440/filter/butterworth_unrolled10.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r7, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled10.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, r7, r9, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:51:         y = ((y) + (b02_1 * x2));
	mla	r1, r3, r6, r1	@ y, tmp312, x1, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:52:         y = ((y) + (a1 * y1));
	mla	r1, lr, r7, r1	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:53:         y = ((y) + (a2 * y2));
	mla	r2, ip, r2, r1	@ y, tmp320, y1, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r6, r2, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r6, r6, #0	@ _85, _84,
	it	ne
	movne	r6, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled10.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r6, r6, r2, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:75:         register int input3 = x[i + 3];
	ldrd	r1, r2, [r4, #8]	@ input2, input3, ivtmp.27,
@ /home/student/seng440/filter/butterworth_unrolled10.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r9, r3, r1	@ _92, tmp312, input2
@ /home/student/seng440/filter/butterworth_unrolled10.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	fp, r0, fp, r9	@ y, tmp314, input1, _92
@ /home/student/seng440/filter/butterworth_unrolled10.c:64:         y = ((y) + (b02_1 * x2));
	add	r5, r5, fp	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:65:         y = ((y) + (a1 * y1));
	mla	r5, lr, r6, r5	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:66:         y = ((y) + (a2 * y2));
	mla	r7, ip, r7, r5	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	r5, r3, r2	@ _109, tmp312, input3
@ /home/student/seng440/filter/butterworth_unrolled10.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	r1, r0, r1, r5	@ y, tmp314, input2, _109
@ /home/student/seng440/filter/butterworth_unrolled10.c:77:         y = ((y) + (b02_1 * x2));
	add	r1, r1, r10	@ y, _74
@ /home/student/seng440/filter/butterworth_unrolled10.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r7, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _102, _101,
	it	ne
	movne	r10, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled10.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, r10, r7, asr #14	@ y, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:78:         y = ((y) + (a1 * y1));
	mla	r1, lr, r7, r1	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	r10, r3, r8	@ _126, tmp312, input4
@ /home/student/seng440/filter/butterworth_unrolled10.c:79:         y = ((y) + (a2 * y2));
	mla	r1, ip, r6, r1	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mla	r2, r0, r2, r10	@ y, tmp314, input3, _126
@ /home/student/seng440/filter/butterworth_unrolled10.c:127:         register int input7 = x[i + 7];
	ldr	r6, [r4, #28]	@ input7, MEM[(const int *)_529 + 28B]
@ /home/student/seng440/filter/butterworth_unrolled10.c:90:         y = ((y) + (b02_1 * x2));
	add	r2, r2, r9	@ y, _92
@ /home/student/seng440/filter/butterworth_unrolled10.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, r1, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _119, _118,
	it	ne
	movne	r9, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled10.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r9, r9, r1, asr #14	@ y, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:91:         y = ((y) + (a1 * y1));
	mla	r2, lr, r9, r2	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:92:         y = ((y) + (a2 * y2));
	mla	r2, ip, r7, r2	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r7, r2, #0, #14	@ _135, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r7, r7, #0	@ _136, _135,
	it	ne
	movne	r7, #1	@ _136,
@ /home/student/seng440/filter/butterworth_unrolled10.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, r7, r2, asr #14	@ y, _136, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:114:         register int input6 = x[i + 6];
	ldrd	r1, r2, [r4, #20]	@ input5, input6, ivtmp.27,
@ /home/student/seng440/filter/butterworth_unrolled10.c:34:     for (i = 0; i + 9 < sample_count; i += 10) {
	adds	r4, r4, #40	@ ivtmp.27, ivtmp.27,
@ /home/student/seng440/filter/butterworth_unrolled10.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mul	fp, r3, r1	@ _143, tmp312, input5
@ /home/student/seng440/filter/butterworth_unrolled10.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mla	r8, r0, r8, fp	@ y, tmp314, input4, _143
@ /home/student/seng440/filter/butterworth_unrolled10.c:103:         y = ((y) + (b02_1 * x2));
	add	r5, r5, r8	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:104:         y = ((y) + (a1 * y1));
	mla	r5, lr, r7, r5	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:105:         y = ((y) + (a2 * y2));
	mla	r9, ip, r9, r5	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mul	r8, r3, r2	@ _160, tmp312, input6
@ /home/student/seng440/filter/butterworth_unrolled10.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r5, r9, #0, #14	@ _152, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r5, r5, #0	@ _153, _152,
@ /home/student/seng440/filter/butterworth_unrolled10.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mla	r1, r0, r1, r8	@ y, tmp314, input5, _160
@ /home/student/seng440/filter/butterworth_unrolled10.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r5, #1	@ _153,
@ /home/student/seng440/filter/butterworth_unrolled10.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r5, r5, r9, asr #14	@ y, _153, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:116:         y = ((y) + (b02_1 * x2));
	add	r1, r1, r10	@ y, _126
@ /home/student/seng440/filter/butterworth_unrolled10.c:117:         y = ((y) + (a1 * y1));
	mla	r1, lr, r5, r1	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:118:         y = ((y) + (a2 * y2));
	mla	r1, ip, r7, r1	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	mul	r9, r3, r6	@ _177, tmp312, input7
@ /home/student/seng440/filter/butterworth_unrolled10.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r7, r1, #0, #14	@ _169, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r7, r7, #0	@ _170, _169,
@ /home/student/seng440/filter/butterworth_unrolled10.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	mla	r2, r0, r2, r9	@ y, tmp314, input6, _177
@ /home/student/seng440/filter/butterworth_unrolled10.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r7, #1	@ _170,
@ /home/student/seng440/filter/butterworth_unrolled10.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r1, r7, r1, asr #14	@ y, _170, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:129:         y = ((y) + (b02_1 * x2));
	add	r2, r2, fp	@ y, _143
@ /home/student/seng440/filter/butterworth_unrolled10.c:130:         y = ((y) + (a1 * y1));
	mla	r2, lr, r1, r2	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:131:         y = ((y) + (a2 * y2));
	mla	r5, ip, r5, r2	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:139:         register int input8 = x[i + 8];
	ldr	r7, [r4, #-8]	@ x2, MEM[(const int *)_529 + 32B]
@ /home/student/seng440/filter/butterworth_unrolled10.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	mul	r6, r0, r6	@ _195, tmp314, input7
@ /home/student/seng440/filter/butterworth_unrolled10.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r5, #0, #14	@ _186, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _187, _186,
@ /home/student/seng440/filter/butterworth_unrolled10.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	mla	r6, r3, r7, r6	@ y, tmp312, x2, _195
@ /home/student/seng440/filter/butterworth_unrolled10.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r2, #1	@ _187,
@ /home/student/seng440/filter/butterworth_unrolled10.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r5, asr #14	@ y, _187, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:141:         y = ((y) + (b02_1 * x2));
	add	r8, r8, r6	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:142:         y = ((y) + (a1 * y1));
	mla	r8, lr, r2, r8	@ y, tmp318, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:143:         y = ((y) + (a2 * y2));
	mla	r1, ip, r1, r8	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:151:         register int input9 = x[i + 9];
	ldr	r6, [r4, #-4]	@ x1, MEM[(const int *)_529 + 36B]
@ /home/student/seng440/filter/butterworth_unrolled10.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r8, r1, #0, #14	@ _203, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r8, r8, #0	@ _204, _203,
	it	ne
	movne	r8, #1	@ _204,
@ /home/student/seng440/filter/butterworth_unrolled10.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r8, r8, r1, asr #14	@ y2, _204, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	mul	r1, r0, r7	@ _212, tmp314, x2
@ /home/student/seng440/filter/butterworth_unrolled10.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	mla	r1, r3, r6, r1	@ y, tmp312, x1, _212
@ /home/student/seng440/filter/butterworth_unrolled10.c:153:         y = ((y) + (b02_1 * x2));
	add	r9, r9, r1	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:154:         y = ((y) + (a1 * y1));
	mla	r9, lr, r8, r9	@ y, tmp318, y2, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:155:         y = ((y) + (a2 * y2));
	mla	r9, ip, r2, r9	@ y, tmp320, y, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:34:     for (i = 0; i + 9 < sample_count; i += 10) {
	ldr	r1, [sp, #32]	@ _541, %sfp
@ /home/student/seng440/filter/butterworth_unrolled10.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r9, #0, #14	@ _220, y,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _221, _220,
	it	ne
	movne	r2, #1	@ _221,
@ /home/student/seng440/filter/butterworth_unrolled10.c:34:     for (i = 0; i + 9 < sample_count; i += 10) {
	cmp	r4, r1	@ ivtmp.27, _541
@ /home/student/seng440/filter/butterworth_unrolled10.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r9, asr #14	@ y1, _221, y,
@ /home/student/seng440/filter/butterworth_unrolled10.c:34:     for (i = 0; i + 9 < sample_count; i += 10) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled10.c:252:     volatile int y = run_IIR(x, N);
	ldr	r10, [sp, #36]	@ tmp494, %sfp
@ /home/student/seng440/filter/butterworth_unrolled10.c:254:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	movs	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled10.c:252:     volatile int y = run_IIR(x, N);
	subw	r6, r10, #1316	@ tmp414, tmp494,
@ /home/student/seng440/filter/butterworth_unrolled10.c:254:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, r10, #1296	@ tmp415, tmp494,
	mov	r1, r4	@, tmp415
@ /home/student/seng440/filter/butterworth_unrolled10.c:252:     volatile int y = run_IIR(x, N);
	str	r2, [r6]	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:254:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled10.c:254:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp499
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/seng440/filter/butterworth_unrolled10.c:271:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/seng440/filter/butterworth_unrolled10.c:270:         (double)x[N - 1] / (1 << 14),
	add	r2, r10, #794624	@ tmp468, tmp494,
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
	vldr.64	d18, .L14+32	@ tmp462,
@ /home/student/seng440/filter/butterworth_unrolled10.c:271:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled10.c:270:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled10.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r10, r10, #1312	@ tmp426, tmp494,
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
	ldr	r7, .L14+56	@ tmp459,
@ /home/student/seng440/filter/butterworth_unrolled10.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp431,
	movt	r0, 15258	@ tmp431,
@ /home/student/seng440/filter/butterworth_unrolled10.c:271:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled10.c:270:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
.LPIC2:
	add	r7, pc	@ tmp459
	vmul.f64	d17, d17, d18	@ _15, _14, tmp462
@ /home/student/seng440/filter/butterworth_unrolled10.c:270:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp462
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled10.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	ldr	r2, [r10]	@ start.tv_sec, start.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled10.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp483, end.tv_nsec, tmp415,
@ /home/student/seng440/filter/butterworth_unrolled10.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r10, #4]	@ tmp485, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled10.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _44, _44, seconds_38, tmp431
@ /home/student/seng440/filter/butterworth_unrolled10.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_38, tmp483, tmp485
@ /home/student/seng440/filter/butterworth_unrolled10.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r10, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled10.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp437, tmp431, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled10.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled10.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp444, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled10.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp444, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled10.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
	adc	r6, r6, r2	@ _46, tmp437, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled10.c:260:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp473,
@ /home/student/seng440/filter/butterworth_unrolled10.c:260:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
	strd	r2, [sp, #8]	@ tmp473,,
@ /home/student/seng440/filter/butterworth_unrolled10.c:260:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp500,
@ /home/student/seng440/filter/butterworth_unrolled10.c:260:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp476,
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled10.c:260:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp500, tmp476
@ /home/student/seng440/filter/butterworth_unrolled10.c:263:     printf(
	mov	r0, r7	@ tmp459, tmp459
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled10.c:275: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled10.c:248:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled10.c:249:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled10.c:255:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled10.c:256:         return 1;
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
