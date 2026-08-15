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
	@ args = 0, pretend = 0, frame = 800048
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	movs	r6, #1	@ n,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:171: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp269,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:171: {
	subw	sp, sp, #1364	@,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1360	@ tmp510,,
	add	r4, sp, #798720	@ _60,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L16	@ tmp274,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L16+8	@ tmp276,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L16+16	@ tmp278,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L16+24	@ tmp280,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	sub	r3, fp, #1280	@ tmp268, tmp510,
	addw	r4, r4, #1356	@ _60, _60,
	mov	r5, r3	@ ivtmp.37, tmp268
	add	r9, r3, #798720	@ tmp511, ivtmp.37,
	str	r2, [r3]	@ tmp269, x[0]
	mov	r7, r3	@ ivtmp.46, ivtmp.37
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r6	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	adds	r6, r6, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _250, n
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _251, _250, tmp274
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _251, tmp276
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp513, tmp278
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp280
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp281, _4
	vmov	r3, s0	@ int	@ tmp281, tmp281
	str	r3, [r7, #4]!	@ tmp281, MEM[(int *)_255]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	cmp	r4, r7	@ _60, ivtmp.46
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:186:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, fp, #1312	@, tmp510,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:186:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L14	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	str	r4, [sp, #36]	@ _60, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled7.c:44:         y = __QADD(y, a2 * y2);
	movw	r6, #58773	@ tmp299,
	movt	r6, 65535	@ tmp299,
	addw	r9, r9, #1268	@ _259, tmp511,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:32:     register int y2 = 0;
	mov	r2, r0	@ y2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:31:     register int y1 = 0;
	mov	r1, r0	@ y1, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:30:     register int x2 = 0;
	mov	r3, r0	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:38:         register int y = __QADD(
	movw	lr, #1105	@ tmp287,
	movw	r8, #2210	@ tmp290,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	movw	r7, #18727	@ tmp296,
.L5:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:37:         register int input0 = x[i];
	ldr	r4, [r5]	@ input0, MEM[(const int *)_267]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:38:         register int y = __QADD(
	mul	r10, r8, r0	@ _55, tmp290, x1
	mul	ip, lr, r4	@ _53, tmp287, input0
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, ip, r10	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:42:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _58, tmp287, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r10, r3	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r7, r1	@ _61, tmp296, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:44:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r6, r2	@ _64, tmp299, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _67, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:54:         y = __QADD(
	mul	r10, r8, r4	@ _76, tmp290, input0
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _67,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _66
@ /home/student/ARM_TEST/butterworth_unrolled7.c:53:         register int input1 = x[i + 1];
	ldr	r2, [r5, #4]	@ input1, MEM[(const int *)_267 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:54:         y = __QADD(
	mul	r4, lr, r2	@ _75, tmp287, input1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r10, r4, r10	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:58:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _78, tmp287, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r10, r0	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:59:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r7, r3	@ _80, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:60:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, r6, r1	@ _82, tmp299, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r1	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:70:         y = __QADD(
	.thumb
	.syntax unified
	mul	r1, r8, r2	@ _94, tmp290, input1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r0, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r0, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _85,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _84
@ /home/student/ARM_TEST/butterworth_unrolled7.c:69:         register int input2 = x[i + 2];
	ldr	r2, [r5, #8]	@ input2, MEM[(const int *)_267 + 8B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:70:         y = __QADD(
	mul	r10, lr, r2	@ _93, tmp287, input2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r10, r1	@ result, _93, _94
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, ip	@ result, result, _53
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:75:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r7, r0	@ _97, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, ip	@ result, result, _97
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:76:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, r6, r3	@ _99, tmp299, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r1, r3	@ result, result, _99
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r3, #0, #14	@ _102, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _101, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:86:         y = __QADD(
	mul	r2, r8, r2	@ _111, tmp290, input2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _102,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _101
@ /home/student/ARM_TEST/butterworth_unrolled7.c:85:         register int input3 = x[i + 3];
	ldr	r1, [r5, #12]	@ input3, MEM[(const int *)_267 + 12B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:86:         y = __QADD(
	mul	ip, lr, r1	@ _110, tmp287, input3
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, ip, r2	@ result, _110, _111
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r4	@ result, result, _75
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:91:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r4, r7, r3	@ _114, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r4	@ result, result, _114
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:92:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, r6, r0	@ _116, tmp299, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r2, r0	@ result, result, _116
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _119, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _118, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:102:         y = __QADD(
	mul	r1, r8, r1	@ _128, tmp290, input3
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _119,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _118
@ /home/student/ARM_TEST/butterworth_unrolled7.c:101:         register int input4 = x[i + 4];
	ldr	r0, [r5, #16]	@ input4, MEM[(const int *)_267 + 16B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:102:         y = __QADD(
	mul	r4, lr, r0	@ _127, tmp287, input4
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r4, r1	@ result, _127, _128
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _93
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:107:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r7, r2	@ _131, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r10	@ result, result, _131
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:108:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, r6, r3	@ _133, tmp299, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _133
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r1, #0, #14	@ _136, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _135, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:118:         y = __QADD(
	mul	r10, r8, r0	@ _145, tmp290, input4
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _136,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _135
@ /home/student/ARM_TEST/butterworth_unrolled7.c:117:         register int input5 = x[i + 5];
	ldr	r3, [r5, #20]	@ x2, MEM[(const int *)_267 + 20B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:118:         y = __QADD(
	mul	r0, lr, r3	@ _144, tmp287, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, _144, _145
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _110
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:123:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r7, r1	@ _148, tmp296, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r0, r0, ip	@ result, result, _148
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:124:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r6, r2	@ _150, tmp299, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r0, r2	@ result, result, _150
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _153, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _152, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:134:         y = __QADD(
	mul	r10, r8, r3	@ _162, tmp290, x2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _153,
	it	ne		@
	orrne	r2, r2, #1	@,, y2, _152
@ /home/student/ARM_TEST/butterworth_unrolled7.c:133:         register int input6 = x[i + 6];
	ldr	r0, [r5, #24]	@ x1, MEM[(const int *)_267 + 24B]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:134:         y = __QADD(
	mul	ip, lr, r0	@ _161, tmp287, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r10	@ result, _161, _162
@ 0 "" 2
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r4	@ result, result, _127
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:139:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r4, r7, r2	@ _165, tmp296, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r4	@ result, result, _165
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:140:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, r6, r1	@ _167, tmp299, y
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r1, ip, r1	@ result, result, _167
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r4, r1, #0, #14	@ _170, result,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	adds	r5, r5, #28	@ ivtmp.37, ivtmp.37,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _169, result,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r4, #0	@ _170,
	it	ne		@
	orrne	r1, r1, #1	@,, y1, _169
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	cmp	r9, r5	@ _259, ivtmp.37
	bne	.L5		@,
	ldr	r4, [sp, #36]	@ _60, %sfp
	add	r5, fp, #794624	@ ivtmp.27, tmp510,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:158:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp421,
	mov	r6, r3	@ x2, x2
	movt	lr, 65535	@ tmp421,
	add	r5, r5, #4080	@ ivtmp.27, ivtmp.27,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	movw	r7, #1105	@ tmp410,
	movw	r9, #2210	@ tmp412,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:157:         y = __QADD(y, a1 * y1);
	movw	r8, #18727	@ tmp418,
	mov	r3, r2	@ y2, y2
.L6:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:151:         register int current_input = x[i];
	ldr	r2, [r5, #4]!	@ current_input, MEM[(const int *)_273]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mul	r10, r9, r0	@ _183, tmp412, x1
	mul	ip, r7, r2	@ _181, tmp410, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd ip, ip, r10	@ result, _181, _183
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:156:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r6, r7, r6	@ _186, tmp410, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r6, ip, r6	@ result, result, _186
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:157:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	ip, r8, r1	@ _189, tmp418, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r6, r6, ip	@ result, result, _189
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:158:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _192, tmp421, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r6, r3	@ result, result, _192
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	ip, r3, #0, #14	@ _195, result,,
	mov	r6, r0	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r10, r3, #14	@ _194, result,
	mov	r0, r2	@ x1, current_input
	mov	r3, r1	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _195,
	it	ne		@
	orrne	r10, r10, #1	@,, y, _194
@ /home/student/ARM_TEST/butterworth_unrolled7.c:150:     for (; i < sample_count; i++) {
	cmp	r4, r5	@ _60, ivtmp.27
	mov	r1, r10	@ y1, y
	bne	.L6		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:191:     volatile int y = run_IIR(x, N);
	subw	r6, fp, #1316	@ tmp430, tmp510,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, fp, #1296	@ tmp431, tmp510,
	mov	r1, r4	@, tmp431
	movs	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:191:     volatile int y = run_IIR(x, N);
	str	r10, [r6]	@ y, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp515
	cmp	r0, #0	@ <retval>
	bne	.L15	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:210:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	add	r2, fp, #794624	@ tmp484, tmp510,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	vldr.64	d18, .L16+32	@ tmp478,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:210:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	fp, fp, #1312	@ tmp442, tmp510,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	ldr	r7, .L16+56	@ tmp475,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp447,
	movt	r0, 15258	@ tmp447,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:210:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
.LPIC2:
	add	r7, pc	@ tmp475
	vmul.f64	d17, d17, d18	@ _15, _14, tmp478
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp478
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	ldr	r2, [fp]	@ start.tv_sec, start.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp499, end.tv_nsec, tmp431,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [fp, #4]	@ tmp501, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _45, _45, seconds_39, tmp447
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_39, tmp499, tmp501
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [fp, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp453, tmp447, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp460, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_44, tmp460, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp453, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	adr	r3, .L16+48	@,
	ldrd	r2, [r3]	@ tmp489,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	strd	r2, [sp, #8]	@ tmp489,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp516,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L16+40	@ tmp492,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp516, tmp492
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	mov	r0, r7	@ tmp475, tmp475
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:214: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L14:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:187:         perror("Unable to start benchmark timer");
	ldr	r0, .L16+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:188:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L15:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:194:         perror("Unable to stop benchmark timer");
	ldr	r0, .L16+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:195:         return 1;
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
