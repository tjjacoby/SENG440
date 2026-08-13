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
	movw	r8, #13644	@ _188,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r8, 12	@ _188,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1360	@,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp291,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:171: {
	sub	sp, sp, #4	@,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	mov	r6, #1	@ n,
	add	r8, sp, r8	@ _188,, _188
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	add	r5, sp, #1360	@ tmp556,,
	mov	r4, r5	@ ivtmp.26, tmp556
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp296,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp298,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp300,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp302,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	str	r3, [r4, #-1280]!	@ tmp291, x[0]
	mov	r7, r4	@ ivtmp.36, ivtmp.26
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r6	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	add	r6, r6, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _250, n
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _251, _250, tmp296
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _251, tmp298
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp558, tmp300
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp302
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp303, _4
	vmov	r3, s0	@ int	@ tmp303, tmp303
	str	r3, [r7, #4]!	@ tmp303, MEM[(int *)_182]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	cmp	r7, r8	@ ivtmp.36, _188
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:186:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r5, #1312	@, tmp556,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:186:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r1, r0, #0	@ x1, tmp559
	bne	.L12		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	str	r5, [sp, #36]	@ tmp556, %sfp
	movw	r3, #13556	@ _60,
	mov	r2, r3	@ _60, _60
@ /home/student/ARM_TEST/butterworth_unrolled7.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp321,
	movt	r2, 12	@ _60,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:32:     register int y2 = 0;
	mov	r3, r1	@ y2, x1
	add	r8, r4, r2	@ _60, ivtmp.26, _60
@ /home/student/ARM_TEST/butterworth_unrolled7.c:30:     register int x2 = 0;
	mov	r0, r1	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:44:         y = __QADD(y, a2 * y2);
	movt	lr, 65535	@ tmp321,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:31:     register int y1 = 0;
	mov	r2, r1	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:38:         register int y = __QADD(
	movw	ip, #1105	@ tmp309,
	movw	r7, #2210	@ tmp312,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	movw	r6, #18727	@ tmp318,
	mov	r5, r8	@ _60, _60
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:37:         register int input0 = x[i];
	ldr	r8, [r4]	@ input0, MEM[(const int *)_3]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:38:         register int y = __QADD(
	mul	r10, r7, r1	@ _55, tmp312, x1
	mul	r9, ip, r8	@ _53, tmp309, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r9, r10	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:42:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r0, ip, r0	@ _58, tmp309, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r0	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r0, r6, r2	@ _61, tmp318, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r0	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:44:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r3, lr, r3	@ _64, tmp321, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r10, r3	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r3, r10, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:53:         register int input1 = x[i + 1];
	ldr	r0, [r4, #4]	@ input1, MEM[(const int *)_3 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r10, r10, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _67,
	orrne	r10, r10, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled7.c:54:         y = __QADD(
	mul	r3, r7, r8	@ _76, tmp312, input0
	mul	r8, ip, r0	@ _75, tmp309, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r8, r3	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:58:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r1, ip, r1	@ _78, tmp309, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:59:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r1, r6, r10	@ _80, tmp318, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:60:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _82, tmp321, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:69:         register int input2 = x[i + 2];
	ldr	r1, [r4, #8]	@ input2, MEM[(const int *)_3 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:70:         y = __QADD(
	mul	r0, r7, r0	@ _94, tmp312, input1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _85,
	orrne	r3, r3, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled7.c:70:         y = __QADD(
	mul	r2, ip, r1	@ _93, tmp309, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r2, r0	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r9	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:75:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r9, r6, r3	@ _97, tmp318, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r9	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:76:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r10, lr, r10	@ _99, tmp321, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r9, r0, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:85:         register int input3 = x[i + 3];
	ldr	r10, [r4, #12]	@ input3, MEM[(const int *)_3 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r0, r0, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:86:         y = __QADD(
	mul	r1, r7, r1	@ _111, tmp312, input2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r9, #0	@ _102,
	orrne	r0, r0, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled7.c:86:         y = __QADD(
	mul	r9, ip, r10	@ _110, tmp309, input3
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r9, r1	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:91:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r8, r6, r0	@ _114, tmp318, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r8	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:92:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r3, lr, r3	@ _116, tmp321, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r3, r1, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r1, r1, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:102:         y = __QADD(
	mul	r10, r7, r10	@ _128, tmp312, input3
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _119,
	orrne	r1, r1, #1	@,, y, _118
@ /home/student/ARM_TEST/butterworth_unrolled7.c:101:         register int input4 = x[i + 4];
	ldr	r3, [r4, #16]	@ input4, MEM[(const int *)_3 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:102:         y = __QADD(
	mul	r8, ip, r3	@ _127, tmp309, input4
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r8, r10	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r10, r2	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:107:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r1	@ _131, tmp318, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r10	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:108:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r0, lr, r0	@ _133, tmp321, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:118:         y = __QADD(
	mul	r3, r7, r3	@ _145, tmp312, input4
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _136,
	orrne	r2, r2, #1	@,, y, _135
@ /home/student/ARM_TEST/butterworth_unrolled7.c:117:         register int input5 = x[i + 5];
	ldr	r0, [r4, #20]	@ x2, MEM[(const int *)_3 + 20B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:118:         y = __QADD(
	mul	r10, ip, r0	@ _144, tmp309, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r10, r3	@ result, _144, _145
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _110
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:123:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r9, r6, r2	@ _148, tmp318, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _148
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:124:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _150, tmp321, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _150
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r1, r3, #0, #14	@ _153, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _152, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:134:         y = __QADD(
	mul	fp, r7, r0	@ _162, tmp312, x2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _153,
	orrne	r3, r3, #1	@,, y2, _152
@ /home/student/ARM_TEST/butterworth_unrolled7.c:133:         register int input6 = x[i + 6];
	ldr	r1, [r4, #24]	@ x1, MEM[(const int *)_3 + 24B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:134:         y = __QADD(
	mul	r9, ip, r1	@ _161, tmp309, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd fp, r9, fp	@ result, _161, _162
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r8, fp, r8	@ result, result, _127
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:139:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	fp, r6, r3	@ _165, tmp318, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r8, r8, fp	@ result, result, _165
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:140:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _167, tmp321, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r8, r2	@ result, result, _167
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	fp, r2, #0, #14	@ _170, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	add	r4, r4, #28	@ ivtmp.26, ivtmp.26,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _169, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	fp, #0	@ _170,
	orrne	r2, r2, #1	@,, y1, _169
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	cmp	r5, r4	@ _60, ivtmp.26
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	ldr	r5, [sp, #36]	@ tmp556, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled7.c:151:         register int current_input = x[i];
	movw	r0, #13636	@ tmp586,
	movt	r0, 12	@ tmp586,
	add	r4, sp, #794624	@ tmp428,,
	add	r0, sp, r0	@ tmp586,, tmp586
	add	r4, r4, #1360	@ tmp428, tmp428,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mul	r1, r7, r1	@ _277, tmp312, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:151:         register int current_input = x[i];
	ldr	r8, [r0]	@ current_input, MEM[(const int *)&x + 799988B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mul	r0, ip, r8	@ _279, tmp309, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r0, r1	@ result, _279, _277
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _144
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:157:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r6, r2	@ _270, tmp318, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _270
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:158:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r3, lr, r3	@ _268, tmp321, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r1, r3	@ result, result, _268
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r10, r3, #0, #14	@ _265, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _266, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mul	r8, r7, r8	@ _243, tmp312, current_input
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r10, #0	@ _265,
	moveq	r1, r3	@, y, _266
	orrne	r1, r3, #1	@,, y, _266
@ /home/student/ARM_TEST/butterworth_unrolled7.c:151:         register int current_input = x[i];
	ldr	r10, [r4, #4088]	@ current_input, MEM[(const int *)&x + 799992B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mul	r3, ip, r10	@ _244, tmp309, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r8	@ result, _244, _243
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _161
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:157:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r8, r6, r1	@ _239, tmp318, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r8	@ result, result, _239
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:158:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _237, tmp321, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, result, _237
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:151:         register int current_input = x[i];
	.arm
	.syntax unified
	ldr	r4, [r4, #4092]	@ current_input, MEM[(const int *)&x + 799996B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mul	r10, r7, r10	@ _183, tmp312, current_input
	mul	r3, ip, r4	@ _181, tmp309, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, _181, _183
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, _279
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _234, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r2, r2, #14	@ _235, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _234,
	orrne	r2, r2, #1	@,, y_231, _235
@ /home/student/ARM_TEST/butterworth_unrolled7.c:157:         y = __QADD(y, a1 * y1);
	mul	r2, r6, r2	@ _189, tmp318, y_231
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _189
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:158:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r1, lr, r1	@ _192, tmp321, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _192
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _195, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r5, #1296	@, tmp556,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _194, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _195,
	orrne	r3, r3, #1	@,, y, _194
@ /home/student/ARM_TEST/butterworth_unrolled7.c:191:     volatile int y = run_IIR(x, N);
	str	r3, [r5, #-1316]	@ y, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r6, r0, #0	@ <retval>, tmp560
	bne	.L13		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r4	@ int	@ current_input, current_input
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	vldr.64	d17, .L14+32	@ tmp531,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp506,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r5, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, current_input
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r5, #-1292]	@ tmp545, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp506,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp531
	ldr	r7, .L14+48	@ tmp528,
.LPIC2:
	add	r7, pc, r7	@ tmp528, tmp528
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:210:         (double)y / (1 << 14)
	ldr	r2, [r5, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp531
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r5, #-1308]	@ tmp547, start.tv_sec
	sbc	r2, r1, r2	@ seconds_39, tmp545, tmp547
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r1, r3, r0	@ _45, _45, seconds_39, tmp506
	mla	r1, r0, r2, r1	@ tmp512, tmp506, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r0, [r5, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r5, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	ip, r0, r2	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp522, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r0, asr #31	@ nanoseconds_44, tmp522, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, ip	@ _47, _45, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	movw	r3, #65529	@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r5, r1, r2	@ _47, tmp512, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	movw	r2, #17721	@ tmp535,
	movt	r2, 29255	@ tmp535,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	movt	r3, 16435	@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	strd	r2, [sp, #8]	@ tmp535,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp561,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp538,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r5	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp561, tmp538
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	mov	r0, r7	@ tmp528, tmp528
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:214: }
	mov	r0, r6	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1360	@,,
	add	sp, sp, #4	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
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
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:187:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:188:         return 1;
	mov	r6, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:194:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:195:         return 1;
	b	.L4		@
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
