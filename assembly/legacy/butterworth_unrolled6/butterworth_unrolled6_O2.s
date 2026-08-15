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
@ /home/student/ARM_TEST/butterworth_unrolled6.c:158:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:155: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp265,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:155: {
	subw	sp, sp, #1364	@,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1360	@ tmp506,,
	add	r7, sp, #798720	@ _246,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp270,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp272,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp274,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp276,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	sub	r3, fp, #1280	@ tmp264, tmp506,
	addw	r7, r7, #1356	@ _246, _246,
	mov	r4, r3	@ ivtmp.25, tmp264
	add	r8, r3, #798720	@ tmp507, ivtmp.25,
	str	r2, [r3]	@ tmp265, x[0]
	mov	r6, r3	@ ivtmp.35, ivtmp.25
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled6.c:158:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _227, n
@ /home/student/ARM_TEST/butterworth_unrolled6.c:159:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _228, _227, tmp270
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _228, tmp272
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:160:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp509, tmp274
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp276
@ /home/student/ARM_TEST/butterworth_unrolled6.c:164:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp277, _4
	vmov	r3, s0	@ int	@ tmp277, tmp277
	str	r3, [r6, #4]!	@ tmp277, MEM[(int *)_248]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:158:     for (int n = 0; n < N; n++) {
	cmp	r7, r6	@ _246, ivtmp.35
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, fp, #1312	@, tmp506,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:43:         y = __QADD(y, a1 * y1);
	str	fp, [sp, #36]	@ tmp506, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled6.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp295,
	movt	lr, 65535	@ tmp295,
	add	r8, r8, #1272	@ _252, tmp507,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:32:     register int y2 = 0;
	mov	r3, r0	@ y2, x1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:31:     register int y1 = 0;
	mov	r2, r0	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:30:     register int x2 = 0;
	mov	r7, r0	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:38:         register int y = __QADD(
	movw	ip, #1105	@ tmp283,
	movw	r6, #2210	@ tmp286,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:43:         y = __QADD(y, a1 * y1);
	movw	r5, #18727	@ tmp292,
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:37:         register int input0 = x[i];
	ldr	r10, [r4]	@ input0, MEM[(const int *)_260]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:38:         register int y = __QADD(
	mul	r9, r6, r0	@ _55, tmp286, x1
	mul	r1, ip, r10	@ _53, tmp283, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r1, r9	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:42:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r7, ip, r7	@ _58, tmp283, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r7, r9, r7	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:43:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r2	@ _61, tmp292, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r7, r7, r9	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:44:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _64, tmp295, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r7, r3	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r7, r3, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:53:         register int input1 = x[i + 1];
	ldr	r9, [r4, #4]	@ input1, MEM[(const int *)_260 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:54:         y = __QADD(
	mul	r10, r6, r10	@ _76, tmp286, input0
@ /home/student/ARM_TEST/butterworth_unrolled6.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r7, #0	@ _67,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled6.c:54:         y = __QADD(
	mul	r7, ip, r9	@ _75, tmp283, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r7, r10	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:58:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r0, ip, r0	@ _78, tmp283, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r10, r0	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:59:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r5, r3	@ _80, tmp292, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:60:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _82, tmp295, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r2	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r0, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:70:         y = __QADD(
	mul	r9, r6, r9	@ _94, tmp286, input1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _85,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled6.c:69:         register int input2 = x[i + 2];
	ldr	r2, [r4, #8]	@ input2, MEM[(const int *)_260 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:70:         y = __QADD(
	mul	fp, ip, r2	@ _93, tmp283, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, fp, r9	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r9, r1	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:75:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r0	@ _97, tmp292, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r9	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:76:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _99, tmp295, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r1, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:86:         y = __QADD(
	mul	r2, r6, r2	@ _111, tmp286, input2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _102,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled6.c:85:         register int input3 = x[i + 3];
	ldr	r3, [r4, #12]	@ input3, MEM[(const int *)_260 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:86:         y = __QADD(
	mul	r9, ip, r3	@ _110, tmp283, input3
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r9, r2	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r7	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:91:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r7, r5, r1	@ _114, tmp292, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r7	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:92:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _116, tmp295, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:101:         register int input4 = x[i + 4];
	ldr	r7, [r4, #16]	@ x2, MEM[(const int *)_260 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:102:         y = __QADD(
	mul	r3, r6, r3	@ _128, tmp286, input3
@ /home/student/ARM_TEST/butterworth_unrolled6.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _119,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _118
@ /home/student/ARM_TEST/butterworth_unrolled6.c:102:         y = __QADD(
	mul	r10, ip, r7	@ _127, tmp283, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r10, r3	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:107:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r5, r2	@ _131, tmp292, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:108:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _133, tmp295, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r3, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:117:         register int input5 = x[i + 5];
	ldr	r0, [r4, #20]	@ x1, MEM[(const int *)_260 + 20B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:118:         y = __QADD(
	mul	fp, r6, r7	@ _145, tmp286, x2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _136,
	it	ne		@
	orrne	r3, r3, #1	@,, y2, _135
@ /home/student/ARM_TEST/butterworth_unrolled6.c:118:         y = __QADD(
	mul	r1, ip, r0	@ _144, tmp283, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd fp, r1, fp	@ result, _144, _145
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r9, fp, r9	@ result, result, _110
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:123:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	fp, r5, r3	@ _148, tmp292, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r9, fp	@ result, result, _148
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:124:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _150, tmp295, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r9, r2	@ result, result, _150
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	fp, r2, #0, #14	@ _153, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:35:     for (i = 0; i + 5 < sample_count; i += 6) {
	adds	r4, r4, #24	@ ivtmp.25, ivtmp.25,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _152, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	fp, #0	@ _153,
	it	ne		@
	orrne	r2, r2, #1	@,, y1, _152
@ /home/student/ARM_TEST/butterworth_unrolled6.c:35:     for (i = 0; i + 5 < sample_count; i += 6) {
	cmp	r8, r4	@ _252, ivtmp.25
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	ldr	fp, [sp, #36]	@ tmp506, %sfp
	mul	r0, r6, r0	@ _203, tmp286, x1
@ /home/student/ARM_TEST/butterworth_unrolled6.c:135:         register int current_input = x[i];
	add	r7, fp, #794624	@ tmp388, tmp506,
	add	r7, r7, #2816	@ tmp388, tmp388,
	ldr	r4, [r7, #1272]	@ current_input, MEM[(const int *)&x + 799992B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	mul	r8, ip, r4	@ _210, tmp283, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r8, r0	@ result, _210, _203
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _127
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:141:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r2	@ _189, tmp292, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _189
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:142:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _187, tmp295, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r3	@ result, result, _187
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	.thumb
	.syntax unified
	mul	r4, r6, r4	@ _166, tmp286, current_input
@ /home/student/ARM_TEST/butterworth_unrolled6.c:135:         register int current_input = x[i];
	ldr	r6, [r7, #1276]	@ current_input, MEM[(const int *)&x + 799996B]
@ /home/student/ARM_TEST/butterworth_unrolled6.c:136:         register int y = __QADD(
	mul	r3, ip, r6	@ _164, tmp283, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r4	@ result, _164, _166
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _144
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r0, #0, #14	@ _184, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _185, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _184,
	it	ne		@
	orrne	r0, r0, #1	@,, y_171, _185
@ /home/student/ARM_TEST/butterworth_unrolled6.c:141:         y = __QADD(y, a1 * y1);
	mul	r1, r5, r0	@ _172, tmp292, y_171
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _172
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:142:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _175, tmp295, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _175
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _178, result,,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:175:     volatile int y = run_IIR(x, N);
	subw	r7, fp, #1316	@ tmp433, tmp506,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _177, result,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, fp, #1296	@ tmp434, tmp506,
	mov	r1, r4	@, tmp434
	movs	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _178,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _177
@ /home/student/ARM_TEST/butterworth_unrolled6.c:175:     volatile int y = run_IIR(x, N);
	str	r3, [r7]	@ y, y
@ /home/student/ARM_TEST/butterworth_unrolled6.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp511
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:193:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r6	@ int	@ current_input, current_input
@ /home/student/ARM_TEST/butterworth_unrolled6.c:194:         (double)y / (1 << 14)
	ldr	r3, [r7]	@ y.0_13, y
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	fp, fp, #1312	@ tmp445, tmp506,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	vldr.64	d18, .L14+32	@ tmp481,
	ldr	r7, .L14+56	@ tmp478,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:193:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, current_input
@ /home/student/ARM_TEST/butterworth_unrolled6.c:194:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp485,
.LPIC2:
	add	r7, pc	@ tmp478
	vmul.f64	d16, d16, d18	@ _12, _11, tmp481
@ /home/student/ARM_TEST/butterworth_unrolled6.c:194:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	strd	r2, [sp, #8]	@ tmp485,,
	vmul.f64	d17, d17, d18	@ _15, _14, tmp481
	vstr.64	d16, [sp, #16]	@ _12,
	vstr.64	d17, [sp, #24]	@ _15,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldrd	r3, r6, [r4]	@ end.tv_sec, tmp495, tmp434
	ldr	r1, [fp]	@ start.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r4, #8]	@ end.tv_nsec, end.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r3, r3, r1	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp450,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r4, r0, [fp, #4]	@ tmp497, start.tv_nsec, tmp445,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp450,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r6, r4	@ seconds_39, tmp495, tmp497
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _45, _45, seconds_39, tmp450
	mla	r6, r1, r4, r6	@ tmp456, tmp450, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r1, r2, r0	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp463, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r0, asr #31	@ nanoseconds_44, tmp463, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r1	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp456, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
	mov	r1, r6	@, _47
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp512,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp488,
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled6.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp512, tmp488
@ /home/student/ARM_TEST/butterworth_unrolled6.c:186:     printf(
	mov	r0, r7	@ tmp478, tmp478
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:198: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:171:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:172:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled6.c:178:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled6.c:179:         return 1;
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
