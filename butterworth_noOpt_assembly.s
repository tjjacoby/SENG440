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
	.file	"butterworth_noOpt.c"
@ GNU C17 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd
	.text
	.section	.rodata
	.align	2
	.type	b0, %object
	.size	b0, 4
b0:
	.word	1105
	.align	2
	.type	b1, %object
	.size	b1, 4
b1:
	.word	2210
	.align	2
	.type	b2, %object
	.size	b2, 4
b2:
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
@ butterworth_noOpt.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #24]	@ tmp124, end
	ldrd	r0, [r3]	@ _1, end_10(D)->tv_sec
@ butterworth_noOpt.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #28]	@ tmp125, start
	ldrd	r2, [r3]	@ _2, start_11(D)->tv_sec
@ butterworth_noOpt.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r6, r0, r2	@ tmp145, _1, _2
	str	r6, [r7, #8]	@ tmp145, %sfp
	sbc	r3, r1, r3	@ tmp146, _1, _2
	str	r3, [r7, #12]	@ tmp146, %sfp
	ldrd	r2, [r7, #8]	@ seconds_12,,
	strd	r2, [r7, #40]	@ seconds_12,,
@ butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #24]	@ tmp127, end
	ldr	r3, [r3, #8]	@ _3, end_10(D)->tv_nsec
@ butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp128, _3,
	mov	r10, r3	@ _4, _3
	mov	fp, r2	@ _4, tmp128
@ butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r3, [r7, #28]	@ tmp129, start
	ldr	r3, [r3, #8]	@ _5, start_11(D)->tv_nsec
@ butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r3, #31	@ tmp130, _5,
	mov	r8, r3	@ _6, _5
	mov	r9, r2	@ _6, tmp130
@ butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r3, r10, r8	@ tmp148, _4, _6
	str	r3, [r7]	@ tmp148, %sfp
	sbc	r3, fp, r9	@ tmp149, _4, _6
	str	r3, [r7, #4]	@ tmp149, %sfp
	ldrd	r2, [r7]	@ nanoseconds_13, %sfp
	strd	r2, [r7, #32]	@ nanoseconds_13,,
@ butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
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
@ butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #32]	@ tmp142,,
	adds	r1, r4, r2	@ tmp151, _7, tmp142
	str	r1, [r7, #16]	@ tmp151, %sfp
	adc	r3, r5, r3	@ tmp152, _7,
	str	r3, [r7, #20]	@ tmp152, %sfp
@ butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	ldrd	r2, [r7, #16]	@ _14,,
@ butterworth_noOpt.c:29: }
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
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}	@
	sub	sp, sp, #100	@,,
	add	r7, sp, #0	@,,
	str	r0, [r7, #4]	@ x, x
	str	r1, [r7]	@ sample_count, sample_count
@ butterworth_noOpt.c:34:     int x1 = 0;
	movs	r3, #0	@ tmp133,
	str	r3, [r7, #92]	@ tmp133, x1
@ butterworth_noOpt.c:35:     int x2 = 0;
	movs	r3, #0	@ tmp134,
	str	r3, [r7, #88]	@ tmp134, x2
@ butterworth_noOpt.c:36:     int y1 = 0;
	movs	r3, #0	@ tmp135,
	str	r3, [r7, #84]	@ tmp135, y1
@ butterworth_noOpt.c:37:     int y2 = 0;
	movs	r3, #0	@ tmp136,
	str	r3, [r7, #80]	@ tmp136, y2
@ butterworth_noOpt.c:40:     for (int n = 0; n < sample_count; n++) {
	movs	r3, #0	@ tmp137,
	str	r3, [r7, #76]	@ tmp137, n
@ butterworth_noOpt.c:40:     for (int n = 0; n < sample_count; n++) {
	b	.L4		@
.L9:
@ butterworth_noOpt.c:50:         temp1 = b0 * x[n];
	ldr	r3, [r7, #76]	@ n.0_1, n
	lsls	r3, r3, #2	@ _2, n.0_1,
	ldr	r2, [r7, #4]	@ tmp138, x
	add	r3, r3, r2	@ _3, tmp138
	ldr	r3, [r3]	@ _4, *_3
@ butterworth_noOpt.c:50:         temp1 = b0 * x[n];
	movw	r2, #1105	@ b0.1_5,
@ butterworth_noOpt.c:50:         temp1 = b0 * x[n];
	mul	r3, r2, r3	@ temp1_29, b0.1_5, _4
	str	r3, [r7, #72]	@ temp1_29, temp1
@ butterworth_noOpt.c:51:         temp2 = b1 * x1;
	movw	r2, #2210	@ b1.2_6,
@ butterworth_noOpt.c:51:         temp2 = b1 * x1;
	ldr	r3, [r7, #92]	@ tmp141, x1
	mul	r3, r2, r3	@ temp2_30, b1.2_6, tmp141
	str	r3, [r7, #68]	@ temp2_30, temp2
@ butterworth_noOpt.c:52:         temp3 = b2 * x2;
	movw	r2, #1105	@ b2.3_7,
@ butterworth_noOpt.c:52:         temp3 = b2 * x2;
	ldr	r3, [r7, #88]	@ tmp143, x2
	mul	r3, r2, r3	@ temp3_31, b2.3_7, tmp143
	str	r3, [r7, #64]	@ temp3_31, temp3
@ butterworth_noOpt.c:53:         temp4 = a1 * y1;
	movw	r2, #18727	@ a1.4_8,
@ butterworth_noOpt.c:53:         temp4 = a1 * y1;
	ldr	r3, [r7, #84]	@ tmp145, y1
	mul	r3, r2, r3	@ temp4_32, a1.4_8, tmp145
	str	r3, [r7, #60]	@ temp4_32, temp4
	ldr	r3, [r7, #72]	@ tmp146, temp1
	str	r3, [r7, #16]	@ tmp146, first
	ldr	r3, [r7, #68]	@ tmp147, temp2
	str	r3, [r7, #12]	@ tmp147, second
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #16]	@ tmp149, first
	ldr	r2, [r7, #12]	@ tmp150, second
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp149, tmp150
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #8]	@ result, result
@ /home/student/seng440/filter/cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #8]	@ D.7781, result
@ butterworth_noOpt.c:56:         int y = __QADD(temp1, temp2);
	str	r3, [r7, #56]	@ D.7781, y
	ldr	r3, [r7, #56]	@ tmp151, y
	str	r3, [r7, #28]	@ tmp151, first
	ldr	r3, [r7, #64]	@ tmp152, temp3
	str	r3, [r7, #24]	@ tmp152, second
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #28]	@ tmp154, first
	ldr	r2, [r7, #24]	@ tmp155, second
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp154, tmp155
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #20]	@ result, result
@ /home/student/seng440/filter/cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #20]	@ D.7775, result
@ butterworth_noOpt.c:57:         y = __QADD(y, temp3);
	str	r3, [r7, #56]	@ D.7775, y
	ldr	r3, [r7, #56]	@ tmp156, y
	str	r3, [r7, #40]	@ tmp156, first
	ldr	r3, [r7, #60]	@ tmp157, temp4
	str	r3, [r7, #36]	@ tmp157, second
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #40]	@ tmp159, first
	ldr	r2, [r7, #36]	@ tmp160, second
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp159, tmp160
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #32]	@ result, result
@ /home/student/seng440/filter/cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #32]	@ D.7769, result
@ butterworth_noOpt.c:58:         y = __QADD(y, temp4);
	str	r3, [r7, #56]	@ D.7769, y
@ butterworth_noOpt.c:59:         y = __QADD(y, a2 * y2);
	movw	r3, #58773	@ a2.5_9,
	movt	r3, 65535	@ a2.5_9,
	ldr	r2, [r7, #80]	@ tmp161, y2
	mul	r3, r2, r3	@ _10, tmp161, a2.5_9
	ldr	r2, [r7, #56]	@ tmp162, y
	str	r2, [r7, #52]	@ tmp162, first
	str	r3, [r7, #48]	@ _10, second
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [r7, #52]	@ tmp164, first
	ldr	r2, [r7, #48]	@ tmp165, second
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, tmp164, tmp165
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #44]	@ result, result
@ /home/student/seng440/filter/cmsis_compiler.h:31:     return result;
	ldr	r3, [r7, #44]	@ D.7763, result
@ butterworth_noOpt.c:59:         y = __QADD(y, a2 * y2);
	str	r3, [r7, #56]	@ D.7763, y
@ butterworth_noOpt.c:60:         y = y >> 14;
	ldr	r3, [r7, #56]	@ tmp167, y
	asrs	r3, r3, #14	@ y_37, tmp167,
	str	r3, [r7, #56]	@ y_37, y
@ butterworth_noOpt.c:62:         x2 = x1;
	ldr	r3, [r7, #92]	@ tmp168, x1
	str	r3, [r7, #88]	@ tmp168, x2
@ butterworth_noOpt.c:63:         x1 = x[n];
	ldr	r3, [r7, #76]	@ n.6_11, n
	lsls	r3, r3, #2	@ _12, n.6_11,
	ldr	r2, [r7, #4]	@ tmp169, x
	add	r3, r3, r2	@ _13, tmp169
@ butterworth_noOpt.c:63:         x1 = x[n];
	ldr	r3, [r3]	@ tmp170, *_13
	str	r3, [r7, #92]	@ tmp170, x1
@ butterworth_noOpt.c:65:         y2 = y1;
	ldr	r3, [r7, #84]	@ tmp171, y1
	str	r3, [r7, #80]	@ tmp171, y2
@ butterworth_noOpt.c:66:         y1 = y;
	ldr	r3, [r7, #56]	@ tmp172, y
	str	r3, [r7, #84]	@ tmp172, y1
@ butterworth_noOpt.c:40:     for (int n = 0; n < sample_count; n++) {
	ldr	r3, [r7, #76]	@ tmp174, n
	adds	r3, r3, #1	@ n_42, tmp174,
	str	r3, [r7, #76]	@ n_42, n
.L4:
@ butterworth_noOpt.c:40:     for (int n = 0; n < sample_count; n++) {
	ldr	r2, [r7, #76]	@ tmp175, n
	ldr	r3, [r7]	@ tmp176, sample_count
	cmp	r2, r3	@ tmp175, tmp176
	blt	.L9		@,
@ butterworth_noOpt.c:68:     return y1;
	ldr	r3, [r7, #84]	@ _27, y1
@ butterworth_noOpt.c:69: }
	mov	r0, r3	@, <retval>
	adds	r7, r7, #100	@,,
	mov	sp, r7	@,
	@ sp needed	@
	ldr	r7, [sp], #4	@,
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
@ butterworth_noOpt.c:79:     for (int n = 0; n < N; n++) {
	movs	r3, #0	@ tmp131,
	add	r2, r7, #798720	@ tmp182,,
	addw	r2, r2, #1364	@ tmp182, tmp182,
	str	r3, [r2]	@ tmp131, n
@ butterworth_noOpt.c:79:     for (int n = 0; n < N; n++) {
	b	.L12		@
.L13:
@ butterworth_noOpt.c:80:         double time = (double)n / SAMPLE_RATE;
	add	r3, r7, #798720	@ tmp184,,
	addw	r3, r3, #1364	@ tmp184, tmp184,
	ldr	r3, [r3]	@ tmp132, n
	vmov	s15, r3	@ int	@ tmp132, tmp132
	vcvt.f64.s32	d17, s15	@ _1, tmp132
@ butterworth_noOpt.c:80:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d18, .L18	@ tmp134,
	vdiv.f64	d16, d17, d18	@ time_39, _1, tmp134
	add	r3, r7, #798720	@ tmp187,,
	add	r3, r3, #1328	@ tmp187, tmp187,
	vstr.64	d16, [r3]	@ time_39, time
@ butterworth_noOpt.c:82:         double input = INPUT_AMPLITUDE * sin(
	add	r3, r7, #798720	@ tmp189,,
	add	r3, r3, #1328	@ tmp189, tmp189,
	vldr.64	d16, [r3]	@ tmp135, time
	vldr.64	d17, .L18+8	@ tmp136,
	vmul.f64	d16, d16, d17	@ _2, tmp135, tmp136
	vmov.f64	d0, d16	@, _2
	bl	sin(PLT)	@
	vmov.f64	d16, d0	@ _3,
@ butterworth_noOpt.c:82:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d17, .L18+16	@ tmp138,
	vmul.f64	d16, d16, d17	@ input_40, _3, tmp138
	add	r3, r7, #798720	@ tmp191,,
	add	r3, r3, #1320	@ tmp191, tmp191,
	vstr.64	d16, [r3]	@ input_40, input
@ butterworth_noOpt.c:86:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #798720	@ tmp193,,
	add	r3, r3, #1320	@ tmp193, tmp193,
	vldr.64	d16, [r3]	@ tmp139, input
	vldr.64	d17, .L18+24	@ tmp140,
	vmul.f64	d16, d16, d17	@ _4, tmp139, tmp140
@ butterworth_noOpt.c:86:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s15, d16	@ _5, _4
	vmov	r1, s15	@ int	@ _5, _5
@ butterworth_noOpt.c:86:         x[n] = (int)(input * (1 << 14));
	add	r3, r7, #1368	@ tmp142,,
	sub	r3, r3, #1328	@ tmp144, tmp141,
	add	r2, r7, #798720	@ tmp196,,
	addw	r2, r2, #1364	@ tmp196, tmp196,
	ldr	r2, [r2]	@ tmp145, n
	str	r1, [r3, r2, lsl #2]	@ _5, x[n_16]
@ butterworth_noOpt.c:79:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp198,,
	addw	r3, r3, #1364	@ tmp198, tmp198,
	ldr	r3, [r3]	@ tmp147, n
	adds	r3, r3, #1	@ n_42, tmp147,
	add	r2, r7, #798720	@ tmp200,,
	addw	r2, r2, #1364	@ tmp200, tmp200,
	str	r3, [r2]	@ n_42, n
.L12:
@ butterworth_noOpt.c:79:     for (int n = 0; n < N; n++) {
	add	r3, r7, #798720	@ tmp202,,
	addw	r3, r3, #1364	@ tmp202, tmp202,
	ldr	r2, [r3]	@ tmp148, n
	movw	r3, #3391	@ tmp149,
	movt	r3, 3	@ tmp149,
	cmp	r2, r3	@ tmp148, tmp149
	ble	.L13		@,
@ butterworth_noOpt.c:92:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	add	r3, r7, #1368	@ tmp150,,
	sub	r3, r3, #1344	@ tmp150, tmp150,
	mov	r1, r3	@, tmp150
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _6,
@ butterworth_noOpt.c:92:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	cmp	r3, #0	@ _6,
	beq	.L14		@,
@ butterworth_noOpt.c:93:         perror("Unable to start benchmark timer");
	ldr	r3, .L18+48	@ tmp151,
.LPIC0:
	add	r3, pc	@ tmp151
	mov	r0, r3	@, tmp151
	bl	perror(PLT)	@
@ butterworth_noOpt.c:94:         return 1;
	movs	r3, #1	@ _17,
	b	.L17		@
.L14:
@ butterworth_noOpt.c:97:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp152,,
	sub	r3, r3, #1328	@ tmp152, tmp152,
	mov	r1, #3392	@,
	movt	r1, 3	@,
	mov	r0, r3	@, tmp152
	bl	run_IIR(PLT)	@
	mov	r2, r0	@ _7,
@ butterworth_noOpt.c:97:     volatile int y = run_IIR(x, N);
	add	r3, r7, #1368	@ tmp154,,
	subw	r3, r3, #1364	@ tmp156, tmp153,
	str	r2, [r3]	@ _7, y
@ butterworth_noOpt.c:99:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	add	r3, r7, #1368	@ tmp157,,
	sub	r3, r3, #1360	@ tmp157, tmp157,
	mov	r1, r3	@, tmp157
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
	mov	r3, r0	@ _8,
@ butterworth_noOpt.c:99:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	cmp	r3, #0	@ _8,
	beq	.L16		@,
@ butterworth_noOpt.c:100:         perror("Unable to stop benchmark timer");
	ldr	r3, .L18+52	@ tmp158,
.LPIC1:
	add	r3, pc	@ tmp158
	mov	r0, r3	@, tmp158
	bl	perror(PLT)	@
@ butterworth_noOpt.c:101:         return 1;
	movs	r3, #1	@ _17,
	b	.L17		@
.L16:
@ butterworth_noOpt.c:104:     uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
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
@ butterworth_noOpt.c:105:     double ns_per_sample = (double)elapsed_ns / (double)N;
	add	r3, r7, #798720	@ tmp206,,
	add	r3, r3, #1352	@ tmp206, tmp206,
	ldrd	r0, [r3]	@, elapsed_ns
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ _9,
@ butterworth_noOpt.c:105:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L18+32	@ tmp162,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_28, _9, tmp162
	add	r3, r7, #798720	@ tmp208,,
	add	r3, r3, #1344	@ tmp208, tmp208,
	vstr.64	d16, [r3]	@ ns_per_sample_28, ns_per_sample
@ butterworth_noOpt.c:106:     double final_time = (double)(N - 1) / SAMPLE_RATE;
	adr	r3, .L18+40	@,
	ldrd	r2, [r3]	@ tmp163,
	add	r1, r7, #798720	@ tmp210,,
	add	r1, r1, #1336	@ tmp210, tmp210,
	strd	r2, [r1]	@ tmp163, final_time
@ butterworth_noOpt.c:115:         (double)x[N - 1] / (1 << 14),
	add	r3, r7, #1368	@ tmp165,,
	sub	r3, r3, #1328	@ tmp167, tmp164,
	add	r3, r3, #798720	@ tmp169, tmp167,
	ldr	r3, [r3, #1276]	@ _10, x[199999]
@ butterworth_noOpt.c:115:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ _10, _10
	vcvt.f64.s32	d17, s15	@ _11, _10
@ butterworth_noOpt.c:108:     printf(
	vldr.64	d18, .L18+24	@ tmp170,
	vdiv.f64	d16, d17, d18	@ _12, _11, tmp170
@ butterworth_noOpt.c:116:         (double)y / (1 << 14)
	add	r3, r7, #1368	@ tmp172,,
	subw	r3, r3, #1364	@ tmp174, tmp171,
	ldr	r3, [r3]	@ y.7_13, y
	vmov	s15, r3	@ int	@ y.7_13, y.7_13
	vcvt.f64.s32	d18, s15	@ _14, y.7_13
@ butterworth_noOpt.c:108:     printf(
	vldr.64	d19, .L18+24	@ tmp175,
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
	ldr	r0, .L18+56	@ tmp178,
.LPIC2:
	add	r0, pc	@ tmp178
	bl	printf(PLT)	@
@ butterworth_noOpt.c:119:     return 0;
	movs	r3, #0	@ _17,
.L17:
@ butterworth_noOpt.c:120: }
	mov	r0, r3	@, <retval>
	add	r7, r7, #798720	@,,
	add	r7, r7, #1368	@,,
	mov	sp, r7	@,
	@ sp needed	@
	pop	{r7, pc}	@
.L19:
	.align	3
.L18:
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
