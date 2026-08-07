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
	.file	"butterworth_unrolled4.c"
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
	@ args = 0, pretend = 0, frame = 800048
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ butterworth_unrolled4.c:126:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ butterworth_unrolled4.c:123: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp210,
@ butterworth_unrolled4.c:123: {
	subw	sp, sp, #1364	@,,
@ butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	add	r3, sp, #1360	@ tmp381,,
	add	r7, sp, #798720	@ _60,,
@ butterworth_unrolled4.c:127:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp215,
@ butterworth_unrolled4.c:128:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp217,
@ butterworth_unrolled4.c:128:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp219,
@ butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp221,
@ butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	str	r3, [sp, #36]	@ tmp381, %sfp
	add	r3, sp, #80	@ tmp209,,
	str	r2, [r3]	@ tmp210, x[0]
	mov	r4, r3	@ ivtmp.22, tmp209
	addw	r7, r7, #1356	@ _60, _60,
	add	r10, r3, #798720	@ tmp382, ivtmp.22,
	mov	r6, r3	@ ivtmp.32, ivtmp.22
.L2:
@ butterworth_unrolled4.c:127:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ butterworth_unrolled4.c:126:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ butterworth_unrolled4.c:127:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _179, n
@ butterworth_unrolled4.c:127:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _180, _179, tmp215
@ butterworth_unrolled4.c:128:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _180, tmp217
	bl	sin(PLT)	@
@ butterworth_unrolled4.c:128:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp384, tmp219
@ butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp221
@ butterworth_unrolled4.c:132:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp222, _4
	vmov	r3, s0	@ int	@ tmp222, tmp222
	str	r3, [r6, #4]!	@ tmp222, MEM[(int *)_54]
@ butterworth_unrolled4.c:126:     for (int n = 0; n < N; n++) {
	cmp	r6, r7	@ ivtmp.32, _60
	bne	.L2		@,
@ butterworth_unrolled4.c:138:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	ldr	r3, [sp, #36]	@ tmp381, %sfp
	movs	r0, #2	@,
	sub	r1, r3, #1312	@, tmp381,
	bl	__clock_gettime64(PLT)	@
@ butterworth_unrolled4.c:138:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	cmp	r0, #0	@ x1
	bne	.L12	@
@ butterworth_unrolled4.c:44:         y = __QADD(y, a2 * y2);
	movw	lr, #58773	@ tmp240,
	add	r10, r10, #1280	@ _18, tmp382,
	movt	lr, 65535	@ tmp240,
@ butterworth_unrolled4.c:32:     register int y2 = 0;
	mov	r6, r0	@ y2, x1
@ butterworth_unrolled4.c:31:     register int y1 = 0;
	mov	r2, r0	@ y1, x1
@ butterworth_unrolled4.c:30:     register int x2 = 0;
	mov	r5, r0	@ x2, x1
@ butterworth_unrolled4.c:38:         register int y = __QADD(
	movw	ip, #1105	@ tmp228,
	movw	r8, #2210	@ tmp231,
@ butterworth_unrolled4.c:43:         y = __QADD(y, a1 * y1);
	movw	r7, #18727	@ tmp237,
.L5:
@ butterworth_unrolled4.c:37:         register int input0 = x[i];
	ldr	r3, [r4]	@ input0, MEM[(const int *)_186]
@ butterworth_unrolled4.c:38:         register int y = __QADD(
	mul	r1, r8, r0	@ _55, tmp231, x1
	mul	r9, ip, r3	@ _53, tmp228, input0
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r9, r1	@ result, _53, _55
@ 0 "" 2
@ butterworth_unrolled4.c:42:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r5, ip, r5	@ _58, tmp228, x2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r5	@ result, result, _58
@ 0 "" 2
@ butterworth_unrolled4.c:43:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r5, r7, r2	@ _61, tmp237, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r5	@ result, result, _61
@ 0 "" 2
@ butterworth_unrolled4.c:44:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r6, lr, r6	@ _64, tmp240, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r6	@ result, result, _64
@ 0 "" 2
@ butterworth_unrolled4.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r5, r1, #0, #14	@ _67, result,,
@ butterworth_unrolled4.c:53:         register int input1 = x[i + 1];
	ldr	r6, [r4, #4]	@ input1, MEM[(const int *)_186 + 4B]
@ butterworth_unrolled4.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _66, result,
@ butterworth_unrolled4.c:54:         y = __QADD(
	mul	r3, r8, r3	@ _76, tmp231, input0
@ butterworth_unrolled4.c:45:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r5, #0	@ _67,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _66
@ butterworth_unrolled4.c:54:         y = __QADD(
	mul	fp, ip, r6	@ _75, tmp228, input1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, fp, r3	@ result, _75, _76
@ 0 "" 2
@ butterworth_unrolled4.c:58:         y = __QADD(y, b02_1 * x2);
	.thumb
	.syntax unified
	mul	r0, ip, r0	@ _78, tmp228, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, _78
@ 0 "" 2
@ butterworth_unrolled4.c:59:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r7, r1	@ _80, tmp237, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, _80
@ 0 "" 2
@ butterworth_unrolled4.c:60:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, lr, r2	@ _82, tmp240, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _82
@ 0 "" 2
@ butterworth_unrolled4.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _85, result,,
@ butterworth_unrolled4.c:69:         register int input2 = x[i + 2];
	ldr	r5, [r4, #8]	@ x2, MEM[(const int *)_186 + 8B]
@ butterworth_unrolled4.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _84, result,
@ butterworth_unrolled4.c:61:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _85,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _84
@ butterworth_unrolled4.c:70:         y = __QADD(
	mul	r2, r8, r6	@ _94, tmp231, input1
	mul	r6, ip, r5	@ _93, tmp228, x2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r6, r6, r2	@ result, _93, _94
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r6, r6, r9	@ result, result, _53
@ 0 "" 2
@ butterworth_unrolled4.c:75:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r2, r7, r3	@ _97, tmp237, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r6, r6, r2	@ result, result, _97
@ 0 "" 2
@ butterworth_unrolled4.c:76:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, lr, r1	@ _99, tmp240, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r6, r6, r1	@ result, result, _99
@ 0 "" 2
@ butterworth_unrolled4.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r6, #0, #14	@ _102, result,,
@ butterworth_unrolled4.c:85:         register int input3 = x[i + 3];
	ldr	r0, [r4, #12]	@ x1, MEM[(const int *)_186 + 12B]
@ butterworth_unrolled4.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r6, r6, #14	@ _101, result,
@ butterworth_unrolled4.c:86:         y = __QADD(
	mul	r1, r8, r5	@ _111, tmp231, x2
@ butterworth_unrolled4.c:77:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _102,
	it	ne		@
	orrne	r6, r6, #1	@,, y2, _101
@ butterworth_unrolled4.c:86:         y = __QADD(
	mul	r2, ip, r0	@ _110, tmp228, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r2, r1	@ result, _110, _111
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, _75
@ 0 "" 2
@ butterworth_unrolled4.c:91:         y = __QADD(y, a1 * y1);
	.thumb
	.syntax unified
	mul	r1, r7, r6	@ _114, tmp237, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r2, r1	@ result, result, _114
@ 0 "" 2
@ butterworth_unrolled4.c:92:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, lr, r3	@ _116, tmp240, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r2, r3	@ result, result, _116
@ 0 "" 2
@ butterworth_unrolled4.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r2, #0, #14	@ _119, result,,
@ butterworth_unrolled4.c:35:     for (i = 0; i + 3 < sample_count; i += 4) {
	adds	r4, r4, #16	@ ivtmp.22, ivtmp.22,
@ butterworth_unrolled4.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _118, result,
@ butterworth_unrolled4.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _119,
	it	ne		@
	orrne	r2, r2, #1	@,, y1, _118
@ butterworth_unrolled4.c:35:     for (i = 0; i + 3 < sample_count; i += 4) {
	cmp	r10, r4	@ _18, ivtmp.22
	bne	.L5		@,
@ butterworth_unrolled4.c:143:     volatile int y = run_IIR(x, N);
	ldr	r3, [sp, #36]	@ tmp381, %sfp
@ butterworth_unrolled4.c:145:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	movs	r0, #2	@,
@ butterworth_unrolled4.c:143:     volatile int y = run_IIR(x, N);
	subw	r6, r3, #1316	@ tmp301, tmp381,
@ butterworth_unrolled4.c:145:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	sub	r4, r3, #1296	@ tmp302, tmp381,
	mov	r1, r4	@, tmp302
@ butterworth_unrolled4.c:143:     volatile int y = run_IIR(x, N);
	str	r2, [r6]	@ y1, y
@ butterworth_unrolled4.c:145:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ butterworth_unrolled4.c:145:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp386
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ butterworth_unrolled4.c:162:         (double)y / (1 << 14)
	ldr	r3, [r6]	@ y.0_13, y
@ butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r0, #51712	@ tmp318,
@ butterworth_unrolled4.c:161:         (double)x[N - 1] / (1 << 14),
	ldr	r2, [sp, #36]	@ tmp381, %sfp
@ butterworth_unrolled4.c:162:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r0, 15258	@ tmp318,
@ butterworth_unrolled4.c:161:         (double)x[N - 1] / (1 << 14),
	add	r1, r2, #794624	@ tmp355, tmp381,
@ butterworth_unrolled4.c:154:     printf(
	vldr.64	d18, .L14+32	@ tmp349,
@ butterworth_unrolled4.c:161:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r1, #4092]	@ x[199999], x[199999]
@ butterworth_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	r2, r2, #1312	@ tmp313, tmp381,
@ butterworth_unrolled4.c:162:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ butterworth_unrolled4.c:161:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r3	@ int	@ x[199999], x[199999]
@ butterworth_unrolled4.c:154:     printf(
	vmul.f64	d17, d17, d18	@ _15, _14, tmp349
@ butterworth_unrolled4.c:161:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ butterworth_unrolled4.c:154:     printf(
	vmul.f64	d16, d16, d18	@ _12, _11, tmp349
	vstr.64	d17, [sp, #24]	@ _15,
	vstr.64	d16, [sp, #16]	@ _12,
@ butterworth_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r1, [r2]	@ start.tv_sec, start.tv_sec
	ldr	r3, [r4]	@ end.tv_sec, end.tv_sec
	subs	r3, r3, r1	@ seconds_39, end.tv_sec, start.tv_sec
@ butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r7, r1, [r4, #4]	@ tmp370, end.tv_nsec, tmp302,
@ butterworth_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r4, [r2, #4]	@ tmp372, start.tv_sec
@ butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r0	@ _45, _45, seconds_39, tmp318
@ butterworth_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r7, r7, r4	@ seconds_39, tmp370, tmp372
@ butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r4, [r2, #8]	@ start.tv_nsec, start.tv_nsec
@ butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r0, r7, r6	@ tmp324, tmp318, seconds_39, _45
@ butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asrs	r2, r1, #31	@ tmp331, end.tv_nsec,
@ butterworth_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r4	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
	sbc	r2, r2, r4, asr #31	@ nanoseconds_44, tmp331, start.tv_nsec,
@ butterworth_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp324, nanoseconds_44
@ butterworth_unrolled4.c:151:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
@ butterworth_unrolled4.c:154:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp360,
	ldr	r7, .L14+56	@ tmp346,
@ butterworth_unrolled4.c:151:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _47
@ butterworth_unrolled4.c:154:     printf(
	strd	r2, [sp, #8]	@ tmp360,,
.LPIC2:
	add	r7, pc	@ tmp346
@ butterworth_unrolled4.c:151:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp387,
@ butterworth_unrolled4.c:151:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp363,
@ butterworth_unrolled4.c:154:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ butterworth_unrolled4.c:151:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp387, tmp363
@ butterworth_unrolled4.c:154:     printf(
	mov	r0, r7	@ tmp346, tmp346
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ butterworth_unrolled4.c:166: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1364	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ butterworth_unrolled4.c:139:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ butterworth_unrolled4.c:140:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ butterworth_unrolled4.c:146:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_unrolled4.c:147:         return 1;
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
