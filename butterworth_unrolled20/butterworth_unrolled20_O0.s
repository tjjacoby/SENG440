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
	.file	"butterworth_unrolled20.c"
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
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/ARM_TEST/butterworth_unrolled20.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled20.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:25: }
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
	@ args = 0, pretend = 0, frame = 1016
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}	@
	sub	sp, sp, #1020	@,,
	add	r7, sp, #0	@,,
	add	r3, r7, #1016	@ tmp626,,
	sub	r3, r3, #1012	@ tmp628, tmp626,
	str	r0, [r3]	@ x, x
	add	r3, r7, #1016	@ tmp629,,
	sub	r3, r3, #1016	@ tmp631, tmp629,
	str	r1, [r3]	@ sample_count, sample_count
@ /home/student/ARM_TEST/butterworth_unrolled20.c:29:     register int x1 = 0;
	movs	r6, #0	@ x1,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:30:     register int x2 = 0;
	mov	r8, #0	@ x2,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:31:     register int y1 = 0;
	movs	r5, #0	@ y1,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:32:     register int y2 = 0;
	mov	r9, #0	@ y2,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	mov	r10, #0	@ i,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	b	.L4		@
.L85:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:37:         register int input0 = x[i];
	mov	r3, r10	@ i.0_1, i
	lsls	r3, r3, #2	@ _2, i.0_1,
	add	r2, r7, #1016	@ tmp632,,
	sub	r2, r2, #1012	@ tmp634, tmp632,
	ldr	r2, [r2]	@ tmp635, x
	add	r3, r3, r2	@ _3, tmp635
@ /home/student/ARM_TEST/butterworth_unrolled20.c:37:         register int input0 = x[i];
	ldr	r0, [r3]	@ input0, *_3
@ /home/student/ARM_TEST/butterworth_unrolled20.c:38:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.1_4,
	mul	r1, r3, r0	@ _5, b02_1.1_4, input0
