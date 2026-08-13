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
	.file	"butterworth_unrolled8.c"
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
@ /home/student/ARM_TEST/butterworth_unrolled8.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled8.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled8.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/ARM_TEST/butterworth_unrolled8.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/ARM_TEST/butterworth_unrolled8.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled8.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:25: }
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
	@ args = 0, pretend = 0, frame = 440
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}	@
	sub	sp, sp, #444	@,,
	add	r7, sp, #0	@,,
	add	r3, r7, #440	@ tmp338,,
	sub	r3, r3, #436	@ tmp340, tmp338,
	str	r0, [r3]	@ x, x
	add	r3, r7, #440	@ tmp341,,
	sub	r3, r3, #440	@ tmp343, tmp341,
	str	r1, [r3]	@ sample_count, sample_count
@ /home/student/ARM_TEST/butterworth_unrolled8.c:29:     register int x1 = 0;
	movs	r6, #0	@ x1,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:30:     register int x2 = 0;
	mov	r8, #0	@ x2,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:31:     register int y1 = 0;
	movs	r5, #0	@ y1,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:32:     register int y2 = 0;
	mov	r9, #0	@ y2,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:35:     for (i = 0; i + 7 < sample_count; i += 8) {
	mov	r10, #0	@ i,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:35:     for (i = 0; i + 7 < sample_count; i += 8) {
	b	.L4		@
.L37:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:37:         register int input0 = x[i];
	mov	r3, r10	@ i.0_1, i
	lsls	r3, r3, #2	@ _2, i.0_1,
	add	r2, r7, #440	@ tmp344,,
	sub	r2, r2, #436	@ tmp346, tmp344,
	ldr	r2, [r2]	@ tmp347, x
	add	r3, r3, r2	@ _3, tmp347
@ /home/student/ARM_TEST/butterworth_unrolled8.c:37:         register int input0 = x[i];
	ldr	r0, [r3]	@ input0, *_3
@ /home/student/ARM_TEST/butterworth_unrolled8.c:38:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.1_4,
	mul	r1, r3, r0	@ _5, b02_1.1_4, input0
