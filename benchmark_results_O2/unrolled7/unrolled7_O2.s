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
	.file	"butterworth_unrolled7.c"
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
	@ args = 0, pretend = 0, frame = 800056
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:149:     for (int n = 0; n < N; n++) {
	movs	r6, #1	@ n,
@ /home/student/seng440/filter/butterworth_unrolled7.c:146: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp269,
@ /home/student/seng440/filter/butterworth_unrolled7.c:146: {
	subw	sp, sp, #1372	@,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	add	r5, sp, #1368	@ tmp459,,
	add	r4, sp, #798720	@ _393,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L16	@ tmp274,
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L16+8	@ tmp276,
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L16+16	@ tmp278,
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L16+24	@ tmp280,
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	sub	r3, r5, #1280	@ tmp268, tmp459,
	addw	r4, r4, #1364	@ _393, _393,
	mov	r7, r3	@ ivtmp.36, tmp268
	add	r9, r3, #798720	@ tmp460, ivtmp.36,
	str	r2, [r3]	@ tmp269, x[0]
	mov	r8, r3	@ ivtmp.45, ivtmp.36
.L2:
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r6	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled7.c:149:     for (int n = 0; n < N; n++) {
	adds	r6, r6, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _439, n
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _440, _439, tmp274
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _440, tmp276
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp462, tmp278
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp280
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp281, _4
	vmov	r3, s0	@ int	@ tmp281, tmp281
	str	r3, [r8, #4]!	@ tmp281, MEM[(int *)_383]
@ /home/student/seng440/filter/butterworth_unrolled7.c:149:     for (int n = 0; n < N; n++) {
	cmp	r8, r4	@ ivtmp.45, _393
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:161:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r5, #1312	@, tmp459,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:161:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	mov	r8, r0	@ x1, tmp463
	cmp	r0, #0	@ x1
	bne	.L14	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:40:         y = ((y) + (a2 * y2));
	movw	lr, #58773	@ tmp295,
	addw	r3, r9, #1268	@ _379, tmp460,
	movt	lr, 65535	@ tmp295,
@ /home/student/seng440/filter/butterworth_unrolled7.c:30:     register int y1 = 0;
	mov	r2, r0	@ y1, x1
	str	r3, [sp, #36]	@ _379, %sfp
@ /home/student/seng440/filter/butterworth_unrolled7.c:29:     register int x2 = 0;
	mov	r9, r0	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled7.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	ip, #1105	@ tmp287,
@ /home/student/seng440/filter/butterworth_unrolled7.c:39:         y = ((y) + (a1 * y1));
	movw	fp, #18727	@ tmp293,
	mov	r1, r0	@ x1, x1
	strd	r4, r5, [sp, #40]	@ _393, tmp459,,
.L5:
@ /home/student/seng440/filter/butterworth_unrolled7.c:49:         register int input1 = x[i + 1];
	ldrd	r6, r5, [r7]	@ input0, input1, ivtmp.36
@ /home/student/seng440/filter/butterworth_unrolled7.c:75:         register int input3 = x[i + 3];
	ldrd	r4, r0, [r7, #8]	@ input2, input3, ivtmp.36,
@ /home/student/seng440/filter/butterworth_unrolled7.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	r10, ip, r5	@ _74, tmp287, input1
@ /home/student/seng440/filter/butterworth_unrolled7.c:75:         register int input3 = x[i + 3];
	str	r0, [sp, #32]	@ input3, %sfp
@ /home/student/seng440/filter/butterworth_unrolled7.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	movw	r0, #2210	@ tmp494,
@ /home/student/seng440/filter/butterworth_unrolled7.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	r3, ip, r6	@ _52, tmp287, input0
@ /home/student/seng440/filter/butterworth_unrolled7.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r6, r0, r6, r10	@ y, tmp494, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled7.c:51:         y = ((y) + (b02_1 * x2));
	mla	r6, ip, r1, r6	@ y, tmp287, x1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	r1, r0, r1, r3	@ y, tmp495, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled7.c:38:         y = ((y) + (b02_1 * x2));
	mla	r1, ip, r9, r1	@ y, tmp287, x2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:39:         y = ((y) + (a1 * y1));
	mla	r1, fp, r2, r1	@ y, tmp293, y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:40:         y = ((y) + (a2 * y2));
	mla	r1, lr, r8, r1	@ y, tmp295, y2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r8, ip, r4	@ _92, tmp287, input2
@ /home/student/seng440/filter/butterworth_unrolled7.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	r5, r0, r5, r8	@ y, tmp496, input1, _92
	mov	r9, r0	@ tmp496, tmp495
@ /home/student/seng440/filter/butterworth_unrolled7.c:64:         y = ((y) + (b02_1 * x2));
	add	r5, r5, r3	@ y, _52
@ /home/student/seng440/filter/butterworth_unrolled7.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r3, r1, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r3, r3, #0	@ _67, _66,
@ /home/student/seng440/filter/butterworth_unrolled7.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	ldr	r0, [sp, #32]	@ input3, %sfp
@ /home/student/seng440/filter/butterworth_unrolled7.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r3, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled7.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r3, r1, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:52:         y = ((y) + (a1 * y1));
	mla	r6, fp, r3, r6	@ y, tmp293, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:53:         y = ((y) + (a2 * y2));
	mla	r1, lr, r2, r6	@ y, tmp295, y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	r2, ip, r0	@ _109, tmp287, input3
@ /home/student/seng440/filter/butterworth_unrolled7.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r6, r1, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mov	r0, r9	@ tmp497, tmp497
@ /home/student/seng440/filter/butterworth_unrolled7.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r6, r6, #0	@ _85, _84,
	it	ne
	movne	r6, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled7.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r6, r6, r1, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:65:         y = ((y) + (a1 * y1));
	mla	r5, fp, r6, r5	@ y, tmp293, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:66:         y = ((y) + (a2 * y2));
	mla	r5, lr, r3, r5	@ y, tmp295, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	r4, r9, r4, r2	@ y, tmp497, input2, _109
@ /home/student/seng440/filter/butterworth_unrolled7.c:101:         register int input5 = x[i + 5];
	ldrd	r3, r9, [r7, #16]	@ input4, x2, ivtmp.36,
@ /home/student/seng440/filter/butterworth_unrolled7.c:77:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r10	@ y, _74
@ /home/student/seng440/filter/butterworth_unrolled7.c:34:     for (i = 0; i + 6 < sample_count; i += 7) {
	adds	r7, r7, #28	@ ivtmp.36, ivtmp.36,
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r5, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _102, _101,
@ /home/student/seng440/filter/butterworth_unrolled7.c:114:         register int input6 = x[i + 6];
	ldr	r1, [r7, #-4]	@ x1, MEM[(const int *)_371 + 24B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r10, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r5, asr #14	@ y, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:78:         y = ((y) + (a1 * y1));
	mla	r4, fp, r10, r4	@ y, tmp293, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:79:         y = ((y) + (a2 * y2));
	mla	r4, lr, r6, r4	@ y, tmp295, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mov	r6, r0	@ tmp498, tmp497
@ /home/student/seng440/filter/butterworth_unrolled7.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	r5, ip, r3	@ _126, tmp287, input4
@ /home/student/seng440/filter/butterworth_unrolled7.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _144, tmp499, input4
@ /home/student/seng440/filter/butterworth_unrolled7.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mla	r3, ip, r9, r3	@ y, tmp287, x2, _144
@ /home/student/seng440/filter/butterworth_unrolled7.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	ldr	r0, [sp, #32]	@ input3, %sfp
@ /home/student/seng440/filter/butterworth_unrolled7.c:103:         y = ((y) + (b02_1 * x2));
	add	r3, r3, r2	@ y, _109
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _119, _118,
@ /home/student/seng440/filter/butterworth_unrolled7.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mla	r0, r6, r0, r5	@ y, tmp498, input3, _126
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r2, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r4, asr #14	@ y, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:90:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r8	@ y, _92
@ /home/student/seng440/filter/butterworth_unrolled7.c:91:         y = ((y) + (a1 * y1));
	mla	r0, fp, r2, r0	@ y, tmp293, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:92:         y = ((y) + (a2 * y2));
	mla	r6, lr, r10, r0	@ y, tmp295, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	movw	r0, #2210	@ tmp500,
	mul	r4, r0, r9	@ _161, tmp500, x2
@ /home/student/seng440/filter/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r0, r6, #0, #14	@ _135, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r0, r0, #0	@ _136, _135,
	it	ne
	movne	r0, #1	@ _136,
@ /home/student/seng440/filter/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r0, r0, r6, asr #14	@ y, _136, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:104:         y = ((y) + (a1 * y1));
	mla	r3, fp, r0, r3	@ y, tmp293, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:105:         y = ((y) + (a2 * y2));
	mla	r3, lr, r2, r3	@ y, tmp295, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mla	r4, ip, r1, r4	@ y, tmp287, x1, _161
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r8, r3, #0, #14	@ _152, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r8, r8, #0	@ _153, _152,
@ /home/student/seng440/filter/butterworth_unrolled7.c:116:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r5	@ y, _126
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r8, #1	@ _153,
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r8, r8, r3, asr #14	@ y2, _153, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:117:         y = ((y) + (a1 * y1));
	mla	r3, fp, r8, r4	@ y, tmp293, y2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:118:         y = ((y) + (a2 * y2));
	mla	r3, lr, r0, r3	@ y, tmp295, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _169, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _170, _169,
	it	ne
	movne	r2, #1	@ _170,
@ /home/student/seng440/filter/butterworth_unrolled7.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r3, asr #14	@ y1, _170, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:34:     for (i = 0; i + 6 < sample_count; i += 7) {
	ldr	r3, [sp, #36]	@ _379, %sfp
	cmp	r7, r3	@ ivtmp.36, _379
	bne	.L5		@,
	ldrd	r4, r5, [sp, #40]	@ _393, tmp459,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:133:         y = ((y) + (a2 * y2));
	movw	r7, #58773	@ tmp371,
	mov	r3, r8	@ y2, y2
	movt	r7, 65535	@ tmp371,
	add	r0, r5, #794624	@ ivtmp.26, tmp459,
	mov	r8, r1	@ x1, x1
	add	r0, r0, #4080	@ ivtmp.26, ivtmp.26,
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r6, #1105	@ tmp363,
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	lr, #2210	@ tmp365,
@ /home/student/seng440/filter/butterworth_unrolled7.c:132:         y = ((y) + (a1 * y1));
	movw	ip, #18727	@ tmp369,
.L6:
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	ldr	r10, [r0, #4]!	@ current_input, MEM[(const int *)_365]
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r1, lr, r8	@ _182, tmp365, x1
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r1, r6, r10, r1	@ y, tmp363, current_input, _182
@ /home/student/seng440/filter/butterworth_unrolled7.c:131:         y = ((y) + (b02_1 * x2));
	mla	r1, r6, r9, r1	@ y, tmp363, x2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:132:         y = ((y) + (a1 * y1));
	mla	r1, ip, r2, r1	@ y, tmp369, y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:133:         y = ((y) + (a2 * y2));
	mla	r1, r7, r3, r1	@ y, tmp371, y2, y
	mov	r3, r2	@ y2, y1
	mov	r9, r8	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r1, #0, #14	@ _194, y,,
	mov	r8, r10	@ x1, current_input
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _195, _194,
	it	ne
	movne	r2, #1	@ _195,
@ /home/student/seng440/filter/butterworth_unrolled7.c:128:     for (; i < sample_count; i++) {
	cmp	r0, r4	@ ivtmp.26, _393
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r1, r2, r1, asr #14	@ y, _195, y,
	mov	r2, r1	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:128:     for (; i < sample_count; i++) {
	bne	.L6		@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:166:     volatile int y = run_IIR(x, N);
	subw	r7, r5, #1316	@ tmp379, tmp459,
@ /home/student/seng440/filter/butterworth_unrolled7.c:168:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, r5, #1296	@ tmp380, tmp459,
	movs	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:166:     volatile int y = run_IIR(x, N);
	str	r1, [r7]	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:168:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r1, r4	@, tmp380
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:168:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r6, r0	@ <retval>, tmp464
	cmp	r0, #0	@ <retval>
	bne	.L15	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:185:         (double)y / (1 << 14)
	ldr	r3, [r7]	@ y.0_13, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:184:         (double)x[N - 1] / (1 << 14),
	add	r2, r5, #794624	@ tmp433, tmp459,
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	vldr.64	d18, .L16+32	@ tmp427,
@ /home/student/seng440/filter/butterworth_unrolled7.c:185:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled7.c:184:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled7.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r5, r5, #1312	@ tmp391, tmp459,
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	ldr	r7, .L16+56	@ tmp424,
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp396,
	movt	r0, 15258	@ tmp396,
@ /home/student/seng440/filter/butterworth_unrolled7.c:185:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled7.c:184:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
.LPIC2:
	add	r7, pc	@ tmp424
	vmul.f64	d17, d17, d18	@ _15, _14, tmp427
@ /home/student/seng440/filter/butterworth_unrolled7.c:184:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp427
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled7.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp448, end.tv_nsec, tmp380,
@ /home/student/seng440/filter/butterworth_unrolled7.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r5, #4]	@ tmp450, start.tv_sec
	sbc	r4, r1, r4	@ seconds_38, tmp448, tmp450
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r5, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r5, r3, r0	@ _44, _44, seconds_38, tmp396
	mla	r5, r0, r4, r5	@ tmp402, tmp396, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp409, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp409, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
	adc	r5, r5, r2	@ _46, tmp402, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	adr	r3, .L16+48	@,
	ldrd	r2, [r3]	@ tmp438,
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r5	@, _46
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	strd	r2, [sp, #8]	@ tmp438,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp465,
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L16+40	@ tmp441,
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r5	@, _46
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp465, tmp441
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	mov	r0, r7	@ tmp424, tmp424
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled7.c:189: }
	mov	r0, r6	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1372	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L14:
@ /home/student/seng440/filter/butterworth_unrolled7.c:162:         perror("Unable to start benchmark timer");
	ldr	r0, .L16+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled7.c:163:         return 1;
	movs	r6, #1	@ <retval>,
	b	.L1		@
.L15:
@ /home/student/seng440/filter/butterworth_unrolled7.c:169:         perror("Unable to stop benchmark timer");
	ldr	r0, .L16+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:170:         return 1;
	b	.L4		@
.L17:
	.align	3
.L16:
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
