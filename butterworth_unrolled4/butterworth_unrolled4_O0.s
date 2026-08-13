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
	.file	"butterworth_unrolled4.c"
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
@ /home/student/ARM_TEST/butterworth_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/ARM_TEST/butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/ARM_TEST/butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/ARM_TEST/butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/ARM_TEST/butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:25: }
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
	@ args = 0, pretend = 0, frame = 248
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}	@
	sub	sp, sp, #252	@,,
	add	r7, sp, #0	@,,
	str	r0, [r7, #4]	@ x, x
	str	r1, [r7]	@ sample_count, sample_count
@ /home/student/ARM_TEST/butterworth_unrolled4.c:29:     register int x1 = 0;
	movs	r6, #0	@ x1,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:30:     register int x2 = 0;
	mov	r9, #0	@ x2,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:31:     register int y1 = 0;
	movs	r5, #0	@ y1,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:32:     register int y2 = 0;
	mov	r10, #0	@ y2,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:35:     for (i = 0; i + 3 < sample_count; i += 4) {
	mov	r8, #0	@ i,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:35:     for (i = 0; i + 3 < sample_count; i += 4) {
	b	.L4		@
.L21:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:37:         register int input0 = x[i];
	mov	r3, r8	@ i.0_1, i
	lsls	r3, r3, #2	@ _2, i.0_1,
	ldr	r2, [r7, #4]	@ tmp242, x
	add	r3, r3, r2	@ _3, tmp242
@ /home/student/ARM_TEST/butterworth_unrolled4.c:37:         register int input0 = x[i];
	ldr	r1, [r3]	@ input0, *_3
@ /home/student/ARM_TEST/butterworth_unrolled4.c:38:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.1_4,
	mul	r2, r3, r1	@ _5, b02_1.1_4, input0
@ /home/student/ARM_TEST/butterworth_unrolled4.c:40:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.2_6,
	lsls	r3, r3, #1	@ _7, b02_1.2_6,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:38:         register int y = __QADD(
	mul	r3, r6, r3	@ _8, x1, _7
	str	r2, [r7, #64]	@ _5, first
	str	r3, [r7, #60]	@ _8, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #64]	@ tmp244, first
	ldr	r2, [r7, #60]	@ tmp245, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp244, tmp245
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #56]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #56]	@ D.7857, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:38:         register int y = __QADD(
	mov	r4, r3	@ y, D.7857
@ /home/student/ARM_TEST/butterworth_unrolled4.c:42:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.3_9,
	mul	r3, r3, r9	@ _10, b02_1.3_9, x2
	str	r4, [r7, #76]	@ y, first
	str	r3, [r7, #72]	@ _10, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #76]	@ tmp247, first
	ldr	r2, [r7, #72]	@ tmp248, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp247, tmp248
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #68]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #68]	@ D.7851, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:42:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7851
@ /home/student/ARM_TEST/butterworth_unrolled4.c:43:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.4_11,
	mul	r3, r5, r3	@ _12, y1, a1.4_11
	str	r4, [r7, #88]	@ y, first
	str	r3, [r7, #84]	@ _12, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #88]	@ tmp250, first
	ldr	r2, [r7, #84]	@ tmp251, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp250, tmp251
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #80]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #80]	@ D.7845, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:43:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7845
@ /home/student/ARM_TEST/butterworth_unrolled4.c:44:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.5_13,
	movt	r3, 65535	@ a2.5_13,
	mul	r3, r3, r10	@ _14, a2.5_13, y2
	str	r4, [r7, #100]	@ y, first
	str	r3, [r7, #96]	@ _14, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #100]	@ tmp253, first
	ldr	r2, [r7, #96]	@ tmp254, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp253, tmp254
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #92]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #92]	@ D.7839, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:44:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7839
@ /home/student/ARM_TEST/butterworth_unrolled4.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp256,
	moveq	r2, #0	@ tmp256,
	uxtb	r2, r2	@ _17, _17
@ /home/student/ARM_TEST/butterworth_unrolled4.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/ARM_TEST/butterworth_unrolled4.c:47:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:48:         x1 = input0;
	mov	r6, r1	@ x1, input0
@ /home/student/ARM_TEST/butterworth_unrolled4.c:49:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:50:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled4.c:53:         register int input1 = x[i + 1];
	mov	r3, r8	@ i.6_19, i
	adds	r3, r3, #1	@ _20, i.6_19,
	lsls	r3, r3, #2	@ _21, _20,
	ldr	r2, [r7, #4]	@ tmp257, x
	add	r3, r3, r2	@ _22, tmp257
@ /home/student/ARM_TEST/butterworth_unrolled4.c:53:         register int input1 = x[i + 1];
	ldr	r1, [r3]	@ input1, *_22
@ /home/student/ARM_TEST/butterworth_unrolled4.c:54:         y = __QADD(
	movw	r3, #1105	@ b02_1.7_23,
	mul	r2, r3, r1	@ _24, b02_1.7_23, input1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:56:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.8_25,
	lsls	r3, r3, #1	@ _26, b02_1.8_25,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:54:         y = __QADD(
	mul	r3, r6, r3	@ _27, x1, _26
	str	r2, [r7, #112]	@ _24, first
	str	r3, [r7, #108]	@ _27, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #112]	@ tmp259, first
	ldr	r2, [r7, #108]	@ tmp260, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp259, tmp260
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #104]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #104]	@ D.7833, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:54:         y = __QADD(
	mov	r4, r3	@ y, D.7833
@ /home/student/ARM_TEST/butterworth_unrolled4.c:58:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.9_28,
	mul	r3, r3, r9	@ _29, b02_1.9_28, x2
	str	r4, [r7, #124]	@ y, first
	str	r3, [r7, #120]	@ _29, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #124]	@ tmp262, first
	ldr	r2, [r7, #120]	@ tmp263, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp262, tmp263
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #116]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #116]	@ D.7827, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:58:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7827
@ /home/student/ARM_TEST/butterworth_unrolled4.c:59:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.10_30,
	mul	r3, r5, r3	@ _31, y1, a1.10_30
	str	r4, [r7, #136]	@ y, first
	str	r3, [r7, #132]	@ _31, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #136]	@ tmp265, first
	ldr	r2, [r7, #132]	@ tmp266, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp265, tmp266
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #128]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #128]	@ D.7821, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:59:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7821
@ /home/student/ARM_TEST/butterworth_unrolled4.c:60:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.11_32,
	movt	r3, 65535	@ a2.11_32,
	mul	r3, r3, r10	@ _33, a2.11_32, y2
	str	r4, [r7, #148]	@ y, first
	str	r3, [r7, #144]	@ _33, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #148]	@ tmp268, first
	ldr	r2, [r7, #144]	@ tmp269, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp268, tmp269
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #140]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #140]	@ D.7815, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:60:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7815
@ /home/student/ARM_TEST/butterworth_unrolled4.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp271,
	moveq	r2, #0	@ tmp271,
	uxtb	r2, r2	@ _36, _36
@ /home/student/ARM_TEST/butterworth_unrolled4.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/ARM_TEST/butterworth_unrolled4.c:63:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:64:         x1 = input1;
	mov	r6, r1	@ x1, input1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:65:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:66:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled4.c:69:         register int input2 = x[i + 2];
	mov	r3, r8	@ i.12_38, i
	adds	r3, r3, #2	@ _39, i.12_38,
	lsls	r3, r3, #2	@ _40, _39,
	ldr	r2, [r7, #4]	@ tmp272, x
	add	r3, r3, r2	@ _41, tmp272
@ /home/student/ARM_TEST/butterworth_unrolled4.c:69:         register int input2 = x[i + 2];
	ldr	r1, [r3]	@ input2, *_41
@ /home/student/ARM_TEST/butterworth_unrolled4.c:70:         y = __QADD(
	movw	r3, #1105	@ b02_1.13_42,
	mul	r2, r3, r1	@ _43, b02_1.13_42, input2
@ /home/student/ARM_TEST/butterworth_unrolled4.c:72:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.14_44,
	lsls	r3, r3, #1	@ _45, b02_1.14_44,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:70:         y = __QADD(
	mul	r3, r6, r3	@ _46, x1, _45
	str	r2, [r7, #160]	@ _43, first
	str	r3, [r7, #156]	@ _46, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #160]	@ tmp274, first
	ldr	r2, [r7, #156]	@ tmp275, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp274, tmp275
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #152]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #152]	@ D.7809, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:70:         y = __QADD(
	mov	r4, r3	@ y, D.7809
@ /home/student/ARM_TEST/butterworth_unrolled4.c:74:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.15_47,
	mul	r3, r3, r9	@ _48, b02_1.15_47, x2
	str	r4, [r7, #172]	@ y, first
	str	r3, [r7, #168]	@ _48, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #172]	@ tmp277, first
	ldr	r2, [r7, #168]	@ tmp278, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp277, tmp278
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #164]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #164]	@ D.7803, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:74:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7803
@ /home/student/ARM_TEST/butterworth_unrolled4.c:75:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.16_49,
	mul	r3, r5, r3	@ _50, y1, a1.16_49
	str	r4, [r7, #184]	@ y, first
	str	r3, [r7, #180]	@ _50, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #184]	@ tmp280, first
	ldr	r2, [r7, #180]	@ tmp281, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp280, tmp281
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #176]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #176]	@ D.7797, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:75:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7797
@ /home/student/ARM_TEST/butterworth_unrolled4.c:76:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.17_51,
	movt	r3, 65535	@ a2.17_51,
	mul	r3, r3, r10	@ _52, a2.17_51, y2
	str	r4, [r7, #196]	@ y, first
	str	r3, [r7, #192]	@ _52, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #196]	@ tmp283, first
	ldr	r2, [r7, #192]	@ tmp284, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp283, tmp284
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #188]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #188]	@ D.7791, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:76:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7791
@ /home/student/ARM_TEST/butterworth_unrolled4.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp286,
	moveq	r2, #0	@ tmp286,
	uxtb	r2, r2	@ _55, _55
@ /home/student/ARM_TEST/butterworth_unrolled4.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/ARM_TEST/butterworth_unrolled4.c:79:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:80:         x1 = input2;
	mov	r6, r1	@ x1, input2
@ /home/student/ARM_TEST/butterworth_unrolled4.c:81:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:82:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled4.c:85:         register int input3 = x[i + 3];
	mov	r3, r8	@ i.18_57, i
	adds	r3, r3, #3	@ _58, i.18_57,
	lsls	r3, r3, #2	@ _59, _58,
	ldr	r2, [r7, #4]	@ tmp287, x
	add	r3, r3, r2	@ _60, tmp287
@ /home/student/ARM_TEST/butterworth_unrolled4.c:85:         register int input3 = x[i + 3];
	ldr	r1, [r3]	@ input3, *_60
@ /home/student/ARM_TEST/butterworth_unrolled4.c:86:         y = __QADD(
	movw	r3, #1105	@ b02_1.19_61,
	mul	r2, r3, r1	@ _62, b02_1.19_61, input3
@ /home/student/ARM_TEST/butterworth_unrolled4.c:88:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.20_63,
	lsls	r3, r3, #1	@ _64, b02_1.20_63,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:86:         y = __QADD(
	mul	r3, r6, r3	@ _65, x1, _64
	str	r2, [r7, #208]	@ _62, first
	str	r3, [r7, #204]	@ _65, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #208]	@ tmp289, first
	ldr	r2, [r7, #204]	@ tmp290, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp289, tmp290
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #200]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #200]	@ D.7785, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:86:         y = __QADD(
	mov	r4, r3	@ y, D.7785
@ /home/student/ARM_TEST/butterworth_unrolled4.c:90:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.21_66,
	mul	r3, r3, r9	@ _67, b02_1.21_66, x2
	str	r4, [r7, #220]	@ y, first
	str	r3, [r7, #216]	@ _67, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #220]	@ tmp292, first
	ldr	r2, [r7, #216]	@ tmp293, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp292, tmp293
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #212]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #212]	@ D.7779, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:90:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7779
@ /home/student/ARM_TEST/butterworth_unrolled4.c:91:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.22_68,
	mul	r3, r5, r3	@ _69, y1, a1.22_68
	str	r4, [r7, #232]	@ y, first
	str	r3, [r7, #228]	@ _69, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #232]	@ tmp295, first
	ldr	r2, [r7, #228]	@ tmp296, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp295, tmp296
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #224]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #224]	@ D.7773, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:91:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7773
@ /home/student/ARM_TEST/butterworth_unrolled4.c:92:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.23_70,
	movt	r3, 65535	@ a2.23_70,
	mul	r3, r3, r10	@ _71, a2.23_70, y2
	str	r4, [r7, #244]	@ y, first
	str	r3, [r7, #240]	@ _71, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #244]	@ tmp298, first
	ldr	r2, [r7, #240]	@ tmp299, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp298, tmp299
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #236]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #236]	@ D.7767, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:92:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7767
@ /home/student/ARM_TEST/butterworth_unrolled4.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _72, y,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _73, y,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _73,
	ite	ne
	movne	r2, #1	@ tmp301,
	moveq	r2, #0	@ tmp301,
	uxtb	r2, r2	@ _74, _74
@ /home/student/ARM_TEST/butterworth_unrolled4.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _72, _75
@ /home/student/ARM_TEST/butterworth_unrolled4.c:95:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:96:         x1 = input3;
	mov	r6, r1	@ x1, input3
@ /home/student/ARM_TEST/butterworth_unrolled4.c:97:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:98:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled4.c:35:     for (i = 0; i + 3 < sample_count; i += 4) {
	add	r8, r8, #4	@ i, i,
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:35:     for (i = 0; i + 3 < sample_count; i += 4) {
	add	r3, r8, #3	@ _76, i,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:35:     for (i = 0; i + 3 < sample_count; i += 4) {
	ldr	r2, [r7]	@ tmp302, sample_count
	cmp	r2, r3	@ tmp302, _76
	bgt	.L21		@,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:102:     for (; i < sample_count; i++) {
	b	.L22		@
.L27:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:103:         register int current_input = x[i];
	mov	r3, r8	@ i.24_77, i
	lsls	r3, r3, #2	@ _78, i.24_77,
	ldr	r2, [r7, #4]	@ tmp303, x
	add	r3, r3, r2	@ _79, tmp303
@ /home/student/ARM_TEST/butterworth_unrolled4.c:103:         register int current_input = x[i];
	ldr	r1, [r3]	@ current_input, *_79
@ /home/student/ARM_TEST/butterworth_unrolled4.c:104:         register int y = __QADD(
	movw	r3, #1105	@ b02_1.25_80,
	mul	r2, r3, r1	@ _81, b02_1.25_80, current_input
@ /home/student/ARM_TEST/butterworth_unrolled4.c:106:             (b02_1 << 1) * x1
	movw	r3, #1105	@ b02_1.26_82,
	lsls	r3, r3, #1	@ _83, b02_1.26_82,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:104:         register int y = __QADD(
	mul	r3, r6, r3	@ _84, x1, _83
	str	r2, [r7, #16]	@ _81, first
	str	r3, [r7, #12]	@ _84, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #16]	@ tmp305, first
	ldr	r2, [r7, #12]	@ tmp306, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp305, tmp306
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #8]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #8]	@ D.7881, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:104:         register int y = __QADD(
	mov	r4, r3	@ y, D.7881
@ /home/student/ARM_TEST/butterworth_unrolled4.c:108:         y = __QADD(y, b02_1 * x2);
	movw	r3, #1105	@ b02_1.27_85,
	mul	r3, r3, r9	@ _86, b02_1.27_85, x2
	str	r4, [r7, #28]	@ y, first
	str	r3, [r7, #24]	@ _86, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #28]	@ tmp308, first
	ldr	r2, [r7, #24]	@ tmp309, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp308, tmp309
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #20]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #20]	@ D.7875, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:108:         y = __QADD(y, b02_1 * x2);
	mov	r4, r3	@ y, D.7875
@ /home/student/ARM_TEST/butterworth_unrolled4.c:109:         y = __QADD(y, a1 * y1);
	movw	r3, #18727	@ a1.28_87,
	mul	r3, r5, r3	@ _88, y1, a1.28_87
	str	r4, [r7, #40]	@ y, first
	str	r3, [r7, #36]	@ _88, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #40]	@ tmp311, first
	ldr	r2, [r7, #36]	@ tmp312, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp311, tmp312
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #32]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #32]	@ D.7869, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:109:         y = __QADD(y, a1 * y1);
	mov	r4, r3	@ y, D.7869
@ /home/student/ARM_TEST/butterworth_unrolled4.c:110:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.29_89,
	movt	r3, 65535	@ a2.29_89,
	mul	r3, r3, r10	@ _90, a2.29_89, y2
	str	r4, [r7, #52]	@ y, first
	str	r3, [r7, #48]	@ _90, second
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #52]	@ tmp314, first
	ldr	r2, [r7, #48]	@ tmp315, second
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp314, tmp315
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #44]	@ result, result
@ ./cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #44]	@ D.7863, result
@ /home/student/ARM_TEST/butterworth_unrolled4.c:110:         y = __QADD(y, a2 * y2);
	mov	r4, r3	@ y, D.7863
@ /home/student/ARM_TEST/butterworth_unrolled4.c:111:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _91, y,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:111:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _92, y,,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:111:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _92,
	ite	ne
	movne	r2, #1	@ tmp317,
	moveq	r2, #0	@ tmp317,
	uxtb	r2, r2	@ _93, _93
@ /home/student/ARM_TEST/butterworth_unrolled4.c:111:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _91, _94
@ /home/student/ARM_TEST/butterworth_unrolled4.c:113:         x2 = x1;
	mov	r9, r6	@ x2, x1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:114:         x1 = current_input;
	mov	r6, r1	@ x1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled4.c:115:         y2 = y1;
	mov	r10, r5	@ y2, y1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:116:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled4.c:102:     for (; i < sample_count; i++) {
	add	r8, r8, #1	@ i, i,
.L22:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:102:     for (; i < sample_count; i++) {
	ldr	r3, [r7]	@ tmp318, sample_count
	cmp	r8, r3	@ i, tmp318
	blt	.L27		@,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:119:     return y1;
	mov	r3, r5	@ _115, y1
@ /home/student/ARM_TEST/butterworth_unrolled4.c:120: }
	mov	r0, r3	@, <retval>
	adds	r7, r7, #252	@,,
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
@ /home/student/ARM_TEST/butterworth_unrolled4.c:126:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/ARM_TEST/butterworth_unrolled4.c:126:     for (int n = 0; n < N; n++) {
	b	.L30		@
.L31:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:127:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/ARM_TEST/butterworth_unrolled4.c:127:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L36	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/ARM_TEST/butterworth_unrolled4.c:128:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L36+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:128:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L36+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/ARM_TEST/butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L36+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/ARM_TEST/butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/ARM_TEST/butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/ARM_TEST/butterworth_unrolled4.c:126:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L30:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:126:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L31		@,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:138:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:138:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L32		@,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:139:         perror("Unable to start benchmark timer");
	ldr	r3, .L36+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled4.c:140:         return 1;
	movs	r3, #1	@ _17,
	b	.L35		@
.L32:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:143:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:143:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/ARM_TEST/butterworth_unrolled4.c:145:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:145:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L34		@,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:146:         perror("Unable to stop benchmark timer");
	ldr	r3, .L36+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled4.c:147:         return 1;
	movs	r3, #1	@ _17,
	b	.L35		@
.L34:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:150:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/ARM_TEST/butterworth_unrolled4.c:151:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/ARM_TEST/butterworth_unrolled4.c:151:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L36+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/ARM_TEST/butterworth_unrolled4.c:152:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L36+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/ARM_TEST/butterworth_unrolled4.c:161:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled4.c:161:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/ARM_TEST/butterworth_unrolled4.c:154:     printf(
	vldr.64	d18, .L36+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/ARM_TEST/butterworth_unrolled4.c:162:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.30_13, y
	vmov	s15, r3	@ int	@ y.30_13, y.30_13
	vcvt.f64.s32	d18, s15	@ _14, y.30_13
@ /home/student/ARM_TEST/butterworth_unrolled4.c:154:     printf(
	vldr.64	d19, .L36+24	@ tmp175,
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
	ldr	r0, .L36+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled4.c:165:     return 0;
	movs	r3, #0	@ _17,
.L35:
@ /home/student/ARM_TEST/butterworth_unrolled4.c:166: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L37:
	.align	3
.L36:
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