@ /home/student/ARM_TEST/butterworth_unrolled20.c:40:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.2_6,
	lsls	r3, r3, #1	@ _7, b02_1.2_6,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:38:         register int y = __QADD(
	mul	r2, r3, r6	@ _8, _7, x1
	add	r3, r7, #1016	@ tmp636,,
	sub	r3, r3, #952	@ tmp638, tmp636,
	str	r1, [r3]	@ _5, first
	add	r3, r7, #1016	@ tmp639,,
	sub	r3, r3, #956	@ tmp641, tmp639,
	str	r2, [r3]	@ _8, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp646,,
	sub	r3, r3, #952	@ tmp648, tmp646,
	ldr	r3, [r3]	@ tmp649, first
	add	r2, r7, #1016	@ tmp650,,
	sub	r2, r2, #956	@ tmp652, tmp650,
	ldr	r2, [r2]	@ tmp653, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp649, tmp653
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp643,,
	sub	r3, r3, #960	@ tmp645, tmp643,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp654,,
	sub	r3, r3, #960	@ tmp656, tmp654,
	ldr	r3, [r3]	@ D.8257, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:38:         register int y = __QADD(
	mov	r4, r3	@ y, D.8257
@ /home/student/ARM_TEST/butterworth_unrolled20.c:42:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.3_9,
	mul	r2, r3, r8	@ _10, b02_1.3_9, x2
	add	r3, r7, #1016	@ tmp657,,
	sub	r3, r3, #940	@ tmp659, tmp657,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp660,,
	sub	r3, r3, #944	@ tmp662, tmp660,
	str	r2, [r3]	@ _10, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp667,,
	sub	r3, r3, #940	@ tmp669, tmp667,
	ldr	r3, [r3]	@ tmp670, first
	add	r2, r7, #1016	@ tmp671,,
	sub	r2, r2, #944	@ tmp673, tmp671,
	ldr	r2, [r2]	@ tmp674, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp670, tmp674
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp664,,
	sub	r3, r3, #948	@ tmp666, tmp664,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp675,,
	sub	r3, r3, #948	@ tmp677, tmp675,
	ldr	r3, [r3]	@ D.8251, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:42:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8251
@ /home/student/ARM_TEST/butterworth_unrolled20.c:43:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.4_11,
	mul	r2, r3, r5	@ _12, a1.4_11, y1
	add	r3, r7, #1016	@ tmp678,,
	sub	r3, r3, #928	@ tmp680, tmp678,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp681,,
	sub	r3, r3, #932	@ tmp683, tmp681,
	str	r2, [r3]	@ _12, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp688,,
	sub	r3, r3, #928	@ tmp690, tmp688,
	ldr	r3, [r3]	@ tmp691, first
	add	r2, r7, #1016	@ tmp692,,
	sub	r2, r2, #932	@ tmp694, tmp692,
	ldr	r2, [r2]	@ tmp695, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp691, tmp695
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp685,,
	sub	r3, r3, #936	@ tmp687, tmp685,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp696,,
	sub	r3, r3, #936	@ tmp698, tmp696,
	ldr	r3, [r3]	@ D.8245, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:43:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8245
@ /home/student/ARM_TEST/butterworth_unrolled20.c:44:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.5_13,
	movt	r3, 65535	@ a2.5_13,
	mul	r2, r3, r9	@ _14, a2.5_13, y2
	add	r3, r7, #1016	@ tmp699,,
	sub	r3, r3, #916	@ tmp701, tmp699,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp702,,
	sub	r3, r3, #920	@ tmp704, tmp702,
	str	r2, [r3]	@ _14, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp709,,
	sub	r3, r3, #916	@ tmp711, tmp709,
	ldr	r3, [r3]	@ tmp712, first
	add	r2, r7, #1016	@ tmp713,,
	sub	r2, r2, #920	@ tmp715, tmp713,
	ldr	r2, [r2]	@ tmp716, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp712, tmp716
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp706,,
	sub	r3, r3, #924	@ tmp708, tmp706,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp717,,
	sub	r3, r3, #924	@ tmp719, tmp717,
	ldr	r3, [r3]	@ D.8239, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:44:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8239
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp721,
	moveq	r2, #0	@ tmp721,
	uxtb	r2, r2	@ _17, _17
@ /home/student/ARM_TEST/butterworth_unrolled20.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/ARM_TEST/butterworth_unrolled20.c:47:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:48:         x1 = input0;
	mov	r6, r0	@ x1, input0
@ /home/student/ARM_TEST/butterworth_unrolled20.c:49:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:50:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:53:         register int input1 = x[i + 1];
	mov	r3, r10	@ i.6_19, i
	adds	r3, r3, #1	@ _20, i.6_19,
	lsls	r3, r3, #2	@ _21, _20,
	add	r2, r7, #1016	@ tmp722,,
	sub	r2, r2, #1012	@ tmp724, tmp722,
	ldr	r2, [r2]	@ tmp725, x
	add	r3, r3, r2	@ _22, tmp725
@ /home/student/ARM_TEST/butterworth_unrolled20.c:53:         register int input1 = x[i + 1];
	ldr	r0, [r3]	@ input1, *_22
@ /home/student/ARM_TEST/butterworth_unrolled20.c:54:         y = __QADD(
	movw	r3, #1105	@ b02_1.7_23,
	mul	r1, r3, r0	@ _24, b02_1.7_23, input1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:56:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.8_25,
	lsls	r3, r3, #1	@ _26, b02_1.8_25,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:54:         y = __QADD(
	mul	r2, r3, r6	@ _27, _26, x1
	add	r3, r7, #1016	@ tmp726,,
	sub	r3, r3, #904	@ tmp728, tmp726,
	str	r1, [r3]	@ _24, first
	add	r3, r7, #1016	@ tmp729,,
	sub	r3, r3, #908	@ tmp731, tmp729,
	str	r2, [r3]	@ _27, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp736,,
	sub	r3, r3, #904	@ tmp738, tmp736,
	ldr	r3, [r3]	@ tmp739, first
	add	r2, r7, #1016	@ tmp740,,
	sub	r2, r2, #908	@ tmp742, tmp740,
	ldr	r2, [r2]	@ tmp743, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp739, tmp743
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp733,,
	sub	r3, r3, #912	@ tmp735, tmp733,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp744,,
	sub	r3, r3, #912	@ tmp746, tmp744,
	ldr	r3, [r3]	@ D.8233, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:54:         y = __QADD(
	mov	r4, r3	@ y, D.8233
@ /home/student/ARM_TEST/butterworth_unrolled20.c:58:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.9_28,
	mul	r2, r3, r8	@ _29, b02_1.9_28, x2
	add	r3, r7, #1016	@ tmp747,,
	sub	r3, r3, #892	@ tmp749, tmp747,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp750,,
	sub	r3, r3, #896	@ tmp752, tmp750,
	str	r2, [r3]	@ _29, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp757,,
	sub	r3, r3, #892	@ tmp759, tmp757,
	ldr	r3, [r3]	@ tmp760, first
	add	r2, r7, #1016	@ tmp761,,
	sub	r2, r2, #896	@ tmp763, tmp761,
	ldr	r2, [r2]	@ tmp764, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp760, tmp764
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp754,,
	sub	r3, r3, #900	@ tmp756, tmp754,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp765,,
	sub	r3, r3, #900	@ tmp767, tmp765,
	ldr	r3, [r3]	@ D.8227, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:58:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8227
@ /home/student/ARM_TEST/butterworth_unrolled20.c:59:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.10_30,
	mul	r2, r3, r5	@ _31, a1.10_30, y1
	add	r3, r7, #1016	@ tmp768,,
	sub	r3, r3, #880	@ tmp770, tmp768,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp771,,
	sub	r3, r3, #884	@ tmp773, tmp771,
	str	r2, [r3]	@ _31, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp778,,
	sub	r3, r3, #880	@ tmp780, tmp778,
	ldr	r3, [r3]	@ tmp781, first
	add	r2, r7, #1016	@ tmp782,,
	sub	r2, r2, #884	@ tmp784, tmp782,
	ldr	r2, [r2]	@ tmp785, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp781, tmp785
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp775,,
	sub	r3, r3, #888	@ tmp777, tmp775,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp786,,
	sub	r3, r3, #888	@ tmp788, tmp786,
	ldr	r3, [r3]	@ D.8221, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:59:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8221
@ /home/student/ARM_TEST/butterworth_unrolled20.c:60:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.11_32,
	movt	r3, 65535	@ a2.11_32,
	mul	r2, r3, r9	@ _33, a2.11_32, y2
	add	r3, r7, #1016	@ tmp789,,
	sub	r3, r3, #868	@ tmp791, tmp789,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp792,,
	sub	r3, r3, #872	@ tmp794, tmp792,
	str	r2, [r3]	@ _33, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp799,,
	sub	r3, r3, #868	@ tmp801, tmp799,
	ldr	r3, [r3]	@ tmp802, first
	add	r2, r7, #1016	@ tmp803,,
	sub	r2, r2, #872	@ tmp805, tmp803,
	ldr	r2, [r2]	@ tmp806, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp802, tmp806
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp796,,
	sub	r3, r3, #876	@ tmp798, tmp796,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp807,,
	sub	r3, r3, #876	@ tmp809, tmp807,
	ldr	r3, [r3]	@ D.8215, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:60:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8215
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp811,
	moveq	r2, #0	@ tmp811,
	uxtb	r2, r2	@ _36, _36
@ /home/student/ARM_TEST/butterworth_unrolled20.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/ARM_TEST/butterworth_unrolled20.c:63:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:64:         x1 = input1;
	mov	r6, r0	@ x1, input1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:65:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:66:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:69:         register int input2 = x[i + 2];
	mov	r3, r10	@ i.12_38, i
	adds	r3, r3, #2	@ _39, i.12_38,
	lsls	r3, r3, #2	@ _40, _39,
	add	r2, r7, #1016	@ tmp812,,
	sub	r2, r2, #1012	@ tmp814, tmp812,
	ldr	r2, [r2]	@ tmp815, x
	add	r3, r3, r2	@ _41, tmp815
@ /home/student/ARM_TEST/butterworth_unrolled20.c:69:         register int input2 = x[i + 2];
	ldr	r0, [r3]	@ input2, *_41
@ /home/student/ARM_TEST/butterworth_unrolled20.c:70:         y = __QADD(
	movw	r3, #1105	@ b02_1.13_42,
	mul	r1, r3, r0	@ _43, b02_1.13_42, input2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:72:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.14_44,
	lsls	r3, r3, #1	@ _45, b02_1.14_44,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:70:         y = __QADD(
	mul	r2, r3, r6	@ _46, _45, x1
	add	r3, r7, #1016	@ tmp816,,
	sub	r3, r3, #856	@ tmp818, tmp816,
	str	r1, [r3]	@ _43, first
	add	r3, r7, #1016	@ tmp819,,
	sub	r3, r3, #860	@ tmp821, tmp819,
	str	r2, [r3]	@ _46, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp826,,
	sub	r3, r3, #856	@ tmp828, tmp826,
	ldr	r3, [r3]	@ tmp829, first
	add	r2, r7, #1016	@ tmp830,,
	sub	r2, r2, #860	@ tmp832, tmp830,
	ldr	r2, [r2]	@ tmp833, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp829, tmp833
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp823,,
	sub	r3, r3, #864	@ tmp825, tmp823,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp834,,
	sub	r3, r3, #864	@ tmp836, tmp834,
	ldr	r3, [r3]	@ D.8209, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:70:         y = __QADD(
	mov	r4, r3	@ y, D.8209
@ /home/student/ARM_TEST/butterworth_unrolled20.c:74:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.15_47,
	mul	r2, r3, r8	@ _48, b02_1.15_47, x2
	add	r3, r7, #1016	@ tmp837,,
	sub	r3, r3, #844	@ tmp839, tmp837,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp840,,
	sub	r3, r3, #848	@ tmp842, tmp840,
	str	r2, [r3]	@ _48, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp847,,
	sub	r3, r3, #844	@ tmp849, tmp847,
	ldr	r3, [r3]	@ tmp850, first
	add	r2, r7, #1016	@ tmp851,,
	sub	r2, r2, #848	@ tmp853, tmp851,
	ldr	r2, [r2]	@ tmp854, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp850, tmp854
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp844,,
	sub	r3, r3, #852	@ tmp846, tmp844,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp855,,
	sub	r3, r3, #852	@ tmp857, tmp855,
	ldr	r3, [r3]	@ D.8203, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:74:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8203
@ /home/student/ARM_TEST/butterworth_unrolled20.c:75:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.16_49,
	mul	r2, r3, r5	@ _50, a1.16_49, y1
	add	r3, r7, #1016	@ tmp858,,
	sub	r3, r3, #832	@ tmp860, tmp858,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp861,,
	sub	r3, r3, #836	@ tmp863, tmp861,
	str	r2, [r3]	@ _50, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp868,,
	sub	r3, r3, #832	@ tmp870, tmp868,
	ldr	r3, [r3]	@ tmp871, first
	add	r2, r7, #1016	@ tmp872,,
	sub	r2, r2, #836	@ tmp874, tmp872,
	ldr	r2, [r2]	@ tmp875, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp871, tmp875
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp865,,
	sub	r3, r3, #840	@ tmp867, tmp865,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp876,,
	sub	r3, r3, #840	@ tmp878, tmp876,
	ldr	r3, [r3]	@ D.8197, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:75:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8197
@ /home/student/ARM_TEST/butterworth_unrolled20.c:76:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.17_51,
	movt	r3, 65535	@ a2.17_51,
	mul	r2, r3, r9	@ _52, a2.17_51, y2
	add	r3, r7, #1016	@ tmp879,,
	sub	r3, r3, #820	@ tmp881, tmp879,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp882,,
	sub	r3, r3, #824	@ tmp884, tmp882,
	str	r2, [r3]	@ _52, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp889,,
	sub	r3, r3, #820	@ tmp891, tmp889,
	ldr	r3, [r3]	@ tmp892, first
	add	r2, r7, #1016	@ tmp893,,
	sub	r2, r2, #824	@ tmp895, tmp893,
	ldr	r2, [r2]	@ tmp896, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp892, tmp896
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp886,,
	sub	r3, r3, #828	@ tmp888, tmp886,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp897,,
	sub	r3, r3, #828	@ tmp899, tmp897,
	ldr	r3, [r3]	@ D.8191, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:76:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8191
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp901,
	moveq	r2, #0	@ tmp901,
	uxtb	r2, r2	@ _55, _55
@ /home/student/ARM_TEST/butterworth_unrolled20.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/ARM_TEST/butterworth_unrolled20.c:79:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:80:         x1 = input2;
	mov	r6, r0	@ x1, input2
@ /home/student/ARM_TEST/butterworth_unrolled20.c:81:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:82:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:85:         register int input3 = x[i + 3];
	mov	r3, r10	@ i.18_57, i
	adds	r3, r3, #3	@ _58, i.18_57,
	lsls	r3, r3, #2	@ _59, _58,
	add	r2, r7, #1016	@ tmp902,,
	sub	r2, r2, #1012	@ tmp904, tmp902,
	ldr	r2, [r2]	@ tmp905, x
	add	r3, r3, r2	@ _60, tmp905
@ /home/student/ARM_TEST/butterworth_unrolled20.c:85:         register int input3 = x[i + 3];
	ldr	r0, [r3]	@ input3, *_60
@ /home/student/ARM_TEST/butterworth_unrolled20.c:86:         y = __QADD(
	movw	r3, #1105	@ b02_1.19_61,
	mul	r1, r3, r0	@ _62, b02_1.19_61, input3
@ /home/student/ARM_TEST/butterworth_unrolled20.c:88:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.20_63,
	lsls	r3, r3, #1	@ _64, b02_1.20_63,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:86:         y = __QADD(
	mul	r2, r3, r6	@ _65, _64, x1
	add	r3, r7, #1016	@ tmp906,,
	sub	r3, r3, #808	@ tmp908, tmp906,
	str	r1, [r3]	@ _62, first
	add	r3, r7, #1016	@ tmp909,,
	sub	r3, r3, #812	@ tmp911, tmp909,
	str	r2, [r3]	@ _65, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp916,,
	sub	r3, r3, #808	@ tmp918, tmp916,
	ldr	r3, [r3]	@ tmp919, first
	add	r2, r7, #1016	@ tmp920,,
	sub	r2, r2, #812	@ tmp922, tmp920,
	ldr	r2, [r2]	@ tmp923, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp919, tmp923
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp913,,
	sub	r3, r3, #816	@ tmp915, tmp913,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp924,,
	sub	r3, r3, #816	@ tmp926, tmp924,
	ldr	r3, [r3]	@ D.8185, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:86:         y = __QADD(
	mov	r4, r3	@ y, D.8185
@ /home/student/ARM_TEST/butterworth_unrolled20.c:90:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.21_66,
	mul	r2, r3, r8	@ _67, b02_1.21_66, x2
	add	r3, r7, #1016	@ tmp927,,
	sub	r3, r3, #796	@ tmp929, tmp927,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp930,,
	sub	r3, r3, #800	@ tmp932, tmp930,
	str	r2, [r3]	@ _67, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp937,,
	sub	r3, r3, #796	@ tmp939, tmp937,
	ldr	r3, [r3]	@ tmp940, first
	add	r2, r7, #1016	@ tmp941,,
	sub	r2, r2, #800	@ tmp943, tmp941,
	ldr	r2, [r2]	@ tmp944, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp940, tmp944
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp934,,
	sub	r3, r3, #804	@ tmp936, tmp934,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp945,,
	sub	r3, r3, #804	@ tmp947, tmp945,
	ldr	r3, [r3]	@ D.8179, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:90:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8179
@ /home/student/ARM_TEST/butterworth_unrolled20.c:91:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.22_68,
	mul	r2, r3, r5	@ _69, a1.22_68, y1
	add	r3, r7, #1016	@ tmp948,,
	sub	r3, r3, #784	@ tmp950, tmp948,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp951,,
	sub	r3, r3, #788	@ tmp953, tmp951,
	str	r2, [r3]	@ _69, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp958,,
	sub	r3, r3, #784	@ tmp960, tmp958,
	ldr	r3, [r3]	@ tmp961, first
	add	r2, r7, #1016	@ tmp962,,
	sub	r2, r2, #788	@ tmp964, tmp962,
	ldr	r2, [r2]	@ tmp965, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp961, tmp965
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp955,,
	sub	r3, r3, #792	@ tmp957, tmp955,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp966,,
	sub	r3, r3, #792	@ tmp968, tmp966,
	ldr	r3, [r3]	@ D.8173, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:91:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8173
@ /home/student/ARM_TEST/butterworth_unrolled20.c:92:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.23_70,
	movt	r3, 65535	@ a2.23_70,
	mul	r2, r3, r9	@ _71, a2.23_70, y2
	add	r3, r7, #1016	@ tmp969,,
	sub	r3, r3, #772	@ tmp971, tmp969,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp972,,
	sub	r3, r3, #776	@ tmp974, tmp972,
	str	r2, [r3]	@ _71, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp979,,
	sub	r3, r3, #772	@ tmp981, tmp979,
	ldr	r3, [r3]	@ tmp982, first
	add	r2, r7, #1016	@ tmp983,,
	sub	r2, r2, #776	@ tmp985, tmp983,
	ldr	r2, [r2]	@ tmp986, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp982, tmp986
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp976,,
	sub	r3, r3, #780	@ tmp978, tmp976,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp987,,
	sub	r3, r3, #780	@ tmp989, tmp987,
	ldr	r3, [r3]	@ D.8167, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:92:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8167
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _72, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _73, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _73,
	ite	ne
	movne	r2, #1	@ tmp991,
	moveq	r2, #0	@ tmp991,
	uxtb	r2, r2	@ _74, _74
@ /home/student/ARM_TEST/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _72, _75
@ /home/student/ARM_TEST/butterworth_unrolled20.c:95:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:96:         x1 = input3;
	mov	r6, r0	@ x1, input3
@ /home/student/ARM_TEST/butterworth_unrolled20.c:97:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:98:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:101:         register int input4 = x[i + 4];
	mov	r3, r10	@ i.24_76, i
	adds	r3, r3, #4	@ _77, i.24_76,
	lsls	r3, r3, #2	@ _78, _77,
	add	r2, r7, #1016	@ tmp992,,
	sub	r2, r2, #1012	@ tmp994, tmp992,
	ldr	r2, [r2]	@ tmp995, x
	add	r3, r3, r2	@ _79, tmp995
@ /home/student/ARM_TEST/butterworth_unrolled20.c:101:         register int input4 = x[i + 4];
	ldr	r0, [r3]	@ input4, *_79
@ /home/student/ARM_TEST/butterworth_unrolled20.c:102:         y = __QADD(
	movw	r3, #1105	@ b02_1.25_80,
	mul	r1, r3, r0	@ _81, b02_1.25_80, input4
@ /home/student/ARM_TEST/butterworth_unrolled20.c:104:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.26_82,
	lsls	r3, r3, #1	@ _83, b02_1.26_82,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:102:         y = __QADD(
	mul	r2, r3, r6	@ _84, _83, x1
	add	r3, r7, #1016	@ tmp996,,
	sub	r3, r3, #760	@ tmp998, tmp996,
	str	r1, [r3]	@ _81, first
	add	r3, r7, #1016	@ tmp999,,
	sub	r3, r3, #764	@ tmp1001, tmp999,
	str	r2, [r3]	@ _84, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1006,,
	sub	r3, r3, #760	@ tmp1008, tmp1006,
	ldr	r3, [r3]	@ tmp1009, first
	add	r2, r7, #1016	@ tmp1010,,
	sub	r2, r2, #764	@ tmp1012, tmp1010,
	ldr	r2, [r2]	@ tmp1013, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1009, tmp1013
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1003,,
	sub	r3, r3, #768	@ tmp1005, tmp1003,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1014,,
	sub	r3, r3, #768	@ tmp1016, tmp1014,
	ldr	r3, [r3]	@ D.8161, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:102:         y = __QADD(
	mov	r4, r3	@ y, D.8161
@ /home/student/ARM_TEST/butterworth_unrolled20.c:106:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.27_85,
	mul	r2, r3, r8	@ _86, b02_1.27_85, x2
	add	r3, r7, #1016	@ tmp1017,,
	sub	r3, r3, #748	@ tmp1019, tmp1017,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1020,,
	sub	r3, r3, #752	@ tmp1022, tmp1020,
	str	r2, [r3]	@ _86, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1027,,
	sub	r3, r3, #748	@ tmp1029, tmp1027,
	ldr	r3, [r3]	@ tmp1030, first
	add	r2, r7, #1016	@ tmp1031,,
	sub	r2, r2, #752	@ tmp1033, tmp1031,
	ldr	r2, [r2]	@ tmp1034, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1030, tmp1034
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1024,,
	sub	r3, r3, #756	@ tmp1026, tmp1024,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1035,,
	sub	r3, r3, #756	@ tmp1037, tmp1035,
	ldr	r3, [r3]	@ D.8155, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:106:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8155
@ /home/student/ARM_TEST/butterworth_unrolled20.c:107:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.28_87,
	mul	r2, r3, r5	@ _88, a1.28_87, y1
	add	r3, r7, #1016	@ tmp1038,,
	sub	r3, r3, #736	@ tmp1040, tmp1038,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1041,,
	sub	r3, r3, #740	@ tmp1043, tmp1041,
	str	r2, [r3]	@ _88, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1048,,
	sub	r3, r3, #736	@ tmp1050, tmp1048,
	ldr	r3, [r3]	@ tmp1051, first
	add	r2, r7, #1016	@ tmp1052,,
	sub	r2, r2, #740	@ tmp1054, tmp1052,
	ldr	r2, [r2]	@ tmp1055, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1051, tmp1055
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1045,,
	sub	r3, r3, #744	@ tmp1047, tmp1045,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1056,,
	sub	r3, r3, #744	@ tmp1058, tmp1056,
	ldr	r3, [r3]	@ D.8149, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:107:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8149
@ /home/student/ARM_TEST/butterworth_unrolled20.c:108:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.29_89,
	movt	r3, 65535	@ a2.29_89,
	mul	r2, r3, r9	@ _90, a2.29_89, y2
	add	r3, r7, #1016	@ tmp1059,,
	sub	r3, r3, #724	@ tmp1061, tmp1059,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1062,,
	sub	r3, r3, #728	@ tmp1064, tmp1062,
	str	r2, [r3]	@ _90, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1069,,
	sub	r3, r3, #724	@ tmp1071, tmp1069,
	ldr	r3, [r3]	@ tmp1072, first
	add	r2, r7, #1016	@ tmp1073,,
	sub	r2, r2, #728	@ tmp1075, tmp1073,
	ldr	r2, [r2]	@ tmp1076, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1072, tmp1076
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1066,,
	sub	r3, r3, #732	@ tmp1068, tmp1066,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1077,,
	sub	r3, r3, #732	@ tmp1079, tmp1077,
	ldr	r3, [r3]	@ D.8143, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:108:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8143
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _91, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _92, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _92,
	ite	ne
	movne	r2, #1	@ tmp1081,
	moveq	r2, #0	@ tmp1081,
	uxtb	r2, r2	@ _93, _93
@ /home/student/ARM_TEST/butterworth_unrolled20.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _91, _94
@ /home/student/ARM_TEST/butterworth_unrolled20.c:111:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:112:         x1 = input4;
	mov	r6, r0	@ x1, input4
@ /home/student/ARM_TEST/butterworth_unrolled20.c:113:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:114:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:117:         register int input5 = x[i + 5];
	mov	r3, r10	@ i.30_95, i
	adds	r3, r3, #5	@ _96, i.30_95,
	lsls	r3, r3, #2	@ _97, _96,
	add	r2, r7, #1016	@ tmp1082,,
	sub	r2, r2, #1012	@ tmp1084, tmp1082,
	ldr	r2, [r2]	@ tmp1085, x
	add	r3, r3, r2	@ _98, tmp1085
@ /home/student/ARM_TEST/butterworth_unrolled20.c:117:         register int input5 = x[i + 5];
	ldr	r0, [r3]	@ input5, *_98
@ /home/student/ARM_TEST/butterworth_unrolled20.c:118:         y = __QADD(
	movw	r3, #1105	@ b02_1.31_99,
	mul	r1, r3, r0	@ _100, b02_1.31_99, input5
@ /home/student/ARM_TEST/butterworth_unrolled20.c:120:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.32_101,
	lsls	r3, r3, #1	@ _102, b02_1.32_101,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:118:         y = __QADD(
	mul	r2, r3, r6	@ _103, _102, x1
	add	r3, r7, #1016	@ tmp1086,,
	sub	r3, r3, #712	@ tmp1088, tmp1086,
	str	r1, [r3]	@ _100, first
	add	r3, r7, #1016	@ tmp1089,,
	sub	r3, r3, #716	@ tmp1091, tmp1089,
	str	r2, [r3]	@ _103, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1096,,
	sub	r3, r3, #712	@ tmp1098, tmp1096,
	ldr	r3, [r3]	@ tmp1099, first
	add	r2, r7, #1016	@ tmp1100,,
	sub	r2, r2, #716	@ tmp1102, tmp1100,
	ldr	r2, [r2]	@ tmp1103, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1099, tmp1103
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1093,,
	sub	r3, r3, #720	@ tmp1095, tmp1093,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1104,,
	sub	r3, r3, #720	@ tmp1106, tmp1104,
	ldr	r3, [r3]	@ D.8137, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:118:         y = __QADD(
	mov	r4, r3	@ y, D.8137
@ /home/student/ARM_TEST/butterworth_unrolled20.c:122:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.33_104,
	mul	r2, r3, r8	@ _105, b02_1.33_104, x2
	add	r3, r7, #1016	@ tmp1107,,
	sub	r3, r3, #700	@ tmp1109, tmp1107,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1110,,
	sub	r3, r3, #704	@ tmp1112, tmp1110,
	str	r2, [r3]	@ _105, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1117,,
	sub	r3, r3, #700	@ tmp1119, tmp1117,
	ldr	r3, [r3]	@ tmp1120, first
	add	r2, r7, #1016	@ tmp1121,,
	sub	r2, r2, #704	@ tmp1123, tmp1121,
	ldr	r2, [r2]	@ tmp1124, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1120, tmp1124
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1114,,
	sub	r3, r3, #708	@ tmp1116, tmp1114,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1125,,
	sub	r3, r3, #708	@ tmp1127, tmp1125,
	ldr	r3, [r3]	@ D.8131, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:122:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8131
@ /home/student/ARM_TEST/butterworth_unrolled20.c:123:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.34_106,
	mul	r2, r3, r5	@ _107, a1.34_106, y1
	add	r3, r7, #1016	@ tmp1128,,
	sub	r3, r3, #688	@ tmp1130, tmp1128,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1131,,
	sub	r3, r3, #692	@ tmp1133, tmp1131,
	str	r2, [r3]	@ _107, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1138,,
	sub	r3, r3, #688	@ tmp1140, tmp1138,
	ldr	r3, [r3]	@ tmp1141, first
	add	r2, r7, #1016	@ tmp1142,,
	sub	r2, r2, #692	@ tmp1144, tmp1142,
	ldr	r2, [r2]	@ tmp1145, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1141, tmp1145
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1135,,
	sub	r3, r3, #696	@ tmp1137, tmp1135,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1146,,
	sub	r3, r3, #696	@ tmp1148, tmp1146,
	ldr	r3, [r3]	@ D.8125, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:123:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8125
@ /home/student/ARM_TEST/butterworth_unrolled20.c:124:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.35_108,
	movt	r3, 65535	@ a2.35_108,
	mul	r2, r3, r9	@ _109, a2.35_108, y2
	add	r3, r7, #1016	@ tmp1149,,
	sub	r3, r3, #676	@ tmp1151, tmp1149,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1152,,
	sub	r3, r3, #680	@ tmp1154, tmp1152,
	str	r2, [r3]	@ _109, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1159,,
	sub	r3, r3, #676	@ tmp1161, tmp1159,
	ldr	r3, [r3]	@ tmp1162, first
	add	r2, r7, #1016	@ tmp1163,,
	sub	r2, r2, #680	@ tmp1165, tmp1163,
	ldr	r2, [r2]	@ tmp1166, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1162, tmp1166
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1156,,
	sub	r3, r3, #684	@ tmp1158, tmp1156,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1167,,
	sub	r3, r3, #684	@ tmp1169, tmp1167,
	ldr	r3, [r3]	@ D.8119, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:124:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8119
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _110, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _111, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _111,
	ite	ne
	movne	r2, #1	@ tmp1171,
	moveq	r2, #0	@ tmp1171,
	uxtb	r2, r2	@ _112, _112
@ /home/student/ARM_TEST/butterworth_unrolled20.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _110, _113
@ /home/student/ARM_TEST/butterworth_unrolled20.c:127:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:128:         x1 = input5;
	mov	r6, r0	@ x1, input5
@ /home/student/ARM_TEST/butterworth_unrolled20.c:129:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:130:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:133:         register int input6 = x[i + 6];
	mov	r3, r10	@ i.36_114, i
	adds	r3, r3, #6	@ _115, i.36_114,
	lsls	r3, r3, #2	@ _116, _115,
	add	r2, r7, #1016	@ tmp1172,,
	sub	r2, r2, #1012	@ tmp1174, tmp1172,
	ldr	r2, [r2]	@ tmp1175, x
	add	r3, r3, r2	@ _117, tmp1175
@ /home/student/ARM_TEST/butterworth_unrolled20.c:133:         register int input6 = x[i + 6];
	ldr	r0, [r3]	@ input6, *_117
@ /home/student/ARM_TEST/butterworth_unrolled20.c:134:         y = __QADD(
	movw	r3, #1105	@ b02_1.37_118,
	mul	r1, r3, r0	@ _119, b02_1.37_118, input6
@ /home/student/ARM_TEST/butterworth_unrolled20.c:136:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.38_120,
	lsls	r3, r3, #1	@ _121, b02_1.38_120,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:134:         y = __QADD(
	mul	r2, r3, r6	@ _122, _121, x1
	add	r3, r7, #1016	@ tmp1176,,
	sub	r3, r3, #664	@ tmp1178, tmp1176,
	str	r1, [r3]	@ _119, first
	add	r3, r7, #1016	@ tmp1179,,
	sub	r3, r3, #668	@ tmp1181, tmp1179,
	str	r2, [r3]	@ _122, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1186,,
	sub	r3, r3, #664	@ tmp1188, tmp1186,
	ldr	r3, [r3]	@ tmp1189, first
	add	r2, r7, #1016	@ tmp1190,,
	sub	r2, r2, #668	@ tmp1192, tmp1190,
	ldr	r2, [r2]	@ tmp1193, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1189, tmp1193
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1183,,
	sub	r3, r3, #672	@ tmp1185, tmp1183,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1194,,
	sub	r3, r3, #672	@ tmp1196, tmp1194,
	ldr	r3, [r3]	@ D.8113, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:134:         y = __QADD(
	mov	r4, r3	@ y, D.8113
@ /home/student/ARM_TEST/butterworth_unrolled20.c:138:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.39_123,
	mul	r2, r3, r8	@ _124, b02_1.39_123, x2
	add	r3, r7, #1016	@ tmp1197,,
	sub	r3, r3, #652	@ tmp1199, tmp1197,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1200,,
	sub	r3, r3, #656	@ tmp1202, tmp1200,
	str	r2, [r3]	@ _124, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1207,,
	sub	r3, r3, #652	@ tmp1209, tmp1207,
	ldr	r3, [r3]	@ tmp1210, first
	add	r2, r7, #1016	@ tmp1211,,
	sub	r2, r2, #656	@ tmp1213, tmp1211,
	ldr	r2, [r2]	@ tmp1214, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1210, tmp1214
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1204,,
	sub	r3, r3, #660	@ tmp1206, tmp1204,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1215,,
	sub	r3, r3, #660	@ tmp1217, tmp1215,
	ldr	r3, [r3]	@ D.8107, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:138:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8107
@ /home/student/ARM_TEST/butterworth_unrolled20.c:139:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.40_125,
	mul	r2, r3, r5	@ _126, a1.40_125, y1
	add	r3, r7, #1016	@ tmp1218,,
	sub	r3, r3, #640	@ tmp1220, tmp1218,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1221,,
	sub	r3, r3, #644	@ tmp1223, tmp1221,
	str	r2, [r3]	@ _126, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1228,,
	sub	r3, r3, #640	@ tmp1230, tmp1228,
	ldr	r3, [r3]	@ tmp1231, first
	add	r2, r7, #1016	@ tmp1232,,
	sub	r2, r2, #644	@ tmp1234, tmp1232,
	ldr	r2, [r2]	@ tmp1235, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1231, tmp1235
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1225,,
	sub	r3, r3, #648	@ tmp1227, tmp1225,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1236,,
	sub	r3, r3, #648	@ tmp1238, tmp1236,
	ldr	r3, [r3]	@ D.8101, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:139:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8101
@ /home/student/ARM_TEST/butterworth_unrolled20.c:140:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.41_127,
	movt	r3, 65535	@ a2.41_127,
	mul	r2, r3, r9	@ _128, a2.41_127, y2
	add	r3, r7, #1016	@ tmp1239,,
	sub	r3, r3, #628	@ tmp1241, tmp1239,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1242,,
	sub	r3, r3, #632	@ tmp1244, tmp1242,
	str	r2, [r3]	@ _128, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1249,,
	sub	r3, r3, #628	@ tmp1251, tmp1249,
	ldr	r3, [r3]	@ tmp1252, first
	add	r2, r7, #1016	@ tmp1253,,
	sub	r2, r2, #632	@ tmp1255, tmp1253,
	ldr	r2, [r2]	@ tmp1256, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1252, tmp1256
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1246,,
	sub	r3, r3, #636	@ tmp1248, tmp1246,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1257,,
	sub	r3, r3, #636	@ tmp1259, tmp1257,
	ldr	r3, [r3]	@ D.8095, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:140:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8095
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _129, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _130, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _130,
	ite	ne
	movne	r2, #1	@ tmp1261,
	moveq	r2, #0	@ tmp1261,
	uxtb	r2, r2	@ _131, _131
@ /home/student/ARM_TEST/butterworth_unrolled20.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _129, _132
@ /home/student/ARM_TEST/butterworth_unrolled20.c:143:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:144:         x1 = input6;
	mov	r6, r0	@ x1, input6
@ /home/student/ARM_TEST/butterworth_unrolled20.c:145:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:146:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:149:         register int input7 = x[i + 7];
	mov	r3, r10	@ i.42_133, i
	adds	r3, r3, #7	@ _134, i.42_133,
	lsls	r3, r3, #2	@ _135, _134,
	add	r2, r7, #1016	@ tmp1262,,
	sub	r2, r2, #1012	@ tmp1264, tmp1262,
	ldr	r2, [r2]	@ tmp1265, x
	add	r3, r3, r2	@ _136, tmp1265
@ /home/student/ARM_TEST/butterworth_unrolled20.c:149:         register int input7 = x[i + 7];
	ldr	r0, [r3]	@ input7, *_136
@ /home/student/ARM_TEST/butterworth_unrolled20.c:150:         y = __QADD(
	movw	r3, #1105	@ b02_1.43_137,
	mul	r1, r3, r0	@ _138, b02_1.43_137, input7
@ /home/student/ARM_TEST/butterworth_unrolled20.c:152:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.44_139,
	lsls	r3, r3, #1	@ _140, b02_1.44_139,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:150:         y = __QADD(
	mul	r2, r3, r6	@ _141, _140, x1
	add	r3, r7, #1016	@ tmp1266,,
	sub	r3, r3, #616	@ tmp1268, tmp1266,
	str	r1, [r3]	@ _138, first
	add	r3, r7, #1016	@ tmp1269,,
	sub	r3, r3, #620	@ tmp1271, tmp1269,
	str	r2, [r3]	@ _141, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1276,,
	sub	r3, r3, #616	@ tmp1278, tmp1276,
	ldr	r3, [r3]	@ tmp1279, first
	add	r2, r7, #1016	@ tmp1280,,
	sub	r2, r2, #620	@ tmp1282, tmp1280,
	ldr	r2, [r2]	@ tmp1283, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1279, tmp1283
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1273,,
	sub	r3, r3, #624	@ tmp1275, tmp1273,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1284,,
	sub	r3, r3, #624	@ tmp1286, tmp1284,
	ldr	r3, [r3]	@ D.8089, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:150:         y = __QADD(
	mov	r4, r3	@ y, D.8089
@ /home/student/ARM_TEST/butterworth_unrolled20.c:154:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.45_142,
	mul	r2, r3, r8	@ _143, b02_1.45_142, x2
	add	r3, r7, #1016	@ tmp1287,,
	sub	r3, r3, #604	@ tmp1289, tmp1287,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1290,,
	sub	r3, r3, #608	@ tmp1292, tmp1290,
	str	r2, [r3]	@ _143, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1297,,
	sub	r3, r3, #604	@ tmp1299, tmp1297,
	ldr	r3, [r3]	@ tmp1300, first
	add	r2, r7, #1016	@ tmp1301,,
	sub	r2, r2, #608	@ tmp1303, tmp1301,
	ldr	r2, [r2]	@ tmp1304, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1300, tmp1304
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1294,,
	sub	r3, r3, #612	@ tmp1296, tmp1294,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1305,,
	sub	r3, r3, #612	@ tmp1307, tmp1305,
	ldr	r3, [r3]	@ D.8083, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:154:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8083
@ /home/student/ARM_TEST/butterworth_unrolled20.c:155:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.46_144,
	mul	r2, r3, r5	@ _145, a1.46_144, y1
	add	r3, r7, #1016	@ tmp1308,,
	sub	r3, r3, #592	@ tmp1310, tmp1308,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1311,,
	sub	r3, r3, #596	@ tmp1313, tmp1311,
	str	r2, [r3]	@ _145, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1318,,
	sub	r3, r3, #592	@ tmp1320, tmp1318,
	ldr	r3, [r3]	@ tmp1321, first
	add	r2, r7, #1016	@ tmp1322,,
	sub	r2, r2, #596	@ tmp1324, tmp1322,
	ldr	r2, [r2]	@ tmp1325, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1321, tmp1325
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1315,,
	sub	r3, r3, #600	@ tmp1317, tmp1315,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1326,,
	sub	r3, r3, #600	@ tmp1328, tmp1326,
	ldr	r3, [r3]	@ D.8077, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:155:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8077
@ /home/student/ARM_TEST/butterworth_unrolled20.c:156:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.47_146,
	movt	r3, 65535	@ a2.47_146,
	mul	r2, r3, r9	@ _147, a2.47_146, y2
	add	r3, r7, #1016	@ tmp1329,,
	sub	r3, r3, #580	@ tmp1331, tmp1329,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1332,,
	sub	r3, r3, #584	@ tmp1334, tmp1332,
	str	r2, [r3]	@ _147, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1339,,
	sub	r3, r3, #580	@ tmp1341, tmp1339,
	ldr	r3, [r3]	@ tmp1342, first
	add	r2, r7, #1016	@ tmp1343,,
	sub	r2, r2, #584	@ tmp1345, tmp1343,
	ldr	r2, [r2]	@ tmp1346, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1342, tmp1346
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1336,,
	sub	r3, r3, #588	@ tmp1338, tmp1336,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1347,,
	sub	r3, r3, #588	@ tmp1349, tmp1347,
	ldr	r3, [r3]	@ D.8071, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:156:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8071
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _148, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _149, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _149,
	ite	ne
	movne	r2, #1	@ tmp1351,
	moveq	r2, #0	@ tmp1351,
	uxtb	r2, r2	@ _150, _150
@ /home/student/ARM_TEST/butterworth_unrolled20.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _148, _151
@ /home/student/ARM_TEST/butterworth_unrolled20.c:159:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:160:         x1 = input7;
	mov	r6, r0	@ x1, input7
@ /home/student/ARM_TEST/butterworth_unrolled20.c:161:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:162:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:164:         register int input8 = x[i + 8];
	mov	r3, r10	@ i.48_152, i
	adds	r3, r3, #8	@ _153, i.48_152,
	lsls	r3, r3, #2	@ _154, _153,
	add	r2, r7, #1016	@ tmp1352,,
	sub	r2, r2, #1012	@ tmp1354, tmp1352,
	ldr	r2, [r2]	@ tmp1355, x
	add	r3, r3, r2	@ _155, tmp1355
@ /home/student/ARM_TEST/butterworth_unrolled20.c:164:         register int input8 = x[i + 8];
	ldr	r0, [r3]	@ input8, *_155
@ /home/student/ARM_TEST/butterworth_unrolled20.c:165:         y = __QADD(
	movw	r3, #1105	@ b02_1.49_156,
	mul	r1, r3, r0	@ _157, b02_1.49_156, input8
@ /home/student/ARM_TEST/butterworth_unrolled20.c:167:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.50_158,
	lsls	r3, r3, #1	@ _159, b02_1.50_158,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:165:         y = __QADD(
	mul	r2, r3, r6	@ _160, _159, x1
	add	r3, r7, #1016	@ tmp1356,,
	sub	r3, r3, #568	@ tmp1358, tmp1356,
	str	r1, [r3]	@ _157, first
	add	r3, r7, #1016	@ tmp1359,,
	sub	r3, r3, #572	@ tmp1361, tmp1359,
	str	r2, [r3]	@ _160, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1366,,
	sub	r3, r3, #568	@ tmp1368, tmp1366,
	ldr	r3, [r3]	@ tmp1369, first
	add	r2, r7, #1016	@ tmp1370,,
	sub	r2, r2, #572	@ tmp1372, tmp1370,
	ldr	r2, [r2]	@ tmp1373, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1369, tmp1373
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1363,,
	sub	r3, r3, #576	@ tmp1365, tmp1363,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1374,,
	sub	r3, r3, #576	@ tmp1376, tmp1374,
	ldr	r3, [r3]	@ D.8065, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:165:         y = __QADD(
	mov	r4, r3	@ y, D.8065
@ /home/student/ARM_TEST/butterworth_unrolled20.c:169:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.51_161,
	mul	r2, r3, r8	@ _162, b02_1.51_161, x2
	add	r3, r7, #1016	@ tmp1377,,
	sub	r3, r3, #556	@ tmp1379, tmp1377,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1380,,
	sub	r3, r3, #560	@ tmp1382, tmp1380,
	str	r2, [r3]	@ _162, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1387,,
	sub	r3, r3, #556	@ tmp1389, tmp1387,
	ldr	r3, [r3]	@ tmp1390, first
	add	r2, r7, #1016	@ tmp1391,,
	sub	r2, r2, #560	@ tmp1393, tmp1391,
	ldr	r2, [r2]	@ tmp1394, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1390, tmp1394
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1384,,
	sub	r3, r3, #564	@ tmp1386, tmp1384,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1395,,
	sub	r3, r3, #564	@ tmp1397, tmp1395,
	ldr	r3, [r3]	@ D.8059, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:169:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8059
@ /home/student/ARM_TEST/butterworth_unrolled20.c:170:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.52_163,
	mul	r2, r3, r5	@ _164, a1.52_163, y1
	add	r3, r7, #1016	@ tmp1398,,
	sub	r3, r3, #544	@ tmp1400, tmp1398,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1401,,
	sub	r3, r3, #548	@ tmp1403, tmp1401,
	str	r2, [r3]	@ _164, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1408,,
	sub	r3, r3, #544	@ tmp1410, tmp1408,
	ldr	r3, [r3]	@ tmp1411, first
	add	r2, r7, #1016	@ tmp1412,,
	sub	r2, r2, #548	@ tmp1414, tmp1412,
	ldr	r2, [r2]	@ tmp1415, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1411, tmp1415
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1405,,
	sub	r3, r3, #552	@ tmp1407, tmp1405,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1416,,
	sub	r3, r3, #552	@ tmp1418, tmp1416,
	ldr	r3, [r3]	@ D.8053, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:170:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8053
@ /home/student/ARM_TEST/butterworth_unrolled20.c:171:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.53_165,
	movt	r3, 65535	@ a2.53_165,
	mul	r2, r3, r9	@ _166, a2.53_165, y2
	add	r3, r7, #1016	@ tmp1419,,
	sub	r3, r3, #532	@ tmp1421, tmp1419,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1422,,
	sub	r3, r3, #536	@ tmp1424, tmp1422,
	str	r2, [r3]	@ _166, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1429,,
	sub	r3, r3, #532	@ tmp1431, tmp1429,
	ldr	r3, [r3]	@ tmp1432, first
	add	r2, r7, #1016	@ tmp1433,,
	sub	r2, r2, #536	@ tmp1435, tmp1433,
	ldr	r2, [r2]	@ tmp1436, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1432, tmp1436
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1426,,
	sub	r3, r3, #540	@ tmp1428, tmp1426,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1437,,
	sub	r3, r3, #540	@ tmp1439, tmp1437,
	ldr	r3, [r3]	@ D.8047, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:171:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8047
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _167, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _168, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _168,
	ite	ne
	movne	r2, #1	@ tmp1441,
	moveq	r2, #0	@ tmp1441,
	uxtb	r2, r2	@ _169, _169
@ /home/student/ARM_TEST/butterworth_unrolled20.c:172:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _167, _170
@ /home/student/ARM_TEST/butterworth_unrolled20.c:174:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:175:         x1 = input8;
	mov	r6, r0	@ x1, input8
@ /home/student/ARM_TEST/butterworth_unrolled20.c:176:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:177:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:179:         register int input9 = x[i + 9];
	mov	r3, r10	@ i.54_171, i
	adds	r3, r3, #9	@ _172, i.54_171,
	lsls	r3, r3, #2	@ _173, _172,
	add	r2, r7, #1016	@ tmp1442,,
	sub	r2, r2, #1012	@ tmp1444, tmp1442,
	ldr	r2, [r2]	@ tmp1445, x
	add	r3, r3, r2	@ _174, tmp1445
@ /home/student/ARM_TEST/butterworth_unrolled20.c:179:         register int input9 = x[i + 9];
	ldr	r0, [r3]	@ input9, *_174
@ /home/student/ARM_TEST/butterworth_unrolled20.c:180:         y = __QADD(
	movw	r3, #1105	@ b02_1.55_175,
	mul	r1, r3, r0	@ _176, b02_1.55_175, input9
@ /home/student/ARM_TEST/butterworth_unrolled20.c:182:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.56_177,
	lsls	r3, r3, #1	@ _178, b02_1.56_177,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:180:         y = __QADD(
	mul	r2, r3, r6	@ _179, _178, x1
	add	r3, r7, #1016	@ tmp1446,,
	sub	r3, r3, #520	@ tmp1448, tmp1446,
	str	r1, [r3]	@ _176, first
	add	r3, r7, #1016	@ tmp1449,,
	sub	r3, r3, #524	@ tmp1451, tmp1449,
	str	r2, [r3]	@ _179, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1456,,
	sub	r3, r3, #520	@ tmp1458, tmp1456,
	ldr	r3, [r3]	@ tmp1459, first
	add	r2, r7, #1016	@ tmp1460,,
	sub	r2, r2, #524	@ tmp1462, tmp1460,
	ldr	r2, [r2]	@ tmp1463, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1459, tmp1463
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1453,,
	sub	r3, r3, #528	@ tmp1455, tmp1453,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1464,,
	sub	r3, r3, #528	@ tmp1466, tmp1464,
	ldr	r3, [r3]	@ D.8041, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:180:         y = __QADD(
	mov	r4, r3	@ y, D.8041
@ /home/student/ARM_TEST/butterworth_unrolled20.c:184:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.57_180,
	mul	r2, r3, r8	@ _181, b02_1.57_180, x2
	add	r3, r7, #1016	@ tmp1467,,
	sub	r3, r3, #508	@ tmp1469, tmp1467,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1470,,
	sub	r3, r3, #512	@ tmp1472, tmp1470,
	str	r2, [r3]	@ _181, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1477,,
	sub	r3, r3, #508	@ tmp1479, tmp1477,
	ldr	r3, [r3]	@ tmp1480, first
	add	r2, r7, #1016	@ tmp1481,,
	sub	r2, r2, #512	@ tmp1483, tmp1481,
	ldr	r2, [r2]	@ tmp1484, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1480, tmp1484
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1474,,
	sub	r3, r3, #516	@ tmp1476, tmp1474,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1485,,
	sub	r3, r3, #516	@ tmp1487, tmp1485,
	ldr	r3, [r3]	@ D.8035, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:184:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8035
@ /home/student/ARM_TEST/butterworth_unrolled20.c:185:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.58_182,
	mul	r2, r3, r5	@ _183, a1.58_182, y1
	add	r3, r7, #1016	@ tmp1488,,
	sub	r3, r3, #496	@ tmp1490, tmp1488,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1491,,
	sub	r3, r3, #500	@ tmp1493, tmp1491,
	str	r2, [r3]	@ _183, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1498,,
	sub	r3, r3, #496	@ tmp1500, tmp1498,
	ldr	r3, [r3]	@ tmp1501, first
	add	r2, r7, #1016	@ tmp1502,,
	sub	r2, r2, #500	@ tmp1504, tmp1502,
	ldr	r2, [r2]	@ tmp1505, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1501, tmp1505
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1495,,
	sub	r3, r3, #504	@ tmp1497, tmp1495,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1506,,
	sub	r3, r3, #504	@ tmp1508, tmp1506,
	ldr	r3, [r3]	@ D.8029, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:185:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8029
@ /home/student/ARM_TEST/butterworth_unrolled20.c:186:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.59_184,
	movt	r3, 65535	@ a2.59_184,
	mul	r2, r3, r9	@ _185, a2.59_184, y2
	add	r3, r7, #1016	@ tmp1509,,
	sub	r3, r3, #484	@ tmp1511, tmp1509,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1512,,
	sub	r3, r3, #488	@ tmp1514, tmp1512,
	str	r2, [r3]	@ _185, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1519,,
	sub	r3, r3, #484	@ tmp1521, tmp1519,
	ldr	r3, [r3]	@ tmp1522, first
	add	r2, r7, #1016	@ tmp1523,,
	sub	r2, r2, #488	@ tmp1525, tmp1523,
	ldr	r2, [r2]	@ tmp1526, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1522, tmp1526
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1516,,
	sub	r3, r3, #492	@ tmp1518, tmp1516,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1527,,
	sub	r3, r3, #492	@ tmp1529, tmp1527,
	ldr	r3, [r3]	@ D.8023, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:186:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8023
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _186, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _187, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _187,
	ite	ne
	movne	r2, #1	@ tmp1531,
	moveq	r2, #0	@ tmp1531,
	uxtb	r2, r2	@ _188, _188
@ /home/student/ARM_TEST/butterworth_unrolled20.c:187:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _186, _189
@ /home/student/ARM_TEST/butterworth_unrolled20.c:189:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:190:         x1 = input9;
	mov	r6, r0	@ x1, input9
@ /home/student/ARM_TEST/butterworth_unrolled20.c:191:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:192:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:195:         register int input10 = x[i + 10];
	mov	r3, r10	@ i.60_190, i
	adds	r3, r3, #10	@ _191, i.60_190,
	lsls	r3, r3, #2	@ _192, _191,
	add	r2, r7, #1016	@ tmp1532,,
	sub	r2, r2, #1012	@ tmp1534, tmp1532,
	ldr	r2, [r2]	@ tmp1535, x
	add	r3, r3, r2	@ _193, tmp1535
@ /home/student/ARM_TEST/butterworth_unrolled20.c:195:         register int input10 = x[i + 10];
	ldr	r0, [r3]	@ input10, *_193
@ /home/student/ARM_TEST/butterworth_unrolled20.c:196:         y = __QADD(
	movw	r3, #1105	@ b02_1.61_194,
	mul	r1, r3, r0	@ _195, b02_1.61_194, input10
@ /home/student/ARM_TEST/butterworth_unrolled20.c:198:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.62_196,
	lsls	r3, r3, #1	@ _197, b02_1.62_196,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:196:         y = __QADD(
	mul	r2, r3, r6	@ _198, _197, x1
	add	r3, r7, #1016	@ tmp1536,,
	sub	r3, r3, #472	@ tmp1538, tmp1536,
	str	r1, [r3]	@ _195, first
	add	r3, r7, #1016	@ tmp1539,,
	sub	r3, r3, #476	@ tmp1541, tmp1539,
	str	r2, [r3]	@ _198, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1546,,
	sub	r3, r3, #472	@ tmp1548, tmp1546,
	ldr	r3, [r3]	@ tmp1549, first
	add	r2, r7, #1016	@ tmp1550,,
	sub	r2, r2, #476	@ tmp1552, tmp1550,
	ldr	r2, [r2]	@ tmp1553, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1549, tmp1553
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1543,,
	sub	r3, r3, #480	@ tmp1545, tmp1543,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1554,,
	sub	r3, r3, #480	@ tmp1556, tmp1554,
	ldr	r3, [r3]	@ D.8017, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:196:         y = __QADD(
	mov	r4, r3	@ y, D.8017
@ /home/student/ARM_TEST/butterworth_unrolled20.c:200:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.63_199,
	mul	r2, r3, r8	@ _200, b02_1.63_199, x2
	add	r3, r7, #1016	@ tmp1557,,
	sub	r3, r3, #460	@ tmp1559, tmp1557,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1560,,
	sub	r3, r3, #464	@ tmp1562, tmp1560,
	str	r2, [r3]	@ _200, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1567,,
	sub	r3, r3, #460	@ tmp1569, tmp1567,
	ldr	r3, [r3]	@ tmp1570, first
	add	r2, r7, #1016	@ tmp1571,,
	sub	r2, r2, #464	@ tmp1573, tmp1571,
	ldr	r2, [r2]	@ tmp1574, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1570, tmp1574
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1564,,
	sub	r3, r3, #468	@ tmp1566, tmp1564,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1575,,
	sub	r3, r3, #468	@ tmp1577, tmp1575,
	ldr	r3, [r3]	@ D.8011, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:200:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8011
@ /home/student/ARM_TEST/butterworth_unrolled20.c:201:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.64_201,
	mul	r2, r3, r5	@ _202, a1.64_201, y1
	add	r3, r7, #1016	@ tmp1578,,
	sub	r3, r3, #448	@ tmp1580, tmp1578,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1581,,
	sub	r3, r3, #452	@ tmp1583, tmp1581,
	str	r2, [r3]	@ _202, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1588,,
	sub	r3, r3, #448	@ tmp1590, tmp1588,
	ldr	r3, [r3]	@ tmp1591, first
	add	r2, r7, #1016	@ tmp1592,,
	sub	r2, r2, #452	@ tmp1594, tmp1592,
	ldr	r2, [r2]	@ tmp1595, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1591, tmp1595
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1585,,
	sub	r3, r3, #456	@ tmp1587, tmp1585,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1596,,
	sub	r3, r3, #456	@ tmp1598, tmp1596,
	ldr	r3, [r3]	@ D.8005, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:201:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8005
@ /home/student/ARM_TEST/butterworth_unrolled20.c:202:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.65_203,
	movt	r3, 65535	@ a2.65_203,
	mul	r2, r3, r9	@ _204, a2.65_203, y2
	add	r3, r7, #1016	@ tmp1599,,
	sub	r3, r3, #436	@ tmp1601, tmp1599,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1602,,
	sub	r3, r3, #440	@ tmp1604, tmp1602,
	str	r2, [r3]	@ _204, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1609,,
	sub	r3, r3, #436	@ tmp1611, tmp1609,
	ldr	r3, [r3]	@ tmp1612, first
	add	r2, r7, #1016	@ tmp1613,,
	sub	r2, r2, #440	@ tmp1615, tmp1613,
	ldr	r2, [r2]	@ tmp1616, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1612, tmp1616
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1606,,
	sub	r3, r3, #444	@ tmp1608, tmp1606,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1617,,
	sub	r3, r3, #444	@ tmp1619, tmp1617,
	ldr	r3, [r3]	@ D.7999, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:202:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7999
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _205, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _206, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _206,
	ite	ne
	movne	r2, #1	@ tmp1621,
	moveq	r2, #0	@ tmp1621,
	uxtb	r2, r2	@ _207, _207
@ /home/student/ARM_TEST/butterworth_unrolled20.c:203:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _205, _208
@ /home/student/ARM_TEST/butterworth_unrolled20.c:205:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:206:         x1 = input10;
	mov	r6, r0	@ x1, input10
@ /home/student/ARM_TEST/butterworth_unrolled20.c:207:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:208:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:210:         register int input11 = x[i + 11];
	mov	r3, r10	@ i.66_209, i
	adds	r3, r3, #11	@ _210, i.66_209,
	lsls	r3, r3, #2	@ _211, _210,
	add	r2, r7, #1016	@ tmp1622,,
	sub	r2, r2, #1012	@ tmp1624, tmp1622,
	ldr	r2, [r2]	@ tmp1625, x
	add	r3, r3, r2	@ _212, tmp1625
@ /home/student/ARM_TEST/butterworth_unrolled20.c:210:         register int input11 = x[i + 11];
	ldr	r0, [r3]	@ input11, *_212
@ /home/student/ARM_TEST/butterworth_unrolled20.c:211:         y = __QADD(
	movw	r3, #1105	@ b02_1.67_213,
	mul	r1, r3, r0	@ _214, b02_1.67_213, input11
@ /home/student/ARM_TEST/butterworth_unrolled20.c:213:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.68_215,
	lsls	r3, r3, #1	@ _216, b02_1.68_215,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:211:         y = __QADD(
	mul	r2, r3, r6	@ _217, _216, x1
	add	r3, r7, #1016	@ tmp1626,,
	sub	r3, r3, #424	@ tmp1628, tmp1626,
	str	r1, [r3]	@ _214, first
	add	r3, r7, #1016	@ tmp1629,,
	sub	r3, r3, #428	@ tmp1631, tmp1629,
	str	r2, [r3]	@ _217, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1636,,
	sub	r3, r3, #424	@ tmp1638, tmp1636,
	ldr	r3, [r3]	@ tmp1639, first
	add	r2, r7, #1016	@ tmp1640,,
	sub	r2, r2, #428	@ tmp1642, tmp1640,
	ldr	r2, [r2]	@ tmp1643, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1639, tmp1643
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1633,,
	sub	r3, r3, #432	@ tmp1635, tmp1633,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1644,,
	sub	r3, r3, #432	@ tmp1646, tmp1644,
	ldr	r3, [r3]	@ D.7993, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:211:         y = __QADD(
	mov	r4, r3	@ y, D.7993
@ /home/student/ARM_TEST/butterworth_unrolled20.c:215:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.69_218,
	mul	r2, r3, r8	@ _219, b02_1.69_218, x2
	add	r3, r7, #1016	@ tmp1647,,
	sub	r3, r3, #412	@ tmp1649, tmp1647,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1650,,
	sub	r3, r3, #416	@ tmp1652, tmp1650,
	str	r2, [r3]	@ _219, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1657,,
	sub	r3, r3, #412	@ tmp1659, tmp1657,
	ldr	r3, [r3]	@ tmp1660, first
	add	r2, r7, #1016	@ tmp1661,,
	sub	r2, r2, #416	@ tmp1663, tmp1661,
	ldr	r2, [r2]	@ tmp1664, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1660, tmp1664
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1654,,
	sub	r3, r3, #420	@ tmp1656, tmp1654,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1665,,
	sub	r3, r3, #420	@ tmp1667, tmp1665,
	ldr	r3, [r3]	@ D.7987, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:215:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7987
@ /home/student/ARM_TEST/butterworth_unrolled20.c:216:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.70_220,
	mul	r2, r3, r5	@ _221, a1.70_220, y1
	add	r3, r7, #1016	@ tmp1668,,
	sub	r3, r3, #400	@ tmp1670, tmp1668,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1671,,
	sub	r3, r3, #404	@ tmp1673, tmp1671,
	str	r2, [r3]	@ _221, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1678,,
	sub	r3, r3, #400	@ tmp1680, tmp1678,
	ldr	r3, [r3]	@ tmp1681, first
	add	r2, r7, #1016	@ tmp1682,,
	sub	r2, r2, #404	@ tmp1684, tmp1682,
	ldr	r2, [r2]	@ tmp1685, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1681, tmp1685
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1675,,
	sub	r3, r3, #408	@ tmp1677, tmp1675,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1686,,
	sub	r3, r3, #408	@ tmp1688, tmp1686,
	ldr	r3, [r3]	@ D.7981, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:216:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7981
@ /home/student/ARM_TEST/butterworth_unrolled20.c:217:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.71_222,
	movt	r3, 65535	@ a2.71_222,
	mul	r2, r3, r9	@ _223, a2.71_222, y2
	add	r3, r7, #1016	@ tmp1689,,
	sub	r3, r3, #388	@ tmp1691, tmp1689,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1692,,
	sub	r3, r3, #392	@ tmp1694, tmp1692,
	str	r2, [r3]	@ _223, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1699,,
	sub	r3, r3, #388	@ tmp1701, tmp1699,
	ldr	r3, [r3]	@ tmp1702, first
	add	r2, r7, #1016	@ tmp1703,,
	sub	r2, r2, #392	@ tmp1705, tmp1703,
	ldr	r2, [r2]	@ tmp1706, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1702, tmp1706
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1696,,
	sub	r3, r3, #396	@ tmp1698, tmp1696,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1707,,
	sub	r3, r3, #396	@ tmp1709, tmp1707,
	ldr	r3, [r3]	@ D.7975, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:217:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7975
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _224, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _225, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _225,
	ite	ne
	movne	r2, #1	@ tmp1711,
	moveq	r2, #0	@ tmp1711,
	uxtb	r2, r2	@ _226, _226
@ /home/student/ARM_TEST/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _224, _227
@ /home/student/ARM_TEST/butterworth_unrolled20.c:220:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:221:         x1 = input11;
	mov	r6, r0	@ x1, input11
@ /home/student/ARM_TEST/butterworth_unrolled20.c:222:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:223:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:225:         register int input12 = x[i + 12];
	mov	r3, r10	@ i.72_228, i
	adds	r3, r3, #12	@ _229, i.72_228,
	lsls	r3, r3, #2	@ _230, _229,
	add	r2, r7, #1016	@ tmp1712,,
	sub	r2, r2, #1012	@ tmp1714, tmp1712,
	ldr	r2, [r2]	@ tmp1715, x
	add	r3, r3, r2	@ _231, tmp1715
@ /home/student/ARM_TEST/butterworth_unrolled20.c:225:         register int input12 = x[i + 12];
	ldr	r0, [r3]	@ input12, *_231
@ /home/student/ARM_TEST/butterworth_unrolled20.c:226:         y = __QADD(
	movw	r3, #1105	@ b02_1.73_232,
	mul	r1, r3, r0	@ _233, b02_1.73_232, input12
@ /home/student/ARM_TEST/butterworth_unrolled20.c:228:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.74_234,
	lsls	r3, r3, #1	@ _235, b02_1.74_234,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:226:         y = __QADD(
	mul	r2, r3, r6	@ _236, _235, x1
	add	r3, r7, #1016	@ tmp1716,,
	sub	r3, r3, #376	@ tmp1718, tmp1716,
	str	r1, [r3]	@ _233, first
	add	r3, r7, #1016	@ tmp1719,,
	sub	r3, r3, #380	@ tmp1721, tmp1719,
	str	r2, [r3]	@ _236, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1726,,
	sub	r3, r3, #376	@ tmp1728, tmp1726,
	ldr	r3, [r3]	@ tmp1729, first
	add	r2, r7, #1016	@ tmp1730,,
	sub	r2, r2, #380	@ tmp1732, tmp1730,
	ldr	r2, [r2]	@ tmp1733, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1729, tmp1733
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1723,,
	sub	r3, r3, #384	@ tmp1725, tmp1723,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1734,,
	sub	r3, r3, #384	@ tmp1736, tmp1734,
	ldr	r3, [r3]	@ D.7969, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:226:         y = __QADD(
	mov	r4, r3	@ y, D.7969
@ /home/student/ARM_TEST/butterworth_unrolled20.c:230:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.75_237,
	mul	r2, r3, r8	@ _238, b02_1.75_237, x2
	add	r3, r7, #1016	@ tmp1737,,
	sub	r3, r3, #364	@ tmp1739, tmp1737,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1740,,
	sub	r3, r3, #368	@ tmp1742, tmp1740,
	str	r2, [r3]	@ _238, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1747,,
	sub	r3, r3, #364	@ tmp1749, tmp1747,
	ldr	r3, [r3]	@ tmp1750, first
	add	r2, r7, #1016	@ tmp1751,,
	sub	r2, r2, #368	@ tmp1753, tmp1751,
	ldr	r2, [r2]	@ tmp1754, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1750, tmp1754
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1744,,
	sub	r3, r3, #372	@ tmp1746, tmp1744,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1755,,
	sub	r3, r3, #372	@ tmp1757, tmp1755,
	ldr	r3, [r3]	@ D.7963, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:230:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7963
@ /home/student/ARM_TEST/butterworth_unrolled20.c:231:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.76_239,
	mul	r2, r3, r5	@ _240, a1.76_239, y1
	add	r3, r7, #1016	@ tmp1758,,
	sub	r3, r3, #352	@ tmp1760, tmp1758,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1761,,
	sub	r3, r3, #356	@ tmp1763, tmp1761,
	str	r2, [r3]	@ _240, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1768,,
	sub	r3, r3, #352	@ tmp1770, tmp1768,
	ldr	r3, [r3]	@ tmp1771, first
	add	r2, r7, #1016	@ tmp1772,,
	sub	r2, r2, #356	@ tmp1774, tmp1772,
	ldr	r2, [r2]	@ tmp1775, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1771, tmp1775
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1765,,
	sub	r3, r3, #360	@ tmp1767, tmp1765,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1776,,
	sub	r3, r3, #360	@ tmp1778, tmp1776,
	ldr	r3, [r3]	@ D.7957, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:231:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7957
@ /home/student/ARM_TEST/butterworth_unrolled20.c:232:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.77_241,
	movt	r3, 65535	@ a2.77_241,
	mul	r2, r3, r9	@ _242, a2.77_241, y2
	add	r3, r7, #1016	@ tmp1779,,
	sub	r3, r3, #340	@ tmp1781, tmp1779,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1782,,
	sub	r3, r3, #344	@ tmp1784, tmp1782,
	str	r2, [r3]	@ _242, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1789,,
	sub	r3, r3, #340	@ tmp1791, tmp1789,
	ldr	r3, [r3]	@ tmp1792, first
	add	r2, r7, #1016	@ tmp1793,,
	sub	r2, r2, #344	@ tmp1795, tmp1793,
	ldr	r2, [r2]	@ tmp1796, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1792, tmp1796
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1786,,
	sub	r3, r3, #348	@ tmp1788, tmp1786,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1797,,
	sub	r3, r3, #348	@ tmp1799, tmp1797,
	ldr	r3, [r3]	@ D.7951, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:232:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7951
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _243, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _244, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _244,
	ite	ne
	movne	r2, #1	@ tmp1801,
	moveq	r2, #0	@ tmp1801,
	uxtb	r2, r2	@ _245, _245
@ /home/student/ARM_TEST/butterworth_unrolled20.c:233:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _243, _246
@ /home/student/ARM_TEST/butterworth_unrolled20.c:235:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:236:         x1 = input12;
	mov	r6, r0	@ x1, input12
@ /home/student/ARM_TEST/butterworth_unrolled20.c:237:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:238:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:240:         register int input13 = x[i + 13];
	mov	r3, r10	@ i.78_247, i
	adds	r3, r3, #13	@ _248, i.78_247,
	lsls	r3, r3, #2	@ _249, _248,
	add	r2, r7, #1016	@ tmp1802,,
	sub	r2, r2, #1012	@ tmp1804, tmp1802,
	ldr	r2, [r2]	@ tmp1805, x
	add	r3, r3, r2	@ _250, tmp1805
@ /home/student/ARM_TEST/butterworth_unrolled20.c:240:         register int input13 = x[i + 13];
	ldr	r0, [r3]	@ input13, *_250
@ /home/student/ARM_TEST/butterworth_unrolled20.c:241:         y = __QADD(
	movw	r3, #1105	@ b02_1.79_251,
	mul	r1, r3, r0	@ _252, b02_1.79_251, input13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:243:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.80_253,
	lsls	r3, r3, #1	@ _254, b02_1.80_253,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:241:         y = __QADD(
	mul	r2, r3, r6	@ _255, _254, x1
	add	r3, r7, #1016	@ tmp1806,,
	sub	r3, r3, #328	@ tmp1808, tmp1806,
	str	r1, [r3]	@ _252, first
	add	r3, r7, #1016	@ tmp1809,,
	sub	r3, r3, #332	@ tmp1811, tmp1809,
	str	r2, [r3]	@ _255, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1816,,
	sub	r3, r3, #328	@ tmp1818, tmp1816,
	ldr	r3, [r3]	@ tmp1819, first
	add	r2, r7, #1016	@ tmp1820,,
	sub	r2, r2, #332	@ tmp1822, tmp1820,
	ldr	r2, [r2]	@ tmp1823, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1819, tmp1823
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1813,,
	sub	r3, r3, #336	@ tmp1815, tmp1813,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1824,,
	sub	r3, r3, #336	@ tmp1826, tmp1824,
	ldr	r3, [r3]	@ D.7945, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:241:         y = __QADD(
	mov	r4, r3	@ y, D.7945
@ /home/student/ARM_TEST/butterworth_unrolled20.c:245:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.81_256,
	mul	r2, r3, r8	@ _257, b02_1.81_256, x2
	add	r3, r7, #1016	@ tmp1827,,
	sub	r3, r3, #316	@ tmp1829, tmp1827,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1830,,
	sub	r3, r3, #320	@ tmp1832, tmp1830,
	str	r2, [r3]	@ _257, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1837,,
	sub	r3, r3, #316	@ tmp1839, tmp1837,
	ldr	r3, [r3]	@ tmp1840, first
	add	r2, r7, #1016	@ tmp1841,,
	sub	r2, r2, #320	@ tmp1843, tmp1841,
	ldr	r2, [r2]	@ tmp1844, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1840, tmp1844
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1834,,
	sub	r3, r3, #324	@ tmp1836, tmp1834,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1845,,
	sub	r3, r3, #324	@ tmp1847, tmp1845,
	ldr	r3, [r3]	@ D.7939, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:245:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7939
@ /home/student/ARM_TEST/butterworth_unrolled20.c:246:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.82_258,
	mul	r2, r3, r5	@ _259, a1.82_258, y1
	add	r3, r7, #1016	@ tmp1848,,
	sub	r3, r3, #304	@ tmp1850, tmp1848,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1851,,
	sub	r3, r3, #308	@ tmp1853, tmp1851,
	str	r2, [r3]	@ _259, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1858,,
	sub	r3, r3, #304	@ tmp1860, tmp1858,
	ldr	r3, [r3]	@ tmp1861, first
	add	r2, r7, #1016	@ tmp1862,,
	sub	r2, r2, #308	@ tmp1864, tmp1862,
	ldr	r2, [r2]	@ tmp1865, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1861, tmp1865
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1855,,
	sub	r3, r3, #312	@ tmp1857, tmp1855,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1866,,
	sub	r3, r3, #312	@ tmp1868, tmp1866,
	ldr	r3, [r3]	@ D.7933, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:246:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7933
@ /home/student/ARM_TEST/butterworth_unrolled20.c:247:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.83_260,
	movt	r3, 65535	@ a2.83_260,
	mul	r2, r3, r9	@ _261, a2.83_260, y2
	add	r3, r7, #1016	@ tmp1869,,
	sub	r3, r3, #292	@ tmp1871, tmp1869,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1872,,
	sub	r3, r3, #296	@ tmp1874, tmp1872,
	str	r2, [r3]	@ _261, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1879,,
	sub	r3, r3, #292	@ tmp1881, tmp1879,
	ldr	r3, [r3]	@ tmp1882, first
	add	r2, r7, #1016	@ tmp1883,,
	sub	r2, r2, #296	@ tmp1885, tmp1883,
	ldr	r2, [r2]	@ tmp1886, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1882, tmp1886
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1876,,
	sub	r3, r3, #300	@ tmp1878, tmp1876,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1887,,
	sub	r3, r3, #300	@ tmp1889, tmp1887,
	ldr	r3, [r3]	@ D.7927, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:247:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7927
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _262, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _263, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _263,
	ite	ne
	movne	r2, #1	@ tmp1891,
	moveq	r2, #0	@ tmp1891,
	uxtb	r2, r2	@ _264, _264
@ /home/student/ARM_TEST/butterworth_unrolled20.c:248:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _262, _265
@ /home/student/ARM_TEST/butterworth_unrolled20.c:250:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:251:         x1 = input13;
	mov	r6, r0	@ x1, input13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:252:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:253:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:256:         register int input14 = x[i + 14];
	mov	r3, r10	@ i.84_266, i
	adds	r3, r3, #14	@ _267, i.84_266,
	lsls	r3, r3, #2	@ _268, _267,
	add	r2, r7, #1016	@ tmp1892,,
	sub	r2, r2, #1012	@ tmp1894, tmp1892,
	ldr	r2, [r2]	@ tmp1895, x
	add	r3, r3, r2	@ _269, tmp1895
@ /home/student/ARM_TEST/butterworth_unrolled20.c:256:         register int input14 = x[i + 14];
	ldr	r0, [r3]	@ input14, *_269
@ /home/student/ARM_TEST/butterworth_unrolled20.c:257:         y = __QADD(
	movw	r3, #1105	@ b02_1.85_270,
	mul	r1, r3, r0	@ _271, b02_1.85_270, input14
@ /home/student/ARM_TEST/butterworth_unrolled20.c:259:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.86_272,
	lsls	r3, r3, #1	@ _273, b02_1.86_272,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:257:         y = __QADD(
	mul	r2, r3, r6	@ _274, _273, x1
	add	r3, r7, #1016	@ tmp1896,,
	sub	r3, r3, #280	@ tmp1898, tmp1896,
	str	r1, [r3]	@ _271, first
	add	r3, r7, #1016	@ tmp1899,,
	sub	r3, r3, #284	@ tmp1901, tmp1899,
	str	r2, [r3]	@ _274, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1906,,
	sub	r3, r3, #280	@ tmp1908, tmp1906,
	ldr	r3, [r3]	@ tmp1909, first
	add	r2, r7, #1016	@ tmp1910,,
	sub	r2, r2, #284	@ tmp1912, tmp1910,
	ldr	r2, [r2]	@ tmp1913, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1909, tmp1913
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1903,,
	sub	r3, r3, #288	@ tmp1905, tmp1903,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1914,,
	sub	r3, r3, #288	@ tmp1916, tmp1914,
	ldr	r3, [r3]	@ D.7921, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:257:         y = __QADD(
	mov	r4, r3	@ y, D.7921
@ /home/student/ARM_TEST/butterworth_unrolled20.c:261:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.87_275,
	mul	r2, r3, r8	@ _276, b02_1.87_275, x2
	add	r3, r7, #1016	@ tmp1917,,
	sub	r3, r3, #268	@ tmp1919, tmp1917,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1920,,
	sub	r3, r3, #272	@ tmp1922, tmp1920,
	str	r2, [r3]	@ _276, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1927,,
	sub	r3, r3, #268	@ tmp1929, tmp1927,
	ldr	r3, [r3]	@ tmp1930, first
	add	r2, r7, #1016	@ tmp1931,,
	sub	r2, r2, #272	@ tmp1933, tmp1931,
	ldr	r2, [r2]	@ tmp1934, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1930, tmp1934
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1924,,
	sub	r3, r3, #276	@ tmp1926, tmp1924,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1935,,
	sub	r3, r3, #276	@ tmp1937, tmp1935,
	ldr	r3, [r3]	@ D.7915, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:261:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7915
@ /home/student/ARM_TEST/butterworth_unrolled20.c:262:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.88_277,
	mul	r2, r3, r5	@ _278, a1.88_277, y1
	add	r3, r7, #1016	@ tmp1938,,
	sub	r3, r3, #256	@ tmp1940, tmp1938,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp1941,,
	sub	r3, r3, #260	@ tmp1943, tmp1941,
	str	r2, [r3]	@ _278, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp1948,,
	sub	r3, r3, #256	@ tmp1950, tmp1948,
	ldr	r3, [r3]	@ tmp1951, first
	add	r2, r7, #1016	@ tmp1952,,
	sub	r2, r2, #260	@ tmp1954, tmp1952,
	ldr	r2, [r2]	@ tmp1955, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp1951, tmp1955
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp1945,,
	sub	r3, r3, #264	@ tmp1947, tmp1945,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp1956,,
	sub	r3, r3, #264	@ tmp1958, tmp1956,
	ldr	r3, [r3]	@ D.7909, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:262:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7909
@ /home/student/ARM_TEST/butterworth_unrolled20.c:263:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.89_279,
	movt	r3, 65535	@ a2.89_279,
	mul	r3, r3, r9	@ _280, a2.89_279, y2
	str	r4, [r7, #772]	@ y, first
	str	r3, [r7, #768]	@ _280, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #772]	@ tmp1960, first
	ldr	r2, [r7, #768]	@ tmp1961, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1960, tmp1961
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #764]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #764]	@ D.7903, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:263:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7903
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _281, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _282, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _282,
	ite	ne
	movne	r2, #1	@ tmp1963,
	moveq	r2, #0	@ tmp1963,
	uxtb	r2, r2	@ _283, _283
@ /home/student/ARM_TEST/butterworth_unrolled20.c:264:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _281, _284
@ /home/student/ARM_TEST/butterworth_unrolled20.c:266:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:267:         x1 = input14;
	mov	r6, r0	@ x1, input14
@ /home/student/ARM_TEST/butterworth_unrolled20.c:268:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:269:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:272:         register int input15 = x[i + 15];
	mov	r3, r10	@ i.90_285, i
	adds	r3, r3, #15	@ _286, i.90_285,
	lsls	r3, r3, #2	@ _287, _286,
	add	r2, r7, #1016	@ tmp1964,,
	sub	r2, r2, #1012	@ tmp1966, tmp1964,
	ldr	r2, [r2]	@ tmp1967, x
	add	r3, r3, r2	@ _288, tmp1967
@ /home/student/ARM_TEST/butterworth_unrolled20.c:272:         register int input15 = x[i + 15];
	ldr	r1, [r3]	@ input15, *_288
@ /home/student/ARM_TEST/butterworth_unrolled20.c:273:         y = __QADD(
	movw	r3, #1105	@ b02_1.91_289,
	mul	r2, r3, r1	@ _290, b02_1.91_289, input15
@ /home/student/ARM_TEST/butterworth_unrolled20.c:275:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.92_291,
	lsls	r3, r3, #1	@ _292, b02_1.92_291,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:273:         y = __QADD(
	mul	r3, r6, r3	@ _293, x1, _292
	str	r2, [r7, #784]	@ _290, first
	str	r3, [r7, #780]	@ _293, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #784]	@ tmp1969, first
	ldr	r2, [r7, #780]	@ tmp1970, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1969, tmp1970
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #776]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #776]	@ D.7897, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:273:         y = __QADD(
	mov	r4, r3	@ y, D.7897
@ /home/student/ARM_TEST/butterworth_unrolled20.c:277:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.93_294,
	mul	r3, r3, r8	@ _295, b02_1.93_294, x2
	str	r4, [r7, #796]	@ y, first
	str	r3, [r7, #792]	@ _295, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #796]	@ tmp1972, first
	ldr	r2, [r7, #792]	@ tmp1973, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1972, tmp1973
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #788]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #788]	@ D.7891, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:277:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7891
@ /home/student/ARM_TEST/butterworth_unrolled20.c:278:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.94_296,
	mul	r3, r5, r3	@ _297, y1, a1.94_296
	str	r4, [r7, #808]	@ y, first
	str	r3, [r7, #804]	@ _297, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #808]	@ tmp1975, first
	ldr	r2, [r7, #804]	@ tmp1976, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1975, tmp1976
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #800]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #800]	@ D.7885, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:278:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7885
@ /home/student/ARM_TEST/butterworth_unrolled20.c:279:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.95_298,
	movt	r3, 65535	@ a2.95_298,
	mul	r3, r3, r9	@ _299, a2.95_298, y2
	str	r4, [r7, #820]	@ y, first
	str	r3, [r7, #816]	@ _299, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #820]	@ tmp1978, first
	ldr	r2, [r7, #816]	@ tmp1979, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1978, tmp1979
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #812]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #812]	@ D.7879, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:279:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7879
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _300, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _301, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _301,
	ite	ne
	movne	r2, #1	@ tmp1981,
	moveq	r2, #0	@ tmp1981,
	uxtb	r2, r2	@ _302, _302
@ /home/student/ARM_TEST/butterworth_unrolled20.c:280:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _300, _303
@ /home/student/ARM_TEST/butterworth_unrolled20.c:282:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:283:         x1 = input15;
	mov	r6, r1	@ x1, input15
@ /home/student/ARM_TEST/butterworth_unrolled20.c:284:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:285:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:287:         register int input16 = x[i + 16];
	mov	r3, r10	@ i.96_304, i
	adds	r3, r3, #16	@ _305, i.96_304,
	lsls	r3, r3, #2	@ _306, _305,
	add	r2, r7, #1016	@ tmp1982,,
	sub	r2, r2, #1012	@ tmp1984, tmp1982,
	ldr	r2, [r2]	@ tmp1985, x
	add	r3, r3, r2	@ _307, tmp1985
@ /home/student/ARM_TEST/butterworth_unrolled20.c:287:         register int input16 = x[i + 16];
	ldr	r1, [r3]	@ input16, *_307
@ /home/student/ARM_TEST/butterworth_unrolled20.c:288:         y = __QADD(
	movw	r3, #1105	@ b02_1.97_308,
	mul	r2, r3, r1	@ _309, b02_1.97_308, input16
@ /home/student/ARM_TEST/butterworth_unrolled20.c:290:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.98_310,
	lsls	r3, r3, #1	@ _311, b02_1.98_310,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:288:         y = __QADD(
	mul	r3, r6, r3	@ _312, x1, _311
	str	r2, [r7, #832]	@ _309, first
	str	r3, [r7, #828]	@ _312, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #832]	@ tmp1987, first
	ldr	r2, [r7, #828]	@ tmp1988, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1987, tmp1988
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #824]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #824]	@ D.7873, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:288:         y = __QADD(
	mov	r4, r3	@ y, D.7873
@ /home/student/ARM_TEST/butterworth_unrolled20.c:292:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.99_313,
	mul	r3, r3, r8	@ _314, b02_1.99_313, x2
	str	r4, [r7, #844]	@ y, first
	str	r3, [r7, #840]	@ _314, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #844]	@ tmp1990, first
	ldr	r2, [r7, #840]	@ tmp1991, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1990, tmp1991
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #836]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #836]	@ D.7867, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:292:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7867
@ /home/student/ARM_TEST/butterworth_unrolled20.c:293:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.100_315,
	mul	r3, r5, r3	@ _316, y1, a1.100_315
	str	r4, [r7, #856]	@ y, first
	str	r3, [r7, #852]	@ _316, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #856]	@ tmp1993, first
	ldr	r2, [r7, #852]	@ tmp1994, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1993, tmp1994
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #848]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #848]	@ D.7861, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:293:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7861
@ /home/student/ARM_TEST/butterworth_unrolled20.c:294:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.101_317,
	movt	r3, 65535	@ a2.101_317,
	mul	r3, r3, r9	@ _318, a2.101_317, y2
	str	r4, [r7, #868]	@ y, first
	str	r3, [r7, #864]	@ _318, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #868]	@ tmp1996, first
	ldr	r2, [r7, #864]	@ tmp1997, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp1996, tmp1997
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #860]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #860]	@ D.7855, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:294:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7855
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _319, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _320, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _320,
	ite	ne
	movne	r2, #1	@ tmp1999,
	moveq	r2, #0	@ tmp1999,
	uxtb	r2, r2	@ _321, _321
@ /home/student/ARM_TEST/butterworth_unrolled20.c:295:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _319, _322
@ /home/student/ARM_TEST/butterworth_unrolled20.c:297:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:298:         x1 = input16;
	mov	r6, r1	@ x1, input16
@ /home/student/ARM_TEST/butterworth_unrolled20.c:299:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:300:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:302:         register int input17 = x[i + 17];
	mov	r3, r10	@ i.102_323, i
	adds	r3, r3, #17	@ _324, i.102_323,
	lsls	r3, r3, #2	@ _325, _324,
	add	r2, r7, #1016	@ tmp2000,,
	sub	r2, r2, #1012	@ tmp2002, tmp2000,
	ldr	r2, [r2]	@ tmp2003, x
	add	r3, r3, r2	@ _326, tmp2003
@ /home/student/ARM_TEST/butterworth_unrolled20.c:302:         register int input17 = x[i + 17];
	ldr	r1, [r3]	@ input17, *_326
@ /home/student/ARM_TEST/butterworth_unrolled20.c:303:         y = __QADD(
	movw	r3, #1105	@ b02_1.103_327,
	mul	r2, r3, r1	@ _328, b02_1.103_327, input17
@ /home/student/ARM_TEST/butterworth_unrolled20.c:305:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.104_329,
	lsls	r3, r3, #1	@ _330, b02_1.104_329,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:303:         y = __QADD(
	mul	r3, r6, r3	@ _331, x1, _330
	str	r2, [r7, #880]	@ _328, first
	str	r3, [r7, #876]	@ _331, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #880]	@ tmp2005, first
	ldr	r2, [r7, #876]	@ tmp2006, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2005, tmp2006
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #872]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #872]	@ D.7849, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:303:         y = __QADD(
	mov	r4, r3	@ y, D.7849
@ /home/student/ARM_TEST/butterworth_unrolled20.c:307:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.105_332,
	mul	r3, r3, r8	@ _333, b02_1.105_332, x2
	str	r4, [r7, #892]	@ y, first
	str	r3, [r7, #888]	@ _333, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #892]	@ tmp2008, first
	ldr	r2, [r7, #888]	@ tmp2009, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2008, tmp2009
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #884]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #884]	@ D.7843, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:307:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7843
@ /home/student/ARM_TEST/butterworth_unrolled20.c:308:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.106_334,
	mul	r3, r5, r3	@ _335, y1, a1.106_334
	str	r4, [r7, #904]	@ y, first
	str	r3, [r7, #900]	@ _335, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #904]	@ tmp2011, first
	ldr	r2, [r7, #900]	@ tmp2012, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2011, tmp2012
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #896]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #896]	@ D.7837, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:308:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7837
@ /home/student/ARM_TEST/butterworth_unrolled20.c:309:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.107_336,
	movt	r3, 65535	@ a2.107_336,
	mul	r3, r3, r9	@ _337, a2.107_336, y2
	str	r4, [r7, #916]	@ y, first
	str	r3, [r7, #912]	@ _337, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #916]	@ tmp2014, first
	ldr	r2, [r7, #912]	@ tmp2015, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2014, tmp2015
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #908]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #908]	@ D.7831, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:309:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7831
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _338, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _339, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _339,
	ite	ne
	movne	r2, #1	@ tmp2017,
	moveq	r2, #0	@ tmp2017,
	uxtb	r2, r2	@ _340, _340
@ /home/student/ARM_TEST/butterworth_unrolled20.c:310:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _338, _341
@ /home/student/ARM_TEST/butterworth_unrolled20.c:312:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:313:         x1 = input17;
	mov	r6, r1	@ x1, input17
@ /home/student/ARM_TEST/butterworth_unrolled20.c:314:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:315:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:317:         register int input18 = x[i + 18];
	mov	r3, r10	@ i.108_342, i
	adds	r3, r3, #18	@ _343, i.108_342,
	lsls	r3, r3, #2	@ _344, _343,
	add	r2, r7, #1016	@ tmp2018,,
	sub	r2, r2, #1012	@ tmp2020, tmp2018,
	ldr	r2, [r2]	@ tmp2021, x
	add	r3, r3, r2	@ _345, tmp2021
@ /home/student/ARM_TEST/butterworth_unrolled20.c:317:         register int input18 = x[i + 18];
	ldr	r1, [r3]	@ input18, *_345
@ /home/student/ARM_TEST/butterworth_unrolled20.c:318:         y = __QADD(
	movw	r3, #1105	@ b02_1.109_346,
	mul	r2, r3, r1	@ _347, b02_1.109_346, input18
@ /home/student/ARM_TEST/butterworth_unrolled20.c:320:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.110_348,
	lsls	r3, r3, #1	@ _349, b02_1.110_348,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:318:         y = __QADD(
	mul	r3, r6, r3	@ _350, x1, _349
	str	r2, [r7, #928]	@ _347, first
	str	r3, [r7, #924]	@ _350, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #928]	@ tmp2023, first
	ldr	r2, [r7, #924]	@ tmp2024, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2023, tmp2024
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #920]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #920]	@ D.7825, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:318:         y = __QADD(
	mov	r4, r3	@ y, D.7825
@ /home/student/ARM_TEST/butterworth_unrolled20.c:322:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.111_351,
	mul	r3, r3, r8	@ _352, b02_1.111_351, x2
	str	r4, [r7, #940]	@ y, first
	str	r3, [r7, #936]	@ _352, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #940]	@ tmp2026, first
	ldr	r2, [r7, #936]	@ tmp2027, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2026, tmp2027
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #932]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #932]	@ D.7819, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:322:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7819
@ /home/student/ARM_TEST/butterworth_unrolled20.c:323:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.112_353,
	mul	r3, r5, r3	@ _354, y1, a1.112_353
	str	r4, [r7, #952]	@ y, first
	str	r3, [r7, #948]	@ _354, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #952]	@ tmp2029, first
	ldr	r2, [r7, #948]	@ tmp2030, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2029, tmp2030
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #944]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #944]	@ D.7813, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:323:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7813
@ /home/student/ARM_TEST/butterworth_unrolled20.c:324:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.113_355,
	movt	r3, 65535	@ a2.113_355,
	mul	r3, r3, r9	@ _356, a2.113_355, y2
	str	r4, [r7, #964]	@ y, first
	str	r3, [r7, #960]	@ _356, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #964]	@ tmp2032, first
	ldr	r2, [r7, #960]	@ tmp2033, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2032, tmp2033
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #956]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #956]	@ D.7807, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:324:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7807
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _357, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _358, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _358,
	ite	ne
	movne	r2, #1	@ tmp2035,
	moveq	r2, #0	@ tmp2035,
	uxtb	r2, r2	@ _359, _359
@ /home/student/ARM_TEST/butterworth_unrolled20.c:325:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _357, _360
@ /home/student/ARM_TEST/butterworth_unrolled20.c:327:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:328:         x1 = input18;
	mov	r6, r1	@ x1, input18
@ /home/student/ARM_TEST/butterworth_unrolled20.c:329:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:330:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:332:         register int input19 = x[i + 19];
	mov	r3, r10	@ i.114_361, i
	adds	r3, r3, #19	@ _362, i.114_361,
	lsls	r3, r3, #2	@ _363, _362,
	add	r2, r7, #1016	@ tmp2036,,
	sub	r2, r2, #1012	@ tmp2038, tmp2036,
	ldr	r2, [r2]	@ tmp2039, x
	add	r3, r3, r2	@ _364, tmp2039
@ /home/student/ARM_TEST/butterworth_unrolled20.c:332:         register int input19 = x[i + 19];
	ldr	r1, [r3]	@ input19, *_364
@ /home/student/ARM_TEST/butterworth_unrolled20.c:333:         y = __QADD(
	movw	r3, #1105	@ b02_1.115_365,
	mul	r2, r3, r1	@ _366, b02_1.115_365, input19
@ /home/student/ARM_TEST/butterworth_unrolled20.c:335:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.116_367,
	lsls	r3, r3, #1	@ _368, b02_1.116_367,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:333:         y = __QADD(
	mul	r3, r6, r3	@ _369, x1, _368
	str	r2, [r7, #976]	@ _366, first
	str	r3, [r7, #972]	@ _369, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #976]	@ tmp2041, first
	ldr	r2, [r7, #972]	@ tmp2042, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2041, tmp2042
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #968]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #968]	@ D.7801, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:333:         y = __QADD(
	mov	r4, r3	@ y, D.7801
@ /home/student/ARM_TEST/butterworth_unrolled20.c:337:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.117_370,
	mul	r3, r3, r8	@ _371, b02_1.117_370, x2
	str	r4, [r7, #988]	@ y, first
	str	r3, [r7, #984]	@ _371, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #988]	@ tmp2044, first
	ldr	r2, [r7, #984]	@ tmp2045, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2044, tmp2045
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #980]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #980]	@ D.7795, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:337:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7795
@ /home/student/ARM_TEST/butterworth_unrolled20.c:338:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.118_372,
	mul	r3, r5, r3	@ _373, y1, a1.118_372
	str	r4, [r7, #1000]	@ y, first
	str	r3, [r7, #996]	@ _373, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #1000]	@ tmp2047, first
	ldr	r2, [r7, #996]	@ tmp2048, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2047, tmp2048
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #992]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #992]	@ D.7789, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:338:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7789
@ /home/student/ARM_TEST/butterworth_unrolled20.c:339:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.119_374,
	movt	r3, 65535	@ a2.119_374,
	mul	r3, r3, r9	@ _375, a2.119_374, y2
	str	r4, [r7, #1012]	@ y, first
	str	r3, [r7, #1008]	@ _375, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #1012]	@ tmp2050, first
	ldr	r2, [r7, #1008]	@ tmp2051, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp2050, tmp2051
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #1004]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #1004]	@ D.7783, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:339:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7783
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _376, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _377, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _377,
	ite	ne
	movne	r2, #1	@ tmp2053,
	moveq	r2, #0	@ tmp2053,
	uxtb	r2, r2	@ _378, _378
@ /home/student/ARM_TEST/butterworth_unrolled20.c:340:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _376, _379
@ /home/student/ARM_TEST/butterworth_unrolled20.c:342:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:343:         x1 = input19;
	mov	r6, r1	@ x1, input19
@ /home/student/ARM_TEST/butterworth_unrolled20.c:344:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:345:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	add	r10, r10, #20	@ i, i,
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	add	r3, r10, #19	@ _380, i,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:35:     for (i = 0; i + 19 < sample_count; i += 20) {
	add	r2, r7, #1016	@ tmp2054,,
	sub	r2, r2, #1016	@ tmp2056, tmp2054,
	ldr	r2, [r2]	@ tmp2057, sample_count
	cmp	r2, r3	@ tmp2057, _380
	bgt	.L85		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:351:     for (; i < sample_count; i++) {
	b	.L86		@
.L91:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:352:         register int current_input = x[i];
	mov	r3, r10	@ i.120_381, i
	lsls	r3, r3, #2	@ _382, i.120_381,
	add	r2, r7, #1016	@ tmp2058,,
	sub	r2, r2, #1012	@ tmp2060, tmp2058,
	ldr	r2, [r2]	@ tmp2061, x
	add	r3, r3, r2	@ _383, tmp2061
@ /home/student/ARM_TEST/butterworth_unrolled20.c:352:         register int current_input = x[i];
	ldr	r0, [r3]	@ current_input, *_383
@ /home/student/ARM_TEST/butterworth_unrolled20.c:353:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.121_384,
	mul	r1, r3, r0	@ _385, b02_1.121_384, current_input
@ /home/student/ARM_TEST/butterworth_unrolled20.c:355:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.122_386,
	lsls	r3, r3, #1	@ _387, b02_1.122_386,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:353:         register int y = __QADD(
	mul	r2, r3, r6	@ _388, _387, x1
	add	r3, r7, #1016	@ tmp2062,,
	sub	r3, r3, #1000	@ tmp2064, tmp2062,
	str	r1, [r3]	@ _385, first
	add	r3, r7, #1016	@ tmp2065,,
	sub	r3, r3, #1004	@ tmp2067, tmp2065,
	str	r2, [r3]	@ _388, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp2072,,
	sub	r3, r3, #1000	@ tmp2074, tmp2072,
	ldr	r3, [r3]	@ tmp2075, first
	add	r2, r7, #1016	@ tmp2076,,
	sub	r2, r2, #1004	@ tmp2078, tmp2076,
	ldr	r2, [r2]	@ tmp2079, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp2075, tmp2079
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp2069,,
	sub	r3, r3, #1008	@ tmp2071, tmp2069,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp2080,,
	sub	r3, r3, #1008	@ tmp2082, tmp2080,
	ldr	r3, [r3]	@ D.8281, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:353:         register int y = __QADD(
	mov	r4, r3	@ y, D.8281
@ /home/student/ARM_TEST/butterworth_unrolled20.c:357:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.123_389,
	mul	r2, r3, r8	@ _390, b02_1.123_389, x2
	add	r3, r7, #1016	@ tmp2083,,
	sub	r3, r3, #988	@ tmp2085, tmp2083,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp2086,,
	sub	r3, r3, #992	@ tmp2088, tmp2086,
	str	r2, [r3]	@ _390, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp2093,,
	sub	r3, r3, #988	@ tmp2095, tmp2093,
	ldr	r3, [r3]	@ tmp2096, first
	add	r2, r7, #1016	@ tmp2097,,
	sub	r2, r2, #992	@ tmp2099, tmp2097,
	ldr	r2, [r2]	@ tmp2100, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp2096, tmp2100
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp2090,,
	sub	r3, r3, #996	@ tmp2092, tmp2090,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp2101,,
	sub	r3, r3, #996	@ tmp2103, tmp2101,
	ldr	r3, [r3]	@ D.8275, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:357:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.8275
@ /home/student/ARM_TEST/butterworth_unrolled20.c:358:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.124_391,
	mul	r2, r3, r5	@ _392, a1.124_391, y1
	add	r3, r7, #1016	@ tmp2104,,
	sub	r3, r3, #976	@ tmp2106, tmp2104,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp2107,,
	sub	r3, r3, #980	@ tmp2109, tmp2107,
	str	r2, [r3]	@ _392, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp2114,,
	sub	r3, r3, #976	@ tmp2116, tmp2114,
	ldr	r3, [r3]	@ tmp2117, first
	add	r2, r7, #1016	@ tmp2118,,
	sub	r2, r2, #980	@ tmp2120, tmp2118,
	ldr	r2, [r2]	@ tmp2121, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp2117, tmp2121
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp2111,,
	sub	r3, r3, #984	@ tmp2113, tmp2111,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp2122,,
	sub	r3, r3, #984	@ tmp2124, tmp2122,
	ldr	r3, [r3]	@ D.8269, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:358:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.8269
@ /home/student/ARM_TEST/butterworth_unrolled20.c:359:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.125_393,
	movt	r3, 65535	@ a2.125_393,
	mul	r2, r3, r9	@ _394, a2.125_393, y2
	add	r3, r7, #1016	@ tmp2125,,
	sub	r3, r3, #964	@ tmp2127, tmp2125,
	str	r4, [r3]	@ y, first
	add	r3, r7, #1016	@ tmp2128,,
	sub	r3, r3, #968	@ tmp2130, tmp2128,
	str	r2, [r3]	@ _394, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #1016	@ tmp2135,,
	sub	r3, r3, #964	@ tmp2137, tmp2135,
	ldr	r3, [r3]	@ tmp2138, first
	add	r2, r7, #1016	@ tmp2139,,
	sub	r2, r2, #968	@ tmp2141, tmp2139,
	ldr	r2, [r2]	@ tmp2142, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp2138, tmp2142
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #1016	@ tmp2132,,
	sub	r3, r3, #972	@ tmp2134, tmp2132,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #1016	@ tmp2143,,
	sub	r3, r3, #972	@ tmp2145, tmp2143,
	ldr	r3, [r3]	@ D.8263, result
@ /home/student/ARM_TEST/butterworth_unrolled20.c:359:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.8263
@ /home/student/ARM_TEST/butterworth_unrolled20.c:360:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _395, y,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:360:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _396, y,,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:360:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _396,
	ite	ne
	movne	r2, #1	@ tmp2147,
	moveq	r2, #0	@ tmp2147,
	uxtb	r2, r2	@ _397, _397
@ /home/student/ARM_TEST/butterworth_unrolled20.c:360:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _395, _398
@ /home/student/ARM_TEST/butterworth_unrolled20.c:362:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:363:         x1 = current_input;
	mov	r6, r0	@ x1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled20.c:364:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:365:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:351:     for (; i < sample_count; i++) {
	add	r10, r10, #1	@ i, i,
.L86:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:351:     for (; i < sample_count; i++) {
	add	r3, r7, #1016	@ tmp2148,,
	sub	r3, r3, #1016	@ tmp2150, tmp2148,
	ldr	r3, [r3]	@ tmp2151, sample_count
	cmp	r10, r3	@ i, tmp2151
	blt	.L91		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:368:     return y1;
	mov	r3, r5	@ _419, y1
@ /home/student/ARM_TEST/butterworth_unrolled20.c:369: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #1020	@,,
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
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	b	.L94		@
.L95:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/ARM_TEST/butterworth_unrolled20.c:376:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L100	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L100+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:377:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L100+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L100+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/ARM_TEST/butterworth_unrolled20.c:381:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L94:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:375:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L95		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:387:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:387:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L96		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:388:         perror("Unable to start benchmark timer");
	ldr	r3, .L100+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:389:         return 1;
	movs	r3, #1	@ _17,
	b	.L99		@
.L96:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:392:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:392:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:394:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L98		@,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:395:         perror("Unable to stop benchmark timer");
	ldr	r3, .L100+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:396:         return 1;
	movs	r3, #1	@ _17,
	b	.L99		@
.L98:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:399:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/ARM_TEST/butterworth_unrolled20.c:400:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L100+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/ARM_TEST/butterworth_unrolled20.c:401:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L100+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled20.c:410:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vldr.64	d18, .L100+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/ARM_TEST/butterworth_unrolled20.c:411:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.126_13, y
	vmov	s15, r3	@ int	@ y.126_13, y.126_13
	vcvt.f64.s32	d18, s15	@ _14, y.126_13
@ /home/student/ARM_TEST/butterworth_unrolled20.c:403:     printf(
	vldr.64	d19, .L100+24	@ tmp175,
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
	ldr	r0, .L100+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled20.c:414:     return 0;
	movs	r3, #0	@ _17,
.L99:
@ /home/student/ARM_TEST/butterworth_unrolled20.c:415: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L101:
	.align	3
.L100:
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
