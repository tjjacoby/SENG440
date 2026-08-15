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
	.file	"butterworth_unrolled.c"
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
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/seng440/filter/butterworth_unrolled.c:29: }
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
@ /home/student/seng440/filter/butterworth_unrolled.c:33:     register int x1 = 0;
	mov	r8, #0	@ x1,
@ /home/student/seng440/filter/butterworth_unrolled.c:34:     register int x2 = 0;
	mov	r10, #0	@ x2,
@ /home/student/seng440/filter/butterworth_unrolled.c:35:     register int y1 = 0;
	movs	r6, #0	@ y1,
@ /home/student/seng440/filter/butterworth_unrolled.c:36:     register int y2 = 0;
	mov	r9, #0	@ y2,
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	movs	r5, #0	@ i,
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	b	.L4		@
.L5:
@ /home/student/seng440/filter/butterworth_unrolled.c:42:         register int current_input = x[i];
	mov	r3, r5	@ i.1_1, i
	lsls	r3, r3, #2	@ _2, i.1_1,
	ldr	r2, [r7, #4]	@ tmp182, x
	add	r3, r3, r2	@ _3, tmp182
@ /home/student/seng440/filter/butterworth_unrolled.c:42:         register int current_input = x[i];
	ldr	r1, [r3]	@ current_input, *_3
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.2_4,
	mul	r2, r3, r1	@ _5, b02_1.2_4, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.3_6,
	lsls	r3, r3, #1	@ _7, b02_1.3_6,
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r3, r3, r8	@ _8, _7, x1
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _5, _8
@ /home/student/seng440/filter/butterworth_unrolled.c:45:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.4_9,
	mul	r3, r3, r10	@ _10, b02_1.4_9, x2
@ /home/student/seng440/filter/butterworth_unrolled.c:45:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _10
@ /home/student/seng440/filter/butterworth_unrolled.c:46:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.5_11,
	mul	r3, r6, r3	@ _12, y1, a1.5_11
@ /home/student/seng440/filter/butterworth_unrolled.c:46:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _12
@ /home/student/seng440/filter/butterworth_unrolled.c:47:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.6_13,
	movt	r3, 65535	@ a2.6_13,
	mul	r3, r3, r9	@ _14, a2.6_13, y2
@ /home/student/seng440/filter/butterworth_unrolled.c:47:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _14
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _15, y,
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _16, y,,
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _16,
	ite	ne
	movne	r2, #1	@ tmp184,
	moveq	r2, #0	@ tmp184,
	uxtb	r2, r2	@ _17, _17
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _15, _18
@ /home/student/seng440/filter/butterworth_unrolled.c:51:         x2 = x1;
	mov	r10, r8	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled.c:52:         x1 = current_input;
	mov	r8, r1	@ x1, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:54:         y2 = y1;
	mov	r9, r6	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled.c:55:         y1 = y;
	mov	r6, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:58:         register int next_input = x[i + 1];
	mov	r3, r5	@ i.7_19, i
	adds	r3, r3, #1	@ _20, i.7_19,
	lsls	r3, r3, #2	@ _21, _20,
	ldr	r2, [r7, #4]	@ tmp185, x
	add	r3, r3, r2	@ _22, tmp185
@ /home/student/seng440/filter/butterworth_unrolled.c:58:         register int next_input = x[i + 1];
	ldr	r1, [r3]	@ next_input, *_22
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.8_23,
	mul	r2, r3, r1	@ _24, b02_1.8_23, next_input
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.9_25,
	lsls	r3, r3, #1	@ _26, b02_1.9_25,
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	mul	r3, r3, r8	@ _27, _26, x1
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _24, _27
@ /home/student/seng440/filter/butterworth_unrolled.c:61:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.10_28,
	mul	r3, r3, r10	@ _29, b02_1.10_28, x2
@ /home/student/seng440/filter/butterworth_unrolled.c:61:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _29
@ /home/student/seng440/filter/butterworth_unrolled.c:62:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.11_30,
	mul	r3, r6, r3	@ _31, y1, a1.11_30
@ /home/student/seng440/filter/butterworth_unrolled.c:62:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _31
@ /home/student/seng440/filter/butterworth_unrolled.c:63:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.12_32,
	movt	r3, 65535	@ a2.12_32,
	mul	r3, r3, r9	@ _33, a2.12_32, y2
@ /home/student/seng440/filter/butterworth_unrolled.c:63:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _33
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _34, y,
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _35, y,,
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _35,
	ite	ne
	movne	r2, #1	@ tmp187,
	moveq	r2, #0	@ tmp187,
	uxtb	r2, r2	@ _36, _36
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _34, _37
@ /home/student/seng440/filter/butterworth_unrolled.c:67:         x2 = x1;
	mov	r10, r8	@ x2, x1
@ /home/student/seng440/filter/butterworth_unrolled.c:68:         x1 = next_input;
	mov	r8, r1	@ x1, next_input
@ /home/student/seng440/filter/butterworth_unrolled.c:70:         y2 = y1;
	mov	r9, r6	@ y2, y1
@ /home/student/seng440/filter/butterworth_unrolled.c:71:         y1 = y;
	mov	r6, r4	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	adds	r5, r5, #2	@ i, i,
.L4:
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	adds	r3, r5, #1	@ _38, i,
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	ldr	r2, [r7]	@ tmp188, sample_count
	cmp	r2, r3	@ tmp188, _38
	bgt	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:75:     if (i < sample_count) {
	ldr	r3, [r7]	@ tmp189, sample_count
	cmp	r5, r3	@ i, tmp189
	bge	.L6		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:76:         register int current_input = x[i];
	mov	r3, r5	@ i.13_39, i
	lsls	r3, r3, #2	@ _40, i.13_39,
	ldr	r2, [r7, #4]	@ tmp190, x
	add	r3, r3, r2	@ _41, tmp190
@ /home/student/seng440/filter/butterworth_unrolled.c:76:         register int current_input = x[i];
	ldr	r5, [r3]	@ current_input, *_41
@ /home/student/seng440/filter/butterworth_unrolled.c:77:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.14_42,
	mul	r2, r3, r5	@ _43, b02_1.14_42, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:77:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.15_44,
	lsls	r3, r3, #1	@ _45, b02_1.15_44,
@ /home/student/seng440/filter/butterworth_unrolled.c:77:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r3, r3, r8	@ _46, _45, x1
@ /home/student/seng440/filter/butterworth_unrolled.c:77:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	adds	r4, r2, r3	@ y, _43, _46
@ /home/student/seng440/filter/butterworth_unrolled.c:79:         y = ((y) + (b02_1 * x2));
	movw	r3, #1105	@ b02_1.16_47,
	mul	r3, r3, r10	@ _48, b02_1.16_47, x2
@ /home/student/seng440/filter/butterworth_unrolled.c:79:         y = ((y) + (b02_1 * x2));
	add	r4, r4, r3	@ y, _48
@ /home/student/seng440/filter/butterworth_unrolled.c:80:         y = ((y) + (a1 * y1));
	movw	r3, #18727	@ a1.17_49,
	mul	r3, r6, r3	@ _50, y1, a1.17_49
@ /home/student/seng440/filter/butterworth_unrolled.c:80:         y = ((y) + (a1 * y1));
	add	r4, r4, r3	@ y, _50
@ /home/student/seng440/filter/butterworth_unrolled.c:81:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.18_51,
	movt	r3, 65535	@ a2.18_51,
	mul	r3, r3, r9	@ _52, a2.18_51, y2
@ /home/student/seng440/filter/butterworth_unrolled.c:81:         y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _52
@ /home/student/seng440/filter/butterworth_unrolled.c:83:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _53, y,
@ /home/student/seng440/filter/butterworth_unrolled.c:83:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _54, y,,
@ /home/student/seng440/filter/butterworth_unrolled.c:83:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _54,
	ite	ne
	movne	r2, #1	@ tmp192,
	moveq	r2, #0	@ tmp192,
	uxtb	r2, r2	@ _55, _55
@ /home/student/seng440/filter/butterworth_unrolled.c:83:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _53, _56
@ /home/student/seng440/filter/butterworth_unrolled.c:89:         y1 = y;
	mov	r6, r4	@ y1, y
.L6:
@ /home/student/seng440/filter/butterworth_unrolled.c:92:     return y1;
	mov	r3, r6	@ _82, y1
@ /home/student/seng440/filter/butterworth_unrolled.c:93: }
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
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	b	.L9		@
.L10:
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L15	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L15+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L15+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L15+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L9:
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L10		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:116:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/seng440/filter/butterworth_unrolled.c:116:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L11		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:117:         perror("Unable to start benchmark timer");
	ldr	r3, .L15+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:118:         return 1;
	movs	r3, #1	@ _17,
	b	.L14		@
.L11:
@ /home/student/seng440/filter/butterworth_unrolled.c:121:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/seng440/filter/butterworth_unrolled.c:121:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/seng440/filter/butterworth_unrolled.c:123:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/seng440/filter/butterworth_unrolled.c:123:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L13		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:124:         perror("Unable to stop benchmark timer");
	ldr	r3, .L15+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:125:         return 1;
	movs	r3, #1	@ _17,
	b	.L14		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled.c:128:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L15+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/seng440/filter/butterworth_unrolled.c:130:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L15+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	vldr.64	d18, .L15+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/seng440/filter/butterworth_unrolled.c:140:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.0_13, y
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d18, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	vldr.64	d19, .L15+24	@ tmp175,
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
	ldr	r0, .L15+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:143:     return 0;
	movs	r3, #0	@ _17,
.L14:
@ /home/student/seng440/filter/butterworth_unrolled.c:144: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L16:
	.align	3
.L15:
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
