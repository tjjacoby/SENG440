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
	.file	"butterworth_pipelined.c"
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
	subw	sp, sp, #1356	@,,
	add	r6, sp, #72	@ tmp178,,
	add	r4, sp, #68	@ ivtmp.27,,
	mov	r7, r6	@ ivtmp.17, tmp178
	add	r6, r6, #798720	@ _90, tmp178,
	addw	r6, r6, #1276	@ _90, _90,
@ butterworth_pipelined.c:119:     for (int n = 0; n < N; n++) {
	movs	r5, #0	@ n,
@ butterworth_pipelined.c:120:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L12	@ tmp184,
@ butterworth_pipelined.c:122:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L12+8	@ tmp186,
@ butterworth_pipelined.c:122:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L12+16	@ tmp188,
@ butterworth_pipelined.c:126:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L12+24	@ tmp190,
.L2:
@ butterworth_pipelined.c:120:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
	vcvt.f64.s32	d16, s15	@ _1, n
@ butterworth_pipelined.c:120:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ time_33, _1, tmp184
@ butterworth_pipelined.c:122:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, time_33, tmp186
	bl	sin(PLT)	@
@ butterworth_pipelined.c:122:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_34, tmp318, tmp188
@ butterworth_pipelined.c:126:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_34, tmp190
@ butterworth_pipelined.c:126:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp191, _4
	vmov	r3, s0	@ int	@ tmp191, tmp191
	str	r3, [r4, #4]!	@ tmp191, MEM[(int *)_76]
@ butterworth_pipelined.c:119:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ butterworth_pipelined.c:119:     for (int n = 0; n < N; n++) {
	cmp	r4, r6	@ ivtmp.27, _90
	bne	.L2		@,
@ butterworth_pipelined.c:132:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	add	r1, sp, #56	@,,
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
@ butterworth_pipelined.c:132:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	mov	fp, r0	@ x1, tmp319
	cbnz	r0, .L10	@ tmp319,
@ butterworth_pipelined.c:60:     register int current_input = x[0];
	ldr	r4, [sp, #72]	@ current_input, MEM[(const int *)&x]
@ butterworth_pipelined.c:61:     register int current_feedforward = __QADD(
	movw	r0, #1105	@ tmp202,
	mul	r0, r4, r0	@ _38, current_input, tmp202
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	movs	r3, #0	@ tmp203,
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r0, r0, r3	@ result, _38, tmp203
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r0, r0, r3	@ result, result, tmp203
@ 0 "" 2
@ butterworth_pipelined.c:54:     register int y2 = 0;
	.thumb
	.syntax unified
	mov	lr, fp	@ y2, x1
@ butterworth_pipelined.c:53:     register int y1 = 0;
	mov	r1, fp	@ y1, x1
@ butterworth_pipelined.c:75:         register int next_b0_product = b02_1 * next_input;
	movw	ip, #1105	@ tmp208,
@ butterworth_pipelined.c:76:         register int next_b1_product = (b02_1 << 1) * current_input;
	movw	r10, #2210	@ tmp210,
@ butterworth_pipelined.c:89:         register int feedback_y1 = a1 * y1;
	movw	r9, #18727	@ tmp216,
@ butterworth_pipelined.c:90:         register int feedback_y2 = a2 * y2;
	movw	r8, #58773	@ tmp219,
	movt	r8, 65535	@ tmp219,
	b	.L5		@
.L10:
@ butterworth_pipelined.c:133:         perror("Unable to start benchmark timer");
	ldr	r0, .L12+56	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_pipelined.c:134:         return 1;
	movs	r6, #1	@ <retval>,
	b	.L1		@
.L7:
	mov	r1, r3	@ y1, y
	mov	r4, r5	@ current_input, next_input
.L5:
@ butterworth_pipelined.c:74:         register int next_input = x[i + 1];
	ldr	r5, [r7, #4]!	@ next_input, MEM[(const int *)_16]
@ butterworth_pipelined.c:75:         register int next_b0_product = b02_1 * next_input;
	mul	r2, ip, r5	@ next_b0_product_47, tmp208, next_input
@ butterworth_pipelined.c:76:         register int next_b1_product = (b02_1 << 1) * current_input;
	mul	r3, r10, r4	@ next_b1_product_49, tmp210, current_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r2, r3	@ result, next_b0_product_47, next_b1_product_49
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, r0	@ current_feedforward, result
@ butterworth_pipelined.c:77:         register int next_b2_product = b02_1 * x1;
	mul	fp, ip, fp	@ next_b2_product_51, tmp208, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r2, fp	@ result, result, next_b2_product_51
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r2	@ result, result
@ butterworth_pipelined.c:89:         register int feedback_y1 = a1 * y1;
	mul	fp, r9, r1	@ feedback_y1_55, tmp216, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, current_feedforward, feedback_y1_55
@ 0 "" 2
@ butterworth_pipelined.c:90:         register int feedback_y2 = a2 * y2;
	.thumb
	.syntax unified
	mul	lr, r8, lr	@ feedback_y2_57, tmp219, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, lr	@ result, result, feedback_y2_57
@ 0 "" 2
@ butterworth_pipelined.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	lr, r3, #0, #14	@ _62, result,,
@ butterworth_pipelined.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _61, result,
@ butterworth_pipelined.c:93:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	lr, #0	@ _62,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _61
	mov	fp, r4	@ x1, current_input
	mov	lr, r1	@ y2, y1
@ butterworth_pipelined.c:68:     for (i = 0; i + 1 < sample_count; i++) {
	cmp	r7, r6	@ ivtmp.17, _90
	bne	.L7		@,
@ butterworth_pipelined.c:104:     register int y = __QADD(current_feedforward, a1 * y1);
	movw	r0, #18727	@ tmp226,
	mul	r3, r0, r3	@ _67, tmp226, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r2, r3	@ result, result, _67
@ 0 "" 2
@ butterworth_pipelined.c:105:     y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	movw	r2, #58773	@ tmp229,
	movt	r2, 65535	@ tmp229,
	mul	r1, r2, r1	@ _69, tmp229, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _69
@ 0 "" 2
@ butterworth_pipelined.c:106:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _72, result,,
@ butterworth_pipelined.c:106:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _71, result,
@ butterworth_pipelined.c:106:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _72,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _71
@ butterworth_pipelined.c:137:     volatile int y = run_IIR(x, N);
	add	r2, sp, #36	@ tmp237,,
	str	r3, [r2]	@ y, y
@ butterworth_pipelined.c:139:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	add	r1, sp, #40	@,,
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
@ butterworth_pipelined.c:139:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	mov	r6, r0	@ <retval>, tmp320
	cmp	r0, #0	@ tmp320
	bne	.L11	@
@ butterworth_pipelined.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	add	r2, sp, #1352	@ tmp243,,
	add	r0, sp, #40	@ tmp245,,
@ butterworth_pipelined.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	add	r4, sp, #56	@ tmp249,,
@ butterworth_pipelined.c:26:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldr	r3, [r0]	@ end.tv_sec, end.tv_sec
	ldr	r1, [r0, #4]	@ tmp306, end.tv_sec
	ldr	r7, [r4]	@ start.tv_sec, start.tv_sec
	ldr	r5, [r4, #4]	@ tmp308, start.tv_sec
	subs	r3, r3, r7	@ seconds_79, end.tv_sec, start.tv_sec
	sbc	r7, r1, r5	@ seconds_79, tmp306, tmp308
@ butterworth_pipelined.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp254,
	movt	r1, 15258	@ tmp254,
	umull	r3, r5, r3, r1	@ _85, _85, seconds_79, tmp254
	mla	r5, r1, r7, r5	@ tmp260, tmp254, seconds_79, _85
@ butterworth_pipelined.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r1, [r0, #8]	@ end.tv_nsec, end.tv_nsec
	asrs	r0, r1, #31	@ tmp267, end.tv_nsec,
@ butterworth_pipelined.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r4, [r4, #8]	@ start.tv_nsec, start.tv_nsec
@ butterworth_pipelined.c:27:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r1, r1, r4	@ nanoseconds_84, end.tv_nsec, start.tv_nsec
	sbc	r0, r0, r4, asr #31	@ nanoseconds_84, tmp267, start.tv_nsec,
@ butterworth_pipelined.c:29:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r1	@ _87, _85, nanoseconds_84
	adc	r5, r5, r0	@ _87, tmp260, nanoseconds_84
@ butterworth_pipelined.c:156:         (double)y / (1 << 14)
	add	r3, sp, #36	@ tmp279,,
	ldr	r3, [r3]	@ y.0_13, y
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
	vcvt.f64.s32	d16, s15	@ _14, y.0_13
@ butterworth_pipelined.c:148:     printf(
	vldr.64	d17, .L12+32	@ tmp285,
	vmul.f64	d16, d16, d17	@ _15, _14, tmp285
	vstr.64	d16, [sp, #24]	@ _15,
@ butterworth_pipelined.c:155:         (double)x[N - 1] / (1 << 14),
	add	r2, r2, #794624	@ tmp291, tmp243,
@ butterworth_pipelined.c:155:         (double)x[N - 1] / (1 << 14),
	ldr	r3, [r2, #4092]	@ x[199999], x[199999]
	vmov	s15, r3	@ int	@ x[199999], x[199999]
	vcvt.f64.s32	d16, s15	@ _11, x[199999]
@ butterworth_pipelined.c:148:     printf(
	vmul.f64	d16, d16, d17	@ _12, _11, tmp285
	vstr.64	d16, [sp, #16]	@ _12,
	adr	r3, .L12+48	@,
	ldrd	r2, [r3]	@ tmp296,
	strd	r2, [sp, #8]	@ tmp296,,
@ butterworth_pipelined.c:145:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _87
	mov	r1, r5	@, _87
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp321,
@ butterworth_pipelined.c:145:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L12+40	@ tmp299,
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp321, tmp299
@ butterworth_pipelined.c:148:     printf(
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	mov	r2, r4	@, _87
	mov	r3, r5	@, _87
	mov	r1, #3392	@,
	movt	r1, 3	@,
	ldr	r0, .L12+60	@,
.LPIC2:
	add	r0, pc	@
	bl	printf(PLT)	@
.L1:
@ butterworth_pipelined.c:160: }
	mov	r0, r6	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1356	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L11:
@ butterworth_pipelined.c:140:         perror("Unable to stop benchmark timer");
	ldr	r0, .L12+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_pipelined.c:141:         return 1;
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
	.word	.LC0-(.LPIC0+4)
	.word	.LC2-(.LPIC2+4)
	.word	.LC1-(.LPIC1+4)
	.size	main, .-main
	.global	__aeabi_ul2d
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",%progbits
