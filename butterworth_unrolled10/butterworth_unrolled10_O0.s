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
	.eabi_attribute 30, 6	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"butterworth_unrolled10.c"
@ GNU C17 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O0
	.text
	.section	.rodata
	.align	2
	.type	b02_1, %object
	.size	b02_1, 4
b02_1:
	.word	1105
	.align	2
	.type	a1, %object
	.size	a1, 4
a1:
	.word	18727
	.align	2
	.type	a2, %object
	.size	a2, 4
a2:
	.word	-6763
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	elapsed_nanoseconds, %function
elapsed_nanoseconds:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10, fp}	@
	sub	sp, sp, #48	@,,
	add	r7, sp, #0	@,,
	str	r0, [r7, #28]	@ start, start
	str	r1, [r7, #24]	@ end, end
@ /home/student/ARM_TEST/butterworth_unrolled10.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled10.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled10.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled10.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/ARM_TEST/butterworth_unrolled10.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled10.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/ARM_TEST/butterworth_unrolled10.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldr	r2, [r7, #44]	@ tmp133, seconds
	mov	r3, #51712	@ tmp134,
	movt	r3, 15258	@ tmp134,
	mul	r2, r3, r2	@ tmp132, tmp134, tmp133
	ldr	r3, [r7, #40]	@ tmp136, seconds
	movs	r1, #0	@ tmp137,
	mul	r3, r1, r3	@ tmp135, tmp137, tmp136
	add	r2, r2, r3	@ tmp138, tmp135
	ldr	r1, [r7, #40]	@ tmp139, seconds
	mov	r3, #51712	@ tmp140,
	movt	r3, 15258	@ tmp140,
	umull	r4, r5, r1, r3	@ _7, _7, tmp139, tmp140
	adds	r3, r2, r5	@ tmp141, tmp138, _7
	mov	r5, r3	@ _7, tmp141
@ /home/student/ARM_TEST/butterworth_unrolled10.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled10.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:25: }
	mov	r0, r2	@, <retval>
	mov	r1, r3	@, <retval>
	adds	r7, r7, #48	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp}	@
	bx	lr	@
	.size	elapsed_nanoseconds, .-elapsed_nanoseconds
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	run_IIR, %function
run_IIR:
	@ args = 0, pretend = 0, frame = 536
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}	@
	sub	sp, sp, #540	@,,
	add	r7, sp, #0	@,,
	add	r3, r7, #536	@ tmp386,,
	sub	r3, r3, #532	@ tmp388, tmp386,
	str	r0, [r3]	@ x, x
	add	r3, r7, #536	@ tmp389,,
	sub	r3, r3, #536	@ tmp391, tmp389,
	str	r1, [r3]	@ sample_count, sample_count
@ /home/student/ARM_TEST/butterworth_unrolled10.c:29:     register int x1 = 0;
	movs	r6, #0	@ x1,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:30:     register int x2 = 0;
	mov	r8, #0	@ x2,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:31:     register int y1 = 0;
	movs	r5, #0	@ y1,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:32:     register int y2 = 0;
	mov	r9, #0	@ y2,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:35:     for (i = 0; i + 9 < sample_count; i += 10) {
	mov	r10, #0	@ i,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:35:     for (i = 0; i + 9 < sample_count; i += 10) {
	b	.L4		@
.L45:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:37:         register int input0 = x[i];
	mov	r3, r10	@ i.0_1, i
	lsls	r3, r3, #2	@ _2, i.0_1,
	add	r2, r7, #536	@ tmp392,,
	sub	r2, r2, #532	@ tmp394, tmp392,
	ldr	r2, [r2]	@ tmp395, x
	add	r3, r3, r2	@ _3, tmp395
@ /home/student/ARM_TEST/butterworth_unrolled10.c:37:         register int input0 = x[i];
	ldr	r0, [r3]	@ input0, *_3
@ /home/student/ARM_TEST/butterworth_unrolled10.c:38:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.1_4,
	mul	r1, r3, r0	@ _5, b02_1.1_4, input0
@ /home/student/ARM_TEST/butterworth_unrolled10.c:40:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.2_6,
	lsls	r3, r3, #1	@ _7, b02_1.2_6,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:38:         register int y = __QADD(
	mul	r2, r3, r6	@ _8, _7, x1
	add	r3, r7, #536	@ tmp396,,
	sub	r3, r3, #472	@ tmp398, tmp396,
	str	r1, [r3]	@ _5, first
	add	r3, r7, #536	@ tmp399,,
	sub	r3, r3, #476	@ tmp401, tmp399,
	str	r2, [r3]	@ _8, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp406,,
	sub	r3, r3, #472	@ tmp408, tmp406,
	ldr	r3, [r3]	@ tmp409, first
	add	r2, r7, #536	@ tmp410,,
	sub	r2, r2, #476	@ tmp412, tmp410,
	ldr	r2, [r2]	@ tmp413, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp409, tmp413
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp403,,
	sub	r3, r3, #480	@ tmp405, tmp403,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp414,,
	sub	r3, r3, #480	@ tmp416, tmp414,
	ldr	r3, [r3]	@ D.8007, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:38:         register int y = __QADD(
	mov	r4, r3	@ y, D.8007
@ /home/student/ARM_TEST/butterworth_unrolled10.c:42:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.3_9,
	mul	r2, r3, r8	@ _10, b02_1.3_9, x2
	add	r3, r7, #536	@ tmp417,,
	sub	r3, r3, #460	@ tmp419, tmp417,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp420,,
	sub	r3, r3, #464	@ tmp422, tmp420,
	str	r2, [r3]	@ _10, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp427,,
	sub	r3, r3, #460	@ tmp429, tmp427,
	ldr	r3, [r3]	@ tmp430, first
	add	r2, r7, #536	@ tmp431,,
	sub	r2, r2, #464	@ tmp433, tmp431,
	ldr	r2, [r2]	@ tmp434, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp430, tmp434
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp424,,
	sub	r3, r3, #468	@ tmp426, tmp424,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp435,,
	sub	r3, r3, #468	@ tmp437, tmp435,
	ldr	r3, [r3]	@ D.8001, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:42:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8001
@ /home/student/ARM_TEST/butterworth_unrolled10.c:43:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.4_11,
	mul	r2, r3, r5	@ _12, a1.4_11, y1
	add	r3, r7, #536	@ tmp438,,
	sub	r3, r3, #448	@ tmp440, tmp438,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp441,,
	sub	r3, r3, #452	@ tmp443, tmp441,
	str	r2, [r3]	@ _12, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp448,,
	sub	r3, r3, #448	@ tmp450, tmp448,
	ldr	r3, [r3]	@ tmp451, first
	add	r2, r7, #536	@ tmp452,,
	sub	r2, r2, #452	@ tmp454, tmp452,
	ldr	r2, [r2]	@ tmp455, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp451, tmp455
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp445,,
	sub	r3, r3, #456	@ tmp447, tmp445,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp456,,
	sub	r3, r3, #456	@ tmp458, tmp456,
	ldr	r3, [r3]	@ D.7995, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:43:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7995
@ /home/student/ARM_TEST/butterworth_unrolled10.c:44:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.5_13,
	movt	r3, 65535	@ a2.5_13,
	mul	r2, r3, r9	@ _14, a2.5_13, y2
	add	r3, r7, #536	@ tmp459,,
	sub	r3, r3, #436	@ tmp461, tmp459,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp462,,
	sub	r3, r3, #440	@ tmp464, tmp462,
	str	r2, [r3]	@ _14, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp469,,
	sub	r3, r3, #436	@ tmp471, tmp469,
	ldr	r3, [r3]	@ tmp472, first
	add	r2, r7, #536	@ tmp473,,
	sub	r2, r2, #440	@ tmp475, tmp473,
	ldr	r2, [r2]	@ tmp476, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp472, tmp476
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp466,,
	sub	r3, r3, #444	@ tmp468, tmp466,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp477,,
	sub	r3, r3, #444	@ tmp479, tmp477,
	ldr	r3, [r3]	@ D.7989, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:44:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7989
@ /home/student/ARM_TEST/butterworth_unrolled10.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp481,
	moveq	r2, #0	@ tmp481,
	uxtb	r2, r2	@ _17, _17
@ /home/student/ARM_TEST/butterworth_unrolled10.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/ARM_TEST/butterworth_unrolled10.c:47:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:48:         x1 = input0;
	mov	r6, r0	@ x1, input0
@ /home/student/ARM_TEST/butterworth_unrolled10.c:49:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:50:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:53:         register int input1 = x[i + 1];
	mov	r3, r10	@ i.6_19, i
	adds	r3, r3, #1	@ _20, i.6_19,
	lsls	r3, r3, #2	@ _21, _20,
	add	r2, r7, #536	@ tmp482,,
	sub	r2, r2, #532	@ tmp484, tmp482,
	ldr	r2, [r2]	@ tmp485, x
	add	r3, r3, r2	@ _22, tmp485
@ /home/student/ARM_TEST/butterworth_unrolled10.c:53:         register int input1 = x[i + 1];
	ldr	r0, [r3]	@ input1, *_22
@ /home/student/ARM_TEST/butterworth_unrolled10.c:54:         y = __QADD(
	movw	r3, #1105	@ b02_1.7_23,
	mul	r1, r3, r0	@ _24, b02_1.7_23, input1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:56:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.8_25,
	lsls	r3, r3, #1	@ _26, b02_1.8_25,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:54:         y = __QADD(
	mul	r2, r3, r6	@ _27, _26, x1
	add	r3, r7, #536	@ tmp486,,
	sub	r3, r3, #424	@ tmp488, tmp486,
	str	r1, [r3]	@ _24, first
	add	r3, r7, #536	@ tmp489,,
	sub	r3, r3, #428	@ tmp491, tmp489,
	str	r2, [r3]	@ _27, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp496,,
	sub	r3, r3, #424	@ tmp498, tmp496,
	ldr	r3, [r3]	@ tmp499, first
	add	r2, r7, #536	@ tmp500,,
	sub	r2, r2, #428	@ tmp502, tmp500,
	ldr	r2, [r2]	@ tmp503, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp499, tmp503
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp493,,
	sub	r3, r3, #432	@ tmp495, tmp493,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp504,,
	sub	r3, r3, #432	@ tmp506, tmp504,
	ldr	r3, [r3]	@ D.7983, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:54:         y = __QADD(
	mov	r4, r3	@ y, D.7983
@ /home/student/ARM_TEST/butterworth_unrolled10.c:58:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.9_28,
	mul	r2, r3, r8	@ _29, b02_1.9_28, x2
	add	r3, r7, #536	@ tmp507,,
	sub	r3, r3, #412	@ tmp509, tmp507,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp510,,
	sub	r3, r3, #416	@ tmp512, tmp510,
	str	r2, [r3]	@ _29, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp517,,
	sub	r3, r3, #412	@ tmp519, tmp517,
	ldr	r3, [r3]	@ tmp520, first
	add	r2, r7, #536	@ tmp521,,
	sub	r2, r2, #416	@ tmp523, tmp521,
	ldr	r2, [r2]	@ tmp524, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp520, tmp524
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp514,,
	sub	r3, r3, #420	@ tmp516, tmp514,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp525,,
	sub	r3, r3, #420	@ tmp527, tmp525,
	ldr	r3, [r3]	@ D.7977, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:58:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7977
@ /home/student/ARM_TEST/butterworth_unrolled10.c:59:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.10_30,
	mul	r2, r3, r5	@ _31, a1.10_30, y1
	add	r3, r7, #536	@ tmp528,,
	sub	r3, r3, #400	@ tmp530, tmp528,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp531,,
	sub	r3, r3, #404	@ tmp533, tmp531,
	str	r2, [r3]	@ _31, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp538,,
	sub	r3, r3, #400	@ tmp540, tmp538,
	ldr	r3, [r3]	@ tmp541, first
	add	r2, r7, #536	@ tmp542,,
	sub	r2, r2, #404	@ tmp544, tmp542,
	ldr	r2, [r2]	@ tmp545, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp541, tmp545
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp535,,
	sub	r3, r3, #408	@ tmp537, tmp535,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp546,,
	sub	r3, r3, #408	@ tmp548, tmp546,
	ldr	r3, [r3]	@ D.7971, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:59:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7971
@ /home/student/ARM_TEST/butterworth_unrolled10.c:60:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.11_32,
	movt	r3, 65535	@ a2.11_32,
	mul	r2, r3, r9	@ _33, a2.11_32, y2
	add	r3, r7, #536	@ tmp549,,
	sub	r3, r3, #388	@ tmp551, tmp549,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp552,,
	sub	r3, r3, #392	@ tmp554, tmp552,
	str	r2, [r3]	@ _33, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp559,,
	sub	r3, r3, #388	@ tmp561, tmp559,
	ldr	r3, [r3]	@ tmp562, first
	add	r2, r7, #536	@ tmp563,,
	sub	r2, r2, #392	@ tmp565, tmp563,
	ldr	r2, [r2]	@ tmp566, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp562, tmp566
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp556,,
	sub	r3, r3, #396	@ tmp558, tmp556,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp567,,
	sub	r3, r3, #396	@ tmp569, tmp567,
	ldr	r3, [r3]	@ D.7965, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:60:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7965
@ /home/student/ARM_TEST/butterworth_unrolled10.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp571,
	moveq	r2, #0	@ tmp571,
	uxtb	r2, r2	@ _36, _36
@ /home/student/ARM_TEST/butterworth_unrolled10.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/ARM_TEST/butterworth_unrolled10.c:63:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:64:         x1 = input1;
	mov	r6, r0	@ x1, input1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:65:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:66:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:69:         register int input2 = x[i + 2];
	mov	r3, r10	@ i.12_38, i
	adds	r3, r3, #2	@ _39, i.12_38,
	lsls	r3, r3, #2	@ _40, _39,
	add	r2, r7, #536	@ tmp572,,
	sub	r2, r2, #532	@ tmp574, tmp572,
	ldr	r2, [r2]	@ tmp575, x
	add	r3, r3, r2	@ _41, tmp575
@ /home/student/ARM_TEST/butterworth_unrolled10.c:69:         register int input2 = x[i + 2];
	ldr	r0, [r3]	@ input2, *_41
@ /home/student/ARM_TEST/butterworth_unrolled10.c:70:         y = __QADD(
	movw	r3, #1105	@ b02_1.13_42,
	mul	r1, r3, r0	@ _43, b02_1.13_42, input2
@ /home/student/ARM_TEST/butterworth_unrolled10.c:72:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.14_44,
	lsls	r3, r3, #1	@ _45, b02_1.14_44,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:70:         y = __QADD(
	mul	r2, r3, r6	@ _46, _45, x1
	add	r3, r7, #536	@ tmp576,,
	sub	r3, r3, #376	@ tmp578, tmp576,
	str	r1, [r3]	@ _43, first
	add	r3, r7, #536	@ tmp579,,
	sub	r3, r3, #380	@ tmp581, tmp579,
	str	r2, [r3]	@ _46, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp586,,
	sub	r3, r3, #376	@ tmp588, tmp586,
	ldr	r3, [r3]	@ tmp589, first
	add	r2, r7, #536	@ tmp590,,
	sub	r2, r2, #380	@ tmp592, tmp590,
	ldr	r2, [r2]	@ tmp593, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp589, tmp593
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp583,,
	sub	r3, r3, #384	@ tmp585, tmp583,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp594,,
	sub	r3, r3, #384	@ tmp596, tmp594,
	ldr	r3, [r3]	@ D.7959, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:70:         y = __QADD(
	mov	r4, r3	@ y, D.7959
@ /home/student/ARM_TEST/butterworth_unrolled10.c:74:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.15_47,
	mul	r2, r3, r8	@ _48, b02_1.15_47, x2
	add	r3, r7, #536	@ tmp597,,
	sub	r3, r3, #364	@ tmp599, tmp597,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp600,,
	sub	r3, r3, #368	@ tmp602, tmp600,
	str	r2, [r3]	@ _48, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp607,,
	sub	r3, r3, #364	@ tmp609, tmp607,
	ldr	r3, [r3]	@ tmp610, first
	add	r2, r7, #536	@ tmp611,,
	sub	r2, r2, #368	@ tmp613, tmp611,
	ldr	r2, [r2]	@ tmp614, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp610, tmp614
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp604,,
	sub	r3, r3, #372	@ tmp606, tmp604,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp615,,
	sub	r3, r3, #372	@ tmp617, tmp615,
	ldr	r3, [r3]	@ D.7953, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:74:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7953
@ /home/student/ARM_TEST/butterworth_unrolled10.c:75:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.16_49,
	mul	r2, r3, r5	@ _50, a1.16_49, y1
	add	r3, r7, #536	@ tmp618,,
	sub	r3, r3, #352	@ tmp620, tmp618,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp621,,
	sub	r3, r3, #356	@ tmp623, tmp621,
	str	r2, [r3]	@ _50, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp628,,
	sub	r3, r3, #352	@ tmp630, tmp628,
	ldr	r3, [r3]	@ tmp631, first
	add	r2, r7, #536	@ tmp632,,
	sub	r2, r2, #356	@ tmp634, tmp632,
	ldr	r2, [r2]	@ tmp635, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp631, tmp635
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp625,,
	sub	r3, r3, #360	@ tmp627, tmp625,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp636,,
	sub	r3, r3, #360	@ tmp638, tmp636,
	ldr	r3, [r3]	@ D.7947, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:75:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7947
@ /home/student/ARM_TEST/butterworth_unrolled10.c:76:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.17_51,
	movt	r3, 65535	@ a2.17_51,
	mul	r2, r3, r9	@ _52, a2.17_51, y2
	add	r3, r7, #536	@ tmp639,,
	sub	r3, r3, #340	@ tmp641, tmp639,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp642,,
	sub	r3, r3, #344	@ tmp644, tmp642,
	str	r2, [r3]	@ _52, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp649,,
	sub	r3, r3, #340	@ tmp651, tmp649,
	ldr	r3, [r3]	@ tmp652, first
	add	r2, r7, #536	@ tmp653,,
	sub	r2, r2, #344	@ tmp655, tmp653,
	ldr	r2, [r2]	@ tmp656, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp652, tmp656
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp646,,
	sub	r3, r3, #348	@ tmp648, tmp646,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp657,,
	sub	r3, r3, #348	@ tmp659, tmp657,
	ldr	r3, [r3]	@ D.7941, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:76:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7941
@ /home/student/ARM_TEST/butterworth_unrolled10.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp661,
	moveq	r2, #0	@ tmp661,
	uxtb	r2, r2	@ _55, _55
@ /home/student/ARM_TEST/butterworth_unrolled10.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/ARM_TEST/butterworth_unrolled10.c:79:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:80:         x1 = input2;
	mov	r6, r0	@ x1, input2
@ /home/student/ARM_TEST/butterworth_unrolled10.c:81:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:82:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:85:         register int input3 = x[i + 3];
	mov	r3, r10	@ i.18_57, i
	adds	r3, r3, #3	@ _58, i.18_57,
	lsls	r3, r3, #2	@ _59, _58,
	add	r2, r7, #536	@ tmp662,,
	sub	r2, r2, #532	@ tmp664, tmp662,
	ldr	r2, [r2]	@ tmp665, x
	add	r3, r3, r2	@ _60, tmp665
@ /home/student/ARM_TEST/butterworth_unrolled10.c:85:         register int input3 = x[i + 3];
	ldr	r0, [r3]	@ input3, *_60
@ /home/student/ARM_TEST/butterworth_unrolled10.c:86:         y = __QADD(
	movw	r3, #1105	@ b02_1.19_61,
	mul	r1, r3, r0	@ _62, b02_1.19_61, input3
@ /home/student/ARM_TEST/butterworth_unrolled10.c:88:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.20_63,
	lsls	r3, r3, #1	@ _64, b02_1.20_63,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:86:         y = __QADD(
	mul	r2, r3, r6	@ _65, _64, x1
	add	r3, r7, #536	@ tmp666,,
	sub	r3, r3, #328	@ tmp668, tmp666,
	str	r1, [r3]	@ _62, first
	add	r3, r7, #536	@ tmp669,,
	sub	r3, r3, #332	@ tmp671, tmp669,
	str	r2, [r3]	@ _65, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp676,,
	sub	r3, r3, #328	@ tmp678, tmp676,
	ldr	r3, [r3]	@ tmp679, first
	add	r2, r7, #536	@ tmp680,,
	sub	r2, r2, #332	@ tmp682, tmp680,
	ldr	r2, [r2]	@ tmp683, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp679, tmp683
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp673,,
	sub	r3, r3, #336	@ tmp675, tmp673,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp684,,
	sub	r3, r3, #336	@ tmp686, tmp684,
	ldr	r3, [r3]	@ D.7935, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:86:         y = __QADD(
	mov	r4, r3	@ y, D.7935
@ /home/student/ARM_TEST/butterworth_unrolled10.c:90:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.21_66,
	mul	r2, r3, r8	@ _67, b02_1.21_66, x2
	add	r3, r7, #536	@ tmp687,,
	sub	r3, r3, #316	@ tmp689, tmp687,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp690,,
	sub	r3, r3, #320	@ tmp692, tmp690,
	str	r2, [r3]	@ _67, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp697,,
	sub	r3, r3, #316	@ tmp699, tmp697,
	ldr	r3, [r3]	@ tmp700, first
	add	r2, r7, #536	@ tmp701,,
	sub	r2, r2, #320	@ tmp703, tmp701,
	ldr	r2, [r2]	@ tmp704, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp700, tmp704
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp694,,
	sub	r3, r3, #324	@ tmp696, tmp694,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp705,,
	sub	r3, r3, #324	@ tmp707, tmp705,
	ldr	r3, [r3]	@ D.7929, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:90:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7929
@ /home/student/ARM_TEST/butterworth_unrolled10.c:91:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.22_68,
	mul	r2, r3, r5	@ _69, a1.22_68, y1
	add	r3, r7, #536	@ tmp708,,
	sub	r3, r3, #304	@ tmp710, tmp708,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp711,,
	sub	r3, r3, #308	@ tmp713, tmp711,
	str	r2, [r3]	@ _69, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp718,,
	sub	r3, r3, #304	@ tmp720, tmp718,
	ldr	r3, [r3]	@ tmp721, first
	add	r2, r7, #536	@ tmp722,,
	sub	r2, r2, #308	@ tmp724, tmp722,
	ldr	r2, [r2]	@ tmp725, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp721, tmp725
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp715,,
	sub	r3, r3, #312	@ tmp717, tmp715,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp726,,
	sub	r3, r3, #312	@ tmp728, tmp726,
	ldr	r3, [r3]	@ D.7923, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:91:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7923
@ /home/student/ARM_TEST/butterworth_unrolled10.c:92:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.23_70,
	movt	r3, 65535	@ a2.23_70,
	mul	r2, r3, r9	@ _71, a2.23_70, y2
	add	r3, r7, #536	@ tmp729,,
	sub	r3, r3, #292	@ tmp731, tmp729,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp732,,
	sub	r3, r3, #296	@ tmp734, tmp732,
	str	r2, [r3]	@ _71, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp739,,
	sub	r3, r3, #292	@ tmp741, tmp739,
	ldr	r3, [r3]	@ tmp742, first
	add	r2, r7, #536	@ tmp743,,
	sub	r2, r2, #296	@ tmp745, tmp743,
	ldr	r2, [r2]	@ tmp746, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp742, tmp746
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp736,,
	sub	r3, r3, #300	@ tmp738, tmp736,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp747,,
	sub	r3, r3, #300	@ tmp749, tmp747,
	ldr	r3, [r3]	@ D.7917, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:92:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7917
@ /home/student/ARM_TEST/butterworth_unrolled10.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _72, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _73, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _73,
	ite	ne
	movne	r2, #1	@ tmp751,
	moveq	r2, #0	@ tmp751,
	uxtb	r2, r2	@ _74, _74
@ /home/student/ARM_TEST/butterworth_unrolled10.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _72, _75
@ /home/student/ARM_TEST/butterworth_unrolled10.c:95:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:96:         x1 = input3;
	mov	r6, r0	@ x1, input3
@ /home/student/ARM_TEST/butterworth_unrolled10.c:97:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:98:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:101:         register int input4 = x[i + 4];
	mov	r3, r10	@ i.24_76, i
	adds	r3, r3, #4	@ _77, i.24_76,
	lsls	r3, r3, #2	@ _78, _77,
	add	r2, r7, #536	@ tmp752,,
	sub	r2, r2, #532	@ tmp754, tmp752,
	ldr	r2, [r2]	@ tmp755, x
	add	r3, r3, r2	@ _79, tmp755
@ /home/student/ARM_TEST/butterworth_unrolled10.c:101:         register int input4 = x[i + 4];
	ldr	r0, [r3]	@ input4, *_79
@ /home/student/ARM_TEST/butterworth_unrolled10.c:102:         y = __QADD(
	movw	r3, #1105	@ b02_1.25_80,
	mul	r1, r3, r0	@ _81, b02_1.25_80, input4
@ /home/student/ARM_TEST/butterworth_unrolled10.c:104:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.26_82,
	lsls	r3, r3, #1	@ _83, b02_1.26_82,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:102:         y = __QADD(
	mul	r2, r3, r6	@ _84, _83, x1
	add	r3, r7, #536	@ tmp756,,
	sub	r3, r3, #280	@ tmp758, tmp756,
	str	r1, [r3]	@ _81, first
	add	r3, r7, #536	@ tmp759,,
	sub	r3, r3, #284	@ tmp761, tmp759,
	str	r2, [r3]	@ _84, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp766,,
	sub	r3, r3, #280	@ tmp768, tmp766,
	ldr	r3, [r3]	@ tmp769, first
	add	r2, r7, #536	@ tmp770,,
	sub	r2, r2, #284	@ tmp772, tmp770,
	ldr	r2, [r2]	@ tmp773, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp769, tmp773
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp763,,
	sub	r3, r3, #288	@ tmp765, tmp763,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp774,,
	sub	r3, r3, #288	@ tmp776, tmp774,
	ldr	r3, [r3]	@ D.7911, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:102:         y = __QADD(
	mov	r4, r3	@ y, D.7911
@ /home/student/ARM_TEST/butterworth_unrolled10.c:106:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.27_85,
	mul	r2, r3, r8	@ _86, b02_1.27_85, x2
	add	r3, r7, #536	@ tmp777,,
	sub	r3, r3, #268	@ tmp779, tmp777,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp780,,
	sub	r3, r3, #272	@ tmp782, tmp780,
	str	r2, [r3]	@ _86, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp787,,
	sub	r3, r3, #268	@ tmp789, tmp787,
	ldr	r3, [r3]	@ tmp790, first
	add	r2, r7, #536	@ tmp791,,
	sub	r2, r2, #272	@ tmp793, tmp791,
	ldr	r2, [r2]	@ tmp794, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp790, tmp794
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp784,,
	sub	r3, r3, #276	@ tmp786, tmp784,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp795,,
	sub	r3, r3, #276	@ tmp797, tmp795,
	ldr	r3, [r3]	@ D.7905, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:106:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7905
@ /home/student/ARM_TEST/butterworth_unrolled10.c:107:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.28_87,
	mul	r2, r3, r5	@ _88, a1.28_87, y1
	add	r3, r7, #536	@ tmp798,,
	sub	r3, r3, #256	@ tmp800, tmp798,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp801,,
	sub	r3, r3, #260	@ tmp803, tmp801,
	str	r2, [r3]	@ _88, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp808,,
	sub	r3, r3, #256	@ tmp810, tmp808,
	ldr	r3, [r3]	@ tmp811, first
	add	r2, r7, #536	@ tmp812,,
	sub	r2, r2, #260	@ tmp814, tmp812,
	ldr	r2, [r2]	@ tmp815, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp811, tmp815
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp805,,
	sub	r3, r3, #264	@ tmp807, tmp805,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp816,,
	sub	r3, r3, #264	@ tmp818, tmp816,
	ldr	r3, [r3]	@ D.7899, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:107:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7899
@ /home/student/ARM_TEST/butterworth_unrolled10.c:108:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.29_89,
	movt	r3, 65535	@ a2.29_89,
	mul	r3, r3, r9	@ _90, a2.29_89, y2
	str	r4, [r7, #292]	@ y, first
	str	r3, [r7, #288]	@ _90, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #292]	@ tmp820, first
	ldr	r2, [r7, #288]	@ tmp821, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp820, tmp821
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #284]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #284]	@ D.7893, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:108:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7893
@ /home/student/ARM_TEST/butterworth_unrolled10.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _91, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _92, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _92,
	ite	ne
	movne	r2, #1	@ tmp823,
	moveq	r2, #0	@ tmp823,
	uxtb	r2, r2	@ _93, _93
@ /home/student/ARM_TEST/butterworth_unrolled10.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _91, _94
@ /home/student/ARM_TEST/butterworth_unrolled10.c:111:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:112:         x1 = input4;
	mov	r6, r0	@ x1, input4
@ /home/student/ARM_TEST/butterworth_unrolled10.c:113:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:114:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:117:         register int input5 = x[i + 5];
	mov	r3, r10	@ i.30_95, i
	adds	r3, r3, #5	@ _96, i.30_95,
	lsls	r3, r3, #2	@ _97, _96,
	add	r2, r7, #536	@ tmp824,,
	sub	r2, r2, #532	@ tmp826, tmp824,
	ldr	r2, [r2]	@ tmp827, x
	add	r3, r3, r2	@ _98, tmp827
@ /home/student/ARM_TEST/butterworth_unrolled10.c:117:         register int input5 = x[i + 5];
	ldr	r1, [r3]	@ input5, *_98
@ /home/student/ARM_TEST/butterworth_unrolled10.c:118:         y = __QADD(
	movw	r3, #1105	@ b02_1.31_99,
	mul	r2, r3, r1	@ _100, b02_1.31_99, input5
@ /home/student/ARM_TEST/butterworth_unrolled10.c:120:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.32_101,
	lsls	r3, r3, #1	@ _102, b02_1.32_101,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:118:         y = __QADD(
	mul	r3, r6, r3	@ _103, x1, _102
	str	r2, [r7, #304]	@ _100, first
	str	r3, [r7, #300]	@ _103, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #304]	@ tmp829, first
	ldr	r2, [r7, #300]	@ tmp830, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp829, tmp830
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #296]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #296]	@ D.7887, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:118:         y = __QADD(
	mov	r4, r3	@ y, D.7887
@ /home/student/ARM_TEST/butterworth_unrolled10.c:122:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.33_104,
	mul	r3, r3, r8	@ _105, b02_1.33_104, x2
	str	r4, [r7, #316]	@ y, first
	str	r3, [r7, #312]	@ _105, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #316]	@ tmp832, first
	ldr	r2, [r7, #312]	@ tmp833, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp832, tmp833
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #308]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #308]	@ D.7881, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:122:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7881
@ /home/student/ARM_TEST/butterworth_unrolled10.c:123:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.34_106,
	mul	r3, r5, r3	@ _107, y1, a1.34_106
	str	r4, [r7, #328]	@ y, first
	str	r3, [r7, #324]	@ _107, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #328]	@ tmp835, first
	ldr	r2, [r7, #324]	@ tmp836, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp835, tmp836
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #320]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #320]	@ D.7875, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:123:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7875
@ /home/student/ARM_TEST/butterworth_unrolled10.c:124:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.35_108,
	movt	r3, 65535	@ a2.35_108,
	mul	r3, r3, r9	@ _109, a2.35_108, y2
	str	r4, [r7, #340]	@ y, first
	str	r3, [r7, #336]	@ _109, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #340]	@ tmp838, first
	ldr	r2, [r7, #336]	@ tmp839, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp838, tmp839
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #332]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #332]	@ D.7869, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:124:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7869
@ /home/student/ARM_TEST/butterworth_unrolled10.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _110, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _111, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _111,
	ite	ne
	movne	r2, #1	@ tmp841,
	moveq	r2, #0	@ tmp841,
	uxtb	r2, r2	@ _112, _112
@ /home/student/ARM_TEST/butterworth_unrolled10.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _110, _113
@ /home/student/ARM_TEST/butterworth_unrolled10.c:127:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:128:         x1 = input5;
	mov	r6, r1	@ x1, input5
@ /home/student/ARM_TEST/butterworth_unrolled10.c:129:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:130:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:133:         register int input6 = x[i + 6];
	mov	r3, r10	@ i.36_114, i
	adds	r3, r3, #6	@ _115, i.36_114,
	lsls	r3, r3, #2	@ _116, _115,
	add	r2, r7, #536	@ tmp842,,
	sub	r2, r2, #532	@ tmp844, tmp842,
	ldr	r2, [r2]	@ tmp845, x
	add	r3, r3, r2	@ _117, tmp845
@ /home/student/ARM_TEST/butterworth_unrolled10.c:133:         register int input6 = x[i + 6];
	ldr	r1, [r3]	@ input6, *_117
@ /home/student/ARM_TEST/butterworth_unrolled10.c:134:         y = __QADD(
	movw	r3, #1105	@ b02_1.37_118,
	mul	r2, r3, r1	@ _119, b02_1.37_118, input6
@ /home/student/ARM_TEST/butterworth_unrolled10.c:136:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.38_120,
	lsls	r3, r3, #1	@ _121, b02_1.38_120,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:134:         y = __QADD(
	mul	r3, r6, r3	@ _122, x1, _121
	str	r2, [r7, #352]	@ _119, first
	str	r3, [r7, #348]	@ _122, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #352]	@ tmp847, first
	ldr	r2, [r7, #348]	@ tmp848, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp847, tmp848
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #344]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #344]	@ D.7863, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:134:         y = __QADD(
	mov	r4, r3	@ y, D.7863
@ /home/student/ARM_TEST/butterworth_unrolled10.c:138:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.39_123,
	mul	r3, r3, r8	@ _124, b02_1.39_123, x2
	str	r4, [r7, #364]	@ y, first
	str	r3, [r7, #360]	@ _124, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #364]	@ tmp850, first
	ldr	r2, [r7, #360]	@ tmp851, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp850, tmp851
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #356]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #356]	@ D.7857, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:138:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7857
@ /home/student/ARM_TEST/butterworth_unrolled10.c:139:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.40_125,
	mul	r3, r5, r3	@ _126, y1, a1.40_125
	str	r4, [r7, #376]	@ y, first
	str	r3, [r7, #372]	@ _126, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #376]	@ tmp853, first
	ldr	r2, [r7, #372]	@ tmp854, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp853, tmp854
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #368]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #368]	@ D.7851, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:139:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7851
@ /home/student/ARM_TEST/butterworth_unrolled10.c:140:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.41_127,
	movt	r3, 65535	@ a2.41_127,
	mul	r3, r3, r9	@ _128, a2.41_127, y2
	str	r4, [r7, #388]	@ y, first
	str	r3, [r7, #384]	@ _128, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #388]	@ tmp856, first
	ldr	r2, [r7, #384]	@ tmp857, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp856, tmp857
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #380]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #380]	@ D.7845, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:140:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7845
@ /home/student/ARM_TEST/butterworth_unrolled10.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _129, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _130, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _130,
	ite	ne
	movne	r2, #1	@ tmp859,
	moveq	r2, #0	@ tmp859,
	uxtb	r2, r2	@ _131, _131
@ /home/student/ARM_TEST/butterworth_unrolled10.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _129, _132
@ /home/student/ARM_TEST/butterworth_unrolled10.c:143:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:144:         x1 = input6;
	mov	r6, r1	@ x1, input6
@ /home/student/ARM_TEST/butterworth_unrolled10.c:145:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:146:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:149:         register int input7 = x[i + 7];
	mov	r3, r10	@ i.42_133, i
	adds	r3, r3, #7	@ _134, i.42_133,
	lsls	r3, r3, #2	@ _135, _134,
	add	r2, r7, #536	@ tmp860,,
	sub	r2, r2, #532	@ tmp862, tmp860,
	ldr	r2, [r2]	@ tmp863, x
	add	r3, r3, r2	@ _136, tmp863
@ /home/student/ARM_TEST/butterworth_unrolled10.c:149:         register int input7 = x[i + 7];
	ldr	r1, [r3]	@ input7, *_136
@ /home/student/ARM_TEST/butterworth_unrolled10.c:150:         y = __QADD(
	movw	r3, #1105	@ b02_1.43_137,
	mul	r2, r3, r1	@ _138, b02_1.43_137, input7
@ /home/student/ARM_TEST/butterworth_unrolled10.c:152:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.44_139,
	lsls	r3, r3, #1	@ _140, b02_1.44_139,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:150:         y = __QADD(
	mul	r3, r6, r3	@ _141, x1, _140
	str	r2, [r7, #400]	@ _138, first
	str	r3, [r7, #396]	@ _141, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #400]	@ tmp865, first
	ldr	r2, [r7, #396]	@ tmp866, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp865, tmp866
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #392]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #392]	@ D.7839, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:150:         y = __QADD(
	mov	r4, r3	@ y, D.7839
@ /home/student/ARM_TEST/butterworth_unrolled10.c:154:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.45_142,
	mul	r3, r3, r8	@ _143, b02_1.45_142, x2
	str	r4, [r7, #412]	@ y, first
	str	r3, [r7, #408]	@ _143, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #412]	@ tmp868, first
	ldr	r2, [r7, #408]	@ tmp869, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp868, tmp869
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #404]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #404]	@ D.7833, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:154:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7833
@ /home/student/ARM_TEST/butterworth_unrolled10.c:155:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.46_144,
	mul	r3, r5, r3	@ _145, y1, a1.46_144
	str	r4, [r7, #424]	@ y, first
	str	r3, [r7, #420]	@ _145, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #424]	@ tmp871, first
	ldr	r2, [r7, #420]	@ tmp872, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp871, tmp872
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #416]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #416]	@ D.7827, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:155:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7827
@ /home/student/ARM_TEST/butterworth_unrolled10.c:156:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.47_146,
	movt	r3, 65535	@ a2.47_146,
	mul	r3, r3, r9	@ _147, a2.47_146, y2
	str	r4, [r7, #436]	@ y, first
	str	r3, [r7, #432]	@ _147, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #436]	@ tmp874, first
	ldr	r2, [r7, #432]	@ tmp875, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp874, tmp875
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #428]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #428]	@ D.7821, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:156:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7821
@ /home/student/ARM_TEST/butterworth_unrolled10.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _148, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _149, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _149,
	ite	ne
	movne	r2, #1	@ tmp877,
	moveq	r2, #0	@ tmp877,
	uxtb	r2, r2	@ _150, _150
@ /home/student/ARM_TEST/butterworth_unrolled10.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _148, _151
@ /home/student/ARM_TEST/butterworth_unrolled10.c:159:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:160:         x1 = input7;
	mov	r6, r1	@ x1, input7
@ /home/student/ARM_TEST/butterworth_unrolled10.c:161:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:162:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:164:         register int input8 = x[i + 8];
	mov	r3, r10	@ i.48_152, i
	adds	r3, r3, #8	@ _153, i.48_152,
	lsls	r3, r3, #2	@ _154, _153,
	add	r2, r7, #536	@ tmp878,,
	sub	r2, r2, #532	@ tmp880, tmp878,
	ldr	r2, [r2]	@ tmp881, x
	add	r3, r3, r2	@ _155, tmp881
@ /home/student/ARM_TEST/butterworth_unrolled10.c:164:         register int input8 = x[i + 8];
	ldr	r1, [r3]	@ input8, *_155
@ /home/student/ARM_TEST/butterworth_unrolled10.c:165:         y = __QADD(
	movw	r3, #1105	@ b02_1.49_156,
	mul	r2, r3, r1	@ _157, b02_1.49_156, input8
@ /home/student/ARM_TEST/butterworth_unrolled10.c:167:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.50_158,
	lsls	r3, r3, #1	@ _159, b02_1.50_158,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:165:         y = __QADD(
	mul	r3, r6, r3	@ _160, x1, _159
	str	r2, [r7, #448]	@ _157, first
	str	r3, [r7, #444]	@ _160, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #448]	@ tmp883, first
	ldr	r2, [r7, #444]	@ tmp884, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp883, tmp884
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #440]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #440]	@ D.7815, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:165:         y = __QADD(
	mov	r4, r3	@ y, D.7815
@ /home/student/ARM_TEST/butterworth_unrolled10.c:169:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.51_161,
	mul	r3, r3, r8	@ _162, b02_1.51_161, x2
	str	r4, [r7, #460]	@ y, first
	str	r3, [r7, #456]	@ _162, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #460]	@ tmp886, first
	ldr	r2, [r7, #456]	@ tmp887, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp886, tmp887
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #452]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #452]	@ D.7809, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:169:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7809
@ /home/student/ARM_TEST/butterworth_unrolled10.c:170:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.52_163,
	mul	r3, r5, r3	@ _164, y1, a1.52_163
	str	r4, [r7, #472]	@ y, first
	str	r3, [r7, #468]	@ _164, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #472]	@ tmp889, first
	ldr	r2, [r7, #468]	@ tmp890, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp889, tmp890
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #464]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #464]	@ D.7803, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:170:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7803
@ /home/student/ARM_TEST/butterworth_unrolled10.c:171:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.53_165,
	movt	r3, 65535	@ a2.53_165,
	mul	r3, r3, r9	@ _166, a2.53_165, y2
	str	r4, [r7, #484]	@ y, first
	str	r3, [r7, #480]	@ _166, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #484]	@ tmp892, first
	ldr	r2, [r7, #480]	@ tmp893, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp892, tmp893
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #476]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #476]	@ D.7797, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:171:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7797
@ /home/student/ARM_TEST/butterworth_unrolled10.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _167, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _168, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _168,
	ite	ne
	movne	r2, #1	@ tmp895,
	moveq	r2, #0	@ tmp895,
	uxtb	r2, r2	@ _169, _169
@ /home/student/ARM_TEST/butterworth_unrolled10.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _167, _170
@ /home/student/ARM_TEST/butterworth_unrolled10.c:174:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:175:         x1 = input8;
	mov	r6, r1	@ x1, input8
@ /home/student/ARM_TEST/butterworth_unrolled10.c:176:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:177:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:179:         register int input9 = x[i + 9];
	mov	r3, r10	@ i.54_171, i
	adds	r3, r3, #9	@ _172, i.54_171,
	lsls	r3, r3, #2	@ _173, _172,
	add	r2, r7, #536	@ tmp896,,
	sub	r2, r2, #532	@ tmp898, tmp896,
	ldr	r2, [r2]	@ tmp899, x
	add	r3, r3, r2	@ _174, tmp899
@ /home/student/ARM_TEST/butterworth_unrolled10.c:179:         register int input9 = x[i + 9];
	ldr	r1, [r3]	@ input9, *_174
@ /home/student/ARM_TEST/butterworth_unrolled10.c:180:         y = __QADD(
	movw	r3, #1105	@ b02_1.55_175,
	mul	r2, r3, r1	@ _176, b02_1.55_175, input9
@ /home/student/ARM_TEST/butterworth_unrolled10.c:182:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.56_177,
	lsls	r3, r3, #1	@ _178, b02_1.56_177,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:180:         y = __QADD(
	mul	r3, r6, r3	@ _179, x1, _178
	str	r2, [r7, #496]	@ _176, first
	str	r3, [r7, #492]	@ _179, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #496]	@ tmp901, first
	ldr	r2, [r7, #492]	@ tmp902, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp901, tmp902
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #488]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #488]	@ D.7791, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:180:         y = __QADD(
	mov	r4, r3	@ y, D.7791
@ /home/student/ARM_TEST/butterworth_unrolled10.c:184:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.57_180,
	mul	r3, r3, r8	@ _181, b02_1.57_180, x2
	str	r4, [r7, #508]	@ y, first
	str	r3, [r7, #504]	@ _181, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #508]	@ tmp904, first
	ldr	r2, [r7, #504]	@ tmp905, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp904, tmp905
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #500]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #500]	@ D.7785, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:184:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7785
@ /home/student/ARM_TEST/butterworth_unrolled10.c:185:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.58_182,
	mul	r3, r5, r3	@ _183, y1, a1.58_182
	str	r4, [r7, #520]	@ y, first
	str	r3, [r7, #516]	@ _183, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #520]	@ tmp907, first
	ldr	r2, [r7, #516]	@ tmp908, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp907, tmp908
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #512]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #512]	@ D.7779, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:185:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7779
@ /home/student/ARM_TEST/butterworth_unrolled10.c:186:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.59_184,
	movt	r3, 65535	@ a2.59_184,
	mul	r3, r3, r9	@ _185, a2.59_184, y2
	str	r4, [r7, #532]	@ y, first
	str	r3, [r7, #528]	@ _185, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #532]	@ tmp910, first
	ldr	r2, [r7, #528]	@ tmp911, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp910, tmp911
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #524]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #524]	@ D.7773, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:186:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7773
@ /home/student/ARM_TEST/butterworth_unrolled10.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _186, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _187, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _187,
	ite	ne
	movne	r2, #1	@ tmp913,
	moveq	r2, #0	@ tmp913,
	uxtb	r2, r2	@ _188, _188
@ /home/student/ARM_TEST/butterworth_unrolled10.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _186, _189
@ /home/student/ARM_TEST/butterworth_unrolled10.c:189:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:190:         x1 = input9;
	mov	r6, r1	@ x1, input9
@ /home/student/ARM_TEST/butterworth_unrolled10.c:191:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:192:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:35:     for (i = 0; i + 9 < sample_count; i += 10) {
	add	r10, r10, #10	@ i, i,
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:35:     for (i = 0; i + 9 < sample_count; i += 10) {
	add	r3, r10, #9	@ _190, i,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:35:     for (i = 0; i + 9 < sample_count; i += 10) {
	add	r2, r7, #536	@ tmp914,,
	sub	r2, r2, #536	@ tmp916, tmp914,
	ldr	r2, [r2]	@ tmp917, sample_count
	cmp	r2, r3	@ tmp917, _190
	bgt	.L45		@,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:257:     for (; i < sample_count; i++) {
	b	.L46		@
.L51:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:258:         register int current_input = x[i];
	mov	r3, r10	@ i.60_191, i
	lsls	r3, r3, #2	@ _192, i.60_191,
	add	r2, r7, #536	@ tmp918,,
	sub	r2, r2, #532	@ tmp920, tmp918,
	ldr	r2, [r2]	@ tmp921, x
	add	r3, r3, r2	@ _193, tmp921
@ /home/student/ARM_TEST/butterworth_unrolled10.c:258:         register int current_input = x[i];
	ldr	r0, [r3]	@ current_input, *_193
@ /home/student/ARM_TEST/butterworth_unrolled10.c:259:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.61_194,
	mul	r1, r3, r0	@ _195, b02_1.61_194, current_input
@ /home/student/ARM_TEST/butterworth_unrolled10.c:261:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.62_196,
	lsls	r3, r3, #1	@ _197, b02_1.62_196,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:259:         register int y = __QADD(
	mul	r2, r3, r6	@ _198, _197, x1
	add	r3, r7, #536	@ tmp922,,
	sub	r3, r3, #520	@ tmp924, tmp922,
	str	r1, [r3]	@ _195, first
	add	r3, r7, #536	@ tmp925,,
	sub	r3, r3, #524	@ tmp927, tmp925,
	str	r2, [r3]	@ _198, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp932,,
	sub	r3, r3, #520	@ tmp934, tmp932,
	ldr	r3, [r3]	@ tmp935, first
	add	r2, r7, #536	@ tmp936,,
	sub	r2, r2, #524	@ tmp938, tmp936,
	ldr	r2, [r2]	@ tmp939, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp935, tmp939
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp929,,
	sub	r3, r3, #528	@ tmp931, tmp929,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp940,,
	sub	r3, r3, #528	@ tmp942, tmp940,
	ldr	r3, [r3]	@ D.8031, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:259:         register int y = __QADD(
	mov	r4, r3	@ y, D.8031
@ /home/student/ARM_TEST/butterworth_unrolled10.c:263:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.63_199,
	mul	r2, r3, r8	@ _200, b02_1.63_199, x2
	add	r3, r7, #536	@ tmp943,,
	sub	r3, r3, #508	@ tmp945, tmp943,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp946,,
	sub	r3, r3, #512	@ tmp948, tmp946,
	str	r2, [r3]	@ _200, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp953,,
	sub	r3, r3, #508	@ tmp955, tmp953,
	ldr	r3, [r3]	@ tmp956, first
	add	r2, r7, #536	@ tmp957,,
	sub	r2, r2, #512	@ tmp959, tmp957,
	ldr	r2, [r2]	@ tmp960, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp956, tmp960
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp950,,
	sub	r3, r3, #516	@ tmp952, tmp950,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp961,,
	sub	r3, r3, #516	@ tmp963, tmp961,
	ldr	r3, [r3]	@ D.8025, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:263:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8025
@ /home/student/ARM_TEST/butterworth_unrolled10.c:264:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.64_201,
	mul	r2, r3, r5	@ _202, a1.64_201, y1
	add	r3, r7, #536	@ tmp964,,
	sub	r3, r3, #496	@ tmp966, tmp964,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp967,,
	sub	r3, r3, #500	@ tmp969, tmp967,
	str	r2, [r3]	@ _202, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp974,,
	sub	r3, r3, #496	@ tmp976, tmp974,
	ldr	r3, [r3]	@ tmp977, first
	add	r2, r7, #536	@ tmp978,,
	sub	r2, r2, #500	@ tmp980, tmp978,
	ldr	r2, [r2]	@ tmp981, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp977, tmp981
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp971,,
	sub	r3, r3, #504	@ tmp973, tmp971,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp982,,
	sub	r3, r3, #504	@ tmp984, tmp982,
	ldr	r3, [r3]	@ D.8019, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:264:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8019
@ /home/student/ARM_TEST/butterworth_unrolled10.c:265:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.65_203,
	movt	r3, 65535	@ a2.65_203,
	mul	r2, r3, r9	@ _204, a2.65_203, y2
	add	r3, r7, #536	@ tmp985,,
	sub	r3, r3, #484	@ tmp987, tmp985,
	str	r4, [r3]	@ y, first
	add	r3, r7, #536	@ tmp988,,
	sub	r3, r3, #488	@ tmp990, tmp988,
	str	r2, [r3]	@ _204, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #536	@ tmp995,,
	sub	r3, r3, #484	@ tmp997, tmp995,
	ldr	r3, [r3]	@ tmp998, first
	add	r2, r7, #536	@ tmp999,,
	sub	r2, r2, #488	@ tmp1001, tmp999,
	ldr	r2, [r2]	@ tmp1002, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp998, tmp1002
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #536	@ tmp992,,
	sub	r3, r3, #492	@ tmp994, tmp992,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #536	@ tmp1003,,
	sub	r3, r3, #492	@ tmp1005, tmp1003,
	ldr	r3, [r3]	@ D.8013, result
@ /home/student/ARM_TEST/butterworth_unrolled10.c:265:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8013
@ /home/student/ARM_TEST/butterworth_unrolled10.c:266:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _205, y,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:266:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _206, y,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:266:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _206,
	ite	ne
	movne	r2, #1	@ tmp1007,
	moveq	r2, #0	@ tmp1007,
	uxtb	r2, r2	@ _207, _207
@ /home/student/ARM_TEST/butterworth_unrolled10.c:266:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _205, _208
@ /home/student/ARM_TEST/butterworth_unrolled10.c:268:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:269:         x1 = current_input;
	mov	r6, r0	@ x1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled10.c:270:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:271:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:257:     for (; i < sample_count; i++) {
	add	r10, r10, #1	@ i, i,
.L46:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:257:     for (; i < sample_count; i++) {
	add	r3, r7, #536	@ tmp1008,,
	sub	r3, r3, #536	@ tmp1010, tmp1008,
	ldr	r3, [r3]	@ tmp1011, sample_count
	cmp	r10, r3	@ i, tmp1011
	blt	.L51		@,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:274:     return y1;
	mov	r3, r5	@ _229, y1
@ /home/student/ARM_TEST/butterworth_unrolled10.c:275: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #540	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10}	@
	bx	lr	@
	.size	run_IIR, .-run_IIR
	.section	.rodata
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
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800088
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}	@
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1400	@,,
	add	r7, sp, #32	@,,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:281:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/ARM_TEST/butterworth_unrolled10.c:281:     for (int n = 0; n < N; n++) {
	b	.L54		@
.L55:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:282:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/ARM_TEST/butterworth_unrolled10.c:282:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L60	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/ARM_TEST/butterworth_unrolled10.c:283:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L60+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:283:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L60+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/ARM_TEST/butterworth_unrolled10.c:287:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L60+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/ARM_TEST/butterworth_unrolled10.c:287:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/ARM_TEST/butterworth_unrolled10.c:287:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/ARM_TEST/butterworth_unrolled10.c:281:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L54:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:281:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L55		@,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:293:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:293:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L56		@,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:294:         perror("Unable to start benchmark timer");
	ldr	r3, .L60+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled10.c:295:         return 1;
	movs	r3, #1	@ _17,
	b	.L59		@
.L56:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:298:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:298:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/ARM_TEST/butterworth_unrolled10.c:300:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:300:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L58		@,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:301:         perror("Unable to stop benchmark timer");
	ldr	r3, .L60+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled10.c:302:         return 1;
	movs	r3, #1	@ _17,
	b	.L59		@
.L58:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:305:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
	add	r2, r7, #1368	@ tmp159,,
	sub	r2, r2, #1360	@ tmp159, tmp159,
	add	r3, r7, #1368	@ tmp160,,
	sub	r3, r3, #1344	@ tmp160, tmp160,
	mov	r1, r2	@, tmp159
	mov	r0, r3	@, tmp160
	bl	elapsed_nanoseconds(PLT)	@
	add	r3, r7, #798720	@ tmp204,,
	add	r3, r3, #1352	@ tmp204, tmp204,
	strd	r0, [r3]	@, elapsed_ns
@ /home/student/ARM_TEST/butterworth_unrolled10.c:306:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/ARM_TEST/butterworth_unrolled10.c:306:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L60+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/ARM_TEST/butterworth_unrolled10.c:307:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L60+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/ARM_TEST/butterworth_unrolled10.c:316:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled10.c:316:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/ARM_TEST/butterworth_unrolled10.c:309:     printf(
	vldr.64	d18, .L60+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/ARM_TEST/butterworth_unrolled10.c:317:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.66_13, y
	vmov	s15, r3	@ int	@ y.66_13, y.66_13
	vcvt.f64.s32	d18, s15	@ _14, y.66_13
@ /home/student/ARM_TEST/butterworth_unrolled10.c:309:     printf(
	vldr.64	d19, .L60+24	@ tmp175,
	vdiv.f64	d17, d18, d19	@ _15, _14, tmp175
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
	add	r3, r7, #798720	@ tmp214,,
	add	r3, r3, #1336	@ tmp214, tmp214,
	ldrd	r2, [r3]	@ tmp176, final_time
	strd	r2, [sp, #8]	@ tmp176,,
	add	r3, r7, #798720	@ tmp216,,
	add	r3, r3, #1344	@ tmp216, tmp216,
	ldrd	r2, [r3]	@ tmp177, ns_per_sample
	strd	r2, [sp]	@ tmp177,
	add	r3, r7, #798720	@ tmp218,,
	add	r3, r3, #1352	@ tmp218, tmp218,
	ldrd	r2, [r3]	@, elapsed_ns
	mov	r1, #3392	@,
	movt	r1, 3	@,
	ldr	r0, .L60+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled10.c:320:     return 0;
	movs	r3, #0	@ _17,
.L59:
@ /home/student/ARM_TEST/butterworth_unrolled10.c:321: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L61:
	.align	3
.L60:
	.word	0
	.word	1086556160
	.word	1507148603
	.word	1082368652
	.word	-1717986918
	.word	1072273817
	.word	0
	.word	1087373312
	.word	0
	.word	1091070464
	.word	1917273401
	.word	1077149689
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC2-(.LPIC2+4)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
