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
	.eabi_attribute 30, 1	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"butterworth_unrolled.c"
@ GNU C17 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O1
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
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 800040
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}	@
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1352	@,,
	add	r7, sp, #72	@ tmp180,,
	add	r4, sp, #68	@ ivtmp.27,,
	mov	r6, r7	@ ivtmp.17, tmp180
	add	r8, r7, #798720	@ _93, tmp180,
	addw	r8, r8, #1276	@ _93, _93,
@ butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	movs	r5, #0	@ n,
@ butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L12	@ tmp186,
@ butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L12+8	@ tmp188,
@ butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L12+16	@ tmp190,
@ butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L12+24	@ tmp192,
.L2:
@ butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
	vcvt.f64.s32	d16, s15	@ _1, n
@ butterworth_unrolled.c:114:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ time_33, _1, tmp186
@ butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, time_33, tmp188
	bl	sin(PLT)	@
@ butterworth_unrolled.c:116:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_34, tmp319, tmp190
@ butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_34, tmp192
@ butterworth_unrolled.c:120:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp193, _4
	vmov	r3, s0	@ int	@ tmp193, tmp193
	str	r3, [r4, #4]!	@ tmp193, MEM[(int *)_91]
@ butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ butterworth_unrolled.c:113:     for (int n = 0; n < N; n++) {
	cmp	r4, r8	@ ivtmp.27, _93
	bne	.L2		@,
@ butterworth_unrolled.c:126:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	add	r1, sp, #56	@,,
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
@ butterworth_unrolled.c:126:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	mov	r1, r0	@ next_input, tmp320
	cmp	r0, #0	@ tmp320
	bne	.L10	@
	add	r7, r7, #798720	@ _84, tmp180,
	add	r7, r7, #1280	@ _84, _84,
@ butterworth_unrolled.c:37:     register int y2 = 0;
	mov	r2, r0	@ y2, next_input
@ butterworth_unrolled.c:36:     register int y1 = 0;
	mov	r8, r0	@ y1, next_input
@ butterworth_unrolled.c:35:     register int x2 = 0;
	mov	r4, r0	@ current_input, next_input
@ butterworth_unrolled.c:44:         register int y = __QADD(
	movw	r0, #1105	@ tmp201,
	movw	lr, #2210	@ tmp203,
@ butterworth_unrolled.c:50:         y = __QADD(y, a1 * y1);
	movw	ip, #18727	@ tmp209,
@ butterworth_unrolled.c:51:         y = __QADD(y, a2 * y2);
	movw	r5, #58773	@ tmp212,
	movt	r5, 65535	@ tmp212,
.L5:
	mov	r9, r4	@ x2, current_input
@ butterworth_unrolled.c:43:         register int current_input = x[i];
	ldr	r4, [r6]	@ current_input, MEM[(const int *)_82]
@ butterworth_unrolled.c:44:         register int y = __QADD(
	mul	r3, r0, r4	@ _42, tmp201, current_input
	mul	r10, lr, r1	@ _44, tmp203, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, _42, _44
@ 0 "" 2
@ butterworth_unrolled.c:49:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r9, r0, r9	@ _47, tmp201, x2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _47
@ 0 "" 2
@ butterworth_unrolled.c:50:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, ip, r8	@ _50, tmp209, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _50
@ 0 "" 2
@ butterworth_unrolled.c:51:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r5, r2	@ _53, tmp212, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _53
@ 0 "" 2
@ butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r9, r3, #0, #14	@ _56, result,,
@ butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _55, result,
@ butterworth_unrolled.c:53:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r9, #0	@ _56,
	ite	eq		@
	moveq	r2, r3	@, y2, _55
	orrne	r2, r3, #1	@,, y2, _55
	mov	r9, r1	@ x1, next_input
@ butterworth_unrolled.c:62:         register int next_input = x[i + 1];
	ldr	r1, [r6, #4]	@ next_input, MEM[(const int *)_82 + 4B]
@ butterworth_unrolled.c:63:         y = __QADD(
	mul	r3, r0, r1	@ _64, tmp201, next_input
	mul	r10, lr, r4	@ _65, tmp203, current_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, _64, _65
@ 0 "" 2
@ butterworth_unrolled.c:68:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r9, r0, r9	@ _67, tmp201, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _67
@ 0 "" 2
@ butterworth_unrolled.c:69:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, ip, r2	@ _69, tmp209, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, result, _69
@ 0 "" 2
@ butterworth_unrolled.c:70:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r8, r5, r8	@ _71, tmp212, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r8	@ result, result, _71
@ 0 "" 2
@ butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r9, r3, #0, #14	@ _74, result,,
@ butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _73, result,
@ butterworth_unrolled.c:72:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r9, #0	@ _74,
	ite	eq		@
	moveq	r8, r3	@, y1, _73
	orrne	r8, r3, #1	@,, y1, _73
@ butterworth_unrolled.c:41:     for (i = 0; i + 1 < sample_count; i += 2) {
	adds	r6, r6, #8	@ ivtmp.17, ivtmp.17,
	cmp	r6, r7	@ ivtmp.17, _84
	bne	.L5		@,
@ butterworth_unrolled.c:131:     volatile int y = run_IIR(x, N);
	add	r3, sp, #36	@ tmp238,,
	str	r8, [r3]	@ y1, y
@ butterworth_unrolled.c:133:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	add	r1, sp, #40	@,,
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
@ butterworth_unrolled.c:133:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	mov	r6, r0	@ <retval>, tmp321
	cmp	r0, #0	@ tmp321
	bne	.L11	@
@ butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	add	r2, sp, #1352	@ tmp244,,
	add	r0, sp, #40	@ tmp246,,
@ butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	add	r4, sp, #56	@ tmp250,,
@ butterworth_unrolled.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r0]	@ end.tv_sec, end.tv_sec
	ldr	r1, [r0, #4]	@ tmp307, end.tv_sec
	ldr	r7, [r4]	@ start.tv_sec, start.tv_sec
	ldr	r5, [r4, #4]	@ tmp309, start.tv_sec
	subs	r3, r3, r7	@ seconds_101, end.tv_sec, start.tv_sec
	sbc	r7, r1, r5	@ seconds_101, tmp307, tmp309
@ butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp255,
	movt	r1, 15258	@ tmp255,
	umull	r3, r5, r3, r1	@ _107, _107, seconds_101, tmp255
	mla	r5, r1, r7, r5	@ tmp261, tmp255, seconds_101, _107
@ butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r0, #8]	@ end.tv_nsec, end.tv_nsec
	asrs	r0, r1, #31	@ tmp268, end.tv_nsec,
@ butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r4, [r4, #8]	@ start.tv_nsec, start.tv_nsec
@ butterworth_unrolled.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r1, r1, r4	@ nanoseconds_106, end.tv_nsec, start.tv_nsec
	sbc	r0, r0, r4, asr #31	@ nanoseconds_106, tmp268, start.tv_nsec,
@ butterworth_unrolled.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r1	@ _109, _107, nanoseconds_106
	adc	r5, r5, r0	@ _109, tmp261, nanoseconds_106
@ butterworth_unrolled.c:150:         (double)y / (1 << 14)
	add	r3, sp, #36	@ tmp280,,
	ldr	r3, [r3]	@ y.0_13, y
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ butterworth_unrolled.c:142:     printf(
	vldr.64	d17, .L12+32	@ tmp286,
	vmul.f64	d16, d16, d17	@ _15, _14, tmp286
	vstr.64	d16, [sp, #24]	@ _15,
@ butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	add	r2, r2, #794624	@ tmp292, tmp244,
@ butterworth_unrolled.c:149:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
	vmov	s15, r3	@ int	@ x[199999], x[199999]
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ butterworth_unrolled.c:142:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp286
	vstr.64	d16, [sp, #16]	@ _12,
	adr	r3, .L12+48	@,
	ldrd	r2, [r3]	@ tmp297,
	strd	r2, [sp, #8]	@ tmp297,,
@ butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _109
	mov	r1, r5	@, _109
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp322,
@ butterworth_unrolled.c:139:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L12+40	@ tmp300,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp322, tmp300
@ butterworth_unrolled.c:142:     printf(
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	mov	r2, r4	@, _109
	mov	r3, r5	@, _109
	mov	r1, #3392	@,
	movt	r1, 3	@,
	ldr	r0, .L12+56	@,
.LPIC2:
	add	r0, pc	@
	bl	printf(PLT)	@
.L1:
@ butterworth_unrolled.c:154: }
	mov	r0, r6	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1352	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}	@
.L10:
@ butterworth_unrolled.c:127:         perror("Unable to start benchmark timer");
	ldr	r0, .L12+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_unrolled.c:128:         return 1;
	movs	r6, #1	@ <retval>,
	b	.L1		@
.L11:
@ butterworth_unrolled.c:134:         perror("Unable to stop benchmark timer");
	ldr	r0, .L12+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_unrolled.c:135:         return 1;
	movs	r6, #1	@ <retval>,
	b	.L1		@
.L13:
	.align	3
.L12:
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
