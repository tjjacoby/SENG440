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
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:190:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:187: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp266,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:187: {
	subw	sp, sp, #1356	@,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1352	@ tmp501,,
	add	r8, sp, #798720	@ _235,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:191:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp271,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:192:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp273,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:192:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp275,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp277,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	sub	r3, fp, #1280	@ tmp265, tmp501,
	addw	r8, r8, #1348	@ _235, _235,
	mov	r4, r3	@ ivtmp.26, tmp265
	add	r7, r3, #798720	@ tmp502, ivtmp.26,
	str	r2, [r3]	@ tmp266, x[0]
	mov	r6, r3	@ ivtmp.36, ivtmp.26
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:191:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled8.c:190:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:191:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _271, n
@ /home/student/ARM_TEST/butterworth_unrolled8.c:191:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _272, _271, tmp271
@ /home/student/ARM_TEST/butterworth_unrolled8.c:192:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _272, tmp273
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:192:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp504, tmp275
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp277
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp278, _4
	vmov	r3, s0	@ int	@ tmp278, tmp278
	str	r3, [r6, #4]!	@ tmp278, MEM[(int *)_231]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:190:     for (int n = 0; n < N; n++) {
	cmp	r6, r8	@ ivtmp.36, _235
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:202:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, fp, #1312	@, tmp501,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:202:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L12	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp296,
	add	r7, r7, #1280	@ _223, tmp502,
	movt	lr, 65535	@ tmp296,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:32:     register int y2 = 0;
	mov	r1, r0	@ y2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:31:     register int y1 = 0;
	mov	r2, r0	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:30:     register int x2 = 0;
	mov	r9, r0	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:38:         register int y = __QADD(
	movw	ip, #1105	@ tmp284,
	movw	r6, #2210	@ tmp287,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:43:         y = __QADD(y, a1 * y1);
	movw	r5, #18727	@ tmp293,
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:37:         register int input0 = x[i];
	ldr	r3, [r4]	@ input0, MEM[(const int *)_199]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:38:         register int y = __QADD(
	mul	r10, r6, r0	@ _55, tmp287, x1
	mul	r8, ip, r3	@ _53, tmp284, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r8, r10	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:42:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r9, ip, r9	@ _58, tmp284, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r10, r9	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:43:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r5, r2	@ _61, tmp293, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r9, r10	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:44:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _64, tmp296, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r9, r9, r1	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r9, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r9, r9, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:54:         y = __QADD(
	mul	r3, r6, r3	@ _76, tmp287, input0
@ /home/student/ARM_TEST/butterworth_unrolled8.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _67,
	it	ne		@
	orrne	r9, r9, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled8.c:54:         y = __QADD(
	ldr	r1, [r4, #4]	@ tmp512, MEM[(const int *)_199 + 4B]
	mul	r1, ip, r1	@ _75, tmp284, tmp512
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r1, r3	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:58:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r0, ip, r0	@ _78, tmp284, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:59:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r5, r9	@ _80, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:60:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _82, tmp296, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _85,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled8.c:70:         y = __QADD(
	ldrd	r2, r10, [r4, #4]	@ tmp513, input2, ivtmp.26,
	mul	r0, r6, r2	@ _94, tmp287, tmp513
	mul	r2, ip, r10	@ _93, tmp284, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r2, r0	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:75:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r3	@ _97, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r8	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:76:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r9, lr, r9	@ _99, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r9	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r8, r0, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:86:         y = __QADD(
	mul	r10, r6, r10	@ _111, tmp287, input2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r8, #0	@ _102,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled8.c:85:         register int input3 = x[i + 3];
	ldr	r8, [r4, #12]	@ input3, MEM[(const int *)_199 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:86:         y = __QADD(
	mul	r9, ip, r8	@ _110, tmp284, input3
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r9, r10	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r10, r1	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:91:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r5, r0	@ _114, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:92:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _116, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r1, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:102:         y = __QADD(
	mul	r10, r6, r8	@ _128, tmp287, input3
@ /home/student/ARM_TEST/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _119,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _118
@ /home/student/ARM_TEST/butterworth_unrolled8.c:101:         register int input4 = x[i + 4];
	ldr	r3, [r4, #16]	@ input4, MEM[(const int *)_199 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:102:         y = __QADD(
	mul	r8, ip, r3	@ _127, tmp284, input4
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r8, r10	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r10, r2	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:107:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r5, r1	@ _131, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:108:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _133, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:118:         y = __QADD(
	mul	r3, r6, r3	@ _145, tmp287, input4
@ /home/student/ARM_TEST/butterworth_unrolled8.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _136,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _135
@ /home/student/ARM_TEST/butterworth_unrolled8.c:117:         register int input5 = x[i + 5];
	ldr	r0, [r4, #20]	@ input5, MEM[(const int *)_199 + 20B]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:118:         y = __QADD(
	mul	r10, ip, r0	@ _144, tmp284, input5
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r10, r3	@ result, _144, _145
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _110
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:123:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r5, r2	@ _148, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _148
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:124:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _150, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _150
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r3, #0, #14	@ _153, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:133:         register int input6 = x[i + 6];
	ldr	r9, [r4, #24]	@ x2, MEM[(const int *)_199 + 24B]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _152, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:134:         y = __QADD(
	mul	r0, r6, r0	@ _162, tmp287, input5
@ /home/student/ARM_TEST/butterworth_unrolled8.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _153,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _152
@ /home/student/ARM_TEST/butterworth_unrolled8.c:134:         y = __QADD(
	mul	r1, ip, r9	@ _161, tmp284, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, _161, _162
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _127
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:139:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r5, r3	@ _165, tmp293, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _165
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:140:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _167, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r2	@ result, result, _167
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r1, #0, #14	@ _170, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:149:         register int input7 = x[i + 7];
	ldr	r0, [r4, #28]	@ x1, MEM[(const int *)_199 + 28B]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _169, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:150:         y = __QADD(
	mul	r8, r6, r9	@ _179, tmp287, x2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _170,
	it	ne		@
	orrne	r1, r1, #1	@,, y2, _169
@ /home/student/ARM_TEST/butterworth_unrolled8.c:150:         y = __QADD(
	mul	r2, ip, r0	@ _178, tmp284, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8	@ result, _178, _179
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10	@ result, result, _144
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:155:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r8, r5, r1	@ _182, tmp293, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r8	@ result, result, _182
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:156:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _184, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r3	@ result, result, _184
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r2, #0, #14	@ _187, result,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:35:     for (i = 0; i + 7 < sample_count; i += 8) {
	adds	r4, r4, #32	@ ivtmp.26, ivtmp.26,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _186, result,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _187,
	it	ne		@
	orrne	r2, r2, #1	@,, y1, _186
@ /home/student/ARM_TEST/butterworth_unrolled8.c:35:     for (i = 0; i + 7 < sample_count; i += 8) {
	cmp	r4, r7	@ ivtmp.26, _223
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:207:     volatile int y = run_IIR(x, N);
	subw	r6, fp, #1316	@ tmp421, tmp501,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:209:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, fp, #1296	@ tmp422, tmp501,
	mov	r1, r4	@, tmp422
	movs	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:207:     volatile int y = run_IIR(x, N);
	str	r2, [r6]	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:209:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:209:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp506
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:226:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:225:         (double)x[N - 1] / (1 << 14),
	add	r1, fp, #794624	@ tmp475, tmp501,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	vldr.64	d18, .L14+32	@ tmp469,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:226:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled8.c:225:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r1, #4092]	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r2, fp, #1312	@ tmp433, tmp501,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp438,
	movt	r0, 15258	@ tmp438,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:226:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled8.c:225:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	vmul.f64	d17, d17, d18	@ _15, _14, tmp469
@ /home/student/ARM_TEST/butterworth_unrolled8.c:225:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp469
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r2]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r1	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r7, r1, [r4, #4]	@ tmp490, end.tv_nsec, tmp422,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r2, #4]	@ tmp492, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled8.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _45, _45, seconds_39, tmp438
@ /home/student/ARM_TEST/butterworth_unrolled8.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r7, r7, r4	@ seconds_39, tmp490, tmp492
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r4, [r2, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled8.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r7, r6	@ tmp444, tmp438, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r1, #31	@ tmp451, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r4	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
	sbc	r2, r2, r4, asr #31	@ nanoseconds_44, tmp451, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp444, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled8.c:215:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp480,
	ldr	r7, .L14+56	@ tmp466,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:215:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	strd	r2, [sp, #8]	@ tmp480,,
.LPIC2:
	add	r7, pc	@ tmp466
@ /home/student/ARM_TEST/butterworth_unrolled8.c:215:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp507,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:215:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp483,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled8.c:215:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp507, tmp483
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	mov	r0, r7	@ tmp466, tmp466
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:230: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1356	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:203:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:204:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:210:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:211:         return 1;
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
