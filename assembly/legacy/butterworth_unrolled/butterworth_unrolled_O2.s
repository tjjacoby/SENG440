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
@ options passed: -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O2
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
	.align	1
	.p2align 2,,3
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	movs	r4, #1	@ n,
@ /home/student/ARM_TEST/butterworth_unrolled.c:108: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp184,
@ /home/student/ARM_TEST/butterworth_unrolled.c:108: {
	subw	sp, sp, #1356	@,,
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	add	r7, sp, #1352	@ tmp323,,
	add	r9, sp, #798720	@ _138,,
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp189,
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp191,
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp193,
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp195,
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	sub	r3, r7, #1280	@ tmp183, tmp323,
	addw	r9, r9, #1348	@ _138, _138,
	mov	r6, r3	@ ivtmp.19, tmp183
	add	r8, r3, #798720	@ tmp324, ivtmp.19,
	str	r2, [r3]	@ tmp184, x[0]
	mov	r5, r3	@ ivtmp.31, ivtmp.19
.L2:
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r4	@ int	@ n, n
@ /home/student/ARM_TEST/butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	adds	r4, r4, #1	@ n, n,
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _103, n
@ /home/student/ARM_TEST/butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _104, _103, tmp189
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _104, tmp191
	bl	sin(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp326, tmp193
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp195
@ /home/student/ARM_TEST/butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp196, _4
	vmov	r3, s0	@ int	@ tmp196, tmp196
	str	r3, [r5, #4]!	@ tmp196, MEM[(int *)_140]
@ /home/student/ARM_TEST/butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	cmp	r9, r5	@ _138, ivtmp.31
	bne	.L2		@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r7, #1312	@, tmp323,
	movs	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:126:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	cmp	r0, #0	@ current_input
	bne	.L12	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:51:         y = __QADD(y, a2 * y2);
	movw	r5, #58773	@ tmp215,
	add	r8, r8, #1280	@ _145, tmp324,
	movt	r5, 65535	@ tmp215,
@ /home/student/ARM_TEST/butterworth_unrolled.c:37:     register int y2 = 0;
	mov	r2, r0	@ y2, current_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:36:     register int y1 = 0;
	mov	r9, r0	@ y1, current_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:34:     register int x1 = 0;
	mov	r4, r0	@ next_input, current_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:44:         register int y = __QADD(
	movw	r1, #1105	@ tmp204,
	movw	lr, #2210	@ tmp206,
@ /home/student/ARM_TEST/butterworth_unrolled.c:50:         y = __QADD(y, a1 * y1);
	movw	ip, #18727	@ tmp212,
.L5:
	mov	r10, r0	@ x2, current_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:43:         register int current_input = x[i];
	ldr	r0, [r6]	@ current_input, MEM[(const int *)_148]
@ /home/student/ARM_TEST/butterworth_unrolled.c:44:         register int y = __QADD(
	mul	fp, lr, r4	@ _55, tmp206, next_input
	mul	r3, r1, r0	@ _53, tmp204, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, _53, _55
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:49:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r10, r1, r10	@ _58, tmp204, x2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _58
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:50:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, ip, r9	@ _61, tmp212, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _61
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:51:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r5, r2	@ _64, tmp215, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _64
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	fp, r3, #0, #14	@ _67, result,,
	mov	r10, r4	@ x1, next_input
@ /home/student/ARM_TEST/butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _66, result,
@ /home/student/ARM_TEST/butterworth_unrolled.c:62:         register int next_input = x[i + 1];
	ldr	r4, [r6, #4]	@ next_input, MEM[(const int *)_148 + 4B]
@ /home/student/ARM_TEST/butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	fp, #0	@ _67,
	ite	eq		@
	moveq	r2, r3	@, y2, _66
	orrne	r2, r3, #1	@,, y2, _66
@ /home/student/ARM_TEST/butterworth_unrolled.c:63:         y = __QADD(
	mul	r3, r1, r4	@ _75, tmp204, next_input
	mul	fp, lr, r0	@ _76, tmp206, current_input
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, _75, _76
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:68:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r10, r1, r10	@ _78, tmp204, x1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _78
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:69:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, ip, r2	@ _80, tmp212, y2
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, result, _80
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:70:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r9, r5, r9	@ _82, tmp215, y1
@ ./cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "./cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _82
@ 0 "" 2
@ /home/student/ARM_TEST/butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r10, r3, #0, #14	@ _85, result,,
@ /home/student/ARM_TEST/butterworth_unrolled.c:41:     for (i = 0; i + 1 < sample_count; i += 2) {
	adds	r6, r6, #8	@ ivtmp.19, ivtmp.19,
@ /home/student/ARM_TEST/butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _84, result,
@ /home/student/ARM_TEST/butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r10, #0	@ _85,
	ite	eq		@
	moveq	r9, r3	@, y1, _84
	orrne	r9, r3, #1	@,, y1, _84
@ /home/student/ARM_TEST/butterworth_unrolled.c:41:     for (i = 0; i + 1 < sample_count; i += 2) {
	cmp	r8, r6	@ _145, ivtmp.19
	bne	.L5		@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:131:     volatile int y = run_IIR(x, N);
	subw	r6, r7, #1316	@ tmp243, tmp323,
@ /home/student/ARM_TEST/butterworth_unrolled.c:133:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r4, r7, #1296	@ tmp244, tmp323,
	mov	r1, r4	@, tmp244
	movs	r0, #1	@,
@ /home/student/ARM_TEST/butterworth_unrolled.c:131:     volatile int y = run_IIR(x, N);
	str	r9, [r6]	@ y1, y
@ /home/student/ARM_TEST/butterworth_unrolled.c:133:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:133:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp328
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ /home/student/ARM_TEST/butterworth_unrolled.c:150:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	add	r2, r7, #794624	@ tmp297, tmp323,
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	vldr.64	d18, .L14+32	@ tmp291,
@ /home/student/ARM_TEST/butterworth_unrolled.c:150:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r7, r7, #1312	@ tmp255, tmp323,
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp260,
	movt	r0, 15258	@ tmp260,
@ /home/student/ARM_TEST/butterworth_unrolled.c:150:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	vmul.f64	d17, d17, d18	@ _15, _14, tmp291
@ /home/student/ARM_TEST/butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp291
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp312, end.tv_nsec, tmp244,
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r7, #4]	@ tmp314, start.tv_sec
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _45, _45, seconds_39, tmp260
@ /home/student/ARM_TEST/butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_39, tmp312, tmp314
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r7, #8]	@ start.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp266, tmp260, seconds_39, _45
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp273, end.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_44, tmp273, start.tv_nsec,
@ /home/student/ARM_TEST/butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp266, nanoseconds_44
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp302,
	ldr	r7, .L14+56	@ tmp288,
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	strd	r2, [sp, #8]	@ tmp302,,
.LPIC2:
	add	r7, pc	@ tmp288
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp329,
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp305,
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ /home/student/ARM_TEST/butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp329, tmp305
@ /home/student/ARM_TEST/butterworth_unrolled.c:142:     printf(
	mov	r0, r7	@ tmp288, tmp288
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/ARM_TEST/butterworth_unrolled.c:154: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1356	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/ARM_TEST/butterworth_unrolled.c:127:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ /home/student/ARM_TEST/butterworth_unrolled.c:128:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/ARM_TEST/butterworth_unrolled.c:134:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
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
	.word	1917273401
	.word	1077149689
	.word	.LC2-(.LPIC2+4)
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
