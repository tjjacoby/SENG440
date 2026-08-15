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
	.file	"butterworth_unrolled20.c"
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
@ /home/student/seng440/filter/butterworth_unrolled20.c:311:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/seng440/filter/butterworth_unrolled20.c:308: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp434,
@ /home/student/seng440/filter/butterworth_unrolled20.c:308: {
	subw	sp, sp, #1364	@,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	add	r7, sp, #1360	@ tmp724,,
	add	r8, sp, #798720	@ _1027,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:312:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp439,
@ /home/student/seng440/filter/butterworth_unrolled20.c:313:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp441,
@ /home/student/seng440/filter/butterworth_unrolled20.c:313:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp443,
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp445,
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	sub	r3, r7, #1280	@ tmp433, tmp724,
	addw	r8, r8, #1356	@ _1027, _1027,
	mov	r4, r3	@ ivtmp.37, tmp433
	add	r9, r3, #798720	@ tmp725, ivtmp.37,
	str	r2, [r3]	@ tmp434, x[0]
	mov	r6, r3	@ ivtmp.47, ivtmp.37
.L2:
@ /home/student/seng440/filter/butterworth_unrolled20.c:312:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled20.c:311:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled20.c:312:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _1068, n
@ /home/student/seng440/filter/butterworth_unrolled20.c:312:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _1069, _1068, tmp439
@ /home/student/seng440/filter/butterworth_unrolled20.c:313:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _1069, tmp441
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:313:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp727, tmp443
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp445
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp446, _4
	vmov	r3, s0	@ int	@ tmp446, tmp446
	str	r3, [r6, #4]!	@ tmp446, MEM[(int *)_1025]
@ /home/student/seng440/filter/butterworth_unrolled20.c:311:     for (int n = 0; n < N; n++) {
	cmp	r6, r8	@ ivtmp.47, _1027
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled20.c:323:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r7, #1312	@, tmp724,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:323:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	mov	r8, r0	@ x1, tmp728
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:39:         y = ((y) + (a1 * y1));
	str	r7, [sp, #36]	@ tmp724, %sfp
	add	r3, r9, #1280	@ _1021, tmp725,
	str	r3, [sp, #32]	@ _1021, %sfp
@ /home/student/seng440/filter/butterworth_unrolled20.c:40:         y = ((y) + (a2 * y2));
	movw	r2, #58773	@ tmp460,
	movt	r2, 65535	@ tmp460,
@ /home/student/seng440/filter/butterworth_unrolled20.c:31:     register int y2 = 0;
	mov	r5, r0	@ y2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:29:     register int x2 = 0;
	mov	r9, r0	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ tmp452,
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	ip, #2210	@ tmp454,
@ /home/student/seng440/filter/butterworth_unrolled20.c:39:         y = ((y) + (a1 * y1));
	movw	r1, #18727	@ tmp458,
.L5:
@ /home/student/seng440/filter/butterworth_unrolled20.c:36:         register int input0 = x[i];
	ldr	r7, [r4]	@ input0, MEM[(const int *)_999]
@ /home/student/seng440/filter/butterworth_unrolled20.c:49:         register int input1 = x[i + 1];
	ldr	lr, [r4, #4]	@ input1, MEM[(const int *)_999 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	r6, r3, r7	@ _52, tmp452, input0
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	r10, ip, r8, r6	@ y, tmp454, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled20.c:38:         y = ((y) + (b02_1 * x2));
	mla	r10, r3, r9, r10	@ y, tmp452, x2, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:39:         y = ((y) + (a1 * y1));
	mla	r10, r1, r0, r10	@ y, tmp458, y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:40:         y = ((y) + (a2 * y2));
	mla	r10, r2, r5, r10	@ y, tmp460, y2, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	r9, r3, lr	@ _74, tmp452, input1
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	fp, r10, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	fp, fp, #0	@ _67, _66,
@ /home/student/seng440/filter/butterworth_unrolled20.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r7, ip, r7, r9	@ y, tmp454, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	fp, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	fp, fp, r10, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:51:         y = ((y) + (b02_1 * x2));
	mla	r7, r3, r8, r7	@ y, tmp452, x1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:52:         y = ((y) + (a1 * y1));
	mla	r7, r1, fp, r7	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:53:         y = ((y) + (a2 * y2));
	mla	r0, r2, r0, r7	@ y, tmp460, y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:88:         register int input4 = x[i + 4];
	ldr	r7, [r4, #16]	@ input4, MEM[(const int *)_999 + 16B]
@ /home/student/seng440/filter/butterworth_unrolled20.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r0, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _85, _84,
	it	ne
	movne	r10, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled20.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r0, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:75:         register int input3 = x[i + 3];
	ldrd	r5, r0, [r4, #8]	@ input2, input3, ivtmp.37,
@ /home/student/seng440/filter/butterworth_unrolled20.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r8, r3, r5	@ _92, tmp452, input2
@ /home/student/seng440/filter/butterworth_unrolled20.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	lr, ip, lr, r8	@ y, tmp454, input1, _92
@ /home/student/seng440/filter/butterworth_unrolled20.c:64:         y = ((y) + (b02_1 * x2));
	add	lr, lr, r6	@ y, _52
@ /home/student/seng440/filter/butterworth_unrolled20.c:65:         y = ((y) + (a1 * y1));
	mla	lr, r1, r10, lr	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	r6, r3, r0	@ _109, tmp452, input3
@ /home/student/seng440/filter/butterworth_unrolled20.c:66:         y = ((y) + (a2 * y2));
	mla	lr, r2, fp, lr	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	r5, ip, r5, r6	@ y, tmp454, input2, _109
@ /home/student/seng440/filter/butterworth_unrolled20.c:77:         y = ((y) + (b02_1 * x2));
	add	r5, r5, r9	@ y, _74
@ /home/student/seng440/filter/butterworth_unrolled20.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, lr, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _102, _101,
	it	ne
	movne	r9, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled20.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	lr, r9, lr, asr #14	@ y, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:78:         y = ((y) + (a1 * y1));
	mla	r5, r1, lr, r5	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:79:         y = ((y) + (a2 * y2));
	mla	r5, r2, r10, r5	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	r9, r3, r7	@ _126, tmp452, input4
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	fp, r5, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	fp, fp, #0	@ _119, _118,
@ /home/student/seng440/filter/butterworth_unrolled20.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mla	r0, ip, r0, r9	@ y, tmp454, input3, _126
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	fp, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	fp, fp, r5, asr #14	@ y, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:90:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r8	@ y, _92
@ /home/student/seng440/filter/butterworth_unrolled20.c:91:         y = ((y) + (a1 * y1));
	mla	r0, r1, fp, r0	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:92:         y = ((y) + (a2 * y2));
	mla	r0, r2, lr, r0	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:127:         register int input7 = x[i + 7];
	ldr	lr, [r4, #28]	@ input7, MEM[(const int *)_999 + 28B]
@ /home/student/seng440/filter/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r0, #0, #14	@ _135, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _136, _135,
	it	ne
	movne	r10, #1	@ _136,
@ /home/student/seng440/filter/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r0, asr #14	@ y, _136, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:114:         register int input6 = x[i + 6];
	ldrd	r5, r0, [r4, #20]	@ input5, input6, ivtmp.37,
@ /home/student/seng440/filter/butterworth_unrolled20.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mul	r8, r3, r5	@ _143, tmp452, input5
@ /home/student/seng440/filter/butterworth_unrolled20.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mla	r7, ip, r7, r8	@ y, tmp454, input4, _143
@ /home/student/seng440/filter/butterworth_unrolled20.c:103:         y = ((y) + (b02_1 * x2));
	add	r7, r7, r6	@ y, _109
@ /home/student/seng440/filter/butterworth_unrolled20.c:104:         y = ((y) + (a1 * y1));
	mla	r7, r1, r10, r7	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mul	r6, r3, r0	@ _160, tmp452, input6
@ /home/student/seng440/filter/butterworth_unrolled20.c:105:         y = ((y) + (a2 * y2));
	mla	r7, r2, fp, r7	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mla	r5, ip, r5, r6	@ y, tmp454, input5, _160
@ /home/student/seng440/filter/butterworth_unrolled20.c:116:         y = ((y) + (b02_1 * x2));
	add	r5, r5, r9	@ y, _126
@ /home/student/seng440/filter/butterworth_unrolled20.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, r7, #0, #14	@ _152, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _153, _152,
	it	ne
	movne	r9, #1	@ _153,
@ /home/student/seng440/filter/butterworth_unrolled20.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, r9, r7, asr #14	@ y, _153, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:117:         y = ((y) + (a1 * y1));
	mla	r5, r1, r7, r5	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:118:         y = ((y) + (a2 * y2));
	mla	r5, r2, r10, r5	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	mul	r9, r3, lr	@ _177, tmp452, input7
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	fp, r5, #0, #14	@ _169, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	fp, fp, #0	@ _170, _169,
@ /home/student/seng440/filter/butterworth_unrolled20.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	mla	r0, ip, r0, r9	@ y, tmp454, input6, _177
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	fp, #1	@ _170,
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	fp, fp, r5, asr #14	@ y, _170, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:129:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r8	@ y, _143
@ /home/student/seng440/filter/butterworth_unrolled20.c:130:         y = ((y) + (a1 * y1));
	mla	r0, r1, fp, r0	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:131:         y = ((y) + (a2 * y2));
	mla	r0, r2, r7, r0	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:164:         register int input10 = x[i + 10];
	ldr	r7, [r4, #40]	@ input10, MEM[(const int *)_999 + 40B]
@ /home/student/seng440/filter/butterworth_unrolled20.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r0, #0, #14	@ _186, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _187, _186,
	it	ne
	movne	r10, #1	@ _187,
@ /home/student/seng440/filter/butterworth_unrolled20.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r0, asr #14	@ y, _187, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:151:         register int input9 = x[i + 9];
	ldrd	r5, r0, [r4, #32]	@ input8, input9, ivtmp.37,
@ /home/student/seng440/filter/butterworth_unrolled20.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	mul	r8, r3, r5	@ _194, tmp452, input8
@ /home/student/seng440/filter/butterworth_unrolled20.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	mla	lr, ip, lr, r8	@ y, tmp454, input7, _194
@ /home/student/seng440/filter/butterworth_unrolled20.c:141:         y = ((y) + (b02_1 * x2));
	add	lr, lr, r6	@ y, _160
@ /home/student/seng440/filter/butterworth_unrolled20.c:142:         y = ((y) + (a1 * y1));
	mla	lr, r1, r10, lr	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	mul	r6, r3, r0	@ _211, tmp452, input9
@ /home/student/seng440/filter/butterworth_unrolled20.c:143:         y = ((y) + (a2 * y2));
	mla	lr, r2, fp, lr	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	mla	r5, ip, r5, r6	@ y, tmp454, input8, _211
@ /home/student/seng440/filter/butterworth_unrolled20.c:153:         y = ((y) + (b02_1 * x2));
	add	r5, r5, r9	@ y, _177
@ /home/student/seng440/filter/butterworth_unrolled20.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, lr, #0, #14	@ _203, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _204, _203,
	it	ne
	movne	r9, #1	@ _204,
@ /home/student/seng440/filter/butterworth_unrolled20.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	lr, r9, lr, asr #14	@ y, _204, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:154:         y = ((y) + (a1 * y1));
	mla	r5, r1, lr, r5	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:155:         y = ((y) + (a2 * y2));
	mla	r5, r2, r10, r5	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:165:         y = ((b02_1 * input10) + ((b02_1 << 1) * x1));
	mul	r9, r3, r7	@ _228, tmp452, input10
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	fp, r5, #0, #14	@ _220, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	fp, fp, #0	@ _221, _220,
@ /home/student/seng440/filter/butterworth_unrolled20.c:165:         y = ((b02_1 * input10) + ((b02_1 << 1) * x1));
	mla	r0, ip, r0, r9	@ y, tmp454, input9, _228
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	fp, #1	@ _221,
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	fp, fp, r5, asr #14	@ y, _221, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:166:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r8	@ y, _194
@ /home/student/seng440/filter/butterworth_unrolled20.c:167:         y = ((y) + (a1 * y1));
	mla	r0, r1, fp, r0	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:168:         y = ((y) + (a2 * y2));
	mla	r0, r2, lr, r0	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:200:         register int input13 = x[i + 13];
	ldr	lr, [r4, #52]	@ input13, MEM[(const int *)_999 + 52B]
@ /home/student/seng440/filter/butterworth_unrolled20.c:169:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r0, #0, #14	@ _237, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:169:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _238, _237,
	it	ne
	movne	r10, #1	@ _238,
@ /home/student/seng440/filter/butterworth_unrolled20.c:169:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r0, asr #14	@ y, _238, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:188:         register int input12 = x[i + 12];
	ldrd	r5, r0, [r4, #44]	@ input11, input12, ivtmp.37,
@ /home/student/seng440/filter/butterworth_unrolled20.c:177:         y = ((b02_1 * input11) + ((b02_1 << 1) * x1));
	mul	r8, r3, r5	@ _245, tmp452, input11
@ /home/student/seng440/filter/butterworth_unrolled20.c:177:         y = ((b02_1 * input11) + ((b02_1 << 1) * x1));
	mla	r7, ip, r7, r8	@ y, tmp454, input10, _245
@ /home/student/seng440/filter/butterworth_unrolled20.c:178:         y = ((y) + (b02_1 * x2));
	add	r6, r6, r7	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:179:         y = ((y) + (a1 * y1));
	mla	r6, r1, r10, r6	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:189:         y = ((b02_1 * input12) + ((b02_1 << 1) * x1));
	mul	r7, r3, r0	@ _262, tmp452, input12
@ /home/student/seng440/filter/butterworth_unrolled20.c:180:         y = ((y) + (a2 * y2));
	mla	r6, r2, fp, r6	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:189:         y = ((b02_1 * input12) + ((b02_1 << 1) * x1));
	mla	r5, ip, r5, r7	@ y, tmp454, input11, _262
@ /home/student/seng440/filter/butterworth_unrolled20.c:190:         y = ((y) + (b02_1 * x2));
	add	r5, r5, r9	@ y, _228
@ /home/student/seng440/filter/butterworth_unrolled20.c:181:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, r6, #0, #14	@ _254, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:181:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _255, _254,
	it	ne
	movne	r9, #1	@ _255,
@ /home/student/seng440/filter/butterworth_unrolled20.c:181:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r6, r9, r6, asr #14	@ y, _255, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:191:         y = ((y) + (a1 * y1));
	mla	r5, r1, r6, r5	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:192:         y = ((y) + (a2 * y2));
	mla	r5, r2, r10, r5	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:201:         y = ((b02_1 * input13) + ((b02_1 << 1) * x1));
	mul	r9, r3, lr	@ _279, tmp452, input13
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	fp, r5, #0, #14	@ _271, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	fp, fp, #0	@ _272, _271,
@ /home/student/seng440/filter/butterworth_unrolled20.c:201:         y = ((b02_1 * input13) + ((b02_1 << 1) * x1));
	mla	r0, ip, r0, r9	@ y, tmp454, input12, _279
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	fp, #1	@ _272,
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	fp, fp, r5, asr #14	@ y, _272, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:202:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r8	@ y, _245
@ /home/student/seng440/filter/butterworth_unrolled20.c:203:         y = ((y) + (a1 * y1));
	mla	r0, r1, fp, r0	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:204:         y = ((y) + (a2 * y2));
	mla	r0, r2, r6, r0	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:238:         register int input16 = x[i + 16];
	ldr	r5, [r4, #64]	@ input16, MEM[(const int *)_999 + 64B]
@ /home/student/seng440/filter/butterworth_unrolled20.c:205:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r0, #0, #14	@ _288, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:205:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _289, _288,
	it	ne
	movne	r10, #1	@ _289,
@ /home/student/seng440/filter/butterworth_unrolled20.c:205:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r0, asr #14	@ y, _289, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:226:         register int input15 = x[i + 15];
	ldrd	r6, r0, [r4, #56]	@ input14, input15, ivtmp.37,
@ /home/student/seng440/filter/butterworth_unrolled20.c:214:         y = ((b02_1 * input14) + ((b02_1 << 1) * x1));
	mul	r8, r3, r6	@ _296, tmp452, input14
@ /home/student/seng440/filter/butterworth_unrolled20.c:214:         y = ((b02_1 * input14) + ((b02_1 << 1) * x1));
	mla	lr, ip, lr, r8	@ y, tmp454, input13, _296
@ /home/student/seng440/filter/butterworth_unrolled20.c:215:         y = ((y) + (b02_1 * x2));
	add	r7, r7, lr	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:216:         y = ((y) + (a1 * y1));
	mla	r7, r1, r10, r7	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:217:         y = ((y) + (a2 * y2));
	mla	r7, r2, fp, r7	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:227:         y = ((b02_1 * input15) + ((b02_1 << 1) * x1));
	mul	fp, r3, r0	@ _313, tmp452, input15
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	lr, r7, #0, #14	@ _305, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	lr, lr, #0	@ _306, _305,
@ /home/student/seng440/filter/butterworth_unrolled20.c:227:         y = ((b02_1 * input15) + ((b02_1 << 1) * x1));
	mla	r6, ip, r6, fp	@ y, tmp454, input14, _313
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	lr, #1	@ _306,
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, lr, r7, asr #14	@ y, _306, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:228:         y = ((y) + (b02_1 * x2));
	add	r6, r6, r9	@ y, _279
@ /home/student/seng440/filter/butterworth_unrolled20.c:229:         y = ((y) + (a1 * y1));
	mla	r6, r1, r7, r6	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:230:         y = ((y) + (a2 * y2));
	mla	r6, r2, r10, r6	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:239:         y = ((b02_1 * input16) + ((b02_1 << 1) * x1));
	mul	r10, r3, r5	@ _330, tmp452, input16
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	lr, r6, #0, #14	@ _322, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	lr, lr, #0	@ _323, _322,
@ /home/student/seng440/filter/butterworth_unrolled20.c:239:         y = ((b02_1 * input16) + ((b02_1 << 1) * x1));
	mla	r0, ip, r0, r10	@ y, tmp454, input15, _330
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	lr, #1	@ _323,
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	lr, lr, r6, asr #14	@ y, _323, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:240:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r8	@ y, _296
@ /home/student/seng440/filter/butterworth_unrolled20.c:241:         y = ((y) + (a1 * y1));
	mla	r0, r1, lr, r0	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:242:         y = ((y) + (a2 * y2));
	mla	r0, r2, r7, r0	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:274:         register int input19 = x[i + 19];
	ldr	r8, [r4, #76]	@ x1, MEM[(const int *)_999 + 76B]
@ /home/student/seng440/filter/butterworth_unrolled20.c:243:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r7, r0, #0, #14	@ _339, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:243:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r7, r7, #0	@ _340, _339,
	it	ne
	movne	r7, #1	@ _340,
@ /home/student/seng440/filter/butterworth_unrolled20.c:243:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, r7, r0, asr #14	@ y, _340, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:262:         register int input18 = x[i + 18];
	ldrd	r0, r9, [r4, #68]	@ input17, x2, ivtmp.37,
@ /home/student/seng440/filter/butterworth_unrolled20.c:34:     for (i = 0; i + 19 < sample_count; i += 20) {
	adds	r4, r4, #80	@ ivtmp.37, ivtmp.37,
@ /home/student/seng440/filter/butterworth_unrolled20.c:251:         y = ((b02_1 * input17) + ((b02_1 << 1) * x1));
	mul	r6, r3, r0	@ _347, tmp452, input17
@ /home/student/seng440/filter/butterworth_unrolled20.c:251:         y = ((b02_1 * input17) + ((b02_1 << 1) * x1));
	mla	r5, ip, r5, r6	@ y, tmp454, input16, _347
@ /home/student/seng440/filter/butterworth_unrolled20.c:263:         y = ((b02_1 * input18) + ((b02_1 << 1) * x1));
	mul	r0, ip, r0	@ _365, tmp454, input17
@ /home/student/seng440/filter/butterworth_unrolled20.c:252:         y = ((y) + (b02_1 * x2));
	add	r5, r5, fp	@ y, _313
@ /home/student/seng440/filter/butterworth_unrolled20.c:253:         y = ((y) + (a1 * y1));
	mla	r5, r1, r7, r5	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:254:         y = ((y) + (a2 * y2));
	mla	r5, r2, lr, r5	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:263:         y = ((b02_1 * input18) + ((b02_1 << 1) * x1));
	mla	r0, r3, r9, r0	@ y, tmp452, x2, _365
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	lr, r5, #0, #14	@ _356, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	lr, lr, #0	@ _357, _356,
@ /home/student/seng440/filter/butterworth_unrolled20.c:264:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r10	@ y, _330
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	lr, #1	@ _357,
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	lr, lr, r5, asr #14	@ y, _357, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:265:         y = ((y) + (a1 * y1));
	mla	r0, r1, lr, r0	@ y, tmp458, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:266:         y = ((y) + (a2 * y2));
	mla	r0, r2, r7, r0	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:267:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r5, r0, #0, #14	@ _373, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:267:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r5, r5, #0	@ _374, _373,
	it	ne
	movne	r5, #1	@ _374,
@ /home/student/seng440/filter/butterworth_unrolled20.c:267:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r5, r5, r0, asr #14	@ y2, _374, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:275:         y = ((b02_1 * input19) + ((b02_1 << 1) * x1));
	mul	r0, ip, r9	@ _382, tmp454, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:275:         y = ((b02_1 * input19) + ((b02_1 << 1) * x1));
	mla	r0, r3, r8, r0	@ y, tmp452, x1, _382
@ /home/student/seng440/filter/butterworth_unrolled20.c:276:         y = ((y) + (b02_1 * x2));
	add	r6, r6, r0	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:277:         y = ((y) + (a1 * y1));
	mla	r6, r1, r5, r6	@ y, tmp458, y2, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:278:         y = ((y) + (a2 * y2));
	mla	r6, r2, lr, r6	@ y, tmp460, y, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:279:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r0, r6, #0, #14	@ _390, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:279:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r0, r0, #0	@ _391, _390,
	it	ne
	movne	r0, #1	@ _391,
@ /home/student/seng440/filter/butterworth_unrolled20.c:279:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r0, r0, r6, asr #14	@ y1, _391, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:34:     for (i = 0; i + 19 < sample_count; i += 20) {
	ldr	r6, [sp, #32]	@ _1021, %sfp
	cmp	r4, r6	@ ivtmp.37, _1021
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled20.c:328:     volatile int y = run_IIR(x, N);
	ldr	r7, [sp, #36]	@ tmp724, %sfp
	subw	r6, r7, #1316	@ tmp644, tmp724,
@ /home/student/seng440/filter/butterworth_unrolled20.c:330:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, r7, #1296	@ tmp645, tmp724,
	mov	r1, r4	@, tmp645
@ /home/student/seng440/filter/butterworth_unrolled20.c:328:     volatile int y = run_IIR(x, N);
	str	r0, [r6]	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:330:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:330:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp729
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:347:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:346:         (double)x[N - 1] / (1 << 14),
	add	r2, r7, #794624	@ tmp698, tmp724,
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	vldr.64	d18, .L14+32	@ tmp692,
@ /home/student/seng440/filter/butterworth_unrolled20.c:347:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled20.c:346:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled20.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r7, r7, #1312	@ tmp656, tmp724,
@ /home/student/seng440/filter/butterworth_unrolled20.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp661,
	b	.L15		@
.L16:
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
.L15:
	movt	r0, 15258	@ tmp661,
@ /home/student/seng440/filter/butterworth_unrolled20.c:347:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled20.c:346:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	vmul.f64	d17, d17, d18	@ _15, _14, tmp692
@ /home/student/seng440/filter/butterworth_unrolled20.c:346:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp692
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled20.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp713, end.tv_nsec, tmp645,
@ /home/student/seng440/filter/butterworth_unrolled20.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r7, #4]	@ tmp715, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled20.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _44, _44, seconds_38, tmp661
@ /home/student/seng440/filter/butterworth_unrolled20.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_38, tmp713, tmp715
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r7, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled20.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp667, tmp661, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp674, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp674, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled20.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
	adc	r6, r6, r2	@ _46, tmp667, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled20.c:336:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	adr	r3, .L17+8	@,
	ldrd	r2, [r3]	@ tmp703,
	ldr	r7, .L17+16	@ tmp689,
@ /home/student/seng440/filter/butterworth_unrolled20.c:336:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	strd	r2, [sp, #8]	@ tmp703,,
.LPIC2:
	add	r7, pc	@ tmp689
@ /home/student/seng440/filter/butterworth_unrolled20.c:336:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp730,
@ /home/student/seng440/filter/butterworth_unrolled20.c:336:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L17	@ tmp706,
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled20.c:336:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp730, tmp706
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	mov	r0, r7	@ tmp689, tmp689
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled20.c:351: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled20.c:324:         perror("Unable to start benchmark timer");
	ldr	r0, .L17+20	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled20.c:325:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled20.c:331:         perror("Unable to stop benchmark timer");
	ldr	r0, .L17+24	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:332:         return 1;
	b	.L4		@
.L18:
	.align	3
.L17:
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
