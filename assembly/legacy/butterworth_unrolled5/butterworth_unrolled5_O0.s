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
	.file	"butterworth_unrolled5.c"
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
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/ARM_TEST/butterworth_unrolled5.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled5.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:25: }
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
	@ args = 0, pretend = 0, frame = 296
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}	@
	sub	sp, sp, #300	@,,
	add	r7, sp, #0	@,,
	add	r3, r7, #296	@ tmp266,,
	sub	r3, r3, #292	@ tmp268, tmp266,
	str	r0, [r3]	@ x, x
	add	r3, r7, #296	@ tmp269,,
	sub	r3, r3, #296	@ tmp271, tmp269,
	str	r1, [r3]	@ sample_count, sample_count
@ /home/student/ARM_TEST/butterworth_unrolled5.c:29:     register int x1 = 0;
	movs	r6, #0	@ x1,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:30:     register int x2 = 0;
	mov	r9, #0	@ x2,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:31:     register int y1 = 0;
	movs	r5, #0	@ y1,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:32:     register int y2 = 0;
	mov	r10, #0	@ y2,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	mov	r8, #0	@ i,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	b	.L4		@
.L25:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:37:         register int input0 = x[i];
	mov	r3, r8	@ i.0_1, i
	lsls	r3, r3, #2	@ _2, i.0_1,
	add	r2, r7, #296	@ tmp272,,
	sub	r2, r2, #292	@ tmp274, tmp272,
	ldr	r2, [r2]	@ tmp275, x
	add	r3, r3, r2	@ _3, tmp275
@ /home/student/ARM_TEST/butterworth_unrolled5.c:37:         register int input0 = x[i];
	ldr	r1, [r3]	@ input0, *_3
@ /home/student/ARM_TEST/butterworth_unrolled5.c:38:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.1_4,
	mul	r2, r3, r1	@ _5, b02_1.1_4, input0
