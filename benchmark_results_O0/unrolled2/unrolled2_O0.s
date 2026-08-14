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
	.file	"butterworth_pipelined2.c"
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
@ /home/student/seng440/filter/butterworth_pipelined2.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ /home/student/seng440/filter/butterworth_pipelined2.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ /home/student/seng440/filter/butterworth_pipelined2.c:20:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ /home/student/seng440/filter/butterworth_pipelined2.c:21:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ /home/student/seng440/filter/butterworth_pipelined2.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ /home/student/seng440/filter/butterworth_pipelined2.c:23:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:24: }
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp}	@
	sub	sp, sp, #8	@,,
	add	r7, sp, #0	@,,
	str	r0, [r7, #4]	@ x, x
	str	r1, [r7]	@ sample_count, sample_count
@ /home/student/seng440/filter/butterworth_pipelined2.c:28:     if (sample_count <= 0) {
	ldr	r3, [r7]	@ tmp204, sample_count
	cmp	r3, #0	@ tmp204,
	bgt	.L4		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:29:         return 0;
	movs	r3, #0	@ _85,
	b	.L5		@
.L4:
@ /home/student/seng440/filter/butterworth_pipelined2.c:32:     register int x1 = 0;
	mov	r10, #0	@ x1,
@ /home/student/seng440/filter/butterworth_pipelined2.c:33:     register int y1 = 0;
	mov	r8, #0	@ y1,
@ /home/student/seng440/filter/butterworth_pipelined2.c:34:     register int y2 = 0;
	mov	r9, #0	@ y2,
@ /home/student/seng440/filter/butterworth_pipelined2.c:37:     register int current_input = x[0];
	ldr	r3, [r7, #4]	@ tmp205, x
	ldr	r5, [r3]	@ current_input, *x_91(D)
@ /home/student/seng440/filter/butterworth_pipelined2.c:38:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.0_1,
	mul	r2, r3, r5	@ _2, b02_1.0_1, current_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:38:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r3, #1105	@ b02_1.1_3,
	lsls	r3, r3, #1	@ _4, b02_1.1_3,
@ /home/student/seng440/filter/butterworth_pipelined2.c:38:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r3, r3, r10	@ _5, _4, x1
@ /home/student/seng440/filter/butterworth_pipelined2.c:38:     register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	adds	r6, r2, r3	@ current_feedforward, _2, _5
@ /home/student/seng440/filter/butterworth_pipelined2.c:42:     for (i = 0; i + 2 < sample_count; i += 2) {
	movs	r4, #0	@ i,
@ /home/student/seng440/filter/butterworth_pipelined2.c:42:     for (i = 0; i + 2 < sample_count; i += 2) {
	b	.L6		@
.L7:
@ /home/student/seng440/filter/butterworth_pipelined2.c:45:             register int next_input = x[i + 1];
	mov	r3, r4	@ i.2_6, i
	adds	r3, r3, #1	@ _7, i.2_6,
	lsls	r3, r3, #2	@ _8, _7,
	ldr	r2, [r7, #4]	@ tmp206, x
	add	r3, r3, r2	@ _9, tmp206
@ /home/student/seng440/filter/butterworth_pipelined2.c:45:             register int next_input = x[i + 1];
	ldr	r1, [r3]	@ next_input, *_9
@ /home/student/seng440/filter/butterworth_pipelined2.c:46:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	movw	r3, #1105	@ b02_1.3_10,
	mul	r2, r3, r1	@ _11, b02_1.3_10, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:46:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	movw	r3, #1105	@ b02_1.4_12,
	lsls	r3, r3, #1	@ _13, b02_1.4_12,
@ /home/student/seng440/filter/butterworth_pipelined2.c:46:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mul	r3, r5, r3	@ _14, current_input, _13
@ /home/student/seng440/filter/butterworth_pipelined2.c:46:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	add	fp, r2, r3	@ next_feedforward, _11, _14
@ /home/student/seng440/filter/butterworth_pipelined2.c:47:             next_feedforward = ((next_feedforward) + (b02_1 * x1));
	movw	r3, #1105	@ b02_1.5_15,
	mul	r3, r3, r10	@ _16, b02_1.5_15, x1
@ /home/student/seng440/filter/butterworth_pipelined2.c:47:             next_feedforward = ((next_feedforward) + (b02_1 * x1));
	add	fp, fp, r3	@ next_feedforward, _16
@ /home/student/seng440/filter/butterworth_pipelined2.c:49:             register int y = ((current_feedforward) + (a1 * y1));
	movw	r3, #18727	@ a1.6_17,
	mul	r3, r3, r8	@ _18, a1.6_17, y1
@ /home/student/seng440/filter/butterworth_pipelined2.c:49:             register int y = ((current_feedforward) + (a1 * y1));
	add	r6, r6, r3	@ y, _18
@ /home/student/seng440/filter/butterworth_pipelined2.c:50:             y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.7_19,
	movt	r3, 65535	@ a2.7_19,
	mul	r3, r3, r9	@ _20, a2.7_19, y2
@ /home/student/seng440/filter/butterworth_pipelined2.c:50:             y = ((y) + (a2 * y2));
	add	r6, r6, r3	@ y, _20
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r6, #14	@ _21, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r6, #0, #14	@ _22, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _22,
	ite	ne
	movne	r2, #1	@ tmp208,
	moveq	r2, #0	@ tmp208,
	uxtb	r2, r2	@ _23, _23
@ /home/student/seng440/filter/butterworth_pipelined2.c:51:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r6, r3, r2	@ y, _21, _24
@ /home/student/seng440/filter/butterworth_pipelined2.c:53:             x1 = current_input;
	mov	r10, r5	@ x1, current_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:54:             current_input = next_input;
	mov	r5, r1	@ current_input, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:55:             y2 = y1;
	mov	r9, r8	@ y2, y1
@ /home/student/seng440/filter/butterworth_pipelined2.c:56:             y1 = y;
	mov	r8, r6	@ y1, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:57:             current_feedforward = next_feedforward;
	mov	r6, fp	@ current_feedforward, next_feedforward
@ /home/student/seng440/filter/butterworth_pipelined2.c:62:             register int next_input = x[i + 2];
	mov	r3, r4	@ i.8_25, i
	adds	r3, r3, #2	@ _26, i.8_25,
	lsls	r3, r3, #2	@ _27, _26,
	ldr	r2, [r7, #4]	@ tmp209, x
	add	r3, r3, r2	@ _28, tmp209
@ /home/student/seng440/filter/butterworth_pipelined2.c:62:             register int next_input = x[i + 2];
	ldr	r1, [r3]	@ next_input, *_28
@ /home/student/seng440/filter/butterworth_pipelined2.c:63:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	movw	r3, #1105	@ b02_1.9_29,
	mul	r2, r3, r1	@ _30, b02_1.9_29, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:63:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	movw	r3, #1105	@ b02_1.10_31,
	lsls	r3, r3, #1	@ _32, b02_1.10_31,
@ /home/student/seng440/filter/butterworth_pipelined2.c:63:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mul	r3, r5, r3	@ _33, current_input, _32
@ /home/student/seng440/filter/butterworth_pipelined2.c:63:             register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	add	fp, r2, r3	@ next_feedforward, _30, _33
@ /home/student/seng440/filter/butterworth_pipelined2.c:64:             next_feedforward = ((next_feedforward) + (b02_1 * x1));
	movw	r3, #1105	@ b02_1.11_34,
	mul	r3, r3, r10	@ _35, b02_1.11_34, x1
@ /home/student/seng440/filter/butterworth_pipelined2.c:64:             next_feedforward = ((next_feedforward) + (b02_1 * x1));
	add	fp, fp, r3	@ next_feedforward, _35
@ /home/student/seng440/filter/butterworth_pipelined2.c:66:             register int y = ((current_feedforward) + (a1 * y1));
	movw	r3, #18727	@ a1.12_36,
	mul	r3, r3, r8	@ _37, a1.12_36, y1
@ /home/student/seng440/filter/butterworth_pipelined2.c:66:             register int y = ((current_feedforward) + (a1 * y1));
	add	r6, r6, r3	@ y, _37
@ /home/student/seng440/filter/butterworth_pipelined2.c:67:             y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.13_38,
	movt	r3, 65535	@ a2.13_38,
	mul	r3, r3, r9	@ _39, a2.13_38, y2
@ /home/student/seng440/filter/butterworth_pipelined2.c:67:             y = ((y) + (a2 * y2));
	add	r6, r6, r3	@ y, _39
@ /home/student/seng440/filter/butterworth_pipelined2.c:68:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r6, #14	@ _40, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:68:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r6, #0, #14	@ _41, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:68:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _41,
	ite	ne
	movne	r2, #1	@ tmp211,
	moveq	r2, #0	@ tmp211,
	uxtb	r2, r2	@ _42, _42
@ /home/student/seng440/filter/butterworth_pipelined2.c:68:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r6, r3, r2	@ y, _40, _43
@ /home/student/seng440/filter/butterworth_pipelined2.c:70:             x1 = current_input;
	mov	r10, r5	@ x1, current_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:71:             current_input = next_input;
	mov	r5, r1	@ current_input, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:72:             y2 = y1;
	mov	r9, r8	@ y2, y1
@ /home/student/seng440/filter/butterworth_pipelined2.c:73:             y1 = y;
	mov	r8, r6	@ y1, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:74:             current_feedforward = next_feedforward;
	mov	r6, fp	@ current_feedforward, next_feedforward
@ /home/student/seng440/filter/butterworth_pipelined2.c:42:     for (i = 0; i + 2 < sample_count; i += 2) {
	adds	r4, r4, #2	@ i, i,
.L6:
@ /home/student/seng440/filter/butterworth_pipelined2.c:42:     for (i = 0; i + 2 < sample_count; i += 2) {
	adds	r3, r4, #2	@ _44, i,
@ /home/student/seng440/filter/butterworth_pipelined2.c:42:     for (i = 0; i + 2 < sample_count; i += 2) {
	ldr	r2, [r7]	@ tmp212, sample_count
	cmp	r2, r3	@ tmp212, _44
	bgt	.L7		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:79:     for (; i + 1 < sample_count; i++) {
	b	.L8		@
.L9:
@ /home/student/seng440/filter/butterworth_pipelined2.c:80:         register int next_input = x[i + 1];
	mov	r3, r4	@ i.14_45, i
	adds	r3, r3, #1	@ _46, i.14_45,
	lsls	r3, r3, #2	@ _47, _46,
	ldr	r2, [r7, #4]	@ tmp213, x
	add	r3, r3, r2	@ _48, tmp213
@ /home/student/seng440/filter/butterworth_pipelined2.c:80:         register int next_input = x[i + 1];
	ldr	r1, [r3]	@ next_input, *_48
@ /home/student/seng440/filter/butterworth_pipelined2.c:81:         register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	movw	r3, #1105	@ b02_1.15_49,
	mul	r2, r3, r1	@ _50, b02_1.15_49, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:81:         register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	movw	r3, #1105	@ b02_1.16_51,
	lsls	r3, r3, #1	@ _52, b02_1.16_51,
@ /home/student/seng440/filter/butterworth_pipelined2.c:81:         register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	mul	r3, r5, r3	@ _53, current_input, _52
@ /home/student/seng440/filter/butterworth_pipelined2.c:81:         register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
	add	fp, r2, r3	@ next_feedforward, _50, _53
@ /home/student/seng440/filter/butterworth_pipelined2.c:82:         next_feedforward = ((next_feedforward) + (b02_1 * x1));
	movw	r3, #1105	@ b02_1.17_54,
	mul	r3, r3, r10	@ _55, b02_1.17_54, x1
@ /home/student/seng440/filter/butterworth_pipelined2.c:82:         next_feedforward = ((next_feedforward) + (b02_1 * x1));
	add	fp, fp, r3	@ next_feedforward, _55
@ /home/student/seng440/filter/butterworth_pipelined2.c:84:         register int y = ((current_feedforward) + (a1 * y1));
	movw	r3, #18727	@ a1.18_56,
	mul	r3, r3, r8	@ _57, a1.18_56, y1
@ /home/student/seng440/filter/butterworth_pipelined2.c:84:         register int y = ((current_feedforward) + (a1 * y1));
	add	r6, r6, r3	@ y, _57
@ /home/student/seng440/filter/butterworth_pipelined2.c:85:         y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.19_58,
	movt	r3, 65535	@ a2.19_58,
	mul	r3, r3, r9	@ _59, a2.19_58, y2
@ /home/student/seng440/filter/butterworth_pipelined2.c:85:         y = ((y) + (a2 * y2));
	add	r6, r6, r3	@ y, _59
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r6, #14	@ _60, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r6, #0, #14	@ _61, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _61,
	ite	ne
	movne	r2, #1	@ tmp215,
	moveq	r2, #0	@ tmp215,
	uxtb	r2, r2	@ _62, _62
@ /home/student/seng440/filter/butterworth_pipelined2.c:86:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r6, r3, r2	@ y, _60, _63
@ /home/student/seng440/filter/butterworth_pipelined2.c:88:         x1 = current_input;
	mov	r10, r5	@ x1, current_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:89:         current_input = next_input;
	mov	r5, r1	@ current_input, next_input
@ /home/student/seng440/filter/butterworth_pipelined2.c:90:         y2 = y1;
	mov	r9, r8	@ y2, y1
@ /home/student/seng440/filter/butterworth_pipelined2.c:91:         y1 = y;
	mov	r8, r6	@ y1, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:92:         current_feedforward = next_feedforward;
	mov	r6, fp	@ current_feedforward, next_feedforward
@ /home/student/seng440/filter/butterworth_pipelined2.c:79:     for (; i + 1 < sample_count; i++) {
	adds	r4, r4, #1	@ i, i,
.L8:
@ /home/student/seng440/filter/butterworth_pipelined2.c:79:     for (; i + 1 < sample_count; i++) {
	adds	r3, r4, #1	@ _64, i,
@ /home/student/seng440/filter/butterworth_pipelined2.c:79:     for (; i + 1 < sample_count; i++) {
	ldr	r2, [r7]	@ tmp216, sample_count
	cmp	r2, r3	@ tmp216, _64
	bgt	.L9		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:96:     register int y = ((current_feedforward) + (a1 * y1));
	movw	r3, #18727	@ a1.20_65,
	mul	r3, r3, r8	@ _66, a1.20_65, y1
@ /home/student/seng440/filter/butterworth_pipelined2.c:96:     register int y = ((current_feedforward) + (a1 * y1));
	adds	r4, r6, r3	@ y, current_feedforward, _66
@ /home/student/seng440/filter/butterworth_pipelined2.c:97:     y = ((y) + (a2 * y2));
	movw	r3, #58773	@ a2.21_67,
	movt	r3, 65535	@ a2.21_67,
	mul	r3, r3, r9	@ _68, a2.21_67, y2
@ /home/student/seng440/filter/butterworth_pipelined2.c:97:     y = ((y) + (a2 * y2));
	add	r4, r4, r3	@ y, _68
@ /home/student/seng440/filter/butterworth_pipelined2.c:98:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r4, #14	@ _69, y,
@ /home/student/seng440/filter/butterworth_pipelined2.c:98:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r4, #0, #14	@ _70, y,,
@ /home/student/seng440/filter/butterworth_pipelined2.c:98:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _70,
	ite	ne
	movne	r2, #1	@ tmp218,
	moveq	r2, #0	@ tmp218,
	uxtb	r2, r2	@ _71, _71
@ /home/student/seng440/filter/butterworth_pipelined2.c:98:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r4, r3, r2	@ y, _69, _72
@ /home/student/seng440/filter/butterworth_pipelined2.c:100:     return y;
	mov	r3, r4	@ _85, y
.L5:
@ /home/student/seng440/filter/butterworth_pipelined2.c:101: }
	mov	r0, r3	@, <retval>
	adds	r7, r7, #8	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp}	@
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
@ /home/student/seng440/filter/butterworth_pipelined2.c:107:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ /home/student/seng440/filter/butterworth_pipelined2.c:107:     for (int n = 0; n < N; n++) {
	b	.L11		@
.L12:
@ /home/student/seng440/filter/butterworth_pipelined2.c:108:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ /home/student/seng440/filter/butterworth_pipelined2.c:108:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L17	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ /home/student/seng440/filter/butterworth_pipelined2.c:109:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L17+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ /home/student/seng440/filter/butterworth_pipelined2.c:109:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L17+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L17+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ /home/student/seng440/filter/butterworth_pipelined2.c:113:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ /home/student/seng440/filter/butterworth_pipelined2.c:107:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L11:
@ /home/student/seng440/filter/butterworth_pipelined2.c:107:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L12		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:119:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ /home/student/seng440/filter/butterworth_pipelined2.c:119:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L13		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:120:         perror("Unable to start benchmark timer");
	ldr	r3, .L17+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:121:         return 1;
	movs	r3, #1	@ _17,
	b	.L16		@
.L13:
@ /home/student/seng440/filter/butterworth_pipelined2.c:124:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ /home/student/seng440/filter/butterworth_pipelined2.c:124:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ /home/student/seng440/filter/butterworth_pipelined2.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ /home/student/seng440/filter/butterworth_pipelined2.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L15		@,
@ /home/student/seng440/filter/butterworth_pipelined2.c:127:         perror("Unable to stop benchmark timer");
	ldr	r3, .L17+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:128:         return 1;
	movs	r3, #1	@ _17,
	b	.L16		@
.L15:
@ /home/student/seng440/filter/butterworth_pipelined2.c:131:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ /home/student/seng440/filter/butterworth_pipelined2.c:132:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ /home/student/seng440/filter/butterworth_pipelined2.c:132:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L17+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ /home/student/seng440/filter/butterworth_pipelined2.c:133:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L17+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ /home/student/seng440/filter/butterworth_pipelined2.c:142:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ /home/student/seng440/filter/butterworth_pipelined2.c:142:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ /home/student/seng440/filter/butterworth_pipelined2.c:135:     printf(
	vldr.64	d18, .L17+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ /home/student/seng440/filter/butterworth_pipelined2.c:143:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.22_13, y
	vmov	s15, r3	@ int	@ y.22_13, y.22_13
	vcvt.f64.s32	d18, s15	@ _14, y.22_13
@ /home/student/seng440/filter/butterworth_pipelined2.c:135:     printf(
	vldr.64	d19, .L17+24	@ tmp175,
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
	ldr	r0, .L17+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ /home/student/seng440/filter/butterworth_pipelined2.c:146:     return 0;
	movs	r3, #0	@ _17,
.L16:
@ /home/student/seng440/filter/butterworth_pipelined2.c:147: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L18:
	.align	3
.L17:
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
