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
	.file	"butterworth_unrolled7.c"
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
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/ARM_TEST/butterworth_unrolled7.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled7.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:25: }
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
	@ args = 0, pretend = 0, frame = 392
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}	@
	sub	sp, sp, #396	@,,
	add	r7, sp, #0	@,,
	add	r3, r7, #392	@ tmp314,,
	sub	r3, r3, #388	@ tmp316, tmp314,
	str	r0, [r3]	@ x, x
	add	r3, r7, #392	@ tmp317,,
	sub	r3, r3, #392	@ tmp319, tmp317,
	str	r1, [r3]	@ sample_count, sample_count
@ /home/student/ARM_TEST/butterworth_unrolled7.c:29:     register int x1 = 0;
	movs	r6, #0	@ x1,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:30:     register int x2 = 0;
	mov	r8, #0	@ x2,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:31:     register int y1 = 0;
	movs	r5, #0	@ y1,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:32:     register int y2 = 0;
	mov	r9, #0	@ y2,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	mov	r10, #0	@ i,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	b	.L4		@
.L33:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:37:         register int input0 = x[i];
	mov	r3, r10	@ i.0_1, i
	lsls	r3, r3, #2	@ _2, i.0_1,
	add	r2, r7, #392	@ tmp320,,
	sub	r2, r2, #388	@ tmp322, tmp320,
	ldr	r2, [r2]	@ tmp323, x
	add	r3, r3, r2	@ _3, tmp323
@ /home/student/ARM_TEST/butterworth_unrolled7.c:37:         register int input0 = x[i];
	ldr	r0, [r3]	@ input0, *_3
@ /home/student/ARM_TEST/butterworth_unrolled7.c:38:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.1_4,
	mul	r1, r3, r0	@ _5, b02_1.1_4, input0
