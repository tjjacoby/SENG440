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
	.file	"butterworth_rounding.c"
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
@ butterworth_rounding.c:86:     for (int n = 0; n < N; n++) {
	movs	r4, #1	@ n,
@ butterworth_rounding.c:81: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ butterworth_rounding.c:93:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp170,
@ butterworth_rounding.c:81: {
	subw	sp, sp, #1356	@,,
@ butterworth_rounding.c:93:         x[n] = (int)(input * (1 << 14));
	add	r7, sp, #1352	@ tmp291,,
	add	r6, sp, #798720	@ _118,,
@ butterworth_rounding.c:87:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp175,
@ butterworth_rounding.c:89:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp177,
@ butterworth_rounding.c:89:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp179,
@ butterworth_rounding.c:93:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp181,
@ butterworth_rounding.c:93:         x[n] = (int)(input * (1 << 14));
	sub	r3, r7, #1280	@ tmp169, tmp291,
	addw	r6, r6, #1348	@ _118, _118,
	mov	r5, r3	@ ivtmp.29, tmp169
	str	r2, [r3]	@ tmp170, x[0]
.L2:
@ butterworth_rounding.c:87:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r4	@ int	@ n, n
@ butterworth_rounding.c:86:     for (int n = 0; n < N; n++) {
	adds	r4, r4, #1	@ n, n,
@ butterworth_rounding.c:87:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _72, n
@ butterworth_rounding.c:87:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _30, _72, tmp175
@ butterworth_rounding.c:89:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _30, tmp177
	bl	sin(PLT)	@
@ butterworth_rounding.c:89:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp293, tmp179
@ butterworth_rounding.c:93:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp181
@ butterworth_rounding.c:93:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp182, _4
	vmov	r3, s0	@ int	@ tmp182, tmp182
	str	r3, [r5, #4]!	@ tmp182, MEM[(int *)_120]
@ butterworth_rounding.c:86:     for (int n = 0; n < N; n++) {
	cmp	r6, r5	@ _118, ivtmp.29
	bne	.L2		@,
@ butterworth_rounding.c:99:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	sub	r1, r7, #1312	@, tmp291,
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
@ butterworth_rounding.c:99:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L12	@
@ butterworth_rounding.c:61:         y = __QADD(y, a2 * y2);
	movw	r8, #58773	@ tmp202,
	subw	r4, r7, #1284	@ ivtmp.18, tmp291,
	movt	r8, 65535	@ tmp202,
@ butterworth_rounding.c:51:     register int y2 = 0;
	mov	fp, r0	@ y2, x1
@ butterworth_rounding.c:50:     register int y1 = 0;
	mov	r1, r0	@ y1, x1
@ butterworth_rounding.c:49:     register int x2 = 0;
	mov	r2, r0	@ x2, x1
@ butterworth_rounding.c:57:         register int y = __QADD(b02_1 * x[i], (b02_1 << 1) * x1);
	movw	ip, #1105	@ tmp191,
	movw	r10, #2210	@ tmp193,
@ butterworth_rounding.c:60:         y = __QADD(y, a1 * y1);
	movw	r9, #18727	@ tmp199,
.L5:
@ butterworth_rounding.c:57:         register int y = __QADD(b02_1 * x[i], (b02_1 << 1) * x1);
	ldr	r5, [r4, #4]!	@ _52, MEM[(const int *)_126]
@ butterworth_rounding.c:57:         register int y = __QADD(b02_1 * x[i], (b02_1 << 1) * x1);
	mul	lr, r10, r0	@ _55, tmp193, x1
	mul	r3, ip, r5	@ _53, tmp191, _52
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, lr	@ result, _53, _55
@ 0 "" 2
@ butterworth_rounding.c:59:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r2, ip, r2	@ _58, tmp191, x2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _58
@ 0 "" 2
@ butterworth_rounding.c:60:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r2, r9, r1	@ _61, tmp199, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _61
@ 0 "" 2
@ butterworth_rounding.c:61:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	fp, r8, fp	@ _64, tmp202, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, result, _64
@ 0 "" 2
@ butterworth_rounding.c:67:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments 
	.thumb
	.syntax unified
	ubfx	lr, r3, #0, #14	@ _67, result,,
	mov	r2, r0	@ x2, x1
@ butterworth_rounding.c:67:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments 
	asrs	r3, r3, #14	@ _66, result,
	mov	fp, r1	@ y2, y1
	mov	r0, r5	@ x1, _52
@ butterworth_rounding.c:67:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0); // von Neumann rounding to Q14 in one line removed variable assignments 
	cmp	lr, #0	@ _67,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _66
@ butterworth_rounding.c:55:     for (i = 0; i < sample_count; i++) {
	cmp	r6, r4	@ _118, ivtmp.18
	mov	r1, r3	@ y1, y
	bne	.L5		@,
@ butterworth_rounding.c:104:     volatile int y = run_IIR(x, N);
	subw	r6, r7, #1316	@ tmp211, tmp291,
@ butterworth_rounding.c:106:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	sub	r4, r7, #1296	@ tmp212, tmp291,
	mov	r1, r4	@, tmp212
	movs	r0, #2	@,
@ butterworth_rounding.c:104:     volatile int y = run_IIR(x, N);
	str	r3, [r6]	@ y, y
@ butterworth_rounding.c:106:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ butterworth_rounding.c:106:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp295
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ butterworth_rounding.c:123:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ butterworth_rounding.c:122:         (double)x[N - 1] / (1 << 14),
	add	r2, r7, #794624	@ tmp265, tmp291,
@ butterworth_rounding.c:115:     printf(
	vldr.64	d18, .L14+32	@ tmp259,
@ butterworth_rounding.c:123:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ butterworth_rounding.c:122:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
@ butterworth_rounding.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r7, r7, #1312	@ tmp223, tmp291,
@ butterworth_rounding.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp228,
	movt	r0, 15258	@ tmp228,
@ butterworth_rounding.c:123:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ butterworth_rounding.c:122:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ butterworth_rounding.c:115:     printf(
	vmul.f64	d17, d17, d18	@ _15, _14, tmp259
@ butterworth_rounding.c:122:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ butterworth_rounding.c:115:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp259
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ butterworth_rounding.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r7]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r2	@ seconds_39, end.tv_sec, start.tv_sec
@ butterworth_rounding.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r1, r2, [r4, #4]	@ tmp280, end.tv_nsec, tmp212,
@ butterworth_rounding.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r7, #4]	@ tmp282, start.tv_sec
@ butterworth_rounding.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _45, _45, seconds_39, tmp228
@ butterworth_rounding.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r1, r4	@ seconds_39, tmp280, tmp282
@ butterworth_rounding.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r7, #8]	@ start.tv_nsec, start.tv_nsec
@ butterworth_rounding.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r4, r6	@ tmp234, tmp228, seconds_39, _45
@ butterworth_rounding.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r2, r1	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ butterworth_rounding.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp241, end.tv_nsec,
@ butterworth_rounding.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r1, asr #31	@ nanoseconds_44, tmp241, start.tv_nsec,
@ butterworth_rounding.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp234, nanoseconds_44
@ butterworth_rounding.c:112:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ butterworth_rounding.c:115:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp270,
	ldr	r7, .L14+56	@ tmp256,
@ butterworth_rounding.c:112:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ butterworth_rounding.c:115:     printf(
	strd	r2, [sp, #8]	@ tmp270,,
.LPIC2:
	add	r7, pc	@ tmp256
@ butterworth_rounding.c:112:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp296,
@ butterworth_rounding.c:112:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp273,
@ butterworth_rounding.c:115:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ butterworth_rounding.c:112:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp296, tmp273
@ butterworth_rounding.c:115:     printf(
	mov	r0, r7	@ tmp256, tmp256
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ butterworth_rounding.c:127: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1356	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ butterworth_rounding.c:100:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ butterworth_rounding.c:101:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ butterworth_rounding.c:107:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_rounding.c:108:         return 1;
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
