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
	movw	r7, #13644	@ _506,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r7, 12	@ _506,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1360	@,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp291,
@ /home/student/seng440/filter/butterworth_unrolled7.c:146: {
	sub	sp, sp, #4	@,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:149:     for (int n = 0; n < N; n++) {
	mov	r5, #1	@ n,
	add	r7, sp, r7	@ _506,, _506
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1360	@ tmp492,,
	mov	r4, fp	@ ivtmp.25, tmp492
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp296,
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp298,
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp300,
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp302,
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	str	r3, [r4, #-1280]!	@ tmp291, x[0]
	mov	r6, r4	@ ivtmp.35, ivtmp.25
.L2:
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled7.c:149:     for (int n = 0; n < N; n++) {
	add	r5, r5, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _439, n
@ /home/student/seng440/filter/butterworth_unrolled7.c:150:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _440, _439, tmp296
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _440, tmp298
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:151:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp494, tmp300
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp302
@ /home/student/seng440/filter/butterworth_unrolled7.c:155:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp303, _4
	vmov	r3, s0	@ int	@ tmp303, tmp303
	str	r3, [r6, #4]!	@ tmp303, MEM[(int *)_504]
@ /home/student/seng440/filter/butterworth_unrolled7.c:149:     for (int n = 0; n < N; n++) {
	cmp	r6, r7	@ ivtmp.35, _506
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:161:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, fp, #1312	@, tmp492,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:161:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r6, r0, #0	@ x1, tmp495
	bne	.L12		@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:39:         y = ((y) + (a1 * y1));
	str	fp, [sp, #36]	@ tmp492, %sfp
	movw	r3, #13556	@ _500,
	movt	r3, 12	@ _500,
@ /home/student/seng440/filter/butterworth_unrolled7.c:40:         y = ((y) + (a2 * y2));
	movw	ip, #58773	@ tmp317,
	add	r3, r4, r3	@ _500, ivtmp.25, _500
@ /home/student/seng440/filter/butterworth_unrolled7.c:31:     register int y2 = 0;
	mov	r2, r6	@ y2, x1
	str	r3, [sp, #32]	@ _500, %sfp
@ /home/student/seng440/filter/butterworth_unrolled7.c:29:     register int x2 = 0;
	mov	r10, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled7.c:40:         y = ((y) + (a2 * y2));
	movt	ip, 65535	@ tmp317,
@ /home/student/seng440/filter/butterworth_unrolled7.c:30:     register int y1 = 0;
	mov	r3, r6	@ y1, x1
@ /home/student/seng440/filter/butterworth_unrolled7.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r0, #1105	@ tmp309,
@ /home/student/seng440/filter/butterworth_unrolled7.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r5, #2210	@ tmp311,
@ /home/student/seng440/filter/butterworth_unrolled7.c:39:         y = ((y) + (a1 * y1));
	movw	lr, #18727	@ tmp315,
.L5:
@ /home/student/seng440/filter/butterworth_unrolled7.c:36:         register int input0 = x[i];
	ldr	r7, [r4]	@ input0, MEM[(const int *)_491]
@ /home/student/seng440/filter/butterworth_unrolled7.c:49:         register int input1 = x[i + 1];
	ldr	r9, [r4, #4]	@ input1, MEM[(const int *)_491 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	r1, r0, r7	@ _52, tmp309, input0
@ /home/student/seng440/filter/butterworth_unrolled7.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mla	r8, r5, r6, r1	@ y, tmp311, x1, _52
@ /home/student/seng440/filter/butterworth_unrolled7.c:38:         y = ((y) + (b02_1 * x2));
	mla	r8, r0, r10, r8	@ y, tmp309, x2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:39:         y = ((y) + (a1 * y1));
	mla	r8, lr, r3, r8	@ y, tmp315, y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:40:         y = ((y) + (a2 * y2));
	mla	r8, ip, r2, r8	@ y, tmp317, y2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	fp, r0, r9	@ _74, tmp309, input1
@ /home/student/seng440/filter/butterworth_unrolled7.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mla	r2, r5, r7, fp	@ y, tmp311, input0, _74
@ /home/student/seng440/filter/butterworth_unrolled7.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r7, r8, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r7, r7, #0	@ _67, _66,
	movne	r7, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled7.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r7, r7, r8, asr #14	@ y, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:51:         y = ((y) + (b02_1 * x2));
	mla	r2, r0, r6, r2	@ y, tmp309, x1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:52:         y = ((y) + (a1 * y1));
	mla	r2, lr, r7, r2	@ y, tmp315, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:53:         y = ((y) + (a2 * y2));
	mla	r3, ip, r3, r2	@ y, tmp317, y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:88:         register int input4 = x[i + 4];
	ldr	r8, [r4, #16]	@ input4, MEM[(const int *)_491 + 16B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r6, r3, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r6, r6, #0	@ _85, _84,
	movne	r6, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled7.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r6, r6, r3, asr #14	@ y, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:75:         register int input3 = x[i + 3];
	ldrd	r2, [r4, #8]	@, ivtmp.25,
@ /home/student/seng440/filter/butterworth_unrolled7.c:34:     for (i = 0; i + 6 < sample_count; i += 7) {
	add	r4, r4, #28	@ ivtmp.25, ivtmp.25,
@ /home/student/seng440/filter/butterworth_unrolled7.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r10, r0, r2	@ _92, tmp309, input2
@ /home/student/seng440/filter/butterworth_unrolled7.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mla	r9, r5, r9, r10	@ y, tmp311, input1, _92
@ /home/student/seng440/filter/butterworth_unrolled7.c:64:         y = ((y) + (b02_1 * x2));
	add	r1, r1, r9	@ y, _52, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:65:         y = ((y) + (a1 * y1));
	mla	r1, lr, r6, r1	@ y, tmp315, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:66:         y = ((y) + (a2 * y2));
	mla	r1, ip, r7, r1	@ y, tmp317, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	r7, r0, r3	@ _109, tmp309, input3
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, r1, #0, #14	@ _101, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _102, _101,
@ /home/student/seng440/filter/butterworth_unrolled7.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mla	r2, r5, r2, r7	@ y, tmp311, input2, _109
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r9, #1	@ _102,
@ /home/student/seng440/filter/butterworth_unrolled7.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r1, r9, r1, asr #14	@ y, _102, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:77:         y = ((y) + (b02_1 * x2));
	add	r2, fp, r2	@ y, _74, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:78:         y = ((y) + (a1 * y1));
	mla	r2, lr, r1, r2	@ y, tmp315, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:79:         y = ((y) + (a2 * y2));
	mla	r6, ip, r6, r2	@ y, tmp317, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	fp, r0, r8	@ _126, tmp309, input4
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r6, #0, #14	@ _118, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _119, _118,
@ /home/student/seng440/filter/butterworth_unrolled7.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mla	r3, r5, r3, fp	@ y, tmp311, input3, _126
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r2, #1	@ _119,
@ /home/student/seng440/filter/butterworth_unrolled7.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r6, asr #14	@ y, _119, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:90:         y = ((y) + (b02_1 * x2));
	add	r3, r10, r3	@ y, _92, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:91:         y = ((y) + (a1 * y1));
	mla	r3, lr, r2, r3	@ y, tmp315, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:101:         register int input5 = x[i + 5];
	ldr	r10, [r4, #-8]	@ x2, MEM[(const int *)_491 + 20B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:92:         y = ((y) + (a2 * y2));
	mla	r1, ip, r1, r3	@ y, tmp317, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mul	r9, r0, r10	@ _143, tmp309, x2
@ /home/student/seng440/filter/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r3, r1, #0, #14	@ _135, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r3, r3, #0	@ _136, _135,
@ /home/student/seng440/filter/butterworth_unrolled7.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mla	r8, r5, r8, r9	@ y, tmp311, input4, _143
@ /home/student/seng440/filter/butterworth_unrolled7.c:114:         register int input6 = x[i + 6];
	ldr	r6, [r4, #-4]	@ x1, MEM[(const int *)_491 + 24B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r3, #1	@ _136,
@ /home/student/seng440/filter/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r3, r1, asr #14	@ y, _136, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:103:         y = ((y) + (b02_1 * x2));
	add	r7, r7, r8	@ y, _109, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:104:         y = ((y) + (a1 * y1));
	mla	r7, lr, r3, r7	@ y, tmp315, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:105:         y = ((y) + (a2 * y2));
	mla	r7, ip, r2, r7	@ y, tmp317, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mul	r8, r0, r6	@ _160, tmp309, x1
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r7, #0, #14	@ _152, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _153, _152,
@ /home/student/seng440/filter/butterworth_unrolled7.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mla	r1, r5, r10, r8	@ y, tmp311, x2, _160
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r2, #1	@ _153,
@ /home/student/seng440/filter/butterworth_unrolled7.c:116:         y = ((y) + (b02_1 * x2));
	add	r1, fp, r1	@ y, _126, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r7, asr #14	@ y2, _153, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:117:         y = ((y) + (a1 * y1));
	mla	r1, lr, r2, r1	@ y, tmp315, y2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:118:         y = ((y) + (a2 * y2));
	mla	r1, ip, r3, r1	@ y, tmp317, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r3, r1, #0, #14	@ _169, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r3, r3, #0	@ _170, _169,
	movne	r3, #1	@ _170,
@ /home/student/seng440/filter/butterworth_unrolled7.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r3, r1, asr #14	@ y1, _170, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:34:     for (i = 0; i + 6 < sample_count; i += 7) {
	ldr	r1, [sp, #32]	@ _500, %sfp
	cmp	r4, r1	@ ivtmp.25, _500
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	ldr	fp, [sp, #36]	@ tmp492, %sfp
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r7, #13636	@ tmp526,
	movt	r7, 12	@ tmp526,
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	movw	r1, #13640	@ tmp522,
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	add	r7, sp, r7	@ tmp526,, tmp526
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	movt	r1, 12	@ tmp522,
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	ldr	r7, [r7]	@ tmp527, MEM[(const int *)&x + 799988B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	add	r1, sp, r1	@ tmp522,, tmp522
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r7, r0, r7	@ _570, tmp309, tmp527
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r6, r5, r6, r7	@ y, tmp311, x1, _570
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	ldr	r4, [r1]	@ current_input, MEM[(const int *)&x + 799992B]
	movw	r1, #13644	@ tmp524,
@ /home/student/seng440/filter/butterworth_unrolled7.c:131:         y = ((y) + (b02_1 * x2));
	add	r6, r9, r6	@ y, _143, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r9, #13636	@ tmp529,
	movt	r9, 12	@ tmp529,
	add	r9, sp, r9	@ tmp529,, tmp529
@ /home/student/seng440/filter/butterworth_unrolled7.c:132:         y = ((y) + (a1 * y1));
	mla	r6, lr, r3, r6	@ y, tmp315, y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:133:         y = ((y) + (a2 * y2));
	mla	r6, ip, r2, r6	@ y, tmp317, y2, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	ldr	r9, [r9]	@ tmp530, MEM[(const int *)&x + 799988B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r2, r0, r4	@ _540, tmp309, current_input
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r2, r5, r9, r2	@ y, tmp311, tmp530, _540
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r4, r5, r4	@ _182, tmp311, current_input
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r5, r6, #0, #14	@ _556, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r5, r5, #0	@ _555, _556,
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	movt	r1, 12	@ tmp524,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r5, #1	@ _555,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r5, r5, r6, asr #14	@ y, _555, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:131:         y = ((y) + (b02_1 * x2));
	add	r2, r8, r2	@ y, _160, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:132:         y = ((y) + (a1 * y1));
	mla	r2, lr, r5, r2	@ y, tmp315, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	add	r1, sp, r1	@ tmp524,, tmp524
@ /home/student/seng440/filter/butterworth_unrolled7.c:133:         y = ((y) + (a2 * y2));
	mla	r3, ip, r3, r2	@ y, tmp317, y1, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:129:         register int current_input = x[i];
	ldr	r10, [r1]	@ current_input, MEM[(const int *)&x + 799996B]
@ /home/student/seng440/filter/butterworth_unrolled7.c:168:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, fp, #1296	@, tmp492,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _530, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _529, _530,
@ /home/student/seng440/filter/butterworth_unrolled7.c:130:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r4, r0, r10, r4	@ y, tmp309, current_input, _182
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	movne	r2, #1	@ _529,
@ /home/student/seng440/filter/butterworth_unrolled7.c:168:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r0, #1	@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r2, r3, asr #14	@ y_527, _529, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:131:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r7	@ y, y, _570
@ /home/student/seng440/filter/butterworth_unrolled7.c:132:         y = ((y) + (a1 * y1));
	mla	r3, lr, r3, r4	@ y, tmp315, y_527, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:133:         y = ((y) + (a2 * y2));
	mla	r3, ip, r5, r3	@ y, tmp317, y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _194, y,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _195, _194,
	movne	r2, #1	@ _195,
@ /home/student/seng440/filter/butterworth_unrolled7.c:134:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r3, r2, r3, asr #14	@ y, _195, y,
@ /home/student/seng440/filter/butterworth_unrolled7.c:166:     volatile int y = run_IIR(x, N);
	str	r3, [fp, #-1316]	@ y, y
@ /home/student/seng440/filter/butterworth_unrolled7.c:168:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:168:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp496
	bne	.L13		@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:184:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r10	@ int	@ current_input, current_input
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	vldr.64	d17, .L14+32	@ tmp467,
@ /home/student/seng440/filter/butterworth_unrolled7.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [fp, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp442,
@ /home/student/seng440/filter/butterworth_unrolled7.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [fp, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled7.c:184:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, current_input
@ /home/student/seng440/filter/butterworth_unrolled7.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r0, [fp, #-1292]	@ tmp481, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp442,
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp467
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _44, _44, seconds_38, tmp442
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	ldr	r7, .L14+48	@ tmp464,
.LPIC2:
	add	r7, pc, r7	@ tmp464, tmp464
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled7.c:185:         (double)y / (1 << 14)
	ldr	r2, [fp, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp467
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_unrolled7.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [fp, #-1308]	@ tmp483, start.tv_sec
	sbc	r2, r0, r2	@ seconds_38, tmp481, tmp483
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r1, r2, r6	@ tmp448, tmp442, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [fp, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [fp, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r2	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp458, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled7.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp458, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	movw	r3, #65529	@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r6, r2	@ _46, tmp448, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	movw	r2, #17721	@ tmp471,
	movt	r2, 29255	@ tmp471,
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	movt	r3, 16435	@,
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	strd	r2, [sp, #8]	@ tmp471,,
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp497,
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp474,
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled7.c:174:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp497, tmp474
@ /home/student/seng440/filter/butterworth_unrolled7.c:177:     printf(
	mov	r0, r7	@ tmp464, tmp464
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled7.c:189: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1360	@,,
	add	sp, sp, #4	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled7.c:162:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled7.c:163:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled7.c:169:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled7.c:170:         return 1;
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