@ /home/student/ARM_TEST/butterworth_unrolled8.c:40:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.2_6,
	lsls	r3, r3, #1	@ _7, b02_1.2_6,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:38:         register int y = __QADD(
	mul	r2, r3, r6	@ _8, _7, x1
	add	r3, r7, #440	@ tmp348,,
	sub	r3, r3, #376	@ tmp350, tmp348,
	str	r1, [r3]	@ _5, first
	add	r3, r7, #440	@ tmp351,,
	sub	r3, r3, #380	@ tmp353, tmp351,
	str	r2, [r3]	@ _8, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp358,,
	sub	r3, r3, #376	@ tmp360, tmp358,
	ldr	r3, [r3]	@ tmp361, first
	add	r2, r7, #440	@ tmp362,,
	sub	r2, r2, #380	@ tmp364, tmp362,
	ldr	r2, [r2]	@ tmp365, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp361, tmp365
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp355,,
	sub	r3, r3, #384	@ tmp357, tmp355,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp366,,
	sub	r3, r3, #384	@ tmp368, tmp366,
	ldr	r3, [r3]	@ D.7957, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:38:         register int y = __QADD(
	mov	r4, r3	@ y, D.7957
@ /home/student/ARM_TEST/butterworth_unrolled8.c:42:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.3_9,
	mul	r2, r3, r8	@ _10, b02_1.3_9, x2
	add	r3, r7, #440	@ tmp369,,
	sub	r3, r3, #364	@ tmp371, tmp369,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp372,,
	sub	r3, r3, #368	@ tmp374, tmp372,
	str	r2, [r3]	@ _10, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp379,,
	sub	r3, r3, #364	@ tmp381, tmp379,
	ldr	r3, [r3]	@ tmp382, first
	add	r2, r7, #440	@ tmp383,,
	sub	r2, r2, #368	@ tmp385, tmp383,
	ldr	r2, [r2]	@ tmp386, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp382, tmp386
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp376,,
	sub	r3, r3, #372	@ tmp378, tmp376,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp387,,
	sub	r3, r3, #372	@ tmp389, tmp387,
	ldr	r3, [r3]	@ D.7951, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:42:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7951
@ /home/student/ARM_TEST/butterworth_unrolled8.c:43:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.4_11,
	mul	r2, r3, r5	@ _12, a1.4_11, y1
	add	r3, r7, #440	@ tmp390,,
	sub	r3, r3, #352	@ tmp392, tmp390,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp393,,
	sub	r3, r3, #356	@ tmp395, tmp393,
	str	r2, [r3]	@ _12, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp400,,
	sub	r3, r3, #352	@ tmp402, tmp400,
	ldr	r3, [r3]	@ tmp403, first
	add	r2, r7, #440	@ tmp404,,
	sub	r2, r2, #356	@ tmp406, tmp404,
	ldr	r2, [r2]	@ tmp407, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp403, tmp407
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp397,,
	sub	r3, r3, #360	@ tmp399, tmp397,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp408,,
	sub	r3, r3, #360	@ tmp410, tmp408,
	ldr	r3, [r3]	@ D.7945, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:43:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7945
@ /home/student/ARM_TEST/butterworth_unrolled8.c:44:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.5_13,
	movt	r3, 65535	@ a2.5_13,
	mul	r2, r3, r9	@ _14, a2.5_13, y2
	add	r3, r7, #440	@ tmp411,,
	sub	r3, r3, #340	@ tmp413, tmp411,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp414,,
	sub	r3, r3, #344	@ tmp416, tmp414,
	str	r2, [r3]	@ _14, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp421,,
	sub	r3, r3, #340	@ tmp423, tmp421,
	ldr	r3, [r3]	@ tmp424, first
	add	r2, r7, #440	@ tmp425,,
	sub	r2, r2, #344	@ tmp427, tmp425,
	ldr	r2, [r2]	@ tmp428, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp424, tmp428
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp418,,
	sub	r3, r3, #348	@ tmp420, tmp418,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp429,,
	sub	r3, r3, #348	@ tmp431, tmp429,
	ldr	r3, [r3]	@ D.7939, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:44:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7939
@ /home/student/ARM_TEST/butterworth_unrolled8.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp433,
	moveq	r2, #0	@ tmp433,
	uxtb	r2, r2	@ _17, _17
@ /home/student/ARM_TEST/butterworth_unrolled8.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/ARM_TEST/butterworth_unrolled8.c:47:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:48:         x1 = input0;
	mov	r6, r0	@ x1, input0
@ /home/student/ARM_TEST/butterworth_unrolled8.c:49:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:50:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:53:         register int input1 = x[i + 1];
	mov	r3, r10	@ i.6_19, i
	adds	r3, r3, #1	@ _20, i.6_19,
	lsls	r3, r3, #2	@ _21, _20,
	add	r2, r7, #440	@ tmp434,,
	sub	r2, r2, #436	@ tmp436, tmp434,
	ldr	r2, [r2]	@ tmp437, x
	add	r3, r3, r2	@ _22, tmp437
@ /home/student/ARM_TEST/butterworth_unrolled8.c:53:         register int input1 = x[i + 1];
	ldr	r0, [r3]	@ input1, *_22
@ /home/student/ARM_TEST/butterworth_unrolled8.c:54:         y = __QADD(
	movw	r3, #1105	@ b02_1.7_23,
	mul	r1, r3, r0	@ _24, b02_1.7_23, input1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:56:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.8_25,
	lsls	r3, r3, #1	@ _26, b02_1.8_25,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:54:         y = __QADD(
	mul	r2, r3, r6	@ _27, _26, x1
	add	r3, r7, #440	@ tmp438,,
	sub	r3, r3, #328	@ tmp440, tmp438,
	str	r1, [r3]	@ _24, first
	add	r3, r7, #440	@ tmp441,,
	sub	r3, r3, #332	@ tmp443, tmp441,
	str	r2, [r3]	@ _27, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp448,,
	sub	r3, r3, #328	@ tmp450, tmp448,
	ldr	r3, [r3]	@ tmp451, first
	add	r2, r7, #440	@ tmp452,,
	sub	r2, r2, #332	@ tmp454, tmp452,
	ldr	r2, [r2]	@ tmp455, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp451, tmp455
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp445,,
	sub	r3, r3, #336	@ tmp447, tmp445,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp456,,
	sub	r3, r3, #336	@ tmp458, tmp456,
	ldr	r3, [r3]	@ D.7933, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:54:         y = __QADD(
	mov	r4, r3	@ y, D.7933
@ /home/student/ARM_TEST/butterworth_unrolled8.c:58:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.9_28,
	mul	r2, r3, r8	@ _29, b02_1.9_28, x2
	add	r3, r7, #440	@ tmp459,,
	sub	r3, r3, #316	@ tmp461, tmp459,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp462,,
	sub	r3, r3, #320	@ tmp464, tmp462,
	str	r2, [r3]	@ _29, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp469,,
	sub	r3, r3, #316	@ tmp471, tmp469,
	ldr	r3, [r3]	@ tmp472, first
	add	r2, r7, #440	@ tmp473,,
	sub	r2, r2, #320	@ tmp475, tmp473,
	ldr	r2, [r2]	@ tmp476, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp472, tmp476
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp466,,
	sub	r3, r3, #324	@ tmp468, tmp466,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp477,,
	sub	r3, r3, #324	@ tmp479, tmp477,
	ldr	r3, [r3]	@ D.7927, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:58:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7927
@ /home/student/ARM_TEST/butterworth_unrolled8.c:59:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.10_30,
	mul	r2, r3, r5	@ _31, a1.10_30, y1
	add	r3, r7, #440	@ tmp480,,
	sub	r3, r3, #304	@ tmp482, tmp480,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp483,,
	sub	r3, r3, #308	@ tmp485, tmp483,
	str	r2, [r3]	@ _31, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp490,,
	sub	r3, r3, #304	@ tmp492, tmp490,
	ldr	r3, [r3]	@ tmp493, first
	add	r2, r7, #440	@ tmp494,,
	sub	r2, r2, #308	@ tmp496, tmp494,
	ldr	r2, [r2]	@ tmp497, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp493, tmp497
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp487,,
	sub	r3, r3, #312	@ tmp489, tmp487,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp498,,
	sub	r3, r3, #312	@ tmp500, tmp498,
	ldr	r3, [r3]	@ D.7921, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:59:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7921
@ /home/student/ARM_TEST/butterworth_unrolled8.c:60:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.11_32,
	movt	r3, 65535	@ a2.11_32,
	mul	r2, r3, r9	@ _33, a2.11_32, y2
	add	r3, r7, #440	@ tmp501,,
	sub	r3, r3, #292	@ tmp503, tmp501,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp504,,
	sub	r3, r3, #296	@ tmp506, tmp504,
	str	r2, [r3]	@ _33, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp511,,
	sub	r3, r3, #292	@ tmp513, tmp511,
	ldr	r3, [r3]	@ tmp514, first
	add	r2, r7, #440	@ tmp515,,
	sub	r2, r2, #296	@ tmp517, tmp515,
	ldr	r2, [r2]	@ tmp518, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp514, tmp518
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp508,,
	sub	r3, r3, #300	@ tmp510, tmp508,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp519,,
	sub	r3, r3, #300	@ tmp521, tmp519,
	ldr	r3, [r3]	@ D.7915, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:60:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7915
@ /home/student/ARM_TEST/butterworth_unrolled8.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp523,
	moveq	r2, #0	@ tmp523,
	uxtb	r2, r2	@ _36, _36
@ /home/student/ARM_TEST/butterworth_unrolled8.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/ARM_TEST/butterworth_unrolled8.c:63:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:64:         x1 = input1;
	mov	r6, r0	@ x1, input1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:65:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:66:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:69:         register int input2 = x[i + 2];
	mov	r3, r10	@ i.12_38, i
	adds	r3, r3, #2	@ _39, i.12_38,
	lsls	r3, r3, #2	@ _40, _39,
	add	r2, r7, #440	@ tmp524,,
	sub	r2, r2, #436	@ tmp526, tmp524,
	ldr	r2, [r2]	@ tmp527, x
	add	r3, r3, r2	@ _41, tmp527
@ /home/student/ARM_TEST/butterworth_unrolled8.c:69:         register int input2 = x[i + 2];
	ldr	r0, [r3]	@ input2, *_41
@ /home/student/ARM_TEST/butterworth_unrolled8.c:70:         y = __QADD(
	movw	r3, #1105	@ b02_1.13_42,
	mul	r1, r3, r0	@ _43, b02_1.13_42, input2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:72:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.14_44,
	lsls	r3, r3, #1	@ _45, b02_1.14_44,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:70:         y = __QADD(
	mul	r2, r3, r6	@ _46, _45, x1
	add	r3, r7, #440	@ tmp528,,
	sub	r3, r3, #280	@ tmp530, tmp528,
	str	r1, [r3]	@ _43, first
	add	r3, r7, #440	@ tmp531,,
	sub	r3, r3, #284	@ tmp533, tmp531,
	str	r2, [r3]	@ _46, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp538,,
	sub	r3, r3, #280	@ tmp540, tmp538,
	ldr	r3, [r3]	@ tmp541, first
	add	r2, r7, #440	@ tmp542,,
	sub	r2, r2, #284	@ tmp544, tmp542,
	ldr	r2, [r2]	@ tmp545, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp541, tmp545
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp535,,
	sub	r3, r3, #288	@ tmp537, tmp535,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp546,,
	sub	r3, r3, #288	@ tmp548, tmp546,
	ldr	r3, [r3]	@ D.7909, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:70:         y = __QADD(
	mov	r4, r3	@ y, D.7909
@ /home/student/ARM_TEST/butterworth_unrolled8.c:74:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.15_47,
	mul	r2, r3, r8	@ _48, b02_1.15_47, x2
	add	r3, r7, #440	@ tmp549,,
	sub	r3, r3, #268	@ tmp551, tmp549,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp552,,
	sub	r3, r3, #272	@ tmp554, tmp552,
	str	r2, [r3]	@ _48, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp559,,
	sub	r3, r3, #268	@ tmp561, tmp559,
	ldr	r3, [r3]	@ tmp562, first
	add	r2, r7, #440	@ tmp563,,
	sub	r2, r2, #272	@ tmp565, tmp563,
	ldr	r2, [r2]	@ tmp566, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp562, tmp566
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp556,,
	sub	r3, r3, #276	@ tmp558, tmp556,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp567,,
	sub	r3, r3, #276	@ tmp569, tmp567,
	ldr	r3, [r3]	@ D.7903, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:74:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7903
@ /home/student/ARM_TEST/butterworth_unrolled8.c:75:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.16_49,
	mul	r2, r3, r5	@ _50, a1.16_49, y1
	add	r3, r7, #440	@ tmp570,,
	sub	r3, r3, #256	@ tmp572, tmp570,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp573,,
	sub	r3, r3, #260	@ tmp575, tmp573,
	str	r2, [r3]	@ _50, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp580,,
	sub	r3, r3, #256	@ tmp582, tmp580,
	ldr	r3, [r3]	@ tmp583, first
	add	r2, r7, #440	@ tmp584,,
	sub	r2, r2, #260	@ tmp586, tmp584,
	ldr	r2, [r2]	@ tmp587, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp583, tmp587
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp577,,
	sub	r3, r3, #264	@ tmp579, tmp577,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp588,,
	sub	r3, r3, #264	@ tmp590, tmp588,
	ldr	r3, [r3]	@ D.7897, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:75:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7897
@ /home/student/ARM_TEST/butterworth_unrolled8.c:76:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.17_51,
	movt	r3, 65535	@ a2.17_51,
	mul	r3, r3, r9	@ _52, a2.17_51, y2
	str	r4, [r7, #196]	@ y, first
	str	r3, [r7, #192]	@ _52, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #196]	@ tmp592, first
	ldr	r2, [r7, #192]	@ tmp593, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp592, tmp593
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #188]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #188]	@ D.7891, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:76:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7891
@ /home/student/ARM_TEST/butterworth_unrolled8.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp595,
	moveq	r2, #0	@ tmp595,
	uxtb	r2, r2	@ _55, _55
@ /home/student/ARM_TEST/butterworth_unrolled8.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/ARM_TEST/butterworth_unrolled8.c:79:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:80:         x1 = input2;
	mov	r6, r0	@ x1, input2
@ /home/student/ARM_TEST/butterworth_unrolled8.c:81:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:82:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:85:         register int input3 = x[i + 3];
	mov	r3, r10	@ i.18_57, i
	adds	r3, r3, #3	@ _58, i.18_57,
	lsls	r3, r3, #2	@ _59, _58,
	add	r2, r7, #440	@ tmp596,,
	sub	r2, r2, #436	@ tmp598, tmp596,
	ldr	r2, [r2]	@ tmp599, x
	add	r3, r3, r2	@ _60, tmp599
@ /home/student/ARM_TEST/butterworth_unrolled8.c:85:         register int input3 = x[i + 3];
	ldr	r1, [r3]	@ input3, *_60
@ /home/student/ARM_TEST/butterworth_unrolled8.c:86:         y = __QADD(
	movw	r3, #1105	@ b02_1.19_61,
	mul	r2, r3, r1	@ _62, b02_1.19_61, input3
@ /home/student/ARM_TEST/butterworth_unrolled8.c:88:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.20_63,
	lsls	r3, r3, #1	@ _64, b02_1.20_63,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:86:         y = __QADD(
	mul	r3, r6, r3	@ _65, x1, _64
	str	r2, [r7, #208]	@ _62, first
	str	r3, [r7, #204]	@ _65, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #208]	@ tmp601, first
	ldr	r2, [r7, #204]	@ tmp602, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp601, tmp602
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #200]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #200]	@ D.7885, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:86:         y = __QADD(
	mov	r4, r3	@ y, D.7885
@ /home/student/ARM_TEST/butterworth_unrolled8.c:90:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.21_66,
	mul	r3, r3, r8	@ _67, b02_1.21_66, x2
	str	r4, [r7, #220]	@ y, first
	str	r3, [r7, #216]	@ _67, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #220]	@ tmp604, first
	ldr	r2, [r7, #216]	@ tmp605, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp604, tmp605
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #212]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #212]	@ D.7879, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:90:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7879
@ /home/student/ARM_TEST/butterworth_unrolled8.c:91:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.22_68,
	mul	r3, r5, r3	@ _69, y1, a1.22_68
	str	r4, [r7, #232]	@ y, first
	str	r3, [r7, #228]	@ _69, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #232]	@ tmp607, first
	ldr	r2, [r7, #228]	@ tmp608, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp607, tmp608
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #224]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #224]	@ D.7873, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:91:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7873
@ /home/student/ARM_TEST/butterworth_unrolled8.c:92:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.23_70,
	movt	r3, 65535	@ a2.23_70,
	mul	r3, r3, r9	@ _71, a2.23_70, y2
	str	r4, [r7, #244]	@ y, first
	str	r3, [r7, #240]	@ _71, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #244]	@ tmp610, first
	ldr	r2, [r7, #240]	@ tmp611, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp610, tmp611
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #236]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #236]	@ D.7867, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:92:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7867
@ /home/student/ARM_TEST/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _72, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _73, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _73,
	ite	ne
	movne	r2, #1	@ tmp613,
	moveq	r2, #0	@ tmp613,
	uxtb	r2, r2	@ _74, _74
@ /home/student/ARM_TEST/butterworth_unrolled8.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _72, _75
@ /home/student/ARM_TEST/butterworth_unrolled8.c:95:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:96:         x1 = input3;
	mov	r6, r1	@ x1, input3
@ /home/student/ARM_TEST/butterworth_unrolled8.c:97:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:98:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:101:         register int input4 = x[i + 4];
	mov	r3, r10	@ i.24_76, i
	adds	r3, r3, #4	@ _77, i.24_76,
	lsls	r3, r3, #2	@ _78, _77,
	add	r2, r7, #440	@ tmp614,,
	sub	r2, r2, #436	@ tmp616, tmp614,
	ldr	r2, [r2]	@ tmp617, x
	add	r3, r3, r2	@ _79, tmp617
@ /home/student/ARM_TEST/butterworth_unrolled8.c:101:         register int input4 = x[i + 4];
	ldr	r1, [r3]	@ input4, *_79
@ /home/student/ARM_TEST/butterworth_unrolled8.c:102:         y = __QADD(
	movw	r3, #1105	@ b02_1.25_80,
	mul	r2, r3, r1	@ _81, b02_1.25_80, input4
@ /home/student/ARM_TEST/butterworth_unrolled8.c:104:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.26_82,
	lsls	r3, r3, #1	@ _83, b02_1.26_82,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:102:         y = __QADD(
	mul	r3, r6, r3	@ _84, x1, _83
	str	r2, [r7, #256]	@ _81, first
	str	r3, [r7, #252]	@ _84, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #256]	@ tmp619, first
	ldr	r2, [r7, #252]	@ tmp620, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp619, tmp620
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #248]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #248]	@ D.7861, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:102:         y = __QADD(
	mov	r4, r3	@ y, D.7861
@ /home/student/ARM_TEST/butterworth_unrolled8.c:106:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.27_85,
	mul	r3, r3, r8	@ _86, b02_1.27_85, x2
	str	r4, [r7, #268]	@ y, first
	str	r3, [r7, #264]	@ _86, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #268]	@ tmp622, first
	ldr	r2, [r7, #264]	@ tmp623, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp622, tmp623
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #260]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #260]	@ D.7855, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:106:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7855
@ /home/student/ARM_TEST/butterworth_unrolled8.c:107:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.28_87,
	mul	r3, r5, r3	@ _88, y1, a1.28_87
	str	r4, [r7, #280]	@ y, first
	str	r3, [r7, #276]	@ _88, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #280]	@ tmp625, first
	ldr	r2, [r7, #276]	@ tmp626, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp625, tmp626
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #272]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #272]	@ D.7849, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:107:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7849
@ /home/student/ARM_TEST/butterworth_unrolled8.c:108:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.29_89,
	movt	r3, 65535	@ a2.29_89,
	mul	r3, r3, r9	@ _90, a2.29_89, y2
	str	r4, [r7, #292]	@ y, first
	str	r3, [r7, #288]	@ _90, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #292]	@ tmp628, first
	ldr	r2, [r7, #288]	@ tmp629, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp628, tmp629
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #284]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #284]	@ D.7843, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:108:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7843
@ /home/student/ARM_TEST/butterworth_unrolled8.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _91, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _92, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _92,
	ite	ne
	movne	r2, #1	@ tmp631,
	moveq	r2, #0	@ tmp631,
	uxtb	r2, r2	@ _93, _93
@ /home/student/ARM_TEST/butterworth_unrolled8.c:109:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _91, _94
@ /home/student/ARM_TEST/butterworth_unrolled8.c:111:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:112:         x1 = input4;
	mov	r6, r1	@ x1, input4
@ /home/student/ARM_TEST/butterworth_unrolled8.c:113:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:114:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:117:         register int input5 = x[i + 5];
	mov	r3, r10	@ i.30_95, i
	adds	r3, r3, #5	@ _96, i.30_95,
	lsls	r3, r3, #2	@ _97, _96,
	add	r2, r7, #440	@ tmp632,,
	sub	r2, r2, #436	@ tmp634, tmp632,
	ldr	r2, [r2]	@ tmp635, x
	add	r3, r3, r2	@ _98, tmp635
@ /home/student/ARM_TEST/butterworth_unrolled8.c:117:         register int input5 = x[i + 5];
	ldr	r1, [r3]	@ input5, *_98
@ /home/student/ARM_TEST/butterworth_unrolled8.c:118:         y = __QADD(
	movw	r3, #1105	@ b02_1.31_99,
	mul	r2, r3, r1	@ _100, b02_1.31_99, input5
@ /home/student/ARM_TEST/butterworth_unrolled8.c:120:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.32_101,
	lsls	r3, r3, #1	@ _102, b02_1.32_101,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:118:         y = __QADD(
	mul	r3, r6, r3	@ _103, x1, _102
	str	r2, [r7, #304]	@ _100, first
	str	r3, [r7, #300]	@ _103, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #304]	@ tmp637, first
	ldr	r2, [r7, #300]	@ tmp638, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp637, tmp638
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #296]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #296]	@ D.7837, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:118:         y = __QADD(
	mov	r4, r3	@ y, D.7837
@ /home/student/ARM_TEST/butterworth_unrolled8.c:122:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.33_104,
	mul	r3, r3, r8	@ _105, b02_1.33_104, x2
	str	r4, [r7, #316]	@ y, first
	str	r3, [r7, #312]	@ _105, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #316]	@ tmp640, first
	ldr	r2, [r7, #312]	@ tmp641, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp640, tmp641
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #308]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #308]	@ D.7831, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:122:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7831
@ /home/student/ARM_TEST/butterworth_unrolled8.c:123:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.34_106,
	mul	r3, r5, r3	@ _107, y1, a1.34_106
	str	r4, [r7, #328]	@ y, first
	str	r3, [r7, #324]	@ _107, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #328]	@ tmp643, first
	ldr	r2, [r7, #324]	@ tmp644, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp643, tmp644
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #320]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #320]	@ D.7825, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:123:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7825
@ /home/student/ARM_TEST/butterworth_unrolled8.c:124:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.35_108,
	movt	r3, 65535	@ a2.35_108,
	mul	r3, r3, r9	@ _109, a2.35_108, y2
	str	r4, [r7, #340]	@ y, first
	str	r3, [r7, #336]	@ _109, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #340]	@ tmp646, first
	ldr	r2, [r7, #336]	@ tmp647, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp646, tmp647
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #332]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #332]	@ D.7819, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:124:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7819
@ /home/student/ARM_TEST/butterworth_unrolled8.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _110, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _111, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _111,
	ite	ne
	movne	r2, #1	@ tmp649,
	moveq	r2, #0	@ tmp649,
	uxtb	r2, r2	@ _112, _112
@ /home/student/ARM_TEST/butterworth_unrolled8.c:125:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _110, _113
@ /home/student/ARM_TEST/butterworth_unrolled8.c:127:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:128:         x1 = input5;
	mov	r6, r1	@ x1, input5
@ /home/student/ARM_TEST/butterworth_unrolled8.c:129:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:130:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:133:         register int input6 = x[i + 6];
	mov	r3, r10	@ i.36_114, i
	adds	r3, r3, #6	@ _115, i.36_114,
	lsls	r3, r3, #2	@ _116, _115,
	add	r2, r7, #440	@ tmp650,,
	sub	r2, r2, #436	@ tmp652, tmp650,
	ldr	r2, [r2]	@ tmp653, x
	add	r3, r3, r2	@ _117, tmp653
@ /home/student/ARM_TEST/butterworth_unrolled8.c:133:         register int input6 = x[i + 6];
	ldr	r1, [r3]	@ input6, *_117
@ /home/student/ARM_TEST/butterworth_unrolled8.c:134:         y = __QADD(
	movw	r3, #1105	@ b02_1.37_118,
	mul	r2, r3, r1	@ _119, b02_1.37_118, input6
@ /home/student/ARM_TEST/butterworth_unrolled8.c:136:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.38_120,
	lsls	r3, r3, #1	@ _121, b02_1.38_120,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:134:         y = __QADD(
	mul	r3, r6, r3	@ _122, x1, _121
	str	r2, [r7, #352]	@ _119, first
	str	r3, [r7, #348]	@ _122, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #352]	@ tmp655, first
	ldr	r2, [r7, #348]	@ tmp656, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp655, tmp656
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #344]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #344]	@ D.7813, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:134:         y = __QADD(
	mov	r4, r3	@ y, D.7813
@ /home/student/ARM_TEST/butterworth_unrolled8.c:138:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.39_123,
	mul	r3, r3, r8	@ _124, b02_1.39_123, x2
	str	r4, [r7, #364]	@ y, first
	str	r3, [r7, #360]	@ _124, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #364]	@ tmp658, first
	ldr	r2, [r7, #360]	@ tmp659, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp658, tmp659
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #356]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #356]	@ D.7807, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:138:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7807
@ /home/student/ARM_TEST/butterworth_unrolled8.c:139:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.40_125,
	mul	r3, r5, r3	@ _126, y1, a1.40_125
	str	r4, [r7, #376]	@ y, first
	str	r3, [r7, #372]	@ _126, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #376]	@ tmp661, first
	ldr	r2, [r7, #372]	@ tmp662, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp661, tmp662
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #368]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #368]	@ D.7801, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:139:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7801
@ /home/student/ARM_TEST/butterworth_unrolled8.c:140:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.41_127,
	movt	r3, 65535	@ a2.41_127,
	mul	r3, r3, r9	@ _128, a2.41_127, y2
	str	r4, [r7, #388]	@ y, first
	str	r3, [r7, #384]	@ _128, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #388]	@ tmp664, first
	ldr	r2, [r7, #384]	@ tmp665, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp664, tmp665
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #380]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #380]	@ D.7795, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:140:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7795
@ /home/student/ARM_TEST/butterworth_unrolled8.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _129, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _130, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _130,
	ite	ne
	movne	r2, #1	@ tmp667,
	moveq	r2, #0	@ tmp667,
	uxtb	r2, r2	@ _131, _131
@ /home/student/ARM_TEST/butterworth_unrolled8.c:141:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _129, _132
@ /home/student/ARM_TEST/butterworth_unrolled8.c:143:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:144:         x1 = input6;
	mov	r6, r1	@ x1, input6
@ /home/student/ARM_TEST/butterworth_unrolled8.c:145:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:146:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:149:         register int input7 = x[i + 7];
	mov	r3, r10	@ i.42_133, i
	adds	r3, r3, #7	@ _134, i.42_133,
	lsls	r3, r3, #2	@ _135, _134,
	add	r2, r7, #440	@ tmp668,,
	sub	r2, r2, #436	@ tmp670, tmp668,
	ldr	r2, [r2]	@ tmp671, x
	add	r3, r3, r2	@ _136, tmp671
@ /home/student/ARM_TEST/butterworth_unrolled8.c:149:         register int input7 = x[i + 7];
	ldr	r1, [r3]	@ input7, *_136
@ /home/student/ARM_TEST/butterworth_unrolled8.c:150:         y = __QADD(
	movw	r3, #1105	@ b02_1.43_137,
	mul	r2, r3, r1	@ _138, b02_1.43_137, input7
@ /home/student/ARM_TEST/butterworth_unrolled8.c:152:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.44_139,
	lsls	r3, r3, #1	@ _140, b02_1.44_139,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:150:         y = __QADD(
	mul	r3, r6, r3	@ _141, x1, _140
	str	r2, [r7, #400]	@ _138, first
	str	r3, [r7, #396]	@ _141, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #400]	@ tmp673, first
	ldr	r2, [r7, #396]	@ tmp674, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp673, tmp674
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #392]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #392]	@ D.7789, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:150:         y = __QADD(
	mov	r4, r3	@ y, D.7789
@ /home/student/ARM_TEST/butterworth_unrolled8.c:154:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.45_142,
	mul	r3, r3, r8	@ _143, b02_1.45_142, x2
	str	r4, [r7, #412]	@ y, first
	str	r3, [r7, #408]	@ _143, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #412]	@ tmp676, first
	ldr	r2, [r7, #408]	@ tmp677, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp676, tmp677
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #404]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #404]	@ D.7783, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:154:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7783
@ /home/student/ARM_TEST/butterworth_unrolled8.c:155:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.46_144,
	mul	r3, r5, r3	@ _145, y1, a1.46_144
	str	r4, [r7, #424]	@ y, first
	str	r3, [r7, #420]	@ _145, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #424]	@ tmp679, first
	ldr	r2, [r7, #420]	@ tmp680, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp679, tmp680
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #416]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #416]	@ D.7777, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:155:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7777
@ /home/student/ARM_TEST/butterworth_unrolled8.c:156:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.47_146,
	movt	r3, 65535	@ a2.47_146,
	mul	r3, r3, r9	@ _147, a2.47_146, y2
	str	r4, [r7, #436]	@ y, first
	str	r3, [r7, #432]	@ _147, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #436]	@ tmp682, first
	ldr	r2, [r7, #432]	@ tmp683, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp682, tmp683
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #428]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #428]	@ D.7771, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:156:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7771
@ /home/student/ARM_TEST/butterworth_unrolled8.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _148, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _149, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _149,
	ite	ne
	movne	r2, #1	@ tmp685,
	moveq	r2, #0	@ tmp685,
	uxtb	r2, r2	@ _150, _150
@ /home/student/ARM_TEST/butterworth_unrolled8.c:157:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _148, _151
@ /home/student/ARM_TEST/butterworth_unrolled8.c:159:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:160:         x1 = input7;
	mov	r6, r1	@ x1, input7
@ /home/student/ARM_TEST/butterworth_unrolled8.c:161:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:162:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:35:     for (i = 0; i + 7 < sample_count; i += 8) {
	add	r10, r10, #8	@ i, i,
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:35:     for (i = 0; i + 7 < sample_count; i += 8) {
	add	r3, r10, #7	@ _152, i,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:35:     for (i = 0; i + 7 < sample_count; i += 8) {
	add	r2, r7, #440	@ tmp686,,
	sub	r2, r2, #440	@ tmp688, tmp686,
	ldr	r2, [r2]	@ tmp689, sample_count
	cmp	r2, r3	@ tmp689, _152
	bgt	.L37		@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:166:     for (; i < sample_count; i++) {
	b	.L38		@
.L43:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:167:         register int current_input = x[i];
	mov	r3, r10	@ i.48_153, i
	lsls	r3, r3, #2	@ _154, i.48_153,
	add	r2, r7, #440	@ tmp690,,
	sub	r2, r2, #436	@ tmp692, tmp690,
	ldr	r2, [r2]	@ tmp693, x
	add	r3, r3, r2	@ _155, tmp693
@ /home/student/ARM_TEST/butterworth_unrolled8.c:167:         register int current_input = x[i];
	ldr	r0, [r3]	@ current_input, *_155
@ /home/student/ARM_TEST/butterworth_unrolled8.c:168:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.49_156,
	mul	r1, r3, r0	@ _157, b02_1.49_156, current_input
@ /home/student/ARM_TEST/butterworth_unrolled8.c:170:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.50_158,
	lsls	r3, r3, #1	@ _159, b02_1.50_158,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:168:         register int y = __QADD(
	mul	r2, r3, r6	@ _160, _159, x1
	add	r3, r7, #440	@ tmp694,,
	sub	r3, r3, #424	@ tmp696, tmp694,
	str	r1, [r3]	@ _157, first
	add	r3, r7, #440	@ tmp697,,
	sub	r3, r3, #428	@ tmp699, tmp697,
	str	r2, [r3]	@ _160, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp704,,
	sub	r3, r3, #424	@ tmp706, tmp704,
	ldr	r3, [r3]	@ tmp707, first
	add	r2, r7, #440	@ tmp708,,
	sub	r2, r2, #428	@ tmp710, tmp708,
	ldr	r2, [r2]	@ tmp711, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp707, tmp711
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp701,,
	sub	r3, r3, #432	@ tmp703, tmp701,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp712,,
	sub	r3, r3, #432	@ tmp714, tmp712,
	ldr	r3, [r3]	@ D.7981, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:168:         register int y = __QADD(
	mov	r4, r3	@ y, D.7981
@ /home/student/ARM_TEST/butterworth_unrolled8.c:172:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.51_161,
	mul	r2, r3, r8	@ _162, b02_1.51_161, x2
	add	r3, r7, #440	@ tmp715,,
	sub	r3, r3, #412	@ tmp717, tmp715,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp718,,
	sub	r3, r3, #416	@ tmp720, tmp718,
	str	r2, [r3]	@ _162, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp725,,
	sub	r3, r3, #412	@ tmp727, tmp725,
	ldr	r3, [r3]	@ tmp728, first
	add	r2, r7, #440	@ tmp729,,
	sub	r2, r2, #416	@ tmp731, tmp729,
	ldr	r2, [r2]	@ tmp732, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp728, tmp732
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp722,,
	sub	r3, r3, #420	@ tmp724, tmp722,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp733,,
	sub	r3, r3, #420	@ tmp735, tmp733,
	ldr	r3, [r3]	@ D.7975, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:172:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7975
@ /home/student/ARM_TEST/butterworth_unrolled8.c:173:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.52_163,
	mul	r2, r3, r5	@ _164, a1.52_163, y1
	add	r3, r7, #440	@ tmp736,,
	sub	r3, r3, #400	@ tmp738, tmp736,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp739,,
	sub	r3, r3, #404	@ tmp741, tmp739,
	str	r2, [r3]	@ _164, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp746,,
	sub	r3, r3, #400	@ tmp748, tmp746,
	ldr	r3, [r3]	@ tmp749, first
	add	r2, r7, #440	@ tmp750,,
	sub	r2, r2, #404	@ tmp752, tmp750,
	ldr	r2, [r2]	@ tmp753, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp749, tmp753
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp743,,
	sub	r3, r3, #408	@ tmp745, tmp743,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp754,,
	sub	r3, r3, #408	@ tmp756, tmp754,
	ldr	r3, [r3]	@ D.7969, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:173:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7969
@ /home/student/ARM_TEST/butterworth_unrolled8.c:174:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.53_165,
	movt	r3, 65535	@ a2.53_165,
	mul	r2, r3, r9	@ _166, a2.53_165, y2
	add	r3, r7, #440	@ tmp757,,
	sub	r3, r3, #388	@ tmp759, tmp757,
	str	r4, [r3]	@ y, first
	add	r3, r7, #440	@ tmp760,,
	sub	r3, r3, #392	@ tmp762, tmp760,
	str	r2, [r3]	@ _166, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	add	r3, r7, #440	@ tmp767,,
	sub	r3, r3, #388	@ tmp769, tmp767,
	ldr	r3, [r3]	@ tmp770, first
	add	r2, r7, #440	@ tmp771,,
	sub	r2, r2, #392	@ tmp773, tmp771,
	ldr	r2, [r2]	@ tmp774, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r2, r3, r2	@ result, tmp770, tmp774
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r7, #440	@ tmp764,,
	sub	r3, r3, #396	@ tmp766, tmp764,
	str	r2, [r3]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	add	r3, r7, #440	@ tmp775,,
	sub	r3, r3, #396	@ tmp777, tmp775,
	ldr	r3, [r3]	@ D.7963, result
@ /home/student/ARM_TEST/butterworth_unrolled8.c:174:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7963
@ /home/student/ARM_TEST/butterworth_unrolled8.c:175:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _167, y,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:175:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _168, y,,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:175:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _168,
	ite	ne
	movne	r2, #1	@ tmp779,
	moveq	r2, #0	@ tmp779,
	uxtb	r2, r2	@ _169, _169
@ /home/student/ARM_TEST/butterworth_unrolled8.c:175:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _167, _170
@ /home/student/ARM_TEST/butterworth_unrolled8.c:177:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:178:         x1 = current_input;
	mov	r6, r0	@ x1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled8.c:179:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:180:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:166:     for (; i < sample_count; i++) {
	add	r10, r10, #1	@ i, i,
.L38:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:166:     for (; i < sample_count; i++) {
	add	r3, r7, #440	@ tmp780,,
	sub	r3, r3, #440	@ tmp782, tmp780,
	ldr	r3, [r3]	@ tmp783, sample_count
	cmp	r10, r3	@ i, tmp783
	blt	.L43		@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:183:     return y1;
	mov	r3, r5	@ _191, y1
@ /home/student/ARM_TEST/butterworth_unrolled8.c:184: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #444	@,,
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
@ /home/student/ARM_TEST/butterworth_unrolled8.c:190:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/ARM_TEST/butterworth_unrolled8.c:190:     for (int n = 0; n < N; n++) {
	b	.L46		@
.L47:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:191:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/ARM_TEST/butterworth_unrolled8.c:191:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L52	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/ARM_TEST/butterworth_unrolled8.c:192:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L52+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:192:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L52+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L52+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/ARM_TEST/butterworth_unrolled8.c:196:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:190:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L46:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:190:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L47		@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:202:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:202:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L48		@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:203:         perror("Unable to start benchmark timer");
	ldr	r3, .L52+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:204:         return 1;
	movs	r3, #1	@ _17,
	b	.L51		@
.L48:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:207:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:207:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/ARM_TEST/butterworth_unrolled8.c:209:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:209:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L50		@,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:210:         perror("Unable to stop benchmark timer");
	ldr	r3, .L52+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:211:         return 1;
	movs	r3, #1	@ _17,
	b	.L51		@
.L50:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:214:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/ARM_TEST/butterworth_unrolled8.c:215:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/ARM_TEST/butterworth_unrolled8.c:215:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L52+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/ARM_TEST/butterworth_unrolled8.c:216:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L52+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/ARM_TEST/butterworth_unrolled8.c:225:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled8.c:225:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	vldr.64	d18, .L52+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/ARM_TEST/butterworth_unrolled8.c:226:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.54_13, y
	vmov	s15, r3	@ int	@ y.54_13, y.54_13
	vcvt.f64.s32	d18, s15	@ _14, y.54_13
@ /home/student/ARM_TEST/butterworth_unrolled8.c:218:     printf(
	vldr.64	d19, .L52+24	@ tmp175,
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
	ldr	r0, .L52+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled8.c:229:     return 0;
	movs	r3, #0	@ _17,
.L51:
@ /home/student/ARM_TEST/butterworth_unrolled8.c:230: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L53:
	.align	3
.L52:
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
