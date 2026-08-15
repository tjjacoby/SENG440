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
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"butterworth_noOpt.c"
@ GNU C17 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -marm -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -march=armv7ve+simd -O3
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
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
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	movw	r6, #13636	@ _118,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r6, 12	@ _118,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1344	@,,
@ /home/student/ARM_TEST/butterworth_noOpt.c:89:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp168,
@ /home/student/ARM_TEST/butterworth_noOpt.c:77: {
	sub	sp, sp, #12	@,,
@ /home/student/ARM_TEST/butterworth_noOpt.c:82:     for (int n = 0; n < N; n++) {
	mov	r5, #1	@ n,
	add	r6, sp, r6	@ _118,, _118
@ /home/student/ARM_TEST/butterworth_noOpt.c:89:         x[n] = (int)(input * (1 << 14));
	add	r7, sp, #1344	@ tmp280,,
	add	r7, r7, #8	@ tmp280, tmp280,
	mov	r8, r7	@ tmp279, tmp280
@ /home/student/ARM_TEST/butterworth_noOpt.c:83:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp173,
@ /home/student/ARM_TEST/butterworth_noOpt.c:85:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp175,
@ /home/student/ARM_TEST/butterworth_noOpt.c:85:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp177,
@ /home/student/ARM_TEST/butterworth_noOpt.c:89:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp179,
@ /home/student/ARM_TEST/butterworth_noOpt.c:89:         x[n] = (int)(input * (1 << 14));
	str	r3, [r8, #-1280]!	@ tmp168, x[0]
	mov	r4, r8	@ ivtmp.29, tmp279
.L2:
@ /home/student/ARM_TEST/butterworth_noOpt.c:83:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_noOpt.c:82:     for (int n = 0; n < N; n++) {
	add	r5, r5, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_noOpt.c:83:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _72, n
@ /home/student/ARM_TEST/butterworth_noOpt.c:83:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _30, _72, tmp173
@ /home/student/ARM_TEST/butterworth_noOpt.c:85:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _30, tmp175
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_noOpt.c:85:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp282, tmp177
@ /home/student/ARM_TEST/butterworth_noOpt.c:89:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp179
@ /home/student/ARM_TEST/butterworth_noOpt.c:89:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp180, _4
	vmov	r3, s0	@ int	@ tmp180, tmp180
	str	r3, [r4, #4]!	@ tmp180, MEM[(int *)_120]
@ /home/student/ARM_TEST/butterworth_noOpt.c:82:     for (int n = 0; n < N; n++) {
	cmp	r6, r4	@ _118, ivtmp.29
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_noOpt.c:95:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r7, #1312	@, tmp280,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_noOpt.c:95:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r2, r0, #0	@ x1, tmp283
	bne	.L12		@,
@ /home/student/ARM_TEST/butterworth_noOpt.c:59:         y = __QADD(y, a2 * y2);
	movw	r4, #58773	@ tmp200,
	sub	r1, r8, #4	@ ivtmp.18, tmp279,
	movt	r4, 65535	@ tmp200,
@ /home/student/ARM_TEST/butterworth_noOpt.c:37:     int y2 = 0;
	mov	r9, r2	@ y2, x1
@ /home/student/ARM_TEST/butterworth_noOpt.c:36:     int y1 = 0;
	mov	r0, r2	@ y1, x1
@ /home/student/ARM_TEST/butterworth_noOpt.c:35:     int x2 = 0;
	mov	r10, r2	@ x2, x1
@ /home/student/ARM_TEST/butterworth_noOpt.c:50:         temp1 = b0 * x[n];
	movw	lr, #1105	@ tmp189,
@ /home/student/ARM_TEST/butterworth_noOpt.c:51:         temp2 = b1 * x1;
	movw	r8, #2210	@ tmp191,
@ /home/student/ARM_TEST/butterworth_noOpt.c:53:         temp4 = a1 * y1;
	movw	r5, #18727	@ tmp197,
.L5:
@ /home/student/ARM_TEST/butterworth_noOpt.c:50:         temp1 = b0 * x[n];
	ldr	ip, [r1, #4]!	@ _52, MEM[(const int *)_126]
@ /home/student/ARM_TEST/butterworth_noOpt.c:51:         temp2 = b1 * x1;
	mul	fp, r8, r2	@ temp2_55, tmp191, x1
@ /home/student/ARM_TEST/butterworth_noOpt.c:50:         temp1 = b0 * x[n];
	mul	r3, lr, ip	@ temp1_53, tmp189, _52
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, temp1_53, temp2_55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_noOpt.c:52:         temp3 = b2 * x2;
	.arm
	.syntax unified
	mul	r10, lr, r10	@ temp3_57, tmp189, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, temp3_57
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_noOpt.c:53:         temp4 = a1 * y1;
	.arm
	.syntax unified
	mul	r10, r5, r0	@ temp4_59, tmp197, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, temp4_59
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_noOpt.c:59:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r9, r4, r9	@ _64, tmp200, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_noOpt.c:63:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments
	.arm
	.syntax unified
	ubfx	r9, r3, #0, #14	@ _67, result,,
	mov	r10, r2	@ x2, x1
@ /home/student/ARM_TEST/butterworth_noOpt.c:63:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments
	asr	r3, r3, #14	@ _66, result,
	mov	r2, ip	@ x1, _52
@ /home/student/ARM_TEST/butterworth_noOpt.c:63:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments
	cmp	r9, #0	@ _67,
	orrne	r3, r3, #1	@,, y, _66
	mov	r9, r0	@ y2, y1
@ /home/student/ARM_TEST/butterworth_noOpt.c:40:     for (int n = 0; n < sample_count; n++) {
	cmp	r6, r1	@ _118, ivtmp.18
	mov	r0, r3	@ y1, y
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_noOpt.c:100:     volatile int y = run_IIR(x, N);
	str	r3, [r7, #-1316]	@ y, y
@ /home/student/ARM_TEST/butterworth_noOpt.c:102:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r7, #1296	@, tmp280,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_noOpt.c:102:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp284
	bne	.L13		@,
@ /home/student/ARM_TEST/butterworth_noOpt.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/ARM_TEST/butterworth_noOpt.c:118:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13636	@ tmp291,
	movt	r2, 12	@ tmp291,
@ /home/student/ARM_TEST/butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp224,
@ /home/student/ARM_TEST/butterworth_noOpt.c:118:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp291,, tmp291
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	vldr.64	d17, .L14+32	@ tmp249,
@ /home/student/ARM_TEST/butterworth_noOpt.c:118:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp292, x[199999]
@ /home/student/ARM_TEST/butterworth_noOpt.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_noOpt.c:118:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp292
@ /home/student/ARM_TEST/butterworth_noOpt.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r0, [r7, #-1292]	@ tmp268, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp224,
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp249
@ /home/student/ARM_TEST/butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _45, _45, seconds_39, tmp224
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_noOpt.c:119:         (double)y / (1 << 14)
	ldr	r2, [r7, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp249
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/ARM_TEST/butterworth_noOpt.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7, #-1308]	@ tmp270, start.tv_sec
	sbc	r2, r0, r2	@ seconds_39, tmp268, tmp270
@ /home/student/ARM_TEST/butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r1, r2, r6	@ tmp230, tmp224, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r7, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/ARM_TEST/butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r7, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	ldr	r7, .L14+48	@ tmp246,
@ /home/student/ARM_TEST/butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r2	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp240, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_noOpt.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r1, asr #31	@ nanoseconds_44, tmp240, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	movw	r3, #65529	@,
@ /home/student/ARM_TEST/butterworth_noOpt.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r6, r2	@ _47, tmp230, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	movw	r2, #17721	@ tmp258,
	movt	r2, 29255	@ tmp258,
@ /home/student/ARM_TEST/butterworth_noOpt.c:108:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	movt	r3, 16435	@,
@ /home/student/ARM_TEST/butterworth_noOpt.c:108:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	strd	r2, [sp, #8]	@ tmp258,,
.LPIC2:
	add	r7, pc, r7	@ tmp246, tmp246
@ /home/student/ARM_TEST/butterworth_noOpt.c:108:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp285,
@ /home/student/ARM_TEST/butterworth_noOpt.c:108:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp261,
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_noOpt.c:108:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp285, tmp261
@ /home/student/ARM_TEST/butterworth_noOpt.c:111:     printf(
	mov	r0, r7	@ tmp246, tmp246
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_noOpt.c:123: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1344	@,,
	add	sp, sp, #12	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_noOpt.c:96:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_noOpt.c:97:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_noOpt.c:103:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_noOpt.c:104:         return 1;
	b	.L4		@
.L15:
	.align	3
.L14:
	.word	0
	.word	1086556160
	.word	1507148603
	.word	1082368652
	.word	-1717986918
	.word	1072273817
	.word	0
	.word	1087373312
	.word	0
	.word	1058013184
	.word	0
	.word	1091070464
	.word	.LC2-(.LPIC2+8)
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
