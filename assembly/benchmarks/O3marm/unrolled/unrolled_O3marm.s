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
	movw	r6, #13636	@ _138,
	vpush.64	{d8, d9, d10, d11}	@
	movt	r6, 12	@ _138,
	sub	sp, sp, #798720	@,,
	sub	sp, sp, #1344	@,,
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	mov	r3, #0	@ tmp182,
@ /home/student/seng440/filter/butterworth_unrolled.c:98: {
	sub	sp, sp, #12	@,,
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	mov	r4, #1	@ n,
	add	r6, sp, r6	@ _138,, _138
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	add	r8, sp, #1344	@ tmp300,,
	add	r8, r8, #8	@ tmp300, tmp300,
	mov	r7, r8	@ ivtmp.18, tmp300
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp187,
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp189,
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp191,
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp193,
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	str	r3, [r7, #-1280]!	@ tmp182, x[0]
	mov	r5, r7	@ ivtmp.30, ivtmp.18
.L2:
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r4	@ int	@ n, n
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	add	r4, r4, #1	@ n, n,
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _144, n
@ /home/student/seng440/filter/butterworth_unrolled.c:104:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _145, _144, tmp187
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _145, tmp189
	bl	sin(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:106:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp302, tmp191
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp193
@ /home/student/seng440/filter/butterworth_unrolled.c:110:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp194, _4
	vmov	r3, s0	@ int	@ tmp194, tmp194
	str	r3, [r5, #4]!	@ tmp194, MEM[(int *)_136]
@ /home/student/seng440/filter/butterworth_unrolled.c:103:     for (int n = 0; n < N; n++) {
	cmp	r5, r6	@ ivtmp.30, _138
	bne	.L2		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:116:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	sub	r1, r8, #1312	@, tmp300,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:116:     if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
	subs	r1, r0, #0	@ current_input, tmp303
	bne	.L12		@,
	add	r6, r7, #798720	@ _131, ivtmp.18,
@ /home/student/seng440/filter/butterworth_unrolled.c:47:         y = ((y) + (a2 * y2));
	movw	lr, #58773	@ tmp209,
	movt	lr, 65535	@ tmp209,
@ /home/student/seng440/filter/butterworth_unrolled.c:36:     register int y2 = 0;
	mov	r2, r1	@ y2, current_input
	add	r6, r6, #1280	@ _131, _131,
@ /home/student/seng440/filter/butterworth_unrolled.c:35:     register int y1 = 0;
	mov	r9, r1	@ y1, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:33:     register int x1 = 0;
	mov	ip, r1	@ next_input, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r0, #1105	@ tmp201,
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	movw	r5, #2210	@ tmp203,
@ /home/student/seng440/filter/butterworth_unrolled.c:46:         y = ((y) + (a1 * y1));
	movw	r4, #18727	@ tmp207,
.L5:
	mov	fp, r1	@ x2, current_input
	mov	r10, ip	@ x1, next_input
@ /home/student/seng440/filter/butterworth_unrolled.c:42:         register int current_input = x[i];
	ldr	r1, [r7]	@ current_input, MEM[(const int *)_128]
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	add	r7, r7, #8	@ ivtmp.18, ivtmp.18,
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mul	r3, r5, ip	@ _54, tmp203, next_input
@ /home/student/seng440/filter/butterworth_unrolled.c:43:         register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
	mla	r3, r0, r1, r3	@ y, tmp201, current_input, _54
@ /home/student/seng440/filter/butterworth_unrolled.c:45:         y = ((y) + (b02_1 * x2));
	mla	r3, r0, fp, r3	@ y, tmp201, x2, y
@ /home/student/seng440/filter/butterworth_unrolled.c:46:         y = ((y) + (a1 * y1));
	mla	r3, r4, r9, r3	@ y, tmp207, y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:47:         y = ((y) + (a2 * y2));
	mla	r3, lr, r2, r3	@ y, tmp209, y2, y
@ /home/student/seng440/filter/butterworth_unrolled.c:58:         register int next_input = x[i + 1];
	ldr	ip, [r7, #-4]	@ next_input, MEM[(const int *)_128 + 4B]
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r2, r3, #0, #14	@ _66, y,,
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r2, r2, #0	@ _67, _66,
	movne	r2, #1	@ _67,
@ /home/student/seng440/filter/butterworth_unrolled.c:49:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r2, r2, r3, asr #14	@ y2, _67, y,
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	mul	r3, r5, r1	@ _75, tmp203, current_input
@ /home/student/seng440/filter/butterworth_unrolled.c:59:         y = ((b02_1 * next_input) + ((b02_1 << 1) * x1));
	mla	r3, r0, ip, r3	@ y, tmp201, next_input, _75
@ /home/student/seng440/filter/butterworth_unrolled.c:61:         y = ((y) + (b02_1 * x2));
	mla	r3, r0, r10, r3	@ y, tmp201, x1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:62:         y = ((y) + (a1 * y1));
	mla	r3, r4, r2, r3	@ y, tmp207, y2, y
@ /home/student/seng440/filter/butterworth_unrolled.c:63:         y = ((y) + (a2 * y2));
	mla	r3, lr, r9, r3	@ y, tmp209, y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r9, r3, #0, #14	@ _84, y,,
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	subs	r9, r9, #0	@ _85, _84,
	movne	r9, #1	@ _85,
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	cmp	r7, r6	@ ivtmp.18, _131
@ /home/student/seng440/filter/butterworth_unrolled.c:65:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	orr	r9, r9, r3, asr #14	@ y1, _85, y,
@ /home/student/seng440/filter/butterworth_unrolled.c:40:     for (i = 0; i + 1 < sample_count; i += 2) {
	bne	.L5		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:121:     volatile int y = run_IIR(x, N);
	str	r9, [r8, #-1316]	@ y1, y
@ /home/student/seng440/filter/butterworth_unrolled.c:123:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	sub	r1, r8, #1296	@, tmp300,
	mov	r0, #1	@,
	bl	__clock_gettime64(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:123:     if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
	subs	r5, r0, #0	@ <retval>, tmp304
	bne	.L13		@,
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r8, #-1296]	@ end.tv_sec, end.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	movw	r2, #13636	@ tmp311,
	movt	r2, 12	@ tmp311,
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp245,
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	add	r2, sp, r2	@ tmp311,, tmp311
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	vldr.64	d17, .L14+32	@ tmp270,
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	vldr.32	s15, [r2]	@ int	@ tmp312, x[199999]
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r8, #-1312]	@ start.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled.c:139:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, tmp312
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r0, [r8, #-1292]	@ tmp289, end.tv_sec
	subs	r3, r3, r2	@ seconds_38, end.tv_sec, start.tv_sec
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp245,
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp270
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _44, _44, seconds_38, tmp245
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	ldr	r7, .L14+48	@ tmp267,
.LPIC2:
	add	r7, pc, r7	@ tmp267, tmp267
	vstr.64	d16, [sp, #16]	@ _12,
@ /home/student/seng440/filter/butterworth_unrolled.c:140:         (double)y / (1 << 14)
	ldr	r2, [r8, #-1316]	@ y.0_13, y
	vmov	s15, r2	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	vmul.f64	d16, d16, d17	@ _15, _14, tmp270
	vstr.64	d16, [sp, #24]	@ _15,
@ /home/student/seng440/filter/butterworth_unrolled.c:25:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r2, [r8, #-1308]	@ tmp291, start.tv_sec
	sbc	r2, r0, r2	@ seconds_38, tmp289, tmp291
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mla	r6, r1, r2, r6	@ tmp251, tmp245, seconds_38, _44
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r8, #-1288]	@ end.tv_nsec, end.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r8, #-1304]	@ start.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r0, r1, r2	@ nanoseconds_43, end.tv_nsec, start.tv_nsec
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp261, start.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled.c:26:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	rsc	r2, r2, r1, asr #31	@ nanoseconds_43, tmp261, end.tv_nsec,
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r0	@ _46, _44, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	movw	r3, #65529	@,
@ /home/student/seng440/filter/butterworth_unrolled.c:28:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adc	r6, r6, r2	@ _46, tmp251, nanoseconds_43
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	movw	r2, #17721	@ tmp279,
	movt	r2, 29255	@ tmp279,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _46
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	movt	r3, 16435	@,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r1, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	strd	r2, [sp, #8]	@ tmp279,,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp305,
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp282,
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _46
	movt	r1, 3	@,
	mov	r3, r6	@, _46
@ /home/student/seng440/filter/butterworth_unrolled.c:129:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp305, tmp282
@ /home/student/seng440/filter/butterworth_unrolled.c:132:     printf(
	mov	r0, r7	@ tmp267, tmp267
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ /home/student/seng440/filter/butterworth_unrolled.c:144: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	add	sp, sp, #1344	@,,
	add	sp, sp, #12	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ /home/student/seng440/filter/butterworth_unrolled.c:117:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+52	@,
.LPIC0:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
.L4:
@ /home/student/seng440/filter/butterworth_unrolled.c:118:         return 1;
	mov	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ /home/student/seng440/filter/butterworth_unrolled.c:124:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+56	@,
.LPIC1:
	add	r0, pc, r0	@,
	bl	perror(PLT)	@
@ /home/student/seng440/filter/butterworth_unrolled.c:125:         return 1;
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
