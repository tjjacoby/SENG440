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
	.file	"butterworth_unrolled.c"
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
	movw	r8, #13636	@ _138,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r8, 12	@ _138,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1344	@,,
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp182,
@ /home/student/ARM_TEST/butterworth_unrolled.c:108: {
	sub	sp, sp, #12	@,,
@ /home/student/ARM_TEST/butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	mov	r4, #1	@ n,
	add	r8, sp, r8	@ _138,, _138
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	add	r7, sp, #1344	@ tmp311,,
	add	r7, r7, #8	@ tmp311, tmp311,
	mov	r6, r7	@ ivtmp.19, tmp311
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp187,
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp189,
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp191,
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp193,
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	str	r3, [r6, #-1280]!	@ tmp182, x[0]
	mov	r5, r6	@ ivtmp.31, ivtmp.19
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r4	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	add	r4, r4, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _103, n
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _104, _103, tmp187
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _104, tmp189
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp313, tmp191
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp193
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp194, _4
	vmov	r3, s0	@ int	@ tmp194, tmp194
	str	r3, [r5, #4]!	@ tmp194, MEM[(int *)_140]
@ /home/student/ARM_TEST/butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	cmp	r8, r5	@ _138, ivtmp.31
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r7, #1312	@, tmp311,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r1, r0, #0	@ current_input, tmp314
	bne	.L12		@,
	add	r8, r6, #798720	@ _145, ivtmp.19,
@ /home/student/ARM_TEST/butterworth_unrolled.c:51:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp213,
	movt	lr, 65535	@ tmp213,
@ /home/student/ARM_TEST/butterworth_unrolled.c:37:     register int y2 = 0;
	mov	r2, r1	@ y2, current_input
	add	r8, r8, #1280	@ _145, _145,
@ /home/student/ARM_TEST/butterworth_unrolled.c:36:     register int y1 = 0;
	mov	r9, r1	@ y1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:34:     register int x1 = 0;
	mov	ip, r1	@ next_input, current_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:44:         register int y = __QADD(
	movw	r0, #1105	@ tmp202,
	movw	r5, #2210	@ tmp204,
@ /home/student/ARM_TEST/butterworth_unrolled.c:50:         y = __QADD(y, a1 * y1);
	movw	r4, #18727	@ tmp210,
.L5:
	mov	r10, r1	@ x2, current_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:43:         register int current_input = x[i];
	ldr	r1, [r6]	@ current_input, MEM[(const int *)_148]
@ /home/student/ARM_TEST/butterworth_unrolled.c:44:         register int y = __QADD(
	mul	fp, r5, ip	@ _55, tmp204, next_input
	mul	r3, r0, r1	@ _53, tmp202, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:49:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r10, r0, r10	@ _58, tmp202, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:50:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r4, r9	@ _61, tmp210, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:51:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r2, lr, r2	@ _64, tmp213, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	fp, r3, #0, #14	@ _67, result,,
	mov	r10, ip	@ x1, next_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled.c:62:         register int next_input = x[i + 1];
	ldr	ip, [r6, #4]	@ next_input, MEM[(const int *)_148 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	fp, #0	@ _67,
	moveq	r2, r3	@, y2, _66
	orrne	r2, r3, #1	@,, y2, _66
@ /home/student/ARM_TEST/butterworth_unrolled.c:63:         y = __QADD(
	mul	r3, r0, ip	@ _75, tmp202, next_input
	mul	fp, r5, r1	@ _76, tmp204, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:68:         y = __QADD(y, b02_1 * x2);
	.arm
	.syntax unified
	mul	r10, r0, r10	@ _78, tmp202, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:69:         y = __QADD(y, a1 * y1);
	.arm
	.syntax unified
	mul	r10, r4, r2	@ _80, tmp210, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:70:         y = __QADD(y, a2 * y2);
	.arm
	.syntax unified
	mul	r9, lr, r9	@ _82, tmp213, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax divided
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.arm
	.syntax unified
	ubfx	r10, r3, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled.c:41:     for (i = 0; i + 1 < sample_count; i += 2) {
	add	r6, r6, #8	@ ivtmp.19, ivtmp.19,
@ /home/student/ARM_TEST/butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asr	r3, r3, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r10, #0	@ _85,
	moveq	r9, r3	@, y1, _84
	orrne	r9, r3, #1	@,, y1, _84
@ /home/student/ARM_TEST/butterworth_unrolled.c:41:     for (i = 0; i + 1 < sample_count; i += 2) {
	cmp	r8, r6	@ _145, ivtmp.19
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:131:     volatile int y = run_IIR(x, N);
	str	r9, [r7, #-1316]	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled.c:133:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r7, #1296	@, tmp311,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:133:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp315
	bne	.L13		@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r7, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13636	@ tmp322,
	movt	r2, 12	@ tmp322,
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp256,
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp322,, tmp322
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	vldr.64	d17, .L14+32	@ tmp281,
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp323, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp323
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r0, [r7, #-1292]	@ tmp300, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp256,
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp281
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _45, _45, seconds_39, tmp256
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled.c:150:         (double)y / (1 << 14)
	ldr	r2, [r7, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp281
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7, #-1308]	@ tmp302, start.tv_sec
	sbc	r2, r0, r2	@ seconds_39, tmp300, tmp302
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r1, r2, r6	@ tmp262, tmp256, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r7, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r7, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	ldr	r7, .L14+48	@ tmp278,
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r2	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp272, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r1, asr #31	@ nanoseconds_44, tmp272, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	movw	r3, #65529	@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r6, r2	@ _47, tmp262, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	movw	r2, #17721	@ tmp290,
	movt	r2, 29255	@ tmp290,
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	movt	r3, 16435	@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	strd	r2, [sp, #8]	@ tmp290,,
.LPIC2:
	add	r7, pc, r7	@ tmp278, tmp278
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp316,
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp293,
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp316, tmp293
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	mov	r0, r7	@ tmp278, tmp278
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled.c:154: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1344	@,,
	add	sp, sp, #12	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled.c:127:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled.c:128:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled.c:134:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:135:         return 1;
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
