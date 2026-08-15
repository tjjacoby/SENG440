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
	.file	"butterworth_unrolled6.c"
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
@ /home/student/seng440/filter/butterworth_unrolled6.c:136:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/seng440/filter/butterworth_unrolled6.c:133: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:142:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp265,
@ /home/student/seng440/filter/butterworth_unrolled6.c:133: {
	subw	sp, sp, #1364	@,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:142:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1360	@ tmp457,,
	add	r7, sp, #798720	@ _326,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:137:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp270,
@ /home/student/seng440/filter/butterworth_unrolled6.c:138:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp272,
@ /home/student/seng440/filter/butterworth_unrolled6.c:138:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp274,
@ /home/student/seng440/filter/butterworth_unrolled6.c:142:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp276,
@ /home/student/seng440/filter/butterworth_unrolled6.c:142:         x[n] = (int)(input * (1 << 14));
	sub	r3, fp, #1280	@ tmp264, tmp457,
	addw	r7, r7, #1356	@ _326, _326,
	mov	r4, r3	@ ivtmp.24, tmp264
	add	r8, r3, #798720	@ tmp456, ivtmp.24,
	str	r2, [r3]	@ tmp265, x[0]
	mov	r6, r3	@ ivtmp.34, ivtmp.24
.L2:
@ /home/student/seng440/filter/butterworth_unrolled6.c:137:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled6.c:136:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled6.c:137:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _390, n
@ /home/student/seng440/filter/butterworth_unrolled6.c:137:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _391, _390, tmp270
@ /home/student/seng440/filter/butterworth_unrolled6.c:138:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _391, tmp272
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled6.c:138:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp459, tmp274
@ /home/student/seng440/filter/butterworth_unrolled6.c:142:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp276
@ /home/student/seng440/filter/butterworth_unrolled6.c:142:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp277, _4
	vmov	r3, s0	@ int	@ tmp277, tmp277
	str	r3, [r6, #4]!	@ tmp277, MEM[(int *)_324]
@ /home/student/seng440/filter/butterworth_unrolled6.c:136:     for (int n = 0; n < N; n++) {
	cmp	r6, r7	@ ivtmp.34, _326
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled6.c:148:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, fp, #1312	@, tmp457,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled6.c:148:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/seng440/filter/butterworth_unrolled6.c:39:         y = ((y) + (a1 * y1));
	str	fp, [sp, #36]	@ tmp457, %sfp
@ /home/student/seng440/filter/butterworth_unrolled6.c:40:         y = ((y) + (a2 * y2));
	movw	r5, #58773	@ tmp291,
	movt	r5, 65535	@ tmp291,
@ /home/student/seng440/filter/butterworth_unrolled6.c:31:     register int y2 = 0;
	mov	r2, r0	@ y2, x1
@ /home/student/seng440/filter/butterworth_unrolled6.c:29:     register int x2 = 0;
	mov	r9, r0	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled6.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	ip, #1105	@ tmp283,
@ /home/student/seng440/filter/butterworth_unrolled6.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r7, #2210	@ tmp285,
@ /home/student/seng440/filter/butterworth_unrolled6.c:39:         y = ((y) + (a1 * y1));
	movw	r6, #18727	@ tmp289,
	mov	r10, r0	@ y1, y1
	add	r3, r8, #1272	@ _320, tmp456,
	str	r3, [sp, #32]	@ _320, %sfp
.L5:
@ /home/student/seng440/filter/butterworth_unrolled6.c:36:         register int input0 = x[i];
	ldr	r3, [r4]	@ input0, MEM[(const int *)_312]
@ /home/student/seng440/filter/butterworth_unrolled6.c:49:         register int input1 = x[i + 1];
	ldr	r8, [r4, #4]	@ input1, MEM[(const int *)_312 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled6.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	r1, ip, r3	@ _52, tmp283, input0
@ /home/student/seng440/filter/butterworth_unrolled6.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	lr, r7, r0, r1	@ y, tmp285, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled6.c:38:         y = ((y) + (b02_1 * x2));
	mla	lr, ip, r9, lr	@ y, tmp283, x2, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:39:         y = ((y) + (a1 * y1));
	mla	lr, r6, r10, lr	@ y, tmp289, y1, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:40:         y = ((y) + (a2 * y2));
	mla	r2, r5, r2, lr	@ y, tmp291, y2, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	fp, ip, r8	@ _74, tmp283, input1
@ /home/student/seng440/filter/butterworth_unrolled6.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	lr, r2, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	lr, lr, #0	@ _67, _66,
@ /home/student/seng440/filter/butterworth_unrolled6.c:88:         register int input4 = x[i + 4];
	ldr	r9, [r4, #16]	@ x2, MEM[(const int *)_312 + 16B]
@ /home/student/seng440/filter/butterworth_unrolled6.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	lr, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled6.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r3, r7, r3, fp	@ y, tmp285, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled6.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	lr, lr, r2, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:51:         y = ((y) + (b02_1 * x2));
	mla	r3, ip, r0, r3	@ y, tmp283, x1, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:52:         y = ((y) + (a1 * y1));
	mla	r3, r6, lr, r3	@ y, tmp289, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:53:         y = ((y) + (a2 * y2));
	mla	r3, r5, r10, r3	@ y, tmp291, y1, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r0, r3, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r0, r0, #0	@ _85, _84,
	it	ne
	movne	r0, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled6.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r0, r0, r3, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:75:         register int input3 = x[i + 3];
	ldrd	r2, r3, [r4, #8]	@ input2, input3, ivtmp.24,
@ /home/student/seng440/filter/butterworth_unrolled6.c:34:     for (i = 0; i + 5 < sample_count; i += 6) {
	adds	r4, r4, #24	@ ivtmp.24, ivtmp.24,
@ /home/student/seng440/filter/butterworth_unrolled6.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r10, ip, r2	@ _92, tmp283, input2
@ /home/student/seng440/filter/butterworth_unrolled6.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	r8, r7, r8, r10	@ y, tmp285, input1, _92
@ /home/student/seng440/filter/butterworth_unrolled6.c:64:         y = ((y) + (b02_1 * x2));
	add	r1, r1, r8	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:65:         y = ((y) + (a1 * y1));
	mla	r1, r6, r0, r1	@ y, tmp289, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:66:         y = ((y) + (a2 * y2));
	mla	r1, r5, lr, r1	@ y, tmp291, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	lr, ip, r3	@ _109, tmp283, input3
@ /home/student/seng440/filter/butterworth_unrolled6.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r8, r1, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r8, r8, #0	@ _102, _101,
@ /home/student/seng440/filter/butterworth_unrolled6.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	r2, r7, r2, lr	@ y, tmp285, input2, _109
@ /home/student/seng440/filter/butterworth_unrolled6.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r8, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled6.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r8, r8, r1, asr #14	@ y, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:77:         y = ((y) + (b02_1 * x2));
	add	r2, r2, fp	@ y, _74
@ /home/student/seng440/filter/butterworth_unrolled6.c:78:         y = ((y) + (a1 * y1));
	mla	r2, r6, r8, r2	@ y, tmp289, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	r1, ip, r9	@ _126, tmp283, x2
@ /home/student/seng440/filter/butterworth_unrolled6.c:79:         y = ((y) + (a2 * y2));
	mla	r2, r5, r0, r2	@ y, tmp291, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mla	r3, r7, r3, r1	@ y, tmp285, input3, _126
@ /home/student/seng440/filter/butterworth_unrolled6.c:101:         register int input5 = x[i + 5];
	ldr	r0, [r4, #-4]	@ x1, MEM[(const int *)_312 + 20B]
@ /home/student/seng440/filter/butterworth_unrolled6.c:90:         y = ((y) + (b02_1 * x2));
	add	r3, r3, r10	@ y, _92
@ /home/student/seng440/filter/butterworth_unrolled6.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, r2, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _119, _118,
	it	ne
	movne	r10, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled6.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, r2, asr #14	@ y, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:91:         y = ((y) + (a1 * y1));
	mla	r3, r6, r10, r3	@ y, tmp289, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:92:         y = ((y) + (a2 * y2));
	mla	r3, r5, r8, r3	@ y, tmp291, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mul	r8, ip, r0	@ _143, tmp283, x1
@ /home/student/seng440/filter/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _135, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _136, _135,
	it	ne
	movne	r2, #1	@ _136,
@ /home/student/seng440/filter/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r3, asr #14	@ y2, _136, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mla	r3, r7, r9, r8	@ y, tmp285, x2, _143
@ /home/student/seng440/filter/butterworth_unrolled6.c:103:         y = ((y) + (b02_1 * x2));
	add	lr, lr, r3	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:104:         y = ((y) + (a1 * y1));
	mla	lr, r6, r2, lr	@ y, tmp289, y2, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:105:         y = ((y) + (a2 * y2));
	mla	lr, r5, r10, lr	@ y, tmp291, y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:34:     for (i = 0; i + 5 < sample_count; i += 6) {
	ldr	r3, [sp, #32]	@ _320, %sfp
@ /home/student/seng440/filter/butterworth_unrolled6.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r10, lr, #0, #14	@ _152, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r10, r10, #0	@ _153, _152,
	it	ne
	movne	r10, #1	@ _153,
@ /home/student/seng440/filter/butterworth_unrolled6.c:34:     for (i = 0; i + 5 < sample_count; i += 6) {
	cmp	r4, r3	@ ivtmp.24, _320
@ /home/student/seng440/filter/butterworth_unrolled6.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r10, r10, lr, asr #14	@ y1, _153, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:34:     for (i = 0; i + 5 < sample_count; i += 6) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled6.c:116:         register int current_input = x[i];
	ldr	fp, [sp, #36]	@ tmp457, %sfp
	mov	r3, r10	@ y1, y1
	add	r4, fp, #794624	@ tmp349, tmp457,
	ldr	lr, [r4, #4088]	@ current_input, MEM[(const int *)&x + 799992B]
	ldr	r9, [r4, #4092]	@ current_input, MEM[(const int *)&x + 799996B]
@ /home/student/seng440/filter/butterworth_unrolled6.c:153:     volatile int y = run_IIR(x, N);
	subw	r4, fp, #1316	@ tmp383, tmp457,
@ /home/student/seng440/filter/butterworth_unrolled6.c:117:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r10, ip, lr	@ _373, tmp283, current_input
@ /home/student/seng440/filter/butterworth_unrolled6.c:117:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r10, r7, r0, r10	@ y, tmp285, x1, _373
@ /home/student/seng440/filter/butterworth_unrolled6.c:117:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r0, r7, lr	@ _165, tmp285, current_input
@ /home/student/seng440/filter/butterworth_unrolled6.c:118:         y = ((y) + (b02_1 * x2));
	add	r1, r1, r10	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r7, fp, #1296	@ tmp384, tmp457,
@ /home/student/seng440/filter/butterworth_unrolled6.c:119:         y = ((y) + (a1 * y1));
	mla	r1, r6, r3, r1	@ y, tmp289, y1, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:120:         y = ((y) + (a2 * y2));
	mla	r2, r5, r2, r1	@ y, tmp291, y2, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:117:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r0, ip, r9, r0	@ y, tmp283, current_input, _165
@ /home/student/seng440/filter/butterworth_unrolled6.c:121:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r1, r2, #0, #14	@ _359, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:121:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r1, r1, #0	@ _358, _359,
@ /home/student/seng440/filter/butterworth_unrolled6.c:118:         y = ((y) + (b02_1 * x2));
	add	r0, r0, r8	@ y, _143
@ /home/student/seng440/filter/butterworth_unrolled6.c:121:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	it	ne
	movne	r1, #1	@ _358,
@ /home/student/seng440/filter/butterworth_unrolled6.c:121:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r1, r2, asr #14	@ y_356, _358, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r1, r7	@, tmp384
@ /home/student/seng440/filter/butterworth_unrolled6.c:119:         y = ((y) + (a1 * y1));
	mla	r2, r6, r2, r0	@ y, tmp289, y_356, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:120:         y = ((y) + (a2 * y2));
	mla	r3, r5, r3, r2	@ y, tmp291, y1, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	movs	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled6.c:121:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _177, y,,
@ /home/student/seng440/filter/butterworth_unrolled6.c:121:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _178, _177,
	it	ne
	movne	r2, #1	@ _178,
@ /home/student/seng440/filter/butterworth_unrolled6.c:121:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r2, r3, asr #14	@ y, _178, y,
@ /home/student/seng440/filter/butterworth_unrolled6.c:153:     volatile int y = run_IIR(x, N);
	str	r3, [r4]	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled6.c:155:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp461
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/seng440/filter/butterworth_unrolled6.c:171:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r9	@ int	@ current_input, current_input
@ /home/student/seng440/filter/butterworth_unrolled6.c:172:         (double)y / (1 << 14)
	ldr	r3, [r4]	@ y.0_13, y
@ /home/student/seng440/filter/butterworth_unrolled6.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	fp, fp, #1312	@ tmp395, tmp457,
@ /home/student/seng440/filter/butterworth_unrolled6.c:164:     printf(
	vldr.64	d18, .L14+32	@ tmp431,
@ /home/student/seng440/filter/butterworth_unrolled6.c:171:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, current_input
@ /home/student/seng440/filter/butterworth_unrolled6.c:172:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled6.c:164:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp435,
	vmul.f64	d16, d16, d18	@ _12, _11, tmp431
@ /home/student/seng440/filter/butterworth_unrolled6.c:172:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled6.c:164:     printf(
	strd	r2, [sp, #8]	@ tmp435,,
	vmul.f64	d17, d17, d18	@ _15, _14, tmp431
	vstr.64	d16, [sp, #16]	@ _12,
	vstr.64	d17, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_unrolled6.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldrd	r3, r4, [r7]	@ end.tv_sec, tmp445, tmp384
	ldr	r1, [fp]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled6.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r6, r0, [fp, #4]	@ tmp447, start.tv_nsec, tmp395,
@ /home/student/seng440/filter/butterworth_unrolled6.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r3, r3, r1	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled6.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp400,
	movt	r1, 15258	@ tmp400,
@ /home/student/seng440/filter/butterworth_unrolled6.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r7, #8]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled6.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r4, r6	@ seconds_38, tmp445, tmp447
@ /home/student/seng440/filter/butterworth_unrolled6.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _44, _44, seconds_38, tmp400
@ /home/student/seng440/filter/butterworth_unrolled6.c:164:     printf(
	ldr	r7, .L14+56	@ tmp428,
@ /home/student/seng440/filter/butterworth_unrolled6.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r1, r4, r6	@ tmp406, tmp400, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled6.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r1, r2, r0	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled6.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp413, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled6.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r0, asr #31	@ nanoseconds_43, tmp413, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled6.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r1	@ _46, _44, nanoseconds_43
	adc	r6, r6, r2	@ _46, tmp406, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled6.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled6.c:164:     printf(
.LPIC2:
	add	r7, pc	@ tmp428
@ /home/student/seng440/filter/butterworth_unrolled6.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp462,
@ /home/student/seng440/filter/butterworth_unrolled6.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp438,
@ /home/student/seng440/filter/butterworth_unrolled6.c:164:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled6.c:161:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp462, tmp438
@ /home/student/seng440/filter/butterworth_unrolled6.c:164:     printf(
	mov	r0, r7	@ tmp428, tmp428
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled6.c:176: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled6.c:149:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled6.c:150:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled6.c:156:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled6.c:157:         return 1;
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
