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
@ /home/student/seng440/filter/butterworth_unrolled20.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/seng440/filter/butterworth_unrolled20.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/seng440/filter/butterworth_unrolled20.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/seng440/filter/butterworth_unrolled20.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/seng440/filter/butterworth_unrolled20.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/seng440/filter/butterworth_unrolled20.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:24: }
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10}	@
	sub	sp, sp, #12	@,,
	add	r7, sp, #0	@,,
	str	r0, [r7, #4]	@ x, x
	str	r1, [r7]	@ sample_count, sample_count
@ /home/student/seng440/filter/butterworth_unrolled20.c:28:     register int x1 = 0;
	movs	r6, #0	@ x1,
@ /home/student/seng440/filter/butterworth_unrolled20.c:29:     register int x2 = 0;
	mov	r8, #0	@ x2,
@ /home/student/seng440/filter/butterworth_unrolled20.c:30:     register int y1 = 0;
	movs	r5, #0	@ y1,
@ /home/student/seng440/filter/butterworth_unrolled20.c:31:     register int y2 = 0;
	mov	r9, #0	@ y2,
@ /home/student/seng440/filter/butterworth_unrolled20.c:34:     for (i = 0; i + 19 < sample_count; i += 20) {
	mov	r10, #0	@ i,
@ /home/student/seng440/filter/butterworth_unrolled20.c:34:     for (i = 0; i + 19 < sample_count; i += 20) {
	b	.L4		@
.L5:
@ /home/student/seng440/filter/butterworth_unrolled20.c:36:         register int input0 = x[i];
	mov	r3, r10	@ i.0_1, i
	lsls	r3, r3, #2	@ _2, i.0_1,
	ldr	r2, [r7, #4]	@ tmp542, x
	add	r3, r3, r2	@ _3, tmp542
@ /home/student/seng440/filter/butterworth_unrolled20.c:36:         register int input0 = x[i];
	ldr	r1, [r3]	@ input0, *_3
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.1_4,
	mul	r2, r3, r1	@ _5, b02_1.1_4, input0
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.2_6,
	lsls	r3, r3, #1	@ _7, b02_1.2_6,
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _8, x1, _7
@ /home/student/seng440/filter/butterworth_unrolled20.c:37:         register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _5, _8
@ /home/student/seng440/filter/butterworth_unrolled20.c:38:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.3_9,
	mul	r3, r3, r8	@ _10, b02_1.3_9, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:38:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _10
@ /home/student/seng440/filter/butterworth_unrolled20.c:39:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.4_11,
	mul	r3, r5, r3	@ _12, y1, a1.4_11
@ /home/student/seng440/filter/butterworth_unrolled20.c:39:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _12
@ /home/student/seng440/filter/butterworth_unrolled20.c:40:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.5_13,
	movt	r3, 65535	@ a2.5_13,
	mul	r3, r3, r9	@ _14, a2.5_13, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:40:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _14
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp544,
	moveq	r2, #0	@ tmp544,
	uxtb	r2, r2	@ _17, _17
@ /home/student/seng440/filter/butterworth_unrolled20.c:41:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/seng440/filter/butterworth_unrolled20.c:43:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:44:         x1 = input0;
	mov	r6, r1	@ x1, input0
@ /home/student/seng440/filter/butterworth_unrolled20.c:45:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:46:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:49:         register int input1 = x[i + 1];
	mov	r3, r10	@ i.6_19, i
	adds	r3, r3, #1	@ _20, i.6_19,
	lsls	r3, r3, #2	@ _21, _20,
	ldr	r2, [r7, #4]	@ tmp545, x
	add	r3, r3, r2	@ _22, tmp545
@ /home/student/seng440/filter/butterworth_unrolled20.c:49:         register int input1 = x[i + 1];
	ldr	r1, [r3]	@ input1, *_22
@ /home/student/seng440/filter/butterworth_unrolled20.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.7_23,
	mul	r2, r3, r1	@ _24, b02_1.7_23, input1
@ /home/student/seng440/filter/butterworth_unrolled20.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.8_25,
	lsls	r3, r3, #1	@ _26, b02_1.8_25,
@ /home/student/seng440/filter/butterworth_unrolled20.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _27, x1, _26
@ /home/student/seng440/filter/butterworth_unrolled20.c:50:         y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _24, _27
@ /home/student/seng440/filter/butterworth_unrolled20.c:51:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.9_28,
	mul	r3, r3, r8	@ _29, b02_1.9_28, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:51:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _29
@ /home/student/seng440/filter/butterworth_unrolled20.c:52:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.10_30,
	mul	r3, r5, r3	@ _31, y1, a1.10_30
@ /home/student/seng440/filter/butterworth_unrolled20.c:52:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _31
@ /home/student/seng440/filter/butterworth_unrolled20.c:53:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.11_32,
	movt	r3, 65535	@ a2.11_32,
	mul	r3, r3, r9	@ _33, a2.11_32, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:53:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _33
@ /home/student/seng440/filter/butterworth_unrolled20.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp547,
	moveq	r2, #0	@ tmp547,
	uxtb	r2, r2	@ _36, _36
@ /home/student/seng440/filter/butterworth_unrolled20.c:54:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/seng440/filter/butterworth_unrolled20.c:56:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:57:         x1 = input1;
	mov	r6, r1	@ x1, input1
@ /home/student/seng440/filter/butterworth_unrolled20.c:58:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:59:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:62:         register int input2 = x[i + 2];
	mov	r3, r10	@ i.12_38, i
	adds	r3, r3, #2	@ _39, i.12_38,
	lsls	r3, r3, #2	@ _40, _39,
	ldr	r2, [r7, #4]	@ tmp548, x
	add	r3, r3, r2	@ _41, tmp548
@ /home/student/seng440/filter/butterworth_unrolled20.c:62:         register int input2 = x[i + 2];
	ldr	r1, [r3]	@ input2, *_41
@ /home/student/seng440/filter/butterworth_unrolled20.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.13_42,
	mul	r2, r3, r1	@ _43, b02_1.13_42, input2
@ /home/student/seng440/filter/butterworth_unrolled20.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.14_44,
	lsls	r3, r3, #1	@ _45, b02_1.14_44,
@ /home/student/seng440/filter/butterworth_unrolled20.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _46, x1, _45
@ /home/student/seng440/filter/butterworth_unrolled20.c:63:         y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _43, _46
@ /home/student/seng440/filter/butterworth_unrolled20.c:64:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.15_47,
	mul	r3, r3, r8	@ _48, b02_1.15_47, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:64:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _48
@ /home/student/seng440/filter/butterworth_unrolled20.c:65:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.16_49,
	mul	r3, r5, r3	@ _50, y1, a1.16_49
@ /home/student/seng440/filter/butterworth_unrolled20.c:65:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _50
@ /home/student/seng440/filter/butterworth_unrolled20.c:66:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.17_51,
	movt	r3, 65535	@ a2.17_51,
	mul	r3, r3, r9	@ _52, a2.17_51, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:66:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _52
@ /home/student/seng440/filter/butterworth_unrolled20.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp550,
	moveq	r2, #0	@ tmp550,
	uxtb	r2, r2	@ _55, _55
@ /home/student/seng440/filter/butterworth_unrolled20.c:67:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/seng440/filter/butterworth_unrolled20.c:69:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:70:         x1 = input2;
	mov	r6, r1	@ x1, input2
@ /home/student/seng440/filter/butterworth_unrolled20.c:71:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:72:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:75:         register int input3 = x[i + 3];
	mov	r3, r10	@ i.18_57, i
	adds	r3, r3, #3	@ _58, i.18_57,
	lsls	r3, r3, #2	@ _59, _58,
	ldr	r2, [r7, #4]	@ tmp551, x
	add	r3, r3, r2	@ _60, tmp551
@ /home/student/seng440/filter/butterworth_unrolled20.c:75:         register int input3 = x[i + 3];
	ldr	r1, [r3]	@ input3, *_60
@ /home/student/seng440/filter/butterworth_unrolled20.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.19_61,
	mul	r2, r3, r1	@ _62, b02_1.19_61, input3
@ /home/student/seng440/filter/butterworth_unrolled20.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.20_63,
	lsls	r3, r3, #1	@ _64, b02_1.20_63,
@ /home/student/seng440/filter/butterworth_unrolled20.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _65, x1, _64
@ /home/student/seng440/filter/butterworth_unrolled20.c:76:         y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _62, _65
@ /home/student/seng440/filter/butterworth_unrolled20.c:77:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.21_66,
	mul	r3, r3, r8	@ _67, b02_1.21_66, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:77:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _67
@ /home/student/seng440/filter/butterworth_unrolled20.c:78:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.22_68,
	mul	r3, r5, r3	@ _69, y1, a1.22_68
@ /home/student/seng440/filter/butterworth_unrolled20.c:78:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _69
@ /home/student/seng440/filter/butterworth_unrolled20.c:79:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.23_70,
	movt	r3, 65535	@ a2.23_70,
	mul	r3, r3, r9	@ _71, a2.23_70, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:79:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _71
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _72, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _73, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _73,
	ite	ne
	movne	r2, #1	@ tmp553,
	moveq	r2, #0	@ tmp553,
	uxtb	r2, r2	@ _74, _74
@ /home/student/seng440/filter/butterworth_unrolled20.c:80:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _72, _75
@ /home/student/seng440/filter/butterworth_unrolled20.c:82:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:83:         x1 = input3;
	mov	r6, r1	@ x1, input3
@ /home/student/seng440/filter/butterworth_unrolled20.c:84:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:85:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:88:         register int input4 = x[i + 4];
	mov	r3, r10	@ i.24_76, i
	adds	r3, r3, #4	@ _77, i.24_76,
	lsls	r3, r3, #2	@ _78, _77,
	ldr	r2, [r7, #4]	@ tmp554, x
	add	r3, r3, r2	@ _79, tmp554
@ /home/student/seng440/filter/butterworth_unrolled20.c:88:         register int input4 = x[i + 4];
	ldr	r1, [r3]	@ input4, *_79
@ /home/student/seng440/filter/butterworth_unrolled20.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.25_80,
	mul	r2, r3, r1	@ _81, b02_1.25_80, input4
@ /home/student/seng440/filter/butterworth_unrolled20.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.26_82,
	lsls	r3, r3, #1	@ _83, b02_1.26_82,
@ /home/student/seng440/filter/butterworth_unrolled20.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _84, x1, _83
@ /home/student/seng440/filter/butterworth_unrolled20.c:89:         y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _81, _84
@ /home/student/seng440/filter/butterworth_unrolled20.c:90:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.27_85,
	mul	r3, r3, r8	@ _86, b02_1.27_85, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:90:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _86
@ /home/student/seng440/filter/butterworth_unrolled20.c:91:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.28_87,
	mul	r3, r5, r3	@ _88, y1, a1.28_87
@ /home/student/seng440/filter/butterworth_unrolled20.c:91:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _88
@ /home/student/seng440/filter/butterworth_unrolled20.c:92:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.29_89,
	movt	r3, 65535	@ a2.29_89,
	mul	r3, r3, r9	@ _90, a2.29_89, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:92:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _90
@ /home/student/seng440/filter/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _91, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _92, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _92,
	ite	ne
	movne	r2, #1	@ tmp556,
	moveq	r2, #0	@ tmp556,
	uxtb	r2, r2	@ _93, _93
@ /home/student/seng440/filter/butterworth_unrolled20.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _91, _94
@ /home/student/seng440/filter/butterworth_unrolled20.c:95:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:96:         x1 = input4;
	mov	r6, r1	@ x1, input4
@ /home/student/seng440/filter/butterworth_unrolled20.c:97:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:98:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:101:         register int input5 = x[i + 5];
	mov	r3, r10	@ i.30_95, i
	adds	r3, r3, #5	@ _96, i.30_95,
	lsls	r3, r3, #2	@ _97, _96,
	ldr	r2, [r7, #4]	@ tmp557, x
	add	r3, r3, r2	@ _98, tmp557
@ /home/student/seng440/filter/butterworth_unrolled20.c:101:         register int input5 = x[i + 5];
	ldr	r1, [r3]	@ input5, *_98
@ /home/student/seng440/filter/butterworth_unrolled20.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.31_99,
	mul	r2, r3, r1	@ _100, b02_1.31_99, input5
@ /home/student/seng440/filter/butterworth_unrolled20.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.32_101,
	lsls	r3, r3, #1	@ _102, b02_1.32_101,
@ /home/student/seng440/filter/butterworth_unrolled20.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _103, x1, _102
@ /home/student/seng440/filter/butterworth_unrolled20.c:102:         y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _100, _103
@ /home/student/seng440/filter/butterworth_unrolled20.c:103:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.33_104,
	mul	r3, r3, r8	@ _105, b02_1.33_104, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:103:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _105
@ /home/student/seng440/filter/butterworth_unrolled20.c:104:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.34_106,
	mul	r3, r5, r3	@ _107, y1, a1.34_106
@ /home/student/seng440/filter/butterworth_unrolled20.c:104:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _107
@ /home/student/seng440/filter/butterworth_unrolled20.c:105:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.35_108,
	movt	r3, 65535	@ a2.35_108,
	mul	r3, r3, r9	@ _109, a2.35_108, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:105:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _109
@ /home/student/seng440/filter/butterworth_unrolled20.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _110, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _111, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _111,
	ite	ne
	movne	r2, #1	@ tmp559,
	moveq	r2, #0	@ tmp559,
	uxtb	r2, r2	@ _112, _112
@ /home/student/seng440/filter/butterworth_unrolled20.c:106:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _110, _113
@ /home/student/seng440/filter/butterworth_unrolled20.c:108:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:109:         x1 = input5;
	mov	r6, r1	@ x1, input5
@ /home/student/seng440/filter/butterworth_unrolled20.c:110:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:111:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:114:         register int input6 = x[i + 6];
	mov	r3, r10	@ i.36_114, i
	adds	r3, r3, #6	@ _115, i.36_114,
	lsls	r3, r3, #2	@ _116, _115,
	ldr	r2, [r7, #4]	@ tmp560, x
	add	r3, r3, r2	@ _117, tmp560
@ /home/student/seng440/filter/butterworth_unrolled20.c:114:         register int input6 = x[i + 6];
	ldr	r1, [r3]	@ input6, *_117
@ /home/student/seng440/filter/butterworth_unrolled20.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.37_118,
	mul	r2, r3, r1	@ _119, b02_1.37_118, input6
@ /home/student/seng440/filter/butterworth_unrolled20.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.38_120,
	lsls	r3, r3, #1	@ _121, b02_1.38_120,
@ /home/student/seng440/filter/butterworth_unrolled20.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _122, x1, _121
@ /home/student/seng440/filter/butterworth_unrolled20.c:115:         y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _119, _122
@ /home/student/seng440/filter/butterworth_unrolled20.c:116:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.39_123,
	mul	r3, r3, r8	@ _124, b02_1.39_123, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:116:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _124
@ /home/student/seng440/filter/butterworth_unrolled20.c:117:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.40_125,
	mul	r3, r5, r3	@ _126, y1, a1.40_125
@ /home/student/seng440/filter/butterworth_unrolled20.c:117:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _126
@ /home/student/seng440/filter/butterworth_unrolled20.c:118:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.41_127,
	movt	r3, 65535	@ a2.41_127,
	mul	r3, r3, r9	@ _128, a2.41_127, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:118:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _128
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _129, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _130, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _130,
	ite	ne
	movne	r2, #1	@ tmp562,
	moveq	r2, #0	@ tmp562,
	uxtb	r2, r2	@ _131, _131
@ /home/student/seng440/filter/butterworth_unrolled20.c:119:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _129, _132
@ /home/student/seng440/filter/butterworth_unrolled20.c:121:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:122:         x1 = input6;
	mov	r6, r1	@ x1, input6
@ /home/student/seng440/filter/butterworth_unrolled20.c:123:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:124:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:127:         register int input7 = x[i + 7];
	mov	r3, r10	@ i.42_133, i
	adds	r3, r3, #7	@ _134, i.42_133,
	lsls	r3, r3, #2	@ _135, _134,
	ldr	r2, [r7, #4]	@ tmp563, x
	add	r3, r3, r2	@ _136, tmp563
@ /home/student/seng440/filter/butterworth_unrolled20.c:127:         register int input7 = x[i + 7];
	ldr	r1, [r3]	@ input7, *_136
@ /home/student/seng440/filter/butterworth_unrolled20.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.43_137,
	mul	r2, r3, r1	@ _138, b02_1.43_137, input7
@ /home/student/seng440/filter/butterworth_unrolled20.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.44_139,
	lsls	r3, r3, #1	@ _140, b02_1.44_139,
@ /home/student/seng440/filter/butterworth_unrolled20.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _141, x1, _140
@ /home/student/seng440/filter/butterworth_unrolled20.c:128:         y = ((b02_1 * input7) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _138, _141
@ /home/student/seng440/filter/butterworth_unrolled20.c:129:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.45_142,
	mul	r3, r3, r8	@ _143, b02_1.45_142, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:129:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _143
@ /home/student/seng440/filter/butterworth_unrolled20.c:130:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.46_144,
	mul	r3, r5, r3	@ _145, y1, a1.46_144
@ /home/student/seng440/filter/butterworth_unrolled20.c:130:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _145
@ /home/student/seng440/filter/butterworth_unrolled20.c:131:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.47_146,
	movt	r3, 65535	@ a2.47_146,
	mul	r3, r3, r9	@ _147, a2.47_146, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:131:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _147
@ /home/student/seng440/filter/butterworth_unrolled20.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _148, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _149, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _149,
	ite	ne
	movne	r2, #1	@ tmp565,
	moveq	r2, #0	@ tmp565,
	uxtb	r2, r2	@ _150, _150
@ /home/student/seng440/filter/butterworth_unrolled20.c:132:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _148, _151
@ /home/student/seng440/filter/butterworth_unrolled20.c:134:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:135:         x1 = input7;
	mov	r6, r1	@ x1, input7
@ /home/student/seng440/filter/butterworth_unrolled20.c:136:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:137:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:139:         register int input8 = x[i + 8];
	mov	r3, r10	@ i.48_152, i
	adds	r3, r3, #8	@ _153, i.48_152,
	lsls	r3, r3, #2	@ _154, _153,
	ldr	r2, [r7, #4]	@ tmp566, x
	add	r3, r3, r2	@ _155, tmp566
@ /home/student/seng440/filter/butterworth_unrolled20.c:139:         register int input8 = x[i + 8];
	ldr	r1, [r3]	@ input8, *_155
@ /home/student/seng440/filter/butterworth_unrolled20.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.49_156,
	mul	r2, r3, r1	@ _157, b02_1.49_156, input8
@ /home/student/seng440/filter/butterworth_unrolled20.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.50_158,
	lsls	r3, r3, #1	@ _159, b02_1.50_158,
@ /home/student/seng440/filter/butterworth_unrolled20.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _160, x1, _159
@ /home/student/seng440/filter/butterworth_unrolled20.c:140:         y = ((b02_1 * input8) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _157, _160
@ /home/student/seng440/filter/butterworth_unrolled20.c:141:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.51_161,
	mul	r3, r3, r8	@ _162, b02_1.51_161, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:141:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _162
@ /home/student/seng440/filter/butterworth_unrolled20.c:142:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.52_163,
	mul	r3, r5, r3	@ _164, y1, a1.52_163
@ /home/student/seng440/filter/butterworth_unrolled20.c:142:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _164
@ /home/student/seng440/filter/butterworth_unrolled20.c:143:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.53_165,
	movt	r3, 65535	@ a2.53_165,
	mul	r3, r3, r9	@ _166, a2.53_165, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:143:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _166
@ /home/student/seng440/filter/butterworth_unrolled20.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _167, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _168, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _168,
	ite	ne
	movne	r2, #1	@ tmp568,
	moveq	r2, #0	@ tmp568,
	uxtb	r2, r2	@ _169, _169
@ /home/student/seng440/filter/butterworth_unrolled20.c:144:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _167, _170
@ /home/student/seng440/filter/butterworth_unrolled20.c:146:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:147:         x1 = input8;
	mov	r6, r1	@ x1, input8
@ /home/student/seng440/filter/butterworth_unrolled20.c:148:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:149:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:151:         register int input9 = x[i + 9];
	mov	r3, r10	@ i.54_171, i
	adds	r3, r3, #9	@ _172, i.54_171,
	lsls	r3, r3, #2	@ _173, _172,
	ldr	r2, [r7, #4]	@ tmp569, x
	add	r3, r3, r2	@ _174, tmp569
@ /home/student/seng440/filter/butterworth_unrolled20.c:151:         register int input9 = x[i + 9];
	ldr	r1, [r3]	@ input9, *_174
@ /home/student/seng440/filter/butterworth_unrolled20.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.55_175,
	mul	r2, r3, r1	@ _176, b02_1.55_175, input9
@ /home/student/seng440/filter/butterworth_unrolled20.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.56_177,
	lsls	r3, r3, #1	@ _178, b02_1.56_177,
@ /home/student/seng440/filter/butterworth_unrolled20.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _179, x1, _178
@ /home/student/seng440/filter/butterworth_unrolled20.c:152:         y = ((b02_1 * input9) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _176, _179
@ /home/student/seng440/filter/butterworth_unrolled20.c:153:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.57_180,
	mul	r3, r3, r8	@ _181, b02_1.57_180, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:153:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _181
@ /home/student/seng440/filter/butterworth_unrolled20.c:154:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.58_182,
	mul	r3, r5, r3	@ _183, y1, a1.58_182
@ /home/student/seng440/filter/butterworth_unrolled20.c:154:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _183
@ /home/student/seng440/filter/butterworth_unrolled20.c:155:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.59_184,
	movt	r3, 65535	@ a2.59_184,
	mul	r3, r3, r9	@ _185, a2.59_184, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:155:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _185
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _186, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _187, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _187,
	ite	ne
	movne	r2, #1	@ tmp571,
	moveq	r2, #0	@ tmp571,
	uxtb	r2, r2	@ _188, _188
@ /home/student/seng440/filter/butterworth_unrolled20.c:156:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _186, _189
@ /home/student/seng440/filter/butterworth_unrolled20.c:158:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:159:         x1 = input9;
	mov	r6, r1	@ x1, input9
@ /home/student/seng440/filter/butterworth_unrolled20.c:160:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:161:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:164:         register int input10 = x[i + 10];
	mov	r3, r10	@ i.60_190, i
	adds	r3, r3, #10	@ _191, i.60_190,
	lsls	r3, r3, #2	@ _192, _191,
	ldr	r2, [r7, #4]	@ tmp572, x
	add	r3, r3, r2	@ _193, tmp572
@ /home/student/seng440/filter/butterworth_unrolled20.c:164:         register int input10 = x[i + 10];
	ldr	r1, [r3]	@ input10, *_193
@ /home/student/seng440/filter/butterworth_unrolled20.c:165:         y = ((b02_1 * input10) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.61_194,
	mul	r2, r3, r1	@ _195, b02_1.61_194, input10
@ /home/student/seng440/filter/butterworth_unrolled20.c:165:         y = ((b02_1 * input10) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.62_196,
	lsls	r3, r3, #1	@ _197, b02_1.62_196,
@ /home/student/seng440/filter/butterworth_unrolled20.c:165:         y = ((b02_1 * input10) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _198, x1, _197
@ /home/student/seng440/filter/butterworth_unrolled20.c:165:         y = ((b02_1 * input10) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _195, _198
@ /home/student/seng440/filter/butterworth_unrolled20.c:166:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.63_199,
	mul	r3, r3, r8	@ _200, b02_1.63_199, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:166:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _200
@ /home/student/seng440/filter/butterworth_unrolled20.c:167:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.64_201,
	mul	r3, r5, r3	@ _202, y1, a1.64_201
@ /home/student/seng440/filter/butterworth_unrolled20.c:167:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _202
@ /home/student/seng440/filter/butterworth_unrolled20.c:168:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.65_203,
	movt	r3, 65535	@ a2.65_203,
	mul	r3, r3, r9	@ _204, a2.65_203, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:168:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _204
@ /home/student/seng440/filter/butterworth_unrolled20.c:169:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _205, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:169:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _206, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:169:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _206,
	ite	ne
	movne	r2, #1	@ tmp574,
	moveq	r2, #0	@ tmp574,
	uxtb	r2, r2	@ _207, _207
@ /home/student/seng440/filter/butterworth_unrolled20.c:169:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _205, _208
@ /home/student/seng440/filter/butterworth_unrolled20.c:171:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:172:         x1 = input10;
	mov	r6, r1	@ x1, input10
@ /home/student/seng440/filter/butterworth_unrolled20.c:173:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:174:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:176:         register int input11 = x[i + 11];
	mov	r3, r10	@ i.66_209, i
	adds	r3, r3, #11	@ _210, i.66_209,
	lsls	r3, r3, #2	@ _211, _210,
	ldr	r2, [r7, #4]	@ tmp575, x
	add	r3, r3, r2	@ _212, tmp575
@ /home/student/seng440/filter/butterworth_unrolled20.c:176:         register int input11 = x[i + 11];
	ldr	r1, [r3]	@ input11, *_212
@ /home/student/seng440/filter/butterworth_unrolled20.c:177:         y = ((b02_1 * input11) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.67_213,
	mul	r2, r3, r1	@ _214, b02_1.67_213, input11
@ /home/student/seng440/filter/butterworth_unrolled20.c:177:         y = ((b02_1 * input11) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.68_215,
	lsls	r3, r3, #1	@ _216, b02_1.68_215,
@ /home/student/seng440/filter/butterworth_unrolled20.c:177:         y = ((b02_1 * input11) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _217, x1, _216
@ /home/student/seng440/filter/butterworth_unrolled20.c:177:         y = ((b02_1 * input11) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _214, _217
@ /home/student/seng440/filter/butterworth_unrolled20.c:178:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.69_218,
	mul	r3, r3, r8	@ _219, b02_1.69_218, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:178:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _219
@ /home/student/seng440/filter/butterworth_unrolled20.c:179:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.70_220,
	mul	r3, r5, r3	@ _221, y1, a1.70_220
@ /home/student/seng440/filter/butterworth_unrolled20.c:179:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _221
@ /home/student/seng440/filter/butterworth_unrolled20.c:180:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.71_222,
	movt	r3, 65535	@ a2.71_222,
	mul	r3, r3, r9	@ _223, a2.71_222, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:180:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _223
@ /home/student/seng440/filter/butterworth_unrolled20.c:181:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _224, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:181:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _225, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:181:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _225,
	ite	ne
	movne	r2, #1	@ tmp577,
	moveq	r2, #0	@ tmp577,
	uxtb	r2, r2	@ _226, _226
@ /home/student/seng440/filter/butterworth_unrolled20.c:181:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _224, _227
@ /home/student/seng440/filter/butterworth_unrolled20.c:183:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:184:         x1 = input11;
	mov	r6, r1	@ x1, input11
@ /home/student/seng440/filter/butterworth_unrolled20.c:185:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:186:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:188:         register int input12 = x[i + 12];
	mov	r3, r10	@ i.72_228, i
	adds	r3, r3, #12	@ _229, i.72_228,
	lsls	r3, r3, #2	@ _230, _229,
	ldr	r2, [r7, #4]	@ tmp578, x
	add	r3, r3, r2	@ _231, tmp578
@ /home/student/seng440/filter/butterworth_unrolled20.c:188:         register int input12 = x[i + 12];
	ldr	r1, [r3]	@ input12, *_231
@ /home/student/seng440/filter/butterworth_unrolled20.c:189:         y = ((b02_1 * input12) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.73_232,
	mul	r2, r3, r1	@ _233, b02_1.73_232, input12
@ /home/student/seng440/filter/butterworth_unrolled20.c:189:         y = ((b02_1 * input12) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.74_234,
	lsls	r3, r3, #1	@ _235, b02_1.74_234,
@ /home/student/seng440/filter/butterworth_unrolled20.c:189:         y = ((b02_1 * input12) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _236, x1, _235
@ /home/student/seng440/filter/butterworth_unrolled20.c:189:         y = ((b02_1 * input12) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _233, _236
@ /home/student/seng440/filter/butterworth_unrolled20.c:190:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.75_237,
	mul	r3, r3, r8	@ _238, b02_1.75_237, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:190:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _238
@ /home/student/seng440/filter/butterworth_unrolled20.c:191:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.76_239,
	mul	r3, r5, r3	@ _240, y1, a1.76_239
@ /home/student/seng440/filter/butterworth_unrolled20.c:191:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _240
@ /home/student/seng440/filter/butterworth_unrolled20.c:192:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.77_241,
	movt	r3, 65535	@ a2.77_241,
	mul	r3, r3, r9	@ _242, a2.77_241, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:192:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _242
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _243, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _244, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _244,
	ite	ne
	movne	r2, #1	@ tmp580,
	moveq	r2, #0	@ tmp580,
	uxtb	r2, r2	@ _245, _245
@ /home/student/seng440/filter/butterworth_unrolled20.c:193:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _243, _246
@ /home/student/seng440/filter/butterworth_unrolled20.c:195:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:196:         x1 = input12;
	mov	r6, r1	@ x1, input12
@ /home/student/seng440/filter/butterworth_unrolled20.c:197:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:198:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:200:         register int input13 = x[i + 13];
	mov	r3, r10	@ i.78_247, i
	adds	r3, r3, #13	@ _248, i.78_247,
	lsls	r3, r3, #2	@ _249, _248,
	ldr	r2, [r7, #4]	@ tmp581, x
	add	r3, r3, r2	@ _250, tmp581
@ /home/student/seng440/filter/butterworth_unrolled20.c:200:         register int input13 = x[i + 13];
	ldr	r1, [r3]	@ input13, *_250
@ /home/student/seng440/filter/butterworth_unrolled20.c:201:         y = ((b02_1 * input13) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.79_251,
	mul	r2, r3, r1	@ _252, b02_1.79_251, input13
@ /home/student/seng440/filter/butterworth_unrolled20.c:201:         y = ((b02_1 * input13) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.80_253,
	lsls	r3, r3, #1	@ _254, b02_1.80_253,
@ /home/student/seng440/filter/butterworth_unrolled20.c:201:         y = ((b02_1 * input13) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _255, x1, _254
@ /home/student/seng440/filter/butterworth_unrolled20.c:201:         y = ((b02_1 * input13) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _252, _255
@ /home/student/seng440/filter/butterworth_unrolled20.c:202:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.81_256,
	mul	r3, r3, r8	@ _257, b02_1.81_256, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:202:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _257
@ /home/student/seng440/filter/butterworth_unrolled20.c:203:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.82_258,
	mul	r3, r5, r3	@ _259, y1, a1.82_258
@ /home/student/seng440/filter/butterworth_unrolled20.c:203:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _259
@ /home/student/seng440/filter/butterworth_unrolled20.c:204:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.83_260,
	movt	r3, 65535	@ a2.83_260,
	mul	r3, r3, r9	@ _261, a2.83_260, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:204:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _261
@ /home/student/seng440/filter/butterworth_unrolled20.c:205:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _262, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:205:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _263, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:205:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _263,
	ite	ne
	movne	r2, #1	@ tmp583,
	moveq	r2, #0	@ tmp583,
	uxtb	r2, r2	@ _264, _264
@ /home/student/seng440/filter/butterworth_unrolled20.c:205:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _262, _265
@ /home/student/seng440/filter/butterworth_unrolled20.c:207:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:208:         x1 = input13;
	mov	r6, r1	@ x1, input13
@ /home/student/seng440/filter/butterworth_unrolled20.c:209:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:210:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:213:         register int input14 = x[i + 14];
	mov	r3, r10	@ i.84_266, i
	adds	r3, r3, #14	@ _267, i.84_266,
	lsls	r3, r3, #2	@ _268, _267,
	ldr	r2, [r7, #4]	@ tmp584, x
	add	r3, r3, r2	@ _269, tmp584
@ /home/student/seng440/filter/butterworth_unrolled20.c:213:         register int input14 = x[i + 14];
	ldr	r1, [r3]	@ input14, *_269
@ /home/student/seng440/filter/butterworth_unrolled20.c:214:         y = ((b02_1 * input14) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.85_270,
	mul	r2, r3, r1	@ _271, b02_1.85_270, input14
@ /home/student/seng440/filter/butterworth_unrolled20.c:214:         y = ((b02_1 * input14) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.86_272,
	lsls	r3, r3, #1	@ _273, b02_1.86_272,
@ /home/student/seng440/filter/butterworth_unrolled20.c:214:         y = ((b02_1 * input14) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _274, x1, _273
@ /home/student/seng440/filter/butterworth_unrolled20.c:214:         y = ((b02_1 * input14) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _271, _274
@ /home/student/seng440/filter/butterworth_unrolled20.c:215:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.87_275,
	mul	r3, r3, r8	@ _276, b02_1.87_275, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:215:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _276
@ /home/student/seng440/filter/butterworth_unrolled20.c:216:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.88_277,
	mul	r3, r5, r3	@ _278, y1, a1.88_277
@ /home/student/seng440/filter/butterworth_unrolled20.c:216:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _278
@ /home/student/seng440/filter/butterworth_unrolled20.c:217:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.89_279,
	movt	r3, 65535	@ a2.89_279,
	mul	r3, r3, r9	@ _280, a2.89_279, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:217:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _280
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _281, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _282, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _282,
	ite	ne
	movne	r2, #1	@ tmp586,
	moveq	r2, #0	@ tmp586,
	uxtb	r2, r2	@ _283, _283
@ /home/student/seng440/filter/butterworth_unrolled20.c:218:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _281, _284
@ /home/student/seng440/filter/butterworth_unrolled20.c:220:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:221:         x1 = input14;
	mov	r6, r1	@ x1, input14
@ /home/student/seng440/filter/butterworth_unrolled20.c:222:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:223:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:226:         register int input15 = x[i + 15];
	mov	r3, r10	@ i.90_285, i
	adds	r3, r3, #15	@ _286, i.90_285,
	lsls	r3, r3, #2	@ _287, _286,
	ldr	r2, [r7, #4]	@ tmp587, x
	add	r3, r3, r2	@ _288, tmp587
@ /home/student/seng440/filter/butterworth_unrolled20.c:226:         register int input15 = x[i + 15];
	ldr	r1, [r3]	@ input15, *_288
@ /home/student/seng440/filter/butterworth_unrolled20.c:227:         y = ((b02_1 * input15) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.91_289,
	mul	r2, r3, r1	@ _290, b02_1.91_289, input15
@ /home/student/seng440/filter/butterworth_unrolled20.c:227:         y = ((b02_1 * input15) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.92_291,
	lsls	r3, r3, #1	@ _292, b02_1.92_291,
@ /home/student/seng440/filter/butterworth_unrolled20.c:227:         y = ((b02_1 * input15) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _293, x1, _292
@ /home/student/seng440/filter/butterworth_unrolled20.c:227:         y = ((b02_1 * input15) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _290, _293
@ /home/student/seng440/filter/butterworth_unrolled20.c:228:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.93_294,
	mul	r3, r3, r8	@ _295, b02_1.93_294, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:228:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _295
@ /home/student/seng440/filter/butterworth_unrolled20.c:229:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.94_296,
	mul	r3, r5, r3	@ _297, y1, a1.94_296
@ /home/student/seng440/filter/butterworth_unrolled20.c:229:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _297
@ /home/student/seng440/filter/butterworth_unrolled20.c:230:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.95_298,
	movt	r3, 65535	@ a2.95_298,
	mul	r3, r3, r9	@ _299, a2.95_298, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:230:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _299
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _300, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _301, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _301,
	ite	ne
	movne	r2, #1	@ tmp589,
	moveq	r2, #0	@ tmp589,
	uxtb	r2, r2	@ _302, _302
@ /home/student/seng440/filter/butterworth_unrolled20.c:231:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _300, _303
@ /home/student/seng440/filter/butterworth_unrolled20.c:233:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:234:         x1 = input15;
	mov	r6, r1	@ x1, input15
@ /home/student/seng440/filter/butterworth_unrolled20.c:235:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:236:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:238:         register int input16 = x[i + 16];
	mov	r3, r10	@ i.96_304, i
	adds	r3, r3, #16	@ _305, i.96_304,
	lsls	r3, r3, #2	@ _306, _305,
	ldr	r2, [r7, #4]	@ tmp590, x
	add	r3, r3, r2	@ _307, tmp590
@ /home/student/seng440/filter/butterworth_unrolled20.c:238:         register int input16 = x[i + 16];
	ldr	r1, [r3]	@ input16, *_307
@ /home/student/seng440/filter/butterworth_unrolled20.c:239:         y = ((b02_1 * input16) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.97_308,
	mul	r2, r3, r1	@ _309, b02_1.97_308, input16
@ /home/student/seng440/filter/butterworth_unrolled20.c:239:         y = ((b02_1 * input16) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.98_310,
	lsls	r3, r3, #1	@ _311, b02_1.98_310,
@ /home/student/seng440/filter/butterworth_unrolled20.c:239:         y = ((b02_1 * input16) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _312, x1, _311
@ /home/student/seng440/filter/butterworth_unrolled20.c:239:         y = ((b02_1 * input16) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _309, _312
@ /home/student/seng440/filter/butterworth_unrolled20.c:240:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.99_313,
	mul	r3, r3, r8	@ _314, b02_1.99_313, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:240:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _314
@ /home/student/seng440/filter/butterworth_unrolled20.c:241:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.100_315,
	mul	r3, r5, r3	@ _316, y1, a1.100_315
@ /home/student/seng440/filter/butterworth_unrolled20.c:241:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _316
@ /home/student/seng440/filter/butterworth_unrolled20.c:242:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.101_317,
	movt	r3, 65535	@ a2.101_317,
	mul	r3, r3, r9	@ _318, a2.101_317, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:242:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _318
@ /home/student/seng440/filter/butterworth_unrolled20.c:243:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _319, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:243:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _320, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:243:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _320,
	ite	ne
	movne	r2, #1	@ tmp592,
	moveq	r2, #0	@ tmp592,
	uxtb	r2, r2	@ _321, _321
@ /home/student/seng440/filter/butterworth_unrolled20.c:243:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _319, _322
@ /home/student/seng440/filter/butterworth_unrolled20.c:245:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:246:         x1 = input16;
	mov	r6, r1	@ x1, input16
@ /home/student/seng440/filter/butterworth_unrolled20.c:247:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:248:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:250:         register int input17 = x[i + 17];
	mov	r3, r10	@ i.102_323, i
	adds	r3, r3, #17	@ _324, i.102_323,
	lsls	r3, r3, #2	@ _325, _324,
	ldr	r2, [r7, #4]	@ tmp593, x
	add	r3, r3, r2	@ _326, tmp593
@ /home/student/seng440/filter/butterworth_unrolled20.c:250:         register int input17 = x[i + 17];
	ldr	r1, [r3]	@ input17, *_326
@ /home/student/seng440/filter/butterworth_unrolled20.c:251:         y = ((b02_1 * input17) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.103_327,
	mul	r2, r3, r1	@ _328, b02_1.103_327, input17
@ /home/student/seng440/filter/butterworth_unrolled20.c:251:         y = ((b02_1 * input17) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.104_329,
	lsls	r3, r3, #1	@ _330, b02_1.104_329,
@ /home/student/seng440/filter/butterworth_unrolled20.c:251:         y = ((b02_1 * input17) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _331, x1, _330
@ /home/student/seng440/filter/butterworth_unrolled20.c:251:         y = ((b02_1 * input17) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _328, _331
@ /home/student/seng440/filter/butterworth_unrolled20.c:252:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.105_332,
	mul	r3, r3, r8	@ _333, b02_1.105_332, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:252:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _333
@ /home/student/seng440/filter/butterworth_unrolled20.c:253:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.106_334,
	mul	r3, r5, r3	@ _335, y1, a1.106_334
@ /home/student/seng440/filter/butterworth_unrolled20.c:253:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _335
@ /home/student/seng440/filter/butterworth_unrolled20.c:254:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.107_336,
	movt	r3, 65535	@ a2.107_336,
	mul	r3, r3, r9	@ _337, a2.107_336, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:254:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _337
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _338, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _339, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _339,
	ite	ne
	movne	r2, #1	@ tmp595,
	moveq	r2, #0	@ tmp595,
	uxtb	r2, r2	@ _340, _340
@ /home/student/seng440/filter/butterworth_unrolled20.c:255:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _338, _341
@ /home/student/seng440/filter/butterworth_unrolled20.c:257:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:258:         x1 = input17;
	mov	r6, r1	@ x1, input17
@ /home/student/seng440/filter/butterworth_unrolled20.c:259:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:260:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:262:         register int input18 = x[i + 18];
	mov	r3, r10	@ i.108_342, i
	adds	r3, r3, #18	@ _343, i.108_342,
	lsls	r3, r3, #2	@ _344, _343,
	ldr	r2, [r7, #4]	@ tmp596, x
	add	r3, r3, r2	@ _345, tmp596
@ /home/student/seng440/filter/butterworth_unrolled20.c:262:         register int input18 = x[i + 18];
	ldr	r1, [r3]	@ input18, *_345
@ /home/student/seng440/filter/butterworth_unrolled20.c:263:         y = ((b02_1 * input18) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.109_346,
	mul	r2, r3, r1	@ _347, b02_1.109_346, input18
@ /home/student/seng440/filter/butterworth_unrolled20.c:263:         y = ((b02_1 * input18) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.110_348,
	lsls	r3, r3, #1	@ _349, b02_1.110_348,
@ /home/student/seng440/filter/butterworth_unrolled20.c:263:         y = ((b02_1 * input18) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _350, x1, _349
@ /home/student/seng440/filter/butterworth_unrolled20.c:263:         y = ((b02_1 * input18) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _347, _350
@ /home/student/seng440/filter/butterworth_unrolled20.c:264:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.111_351,
	mul	r3, r3, r8	@ _352, b02_1.111_351, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:264:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _352
@ /home/student/seng440/filter/butterworth_unrolled20.c:265:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.112_353,
	mul	r3, r5, r3	@ _354, y1, a1.112_353
@ /home/student/seng440/filter/butterworth_unrolled20.c:265:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _354
@ /home/student/seng440/filter/butterworth_unrolled20.c:266:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.113_355,
	movt	r3, 65535	@ a2.113_355,
	mul	r3, r3, r9	@ _356, a2.113_355, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:266:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _356
@ /home/student/seng440/filter/butterworth_unrolled20.c:267:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _357, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:267:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _358, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:267:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _358,
	ite	ne
	movne	r2, #1	@ tmp598,
	moveq	r2, #0	@ tmp598,
	uxtb	r2, r2	@ _359, _359
@ /home/student/seng440/filter/butterworth_unrolled20.c:267:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _357, _360
@ /home/student/seng440/filter/butterworth_unrolled20.c:269:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:270:         x1 = input18;
	mov	r6, r1	@ x1, input18
@ /home/student/seng440/filter/butterworth_unrolled20.c:271:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:272:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:274:         register int input19 = x[i + 19];
	mov	r3, r10	@ i.114_361, i
	adds	r3, r3, #19	@ _362, i.114_361,
	lsls	r3, r3, #2	@ _363, _362,
	ldr	r2, [r7, #4]	@ tmp599, x
	add	r3, r3, r2	@ _364, tmp599
@ /home/student/seng440/filter/butterworth_unrolled20.c:274:         register int input19 = x[i + 19];
	ldr	r1, [r3]	@ input19, *_364
@ /home/student/seng440/filter/butterworth_unrolled20.c:275:         y = ((b02_1 * input19) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.115_365,
	mul	r2, r3, r1	@ _366, b02_1.115_365, input19
@ /home/student/seng440/filter/butterworth_unrolled20.c:275:         y = ((b02_1 * input19) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.116_367,
	lsls	r3, r3, #1	@ _368, b02_1.116_367,
@ /home/student/seng440/filter/butterworth_unrolled20.c:275:         y = ((b02_1 * input19) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _369, x1, _368
@ /home/student/seng440/filter/butterworth_unrolled20.c:275:         y = ((b02_1 * input19) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _366, _369
@ /home/student/seng440/filter/butterworth_unrolled20.c:276:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.117_370,
	mul	r3, r3, r8	@ _371, b02_1.117_370, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:276:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _371
@ /home/student/seng440/filter/butterworth_unrolled20.c:277:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.118_372,
	mul	r3, r5, r3	@ _373, y1, a1.118_372
@ /home/student/seng440/filter/butterworth_unrolled20.c:277:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _373
@ /home/student/seng440/filter/butterworth_unrolled20.c:278:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.119_374,
	movt	r3, 65535	@ a2.119_374,
	mul	r3, r3, r9	@ _375, a2.119_374, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:278:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _375
@ /home/student/seng440/filter/butterworth_unrolled20.c:279:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _376, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:279:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _377, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:279:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _377,
	ite	ne
	movne	r2, #1	@ tmp601,
	moveq	r2, #0	@ tmp601,
	uxtb	r2, r2	@ _378, _378
@ /home/student/seng440/filter/butterworth_unrolled20.c:279:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _376, _379
@ /home/student/seng440/filter/butterworth_unrolled20.c:281:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:282:         x1 = input19;
	mov	r6, r1	@ x1, input19
@ /home/student/seng440/filter/butterworth_unrolled20.c:283:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:284:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:34:     for (i = 0; i + 19 < sample_count; i += 20) {
	add	r10, r10, #20	@ i, i,
.L4:
@ /home/student/seng440/filter/butterworth_unrolled20.c:34:     for (i = 0; i + 19 < sample_count; i += 20) {
	add	r3, r10, #19	@ _380, i,
@ /home/student/seng440/filter/butterworth_unrolled20.c:34:     for (i = 0; i + 19 < sample_count; i += 20) {
	ldr	r2, [r7]	@ tmp602, sample_count
	cmp	r2, r3	@ tmp602, _380
	bgt	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled20.c:290:     for (; i < sample_count; i++) {
	b	.L6		@
.L7:
@ /home/student/seng440/filter/butterworth_unrolled20.c:291:         register int current_input = x[i];
	mov	r3, r10	@ i.120_381, i
	lsls	r3, r3, #2	@ _382, i.120_381,
	ldr	r2, [r7, #4]	@ tmp603, x
	add	r3, r3, r2	@ _383, tmp603
@ /home/student/seng440/filter/butterworth_unrolled20.c:291:         register int current_input = x[i];
	ldr	r1, [r3]	@ current_input, *_383
@ /home/student/seng440/filter/butterworth_unrolled20.c:292:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.121_384,
	mul	r2, r3, r1	@ _385, b02_1.121_384, current_input
@ /home/student/seng440/filter/butterworth_unrolled20.c:292:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.122_386,
	lsls	r3, r3, #1	@ _387, b02_1.122_386,
@ /home/student/seng440/filter/butterworth_unrolled20.c:292:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r3, r6, r3	@ _388, x1, _387
@ /home/student/seng440/filter/butterworth_unrolled20.c:292:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _385, _388
@ /home/student/seng440/filter/butterworth_unrolled20.c:293:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.123_389,
	mul	r3, r3, r8	@ _390, b02_1.123_389, x2
@ /home/student/seng440/filter/butterworth_unrolled20.c:293:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _390
@ /home/student/seng440/filter/butterworth_unrolled20.c:294:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.124_391,
	mul	r3, r5, r3	@ _392, y1, a1.124_391
@ /home/student/seng440/filter/butterworth_unrolled20.c:294:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _392
@ /home/student/seng440/filter/butterworth_unrolled20.c:295:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.125_393,
	movt	r3, 65535	@ a2.125_393,
	mul	r3, r3, r9	@ _394, a2.125_393, y2
@ /home/student/seng440/filter/butterworth_unrolled20.c:295:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _394
@ /home/student/seng440/filter/butterworth_unrolled20.c:296:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _395, y,
@ /home/student/seng440/filter/butterworth_unrolled20.c:296:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _396, y,,
@ /home/student/seng440/filter/butterworth_unrolled20.c:296:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _396,
	ite	ne
	movne	r2, #1	@ tmp605,
	moveq	r2, #0	@ tmp605,
	uxtb	r2, r2	@ _397, _397
@ /home/student/seng440/filter/butterworth_unrolled20.c:296:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _395, _398
@ /home/student/seng440/filter/butterworth_unrolled20.c:298:         x2 = x1;
	mov	r8, r6	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled20.c:299:         x1 = current_input;
	mov	r6, r1	@ x1, current_input
@ /home/student/seng440/filter/butterworth_unrolled20.c:300:         y2 = y1;
	mov	r9, r5	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:301:         y1 = y;
	mov	r5, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:290:     for (; i < sample_count; i++) {
	add	r10, r10, #1	@ i, i,
.L6:
@ /home/student/seng440/filter/butterworth_unrolled20.c:290:     for (; i < sample_count; i++) {
	ldr	r3, [r7]	@ tmp606, sample_count
	cmp	r10, r3	@ i, tmp606
	blt	.L7		@,
@ /home/student/seng440/filter/butterworth_unrolled20.c:304:     return y1;
	mov	r3, r5	@ _416, y1
@ /home/student/seng440/filter/butterworth_unrolled20.c:305: }
	mov	r0, r3	@, <retval>
	adds	r7, r7, #12	@,,
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
@ /home/student/seng440/filter/butterworth_unrolled20.c:311:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/seng440/filter/butterworth_unrolled20.c:311:     for (int n = 0; n < N; n++) {
	b	.L10		@
.L11:
@ /home/student/seng440/filter/butterworth_unrolled20.c:312:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/seng440/filter/butterworth_unrolled20.c:312:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L16	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/seng440/filter/butterworth_unrolled20.c:313:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L16+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/seng440/filter/butterworth_unrolled20.c:313:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L16+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L16+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/seng440/filter/butterworth_unrolled20.c:317:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/seng440/filter/butterworth_unrolled20.c:311:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L10:
@ /home/student/seng440/filter/butterworth_unrolled20.c:311:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L11		@,
@ /home/student/seng440/filter/butterworth_unrolled20.c:323:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/seng440/filter/butterworth_unrolled20.c:323:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L12		@,
@ /home/student/seng440/filter/butterworth_unrolled20.c:324:         perror("Unable to start benchmark timer");
	ldr	r3, .L16+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:325:         return 1;
	movs	r3, #1	@ _17,
	b	.L15		@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled20.c:328:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/seng440/filter/butterworth_unrolled20.c:328:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/seng440/filter/butterworth_unrolled20.c:330:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/seng440/filter/butterworth_unrolled20.c:330:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L14		@,
@ /home/student/seng440/filter/butterworth_unrolled20.c:331:         perror("Unable to stop benchmark timer");
	ldr	r3, .L16+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:332:         return 1;
	movs	r3, #1	@ _17,
	b	.L15		@
.L14:
@ /home/student/seng440/filter/butterworth_unrolled20.c:335:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/seng440/filter/butterworth_unrolled20.c:336:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/seng440/filter/butterworth_unrolled20.c:336:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L16+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/seng440/filter/butterworth_unrolled20.c:337:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L16+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/seng440/filter/butterworth_unrolled20.c:346:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled20.c:346:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	vldr.64	d18, .L16+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/seng440/filter/butterworth_unrolled20.c:347:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.126_13, y
	vmov	s15, r3	@ int	@ y.126_13, y.126_13
	vcvt.f64.s32	d18, s15	@ _14, y.126_13
@ /home/student/seng440/filter/butterworth_unrolled20.c:339:     printf(
	vldr.64	d19, .L16+24	@ tmp175,
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
	ldr	r0, .L16+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled20.c:350:     return 0;
	movs	r3, #0	@ _17,
.L15:
@ /home/student/seng440/filter/butterworth_unrolled20.c:351: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
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