@ /home/student/ARM_TEST/butterworth_unrolled7.c:40:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.2_6,
	lsls	r3, r3, #1	@ _7, b02_1.2_6,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:38:         register int y = __QADD(
	mul	r2, r3, r6	@ _8, _7, x1
	add	r3, r7, #392	@ tmp324,,
	sub	r3, r3, #328	@ tmp326, tmp324,
	str	r1, [r3]	@ _5, first
	add	r3, r7, #392	@ tmp327,,
	sub	r3, r3, #332	@ tmp329, tmp327,
	str	r2, [r3]	@ _8, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp334,,
	sub	r3, r3, #328	@ tmp336, tmp334,
	ldr	r3, [r3]	@ tmp337, first
	add	r2, r7, #392	@ tmp338,,
	sub	r2, r2, #332	@ tmp340, tmp338,
	ldr	r2, [r2]	@ tmp341, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp337, tmp341
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp331,,
	sub	r3, r3, #336	@ tmp333, tmp331,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp342,,
	sub	r3, r3, #336	@ tmp344, tmp342,
	ldr	r3, [r3]	@ D.7932, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:38:         register int y = __QADD(
	mov	r4, r3	@ y, D.7932
@ /home/student/ARM_TEST/butterworth_unrolled7.c:42:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.3_9,
	mul	r2, r3, r8	@ _10, b02_1.3_9, x2
	add	r3, r7, #392	@ tmp345,,
	sub	r3, r3, #316	@ tmp347, tmp345,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp348,,
	sub	r3, r3, #320	@ tmp350, tmp348,
	str	r2, [r3]	@ _10, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp355,,
	sub	r3, r3, #316	@ tmp357, tmp355,
	ldr	r3, [r3]	@ tmp358, first
	add	r2, r7, #392	@ tmp359,,
	sub	r2, r2, #320	@ tmp361, tmp359,
	ldr	r2, [r2]	@ tmp362, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp358, tmp362
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp352,,
	sub	r3, r3, #324	@ tmp354, tmp352,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp363,,
	sub	r3, r3, #324	@ tmp365, tmp363,
	ldr	r3, [r3]	@ D.7926, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:42:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7926
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.4_11,
	mul	r2, r3, r5	@ _12, a1.4_11, y1
	add	r3, r7, #392	@ tmp366,,
	sub	r3, r3, #304	@ tmp368, tmp366,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp369,,
	sub	r3, r3, #308	@ tmp371, tmp369,
	str	r2, [r3]	@ _12, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp376,,
	sub	r3, r3, #304	@ tmp378, tmp376,
	ldr	r3, [r3]	@ tmp379, first
	add	r2, r7, #392	@ tmp380,,
	sub	r2, r2, #308	@ tmp382, tmp380,
	ldr	r2, [r2]	@ tmp383, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp379, tmp383
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp373,,
	sub	r3, r3, #312	@ tmp375, tmp373,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp384,,
	sub	r3, r3, #312	@ tmp386, tmp384,
	ldr	r3, [r3]	@ D.7920, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:43:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7920
@ /home/student/ARM_TEST/butterworth_unrolled7.c:44:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.5_13,
	movt	r3, 65535	@ a2.5_13,
	mul	r2, r3, r9	@ _14, a2.5_13, y2
	add	r3, r7, #392	@ tmp387,,
	sub	r3, r3, #292	@ tmp389, tmp387,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp390,,
	sub	r3, r3, #296	@ tmp392, tmp390,
	str	r2, [r3]	@ _14, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp397,,
	sub	r3, r3, #292	@ tmp399, tmp397,
	ldr	r3, [r3]	@ tmp400, first
	add	r2, r7, #392	@ tmp401,,
	sub	r2, r2, #296	@ tmp403, tmp401,
	ldr	r2, [r2]	@ tmp404, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp400, tmp404
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp394,,
	sub	r3, r3, #300	@ tmp396, tmp394,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp405,,
	sub	r3, r3, #300	@ tmp407, tmp405,
	ldr	r3, [r3]	@ D.7914, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:44:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7914
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp409,
	moveq	r2, #0	@ tmp409,
	uxtb	r2, r2	@ _17, _17
@ /home/student/ARM_TEST/butterworth_unrolled7.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/ARM_TEST/butterworth_unrolled7.c:47:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:48:         x1 = input0;
	mov	r6, r0	@ x1, input0
@ /home/student/ARM_TEST/butterworth_unrolled7.c:49:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:50:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:53:         register int input1 = x[i + 1];
	mov	r3, r10	@ i.6_19, i
	adds	r3, r3, #1	@ _20, i.6_19,
	lsls	r3, r3, #2	@ _21, _20,
	add	r2, r7, #392	@ tmp410,,
	sub	r2, r2, #388	@ tmp412, tmp410,
	ldr	r2, [r2]	@ tmp413, x
	add	r3, r3, r2	@ _22, tmp413
@ /home/student/ARM_TEST/butterworth_unrolled7.c:53:         register int input1 = x[i + 1];
	ldr	r0, [r3]	@ input1, *_22
@ /home/student/ARM_TEST/butterworth_unrolled7.c:54:         y = __QADD(
	movw	r3, #1105	@ b02_1.7_23,
	mul	r1, r3, r0	@ _24, b02_1.7_23, input1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:56:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.8_25,
	lsls	r3, r3, #1	@ _26, b02_1.8_25,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:54:         y = __QADD(
	mul	r2, r3, r6	@ _27, _26, x1
	add	r3, r7, #392	@ tmp414,,
	sub	r3, r3, #280	@ tmp416, tmp414,
	str	r1, [r3]	@ _24, first
	add	r3, r7, #392	@ tmp417,,
	sub	r3, r3, #284	@ tmp419, tmp417,
	str	r2, [r3]	@ _27, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp424,,
	sub	r3, r3, #280	@ tmp426, tmp424,
	ldr	r3, [r3]	@ tmp427, first
	add	r2, r7, #392	@ tmp428,,
	sub	r2, r2, #284	@ tmp430, tmp428,
	ldr	r2, [r2]	@ tmp431, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp427, tmp431
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp421,,
	sub	r3, r3, #288	@ tmp423, tmp421,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp432,,
	sub	r3, r3, #288	@ tmp434, tmp432,
	ldr	r3, [r3]	@ D.7908, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:54:         y = __QADD(
	mov	r4, r3	@ y, D.7908
@ /home/student/ARM_TEST/butterworth_unrolled7.c:58:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.9_28,
	mul	r2, r3, r8	@ _29, b02_1.9_28, x2
	add	r3, r7, #392	@ tmp435,,
	sub	r3, r3, #268	@ tmp437, tmp435,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp438,,
	sub	r3, r3, #272	@ tmp440, tmp438,
	str	r2, [r3]	@ _29, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp445,,
	sub	r3, r3, #268	@ tmp447, tmp445,
	ldr	r3, [r3]	@ tmp448, first
	add	r2, r7, #392	@ tmp449,,
	sub	r2, r2, #272	@ tmp451, tmp449,
	ldr	r2, [r2]	@ tmp452, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp448, tmp452
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp442,,
	sub	r3, r3, #276	@ tmp444, tmp442,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp453,,
	sub	r3, r3, #276	@ tmp455, tmp453,
	ldr	r3, [r3]	@ D.7902, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:58:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7902
@ /home/student/ARM_TEST/butterworth_unrolled7.c:59:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.10_30,
	mul	r2, r3, r5	@ _31, a1.10_30, y1
	add	r3, r7, #392	@ tmp456,,
	sub	r3, r3, #256	@ tmp458, tmp456,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp459,,
	sub	r3, r3, #260	@ tmp461, tmp459,
	str	r2, [r3]	@ _31, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp466,,
	sub	r3, r3, #256	@ tmp468, tmp466,
	ldr	r3, [r3]	@ tmp469, first
	add	r2, r7, #392	@ tmp470,,
	sub	r2, r2, #260	@ tmp472, tmp470,
	ldr	r2, [r2]	@ tmp473, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp469, tmp473
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp463,,
	sub	r3, r3, #264	@ tmp465, tmp463,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp474,,
	sub	r3, r3, #264	@ tmp476, tmp474,
	ldr	r3, [r3]	@ D.7896, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:59:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7896
@ /home/student/ARM_TEST/butterworth_unrolled7.c:60:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.11_32,
	movt	r3, 65535	@ a2.11_32,
	mul	r3, r3, r9	@ _33, a2.11_32, y2
	str	r4, [r7, #148]	@ y, first
	str	r3, [r7, #144]	@ _33, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #148]	@ tmp478, first
	ldr	r2, [r7, #144]	@ tmp479, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp478, tmp479
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #140]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #140]	@ D.7890, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:60:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7890
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp481,
	moveq	r2, #0	@ tmp481,
	uxtb	r2, r2	@ _36, _36
@ /home/student/ARM_TEST/butterworth_unrolled7.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/ARM_TEST/butterworth_unrolled7.c:63:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:64:         x1 = input1;
	mov	r6, r0	@ x1, input1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:65:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:66:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:69:         register int input2 = x[i + 2];
	mov	r3, r10	@ i.12_38, i
	adds	r3, r3, #2	@ _39, i.12_38,
	lsls	r3, r3, #2	@ _40, _39,
	add	r2, r7, #392	@ tmp482,,
	sub	r2, r2, #388	@ tmp484, tmp482,
	ldr	r2, [r2]	@ tmp485, x
	add	r3, r3, r2	@ _41, tmp485
@ /home/student/ARM_TEST/butterworth_unrolled7.c:69:         register int input2 = x[i + 2];
	ldr	r1, [r3]	@ input2, *_41
@ /home/student/ARM_TEST/butterworth_unrolled7.c:70:         y = __QADD(
	movw	r3, #1105	@ b02_1.13_42,
	mul	r2, r3, r1	@ _43, b02_1.13_42, input2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:72:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.14_44,
	lsls	r3, r3, #1	@ _45, b02_1.14_44,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:70:         y = __QADD(
	mul	r3, r6, r3	@ _46, x1, _45
	str	r2, [r7, #160]	@ _43, first
	str	r3, [r7, #156]	@ _46, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #160]	@ tmp487, first
	ldr	r2, [r7, #156]	@ tmp488, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp487, tmp488
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #152]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #152]	@ D.7884, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:70:         y = __QADD(
	mov	r4, r3	@ y, D.7884
@ /home/student/ARM_TEST/butterworth_unrolled7.c:74:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.15_47,
	mul	r3, r3, r8	@ _48, b02_1.15_47, x2
	str	r4, [r7, #172]	@ y, first
	str	r3, [r7, #168]	@ _48, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #172]	@ tmp490, first
	ldr	r2, [r7, #168]	@ tmp491, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp490, tmp491
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #164]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #164]	@ D.7878, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:74:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7878
@ /home/student/ARM_TEST/butterworth_unrolled7.c:75:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.16_49,
	mul	r3, r5, r3	@ _50, y1, a1.16_49
	str	r4, [r7, #184]	@ y, first
	str	r3, [r7, #180]	@ _50, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #184]	@ tmp493, first
	ldr	r2, [r7, #180]	@ tmp494, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp493, tmp494
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #176]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #176]	@ D.7872, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:75:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7872
@ /home/student/ARM_TEST/butterworth_unrolled7.c:76:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.17_51,
	movt	r3, 65535	@ a2.17_51,
	mul	r3, r3, r9	@ _52, a2.17_51, y2
	str	r4, [r7, #196]	@ y, first
	str	r3, [r7, #192]	@ _52, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #196]	@ tmp496, first
	ldr	r2, [r7, #192]	@ tmp497, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp496, tmp497
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #188]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #188]	@ D.7866, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:76:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7866
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp499,
	moveq	r2, #0	@ tmp499,
	uxtb	r2, r2	@ _55, _55
@ /home/student/ARM_TEST/butterworth_unrolled7.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/ARM_TEST/butterworth_unrolled7.c:79:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:80:         x1 = input2;
	mov	r6, r1	@ x1, input2
@ /home/student/ARM_TEST/butterworth_unrolled7.c:81:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:82:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:85:         register int input3 = x[i + 3];
	mov	r3, r10	@ i.18_57, i
	adds	r3, r3, #3	@ _58, i.18_57,
	lsls	r3, r3, #2	@ _59, _58,
	add	r2, r7, #392	@ tmp500,,
	sub	r2, r2, #388	@ tmp502, tmp500,
	ldr	r2, [r2]	@ tmp503, x
	add	r3, r3, r2	@ _60, tmp503
@ /home/student/ARM_TEST/butterworth_unrolled7.c:85:         register int input3 = x[i + 3];
	ldr	r1, [r3]	@ input3, *_60
@ /home/student/ARM_TEST/butterworth_unrolled7.c:86:         y = __QADD(
	movw	r3, #1105	@ b02_1.19_61,
	mul	r2, r3, r1	@ _62, b02_1.19_61, input3
@ /home/student/ARM_TEST/butterworth_unrolled7.c:88:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.20_63,
	lsls	r3, r3, #1	@ _64, b02_1.20_63,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:86:         y = __QADD(
	mul	r3, r6, r3	@ _65, x1, _64
	str	r2, [r7, #208]	@ _62, first
	str	r3, [r7, #204]	@ _65, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #208]	@ tmp505, first
	ldr	r2, [r7, #204]	@ tmp506, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp505, tmp506
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #200]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #200]	@ D.7860, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:86:         y = __QADD(
	mov	r4, r3	@ y, D.7860
@ /home/student/ARM_TEST/butterworth_unrolled7.c:90:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.21_66,
	mul	r3, r3, r8	@ _67, b02_1.21_66, x2
	str	r4, [r7, #220]	@ y, first
	str	r3, [r7, #216]	@ _67, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #220]	@ tmp508, first
	ldr	r2, [r7, #216]	@ tmp509, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp508, tmp509
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #212]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #212]	@ D.7854, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:90:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7854
@ /home/student/ARM_TEST/butterworth_unrolled7.c:91:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.22_68,
	mul	r3, r5, r3	@ _69, y1, a1.22_68
	str	r4, [r7, #232]	@ y, first
	str	r3, [r7, #228]	@ _69, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #232]	@ tmp511, first
	ldr	r2, [r7, #228]	@ tmp512, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp511, tmp512
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #224]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #224]	@ D.7848, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:91:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7848
@ /home/student/ARM_TEST/butterworth_unrolled7.c:92:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.23_70,
	movt	r3, 65535	@ a2.23_70,
	mul	r3, r3, r9	@ _71, a2.23_70, y2
	str	r4, [r7, #244]	@ y, first
	str	r3, [r7, #240]	@ _71, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #244]	@ tmp514, first
	ldr	r2, [r7, #240]	@ tmp515, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp514, tmp515
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #236]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #236]	@ D.7842, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:92:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7842
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _72, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _73, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _73,
	ite	ne
	movne	r2, #1	@ tmp517,
	moveq	r2, #0	@ tmp517,
	uxtb	r2, r2	@ _74, _74
@ /home/student/ARM_TEST/butterworth_unrolled7.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _72, _75
@ /home/student/ARM_TEST/butterworth_unrolled7.c:95:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:96:         x1 = input3;
	mov	r6, r1	@ x1, input3
@ /home/student/ARM_TEST/butterworth_unrolled7.c:97:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:98:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:101:         register int input4 = x[i + 4];
	mov	r3, r10	@ i.24_76, i
	adds	r3, r3, #4	@ _77, i.24_76,
	lsls	r3, r3, #2	@ _78, _77,
	add	r2, r7, #392	@ tmp518,,
	sub	r2, r2, #388	@ tmp520, tmp518,
	ldr	r2, [r2]	@ tmp521, x
	add	r3, r3, r2	@ _79, tmp521
@ /home/student/ARM_TEST/butterworth_unrolled7.c:101:         register int input4 = x[i + 4];
	ldr	r1, [r3]	@ input4, *_79
@ /home/student/ARM_TEST/butterworth_unrolled7.c:102:         y = __QADD(
	movw	r3, #1105	@ b02_1.25_80,
	mul	r2, r3, r1	@ _81, b02_1.25_80, input4
@ /home/student/ARM_TEST/butterworth_unrolled7.c:104:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.26_82,
	lsls	r3, r3, #1	@ _83, b02_1.26_82,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:102:         y = __QADD(
	mul	r3, r6, r3	@ _84, x1, _83
	str	r2, [r7, #256]	@ _81, first
	str	r3, [r7, #252]	@ _84, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #256]	@ tmp523, first
	ldr	r2, [r7, #252]	@ tmp524, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp523, tmp524
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #248]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #248]	@ D.7836, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:102:         y = __QADD(
	mov	r4, r3	@ y, D.7836
@ /home/student/ARM_TEST/butterworth_unrolled7.c:106:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.27_85,
	mul	r3, r3, r8	@ _86, b02_1.27_85, x2
	str	r4, [r7, #268]	@ y, first
	str	r3, [r7, #264]	@ _86, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #268]	@ tmp526, first
	ldr	r2, [r7, #264]	@ tmp527, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp526, tmp527
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #260]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #260]	@ D.7830, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:106:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7830
@ /home/student/ARM_TEST/butterworth_unrolled7.c:107:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.28_87,
	mul	r3, r5, r3	@ _88, y1, a1.28_87
	str	r4, [r7, #280]	@ y, first
	str	r3, [r7, #276]	@ _88, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #280]	@ tmp529, first
	ldr	r2, [r7, #276]	@ tmp530, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp529, tmp530
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #272]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #272]	@ D.7824, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:107:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7824
@ /home/student/ARM_TEST/butterworth_unrolled7.c:108:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.29_89,
	movt	r3, 65535	@ a2.29_89,
	mul	r3, r3, r9	@ _90, a2.29_89, y2
	str	r4, [r7, #292]	@ y, first
	str	r3, [r7, #288]	@ _90, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #292]	@ tmp532, first
	ldr	r2, [r7, #288]	@ tmp533, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp532, tmp533
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #284]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #284]	@ D.7818, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:108:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7818
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _91, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _92, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _92,
	ite	ne
	movne	r2, #1	@ tmp535,
	moveq	r2, #0	@ tmp535,
	uxtb	r2, r2	@ _93, _93
@ /home/student/ARM_TEST/butterworth_unrolled7.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _91, _94
@ /home/student/ARM_TEST/butterworth_unrolled7.c:111:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:112:         x1 = input4;
	mov	r6, r1	@ x1, input4
@ /home/student/ARM_TEST/butterworth_unrolled7.c:113:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:114:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:117:         register int input5 = x[i + 5];
	mov	r3, r10	@ i.30_95, i
	adds	r3, r3, #5	@ _96, i.30_95,
	lsls	r3, r3, #2	@ _97, _96,
	add	r2, r7, #392	@ tmp536,,
	sub	r2, r2, #388	@ tmp538, tmp536,
	ldr	r2, [r2]	@ tmp539, x
	add	r3, r3, r2	@ _98, tmp539
@ /home/student/ARM_TEST/butterworth_unrolled7.c:117:         register int input5 = x[i + 5];
	ldr	r1, [r3]	@ input5, *_98
@ /home/student/ARM_TEST/butterworth_unrolled7.c:118:         y = __QADD(
	movw	r3, #1105	@ b02_1.31_99,
	mul	r2, r3, r1	@ _100, b02_1.31_99, input5
@ /home/student/ARM_TEST/butterworth_unrolled7.c:120:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.32_101,
	lsls	r3, r3, #1	@ _102, b02_1.32_101,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:118:         y = __QADD(
	mul	r3, r6, r3	@ _103, x1, _102
	str	r2, [r7, #304]	@ _100, first
	str	r3, [r7, #300]	@ _103, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #304]	@ tmp541, first
	ldr	r2, [r7, #300]	@ tmp542, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp541, tmp542
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #296]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #296]	@ D.7812, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:118:         y = __QADD(
	mov	r4, r3	@ y, D.7812
@ /home/student/ARM_TEST/butterworth_unrolled7.c:122:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.33_104,
	mul	r3, r3, r8	@ _105, b02_1.33_104, x2
	str	r4, [r7, #316]	@ y, first
	str	r3, [r7, #312]	@ _105, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #316]	@ tmp544, first
	ldr	r2, [r7, #312]	@ tmp545, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp544, tmp545
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #308]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #308]	@ D.7806, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:122:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7806
@ /home/student/ARM_TEST/butterworth_unrolled7.c:123:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.34_106,
	mul	r3, r5, r3	@ _107, y1, a1.34_106
	str	r4, [r7, #328]	@ y, first
	str	r3, [r7, #324]	@ _107, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #328]	@ tmp547, first
	ldr	r2, [r7, #324]	@ tmp548, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp547, tmp548
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #320]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #320]	@ D.7800, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:123:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7800
@ /home/student/ARM_TEST/butterworth_unrolled7.c:124:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.35_108,
	movt	r3, 65535	@ a2.35_108,
	mul	r3, r3, r9	@ _109, a2.35_108, y2
	str	r4, [r7, #340]	@ y, first
	str	r3, [r7, #336]	@ _109, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #340]	@ tmp550, first
	ldr	r2, [r7, #336]	@ tmp551, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp550, tmp551
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #332]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #332]	@ D.7794, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:124:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7794
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _110, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _111, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _111,
	ite	ne
	movne	r2, #1	@ tmp553,
	moveq	r2, #0	@ tmp553,
	uxtb	r2, r2	@ _112, _112
@ /home/student/ARM_TEST/butterworth_unrolled7.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _110, _113
@ /home/student/ARM_TEST/butterworth_unrolled7.c:127:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:128:         x1 = input5;
	mov	r6, r1	@ x1, input5
@ /home/student/ARM_TEST/butterworth_unrolled7.c:129:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:130:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:133:         register int input6 = x[i + 6];
	mov	r3, r10	@ i.36_114, i
	adds	r3, r3, #6	@ _115, i.36_114,
	lsls	r3, r3, #2	@ _116, _115,
	add	r2, r7, #392	@ tmp554,,
	sub	r2, r2, #388	@ tmp556, tmp554,
	ldr	r2, [r2]	@ tmp557, x
	add	r3, r3, r2	@ _117, tmp557
@ /home/student/ARM_TEST/butterworth_unrolled7.c:133:         register int input6 = x[i + 6];
	ldr	r1, [r3]	@ input6, *_117
@ /home/student/ARM_TEST/butterworth_unrolled7.c:134:         y = __QADD(
	movw	r3, #1105	@ b02_1.37_118,
	mul	r2, r3, r1	@ _119, b02_1.37_118, input6
@ /home/student/ARM_TEST/butterworth_unrolled7.c:136:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.38_120,
	lsls	r3, r3, #1	@ _121, b02_1.38_120,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:134:         y = __QADD(
	mul	r3, r6, r3	@ _122, x1, _121
	str	r2, [r7, #352]	@ _119, first
	str	r3, [r7, #348]	@ _122, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #352]	@ tmp559, first
	ldr	r2, [r7, #348]	@ tmp560, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp559, tmp560
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #344]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #344]	@ D.7788, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:134:         y = __QADD(
	mov	r4, r3	@ y, D.7788
@ /home/student/ARM_TEST/butterworth_unrolled7.c:138:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.39_123,
	mul	r3, r3, r8	@ _124, b02_1.39_123, x2
	str	r4, [r7, #364]	@ y, first
	str	r3, [r7, #360]	@ _124, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #364]	@ tmp562, first
	ldr	r2, [r7, #360]	@ tmp563, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp562, tmp563
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #356]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #356]	@ D.7782, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:138:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7782
@ /home/student/ARM_TEST/butterworth_unrolled7.c:139:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.40_125,
	mul	r3, r5, r3	@ _126, y1, a1.40_125
	str	r4, [r7, #376]	@ y, first
	str	r3, [r7, #372]	@ _126, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #376]	@ tmp565, first
	ldr	r2, [r7, #372]	@ tmp566, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp565, tmp566
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #368]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #368]	@ D.7776, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:139:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7776
@ /home/student/ARM_TEST/butterworth_unrolled7.c:140:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.41_127,
	movt	r3, 65535	@ a2.41_127,
	mul	r3, r3, r9	@ _128, a2.41_127, y2
	str	r4, [r7, #388]	@ y, first
	str	r3, [r7, #384]	@ _128, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #388]	@ tmp568, first
	ldr	r2, [r7, #384]	@ tmp569, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp568, tmp569
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #380]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #380]	@ D.7770, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:140:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7770
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _129, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _130, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _130,
	ite	ne
	movne	r2, #1	@ tmp571,
	moveq	r2, #0	@ tmp571,
	uxtb	r2, r2	@ _131, _131
@ /home/student/ARM_TEST/butterworth_unrolled7.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _129, _132
@ /home/student/ARM_TEST/butterworth_unrolled7.c:143:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:144:         x1 = input6;
	mov	r6, r1	@ x1, input6
@ /home/student/ARM_TEST/butterworth_unrolled7.c:145:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:146:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	add	r10, r10, #7	@ i, i,
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	add	r3, r10, #6	@ _133, i,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:35:     for (i = 0; i + 6 < sample_count; i += 7) {
	add	r2, r7, #392	@ tmp572,,
	sub	r2, r2, #392	@ tmp574, tmp572,
	ldr	r2, [r2]	@ tmp575, sample_count
	cmp	r2, r3	@ tmp575, _133
	bgt	.L33		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:150:     for (; i < sample_count; i++) {
	b	.L34		@
.L39:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:151:         register int current_input = x[i];
	mov	r3, r10	@ i.42_134, i
	lsls	r3, r3, #2	@ _135, i.42_134,
	add	r2, r7, #392	@ tmp576,,
	sub	r2, r2, #388	@ tmp578, tmp576,
	ldr	r2, [r2]	@ tmp579, x
	add	r3, r3, r2	@ _136, tmp579
@ /home/student/ARM_TEST/butterworth_unrolled7.c:151:         register int current_input = x[i];
	ldr	r0, [r3]	@ current_input, *_136
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.43_137,
	mul	r1, r3, r0	@ _138, b02_1.43_137, current_input
@ /home/student/ARM_TEST/butterworth_unrolled7.c:154:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.44_139,
	lsls	r3, r3, #1	@ _140, b02_1.44_139,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mul	r2, r3, r6	@ _141, _140, x1
	add	r3, r7, #392	@ tmp580,,
	sub	r3, r3, #376	@ tmp582, tmp580,
	str	r1, [r3]	@ _138, first
	add	r3, r7, #392	@ tmp583,,
	sub	r3, r3, #380	@ tmp585, tmp583,
	str	r2, [r3]	@ _141, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp590,,
	sub	r3, r3, #376	@ tmp592, tmp590,
	ldr	r3, [r3]	@ tmp593, first
	add	r2, r7, #392	@ tmp594,,
	sub	r2, r2, #380	@ tmp596, tmp594,
	ldr	r2, [r2]	@ tmp597, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp593, tmp597
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp587,,
	sub	r3, r3, #384	@ tmp589, tmp587,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp598,,
	sub	r3, r3, #384	@ tmp600, tmp598,
	ldr	r3, [r3]	@ D.7956, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:152:         register int y = __QADD(
	mov	r4, r3	@ y, D.7956
@ /home/student/ARM_TEST/butterworth_unrolled7.c:156:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.45_142,
	mul	r2, r3, r8	@ _143, b02_1.45_142, x2
	add	r3, r7, #392	@ tmp601,,
	sub	r3, r3, #364	@ tmp603, tmp601,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp604,,
	sub	r3, r3, #368	@ tmp606, tmp604,
	str	r2, [r3]	@ _143, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp611,,
	sub	r3, r3, #364	@ tmp613, tmp611,
	ldr	r3, [r3]	@ tmp614, first
	add	r2, r7, #392	@ tmp615,,
	sub	r2, r2, #368	@ tmp617, tmp615,
	ldr	r2, [r2]	@ tmp618, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp614, tmp618
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp608,,
	sub	r3, r3, #372	@ tmp610, tmp608,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp619,,
	sub	r3, r3, #372	@ tmp621, tmp619,
	ldr	r3, [r3]	@ D.7950, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:156:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7950
@ /home/student/ARM_TEST/butterworth_unrolled7.c:157:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.46_144,
	mul	r2, r3, r5	@ _145, a1.46_144, y1
	add	r3, r7, #392	@ tmp622,,
	sub	r3, r3, #352	@ tmp624, tmp622,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp625,,
	sub	r3, r3, #356	@ tmp627, tmp625,
	str	r2, [r3]	@ _145, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp632,,
	sub	r3, r3, #352	@ tmp634, tmp632,
	ldr	r3, [r3]	@ tmp635, first
	add	r2, r7, #392	@ tmp636,,
	sub	r2, r2, #356	@ tmp638, tmp636,
	ldr	r2, [r2]	@ tmp639, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp635, tmp639
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp629,,
	sub	r3, r3, #360	@ tmp631, tmp629,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp640,,
	sub	r3, r3, #360	@ tmp642, tmp640,
	ldr	r3, [r3]	@ D.7944, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:157:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7944
@ /home/student/ARM_TEST/butterworth_unrolled7.c:158:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.47_146,
	movt	r3, 65535	@ a2.47_146,
	mul	r2, r3, r9	@ _147, a2.47_146, y2
	add	r3, r7, #392	@ tmp643,,
	sub	r3, r3, #340	@ tmp645, tmp643,
	str	r4, [r3]	@ y, first
	add	r3, r7, #392	@ tmp646,,
	sub	r3, r3, #344	@ tmp648, tmp646,
	str	r2, [r3]	@ _147, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #392	@ tmp653,,
	sub	r3, r3, #340	@ tmp655, tmp653,
	ldr	r3, [r3]	@ tmp656, first
	add	r2, r7, #392	@ tmp657,,
	sub	r2, r2, #344	@ tmp659, tmp657,
	ldr	r2, [r2]	@ tmp660, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp656, tmp660
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #392	@ tmp650,,
	sub	r3, r3, #348	@ tmp652, tmp650,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #392	@ tmp661,,
	sub	r3, r3, #348	@ tmp663, tmp661,
	ldr	r3, [r3]	@ D.7938, result
@ /home/student/ARM_TEST/butterworth_unrolled7.c:158:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7938
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _148, y,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _149, y,,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _149,
	ite	ne
	movne	r2, #1	@ tmp665,
	moveq	r2, #0	@ tmp665,
	uxtb	r2, r2	@ _150, _150
@ /home/student/ARM_TEST/butterworth_unrolled7.c:159:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _148, _151
@ /home/student/ARM_TEST/butterworth_unrolled7.c:161:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:162:         x1 = current_input;
	mov	r6, r0	@ x1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled7.c:163:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:164:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:150:     for (; i < sample_count; i++) {
	add	r10, r10, #1	@ i, i,
.L34:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:150:     for (; i < sample_count; i++) {
	add	r3, r7, #392	@ tmp666,,
	sub	r3, r3, #392	@ tmp668, tmp666,
	ldr	r3, [r3]	@ tmp669, sample_count
	cmp	r10, r3	@ i, tmp669
	blt	.L39		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:167:     return y1;
	mov	r3, r5	@ _172, y1
@ /home/student/ARM_TEST/butterworth_unrolled7.c:168: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #396	@,,
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
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	b	.L42		@
.L43:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/ARM_TEST/butterworth_unrolled7.c:175:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L48	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L48+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:176:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L48+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L48+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/ARM_TEST/butterworth_unrolled7.c:180:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L42:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:174:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L43		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:186:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:186:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L44		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:187:         perror("Unable to start benchmark timer");
	ldr	r3, .L48+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:188:         return 1;
	movs	r3, #1	@ _17,
	b	.L47		@
.L44:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:191:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:191:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:193:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L46		@,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:194:         perror("Unable to stop benchmark timer");
	ldr	r3, .L48+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:195:         return 1;
	movs	r3, #1	@ _17,
	b	.L47		@
.L46:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:198:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/ARM_TEST/butterworth_unrolled7.c:199:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L48+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/ARM_TEST/butterworth_unrolled7.c:200:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L48+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled7.c:209:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	vldr.64	d18, .L48+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/ARM_TEST/butterworth_unrolled7.c:210:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.48_13, y
	vmov	s15, r3	@ int	@ y.48_13, y.48_13
	vcvt.f64.s32	d18, s15	@ _14, y.48_13
@ /home/student/ARM_TEST/butterworth_unrolled7.c:202:     printf(
	vldr.64	d19, .L48+24	@ tmp175,
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
	ldr	r0, .L48+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled7.c:213:     return 0;
	movs	r3, #0	@ _17,
.L47:
@ /home/student/ARM_TEST/butterworth_unrolled7.c:214: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L49:
	.align	3
.L48:
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