@ /home/student/ARM_TEST/butterworth_unrolled5.c:40:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.2_6,
	lsls	r3, r3, #1	@ _7, b02_1.2_6,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:38:         register int y = __QADD(
	mul	r3, r6, r3	@ _8, x1, _7
	str	r2, [r7, #64]	@ _5, first
	str	r3, [r7, #60]	@ _8, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #64]	@ tmp277, first
	ldr	r2, [r7, #60]	@ tmp278, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp277, tmp278
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #56]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #56]	@ D.7882, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:38:         register int y = __QADD(
	mov	r4, r3	@ y, D.7882
@ /home/student/ARM_TEST/butterworth_unrolled5.c:42:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.3_9,
	mul	r3, r3, r9	@ _10, b02_1.3_9, x2
	str	r4, [r7, #76]	@ y, first
	str	r3, [r7, #72]	@ _10, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #76]	@ tmp280, first
	ldr	r2, [r7, #72]	@ tmp281, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp280, tmp281
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #68]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #68]	@ D.7876, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:42:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7876
@ /home/student/ARM_TEST/butterworth_unrolled5.c:43:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.4_11,
	mul	r3, r5, r3	@ _12, y1, a1.4_11
	str	r4, [r7, #88]	@ y, first
	str	r3, [r7, #84]	@ _12, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #88]	@ tmp283, first
	ldr	r2, [r7, #84]	@ tmp284, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp283, tmp284
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #80]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #80]	@ D.7870, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:43:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7870
@ /home/student/ARM_TEST/butterworth_unrolled5.c:44:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.5_13,
	movt	r3, 65535	@ a2.5_13,
	mul	r3, r3, r10	@ _14, a2.5_13, y2
	str	r4, [r7, #100]	@ y, first
	str	r3, [r7, #96]	@ _14, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #100]	@ tmp286, first
	ldr	r2, [r7, #96]	@ tmp287, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp286, tmp287
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #92]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #92]	@ D.7864, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:44:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7864
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp289,
	moveq	r2, #0	@ tmp289,
	uxtb	r2, r2	@ _17, _17
@ /home/student/ARM_TEST/butterworth_unrolled5.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/ARM_TEST/butterworth_unrolled5.c:47:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:48:         x1 = input0;
	mov	r6, r1	@ x1, input0
@ /home/student/ARM_TEST/butterworth_unrolled5.c:49:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:50:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:53:         register int input1 = x[i + 1];
	mov	r3, r8	@ i.6_19, i
	adds	r3, r3, #1	@ _20, i.6_19,
	lsls	r3, r3, #2	@ _21, _20,
	add	r2, r7, #296	@ tmp290,,
	sub	r2, r2, #292	@ tmp292, tmp290,
	ldr	r2, [r2]	@ tmp293, x
	add	r3, r3, r2	@ _22, tmp293
@ /home/student/ARM_TEST/butterworth_unrolled5.c:53:         register int input1 = x[i + 1];
	ldr	r1, [r3]	@ input1, *_22
@ /home/student/ARM_TEST/butterworth_unrolled5.c:54:         y = __QADD(
	movw	r3, #1105	@ b02_1.7_23,
	mul	r2, r3, r1	@ _24, b02_1.7_23, input1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:56:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.8_25,
	lsls	r3, r3, #1	@ _26, b02_1.8_25,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:54:         y = __QADD(
	mul	r3, r6, r3	@ _27, x1, _26
	str	r2, [r7, #112]	@ _24, first
	str	r3, [r7, #108]	@ _27, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #112]	@ tmp295, first
	ldr	r2, [r7, #108]	@ tmp296, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp295, tmp296
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #104]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #104]	@ D.7858, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:54:         y = __QADD(
	mov	r4, r3	@ y, D.7858
@ /home/student/ARM_TEST/butterworth_unrolled5.c:58:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.9_28,
	mul	r3, r3, r9	@ _29, b02_1.9_28, x2
	str	r4, [r7, #124]	@ y, first
	str	r3, [r7, #120]	@ _29, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #124]	@ tmp298, first
	ldr	r2, [r7, #120]	@ tmp299, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp298, tmp299
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #116]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #116]	@ D.7852, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:58:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7852
@ /home/student/ARM_TEST/butterworth_unrolled5.c:59:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.10_30,
	mul	r3, r5, r3	@ _31, y1, a1.10_30
	str	r4, [r7, #136]	@ y, first
	str	r3, [r7, #132]	@ _31, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #136]	@ tmp301, first
	ldr	r2, [r7, #132]	@ tmp302, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp301, tmp302
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #128]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #128]	@ D.7846, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:59:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7846
@ /home/student/ARM_TEST/butterworth_unrolled5.c:60:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.11_32,
	movt	r3, 65535	@ a2.11_32,
	mul	r3, r3, r10	@ _33, a2.11_32, y2
	str	r4, [r7, #148]	@ y, first
	str	r3, [r7, #144]	@ _33, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #148]	@ tmp304, first
	ldr	r2, [r7, #144]	@ tmp305, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp304, tmp305
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #140]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #140]	@ D.7840, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:60:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7840
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp307,
	moveq	r2, #0	@ tmp307,
	uxtb	r2, r2	@ _36, _36
@ /home/student/ARM_TEST/butterworth_unrolled5.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/ARM_TEST/butterworth_unrolled5.c:63:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:64:         x1 = input1;
	mov	r6, r1	@ x1, input1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:65:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:66:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:69:         register int input2 = x[i + 2];
	mov	r3, r8	@ i.12_38, i
	adds	r3, r3, #2	@ _39, i.12_38,
	lsls	r3, r3, #2	@ _40, _39,
	add	r2, r7, #296	@ tmp308,,
	sub	r2, r2, #292	@ tmp310, tmp308,
	ldr	r2, [r2]	@ tmp311, x
	add	r3, r3, r2	@ _41, tmp311
@ /home/student/ARM_TEST/butterworth_unrolled5.c:69:         register int input2 = x[i + 2];
	ldr	r1, [r3]	@ input2, *_41
@ /home/student/ARM_TEST/butterworth_unrolled5.c:70:         y = __QADD(
	movw	r3, #1105	@ b02_1.13_42,
	mul	r2, r3, r1	@ _43, b02_1.13_42, input2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:72:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.14_44,
	lsls	r3, r3, #1	@ _45, b02_1.14_44,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:70:         y = __QADD(
	mul	r3, r6, r3	@ _46, x1, _45
	str	r2, [r7, #160]	@ _43, first
	str	r3, [r7, #156]	@ _46, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #160]	@ tmp313, first
	ldr	r2, [r7, #156]	@ tmp314, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp313, tmp314
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #152]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #152]	@ D.7834, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:70:         y = __QADD(
	mov	r4, r3	@ y, D.7834
@ /home/student/ARM_TEST/butterworth_unrolled5.c:74:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.15_47,
	mul	r3, r3, r9	@ _48, b02_1.15_47, x2
	str	r4, [r7, #172]	@ y, first
	str	r3, [r7, #168]	@ _48, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #172]	@ tmp316, first
	ldr	r2, [r7, #168]	@ tmp317, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp316, tmp317
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #164]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #164]	@ D.7828, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:74:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7828
@ /home/student/ARM_TEST/butterworth_unrolled5.c:75:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.16_49,
	mul	r3, r5, r3	@ _50, y1, a1.16_49
	str	r4, [r7, #184]	@ y, first
	str	r3, [r7, #180]	@ _50, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #184]	@ tmp319, first
	ldr	r2, [r7, #180]	@ tmp320, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp319, tmp320
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #176]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #176]	@ D.7822, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:75:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7822
@ /home/student/ARM_TEST/butterworth_unrolled5.c:76:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.17_51,
	movt	r3, 65535	@ a2.17_51,
	mul	r3, r3, r10	@ _52, a2.17_51, y2
	str	r4, [r7, #196]	@ y, first
	str	r3, [r7, #192]	@ _52, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #196]	@ tmp322, first
	ldr	r2, [r7, #192]	@ tmp323, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp322, tmp323
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #188]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #188]	@ D.7816, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:76:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7816
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp325,
	moveq	r2, #0	@ tmp325,
	uxtb	r2, r2	@ _55, _55
@ /home/student/ARM_TEST/butterworth_unrolled5.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/ARM_TEST/butterworth_unrolled5.c:79:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:80:         x1 = input2;
	mov	r6, r1	@ x1, input2
@ /home/student/ARM_TEST/butterworth_unrolled5.c:81:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:82:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:85:         register int input3 = x[i + 3];
	mov	r3, r8	@ i.18_57, i
	adds	r3, r3, #3	@ _58, i.18_57,
	lsls	r3, r3, #2	@ _59, _58,
	add	r2, r7, #296	@ tmp326,,
	sub	r2, r2, #292	@ tmp328, tmp326,
	ldr	r2, [r2]	@ tmp329, x
	add	r3, r3, r2	@ _60, tmp329
@ /home/student/ARM_TEST/butterworth_unrolled5.c:85:         register int input3 = x[i + 3];
	ldr	r1, [r3]	@ input3, *_60
@ /home/student/ARM_TEST/butterworth_unrolled5.c:86:         y = __QADD(
	movw	r3, #1105	@ b02_1.19_61,
	mul	r2, r3, r1	@ _62, b02_1.19_61, input3
@ /home/student/ARM_TEST/butterworth_unrolled5.c:88:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.20_63,
	lsls	r3, r3, #1	@ _64, b02_1.20_63,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:86:         y = __QADD(
	mul	r3, r6, r3	@ _65, x1, _64
	str	r2, [r7, #208]	@ _62, first
	str	r3, [r7, #204]	@ _65, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #208]	@ tmp331, first
	ldr	r2, [r7, #204]	@ tmp332, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp331, tmp332
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #200]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #200]	@ D.7810, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:86:         y = __QADD(
	mov	r4, r3	@ y, D.7810
@ /home/student/ARM_TEST/butterworth_unrolled5.c:90:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.21_66,
	mul	r3, r3, r9	@ _67, b02_1.21_66, x2
	str	r4, [r7, #220]	@ y, first
	str	r3, [r7, #216]	@ _67, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #220]	@ tmp334, first
	ldr	r2, [r7, #216]	@ tmp335, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp334, tmp335
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #212]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #212]	@ D.7804, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:90:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7804
@ /home/student/ARM_TEST/butterworth_unrolled5.c:91:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.22_68,
	mul	r3, r5, r3	@ _69, y1, a1.22_68
	str	r4, [r7, #232]	@ y, first
	str	r3, [r7, #228]	@ _69, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #232]	@ tmp337, first
	ldr	r2, [r7, #228]	@ tmp338, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp337, tmp338
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #224]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #224]	@ D.7798, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:91:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7798
@ /home/student/ARM_TEST/butterworth_unrolled5.c:92:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.23_70,
	movt	r3, 65535	@ a2.23_70,
	mul	r3, r3, r10	@ _71, a2.23_70, y2
	str	r4, [r7, #244]	@ y, first
	str	r3, [r7, #240]	@ _71, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #244]	@ tmp340, first
	ldr	r2, [r7, #240]	@ tmp341, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp340, tmp341
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #236]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #236]	@ D.7792, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:92:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7792
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _72, y,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _73, y,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _73,
	ite	ne
	movne	r2, #1	@ tmp343,
	moveq	r2, #0	@ tmp343,
	uxtb	r2, r2	@ _74, _74
@ /home/student/ARM_TEST/butterworth_unrolled5.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _72, _75
@ /home/student/ARM_TEST/butterworth_unrolled5.c:95:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:96:         x1 = input3;
	mov	r6, r1	@ x1, input3
@ /home/student/ARM_TEST/butterworth_unrolled5.c:97:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:98:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:101:         register int input4 = x[i + 4];
	mov	r3, r8	@ i.24_76, i
	adds	r3, r3, #4	@ _77, i.24_76,
	lsls	r3, r3, #2	@ _78, _77,
	add	r2, r7, #296	@ tmp344,,
	sub	r2, r2, #292	@ tmp346, tmp344,
	ldr	r2, [r2]	@ tmp347, x
	add	r3, r3, r2	@ _79, tmp347
@ /home/student/ARM_TEST/butterworth_unrolled5.c:101:         register int input4 = x[i + 4];
	ldr	r1, [r3]	@ input4, *_79
@ /home/student/ARM_TEST/butterworth_unrolled5.c:102:         y = __QADD(
	movw	r3, #1105	@ b02_1.25_80,
	mul	r2, r3, r1	@ _81, b02_1.25_80, input4
@ /home/student/ARM_TEST/butterworth_unrolled5.c:104:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.26_82,
	lsls	r3, r3, #1	@ _83, b02_1.26_82,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:102:         y = __QADD(
	mul	r3, r6, r3	@ _84, x1, _83
	str	r2, [r7, #256]	@ _81, first
	str	r3, [r7, #252]	@ _84, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #256]	@ tmp349, first
	ldr	r2, [r7, #252]	@ tmp350, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp349, tmp350
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #248]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #248]	@ D.7786, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:102:         y = __QADD(
	mov	r4, r3	@ y, D.7786
@ /home/student/ARM_TEST/butterworth_unrolled5.c:106:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.27_85,
	mul	r3, r3, r9	@ _86, b02_1.27_85, x2
	str	r4, [r7, #268]	@ y, first
	str	r3, [r7, #264]	@ _86, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #268]	@ tmp352, first
	ldr	r2, [r7, #264]	@ tmp353, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp352, tmp353
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #260]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #260]	@ D.7780, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:106:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7780
@ /home/student/ARM_TEST/butterworth_unrolled5.c:107:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.28_87,
	mul	r3, r5, r3	@ _88, y1, a1.28_87
	str	r4, [r7, #280]	@ y, first
	str	r3, [r7, #276]	@ _88, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #280]	@ tmp355, first
	ldr	r2, [r7, #276]	@ tmp356, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp355, tmp356
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #272]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #272]	@ D.7774, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:107:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7774
@ /home/student/ARM_TEST/butterworth_unrolled5.c:108:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.29_89,
	movt	r3, 65535	@ a2.29_89,
	mul	r3, r3, r10	@ _90, a2.29_89, y2
	str	r4, [r7, #292]	@ y, first
	str	r3, [r7, #288]	@ _90, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #292]	@ tmp358, first
	ldr	r2, [r7, #288]	@ tmp359, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp358, tmp359
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #284]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #284]	@ D.7768, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:108:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7768
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _91, y,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _92, y,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _92,
	ite	ne
	movne	r2, #1	@ tmp361,
	moveq	r2, #0	@ tmp361,
	uxtb	r2, r2	@ _93, _93
@ /home/student/ARM_TEST/butterworth_unrolled5.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _91, _94
@ /home/student/ARM_TEST/butterworth_unrolled5.c:111:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:112:         x1 = input4;
	mov	r6, r1	@ x1, input4
@ /home/student/ARM_TEST/butterworth_unrolled5.c:113:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:114:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	add	r8, r8, #5	@ i, i,
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	add	r3, r8, #4	@ _95, i,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:35:     for (i = 0; i + 4 < sample_count; i += 5) {
	add	r2, r7, #296	@ tmp362,,
	sub	r2, r2, #296	@ tmp364, tmp362,
	ldr	r2, [r2]	@ tmp365, sample_count
	cmp	r2, r3	@ tmp365, _95
	bgt	.L25		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:134:     for (; i < sample_count; i++) {
	b	.L26		@
.L31:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:135:         register int current_input = x[i];
	mov	r3, r8	@ i.30_96, i
	lsls	r3, r3, #2	@ _97, i.30_96,
	add	r2, r7, #296	@ tmp366,,
	sub	r2, r2, #292	@ tmp368, tmp366,
	ldr	r2, [r2]	@ tmp369, x
	add	r3, r3, r2	@ _98, tmp369
@ /home/student/ARM_TEST/butterworth_unrolled5.c:135:         register int current_input = x[i];
	ldr	r0, [r3]	@ current_input, *_98
@ /home/student/ARM_TEST/butterworth_unrolled5.c:136:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.31_99,
	mul	r1, r3, r0	@ _100, b02_1.31_99, current_input
@ /home/student/ARM_TEST/butterworth_unrolled5.c:138:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.32_101,
	lsls	r3, r3, #1	@ _102, b02_1.32_101,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:136:         register int y = __QADD(
	mul	r2, r3, r6	@ _103, _102, x1
	add	r3, r7, #296	@ tmp370,,
	sub	r3, r3, #280	@ tmp372, tmp370,
	str	r1, [r3]	@ _100, first
	add	r3, r7, #296	@ tmp373,,
	sub	r3, r3, #284	@ tmp375, tmp373,
	str	r2, [r3]	@ _103, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #296	@ tmp380,,
	sub	r3, r3, #280	@ tmp382, tmp380,
	ldr	r3, [r3]	@ tmp383, first
	add	r2, r7, #296	@ tmp384,,
	sub	r2, r2, #284	@ tmp386, tmp384,
	ldr	r2, [r2]	@ tmp387, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp383, tmp387
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #296	@ tmp377,,
	sub	r3, r3, #288	@ tmp379, tmp377,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #296	@ tmp388,,
	sub	r3, r3, #288	@ tmp390, tmp388,
	ldr	r3, [r3]	@ D.7906, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:136:         register int y = __QADD(
	mov	r4, r3	@ y, D.7906
@ /home/student/ARM_TEST/butterworth_unrolled5.c:140:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.33_104,
	mul	r2, r3, r9	@ _105, b02_1.33_104, x2
	add	r3, r7, #296	@ tmp391,,
	sub	r3, r3, #268	@ tmp393, tmp391,
	str	r4, [r3]	@ y, first
	add	r3, r7, #296	@ tmp394,,
	sub	r3, r3, #272	@ tmp396, tmp394,
	str	r2, [r3]	@ _105, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #296	@ tmp401,,
	sub	r3, r3, #268	@ tmp403, tmp401,
	ldr	r3, [r3]	@ tmp404, first
	add	r2, r7, #296	@ tmp405,,
	sub	r2, r2, #272	@ tmp407, tmp405,
	ldr	r2, [r2]	@ tmp408, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp404, tmp408
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #296	@ tmp398,,
	sub	r3, r3, #276	@ tmp400, tmp398,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #296	@ tmp409,,
	sub	r3, r3, #276	@ tmp411, tmp409,
	ldr	r3, [r3]	@ D.7900, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:140:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7900
@ /home/student/ARM_TEST/butterworth_unrolled5.c:141:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.34_106,
	mul	r2, r3, r5	@ _107, a1.34_106, y1
	add	r3, r7, #296	@ tmp412,,
	sub	r3, r3, #256	@ tmp414, tmp412,
	str	r4, [r3]	@ y, first
	add	r3, r7, #296	@ tmp415,,
	sub	r3, r3, #260	@ tmp417, tmp415,
	str	r2, [r3]	@ _107, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #296	@ tmp422,,
	sub	r3, r3, #256	@ tmp424, tmp422,
	ldr	r3, [r3]	@ tmp425, first
	add	r2, r7, #296	@ tmp426,,
	sub	r2, r2, #260	@ tmp428, tmp426,
	ldr	r2, [r2]	@ tmp429, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp425, tmp429
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #296	@ tmp419,,
	sub	r3, r3, #264	@ tmp421, tmp419,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #296	@ tmp430,,
	sub	r3, r3, #264	@ tmp432, tmp430,
	ldr	r3, [r3]	@ D.7894, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:141:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7894
@ /home/student/ARM_TEST/butterworth_unrolled5.c:142:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.35_108,
	movt	r3, 65535	@ a2.35_108,
	mul	r3, r3, r10	@ _109, a2.35_108, y2
	str	r4, [r7, #52]	@ y, first
	str	r3, [r7, #48]	@ _109, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #52]	@ tmp434, first
	ldr	r2, [r7, #48]	@ tmp435, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp434, tmp435
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #44]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #44]	@ D.7888, result
@ /home/student/ARM_TEST/butterworth_unrolled5.c:142:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7888
@ /home/student/ARM_TEST/butterworth_unrolled5.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _110, y,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _111, y,,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _111,
	ite	ne
	movne	r2, #1	@ tmp437,
	moveq	r2, #0	@ tmp437,
	uxtb	r2, r2	@ _112, _112
@ /home/student/ARM_TEST/butterworth_unrolled5.c:143:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _110, _113
@ /home/student/ARM_TEST/butterworth_unrolled5.c:145:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:146:         x1 = current_input;
	mov	r6, r0	@ x1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled5.c:147:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:148:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:134:     for (; i < sample_count; i++) {
	add	r8, r8, #1	@ i, i,
.L26:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:134:     for (; i < sample_count; i++) {
	add	r3, r7, #296	@ tmp438,,
	sub	r3, r3, #296	@ tmp440, tmp438,
	ldr	r3, [r3]	@ tmp441, sample_count
	cmp	r8, r3	@ i, tmp441
	blt	.L31		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:151:     return y1;
	mov	r3, r5	@ _134, y1
@ /home/student/ARM_TEST/butterworth_unrolled5.c:152: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #300	@,,
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
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	b	.L34		@
.L35:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/ARM_TEST/butterworth_unrolled5.c:159:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L40	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L40+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:160:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L40+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L40+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/ARM_TEST/butterworth_unrolled5.c:164:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L34:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:158:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L35		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:170:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L36		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:171:         perror("Unable to start benchmark timer");
	ldr	r3, .L40+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:172:         return 1;
	movs	r3, #1	@ _17,
	b	.L39		@
.L36:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:175:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:175:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/ARM_TEST/butterworth_unrolled5.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:177:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L38		@,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:178:         perror("Unable to stop benchmark timer");
	ldr	r3, .L40+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:179:         return 1;
	movs	r3, #1	@ _17,
	b	.L39		@
.L38:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:182:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/ARM_TEST/butterworth_unrolled5.c:183:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L40+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/ARM_TEST/butterworth_unrolled5.c:184:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L40+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled5.c:193:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	vldr.64	d18, .L40+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/ARM_TEST/butterworth_unrolled5.c:194:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.36_13, y
	vmov	s15, r3	@ int	@ y.36_13, y.36_13
	vcvt.f64.s32	d18, s15	@ _14, y.36_13
@ /home/student/ARM_TEST/butterworth_unrolled5.c:186:     printf(
	vldr.64	d19, .L40+24	@ tmp175,
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
	ldr	r0, .L40+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled5.c:197:     return 0;
	movs	r3, #0	@ _17,
.L39:
@ /home/student/ARM_TEST/butterworth_unrolled5.c:198: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L41:
	.align	3
.L40:
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
