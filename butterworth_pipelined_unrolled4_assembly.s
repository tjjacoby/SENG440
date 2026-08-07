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
	.file	"butterworth_pipelined_unrolled4.c"
@ GNU C17 (Debian 14.2.0-19) version 14.2.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

@ warning: MPFR header version 4.2.1 differs from library version 4.2.2.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-a7 -mfloat-abi=hard -mtls-dialect=gnu -mthumb -march=armv7ve+simd -O3
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
	@ args = 0, pretend = 0, frame = 800056
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ butterworth_pipelined_unrolled4.c:175:     for (int n = 0; n < N; n++) {
	movs	r5, #1	@ n,
@ butterworth_pipelined_unrolled4.c:172: {
	vpush.64	{d8, d9, d10, d11}	@
	sub	sp, sp, #798720	@,,
@ butterworth_pipelined_unrolled4.c:181:         x[n] = (int)(input * (1 << 14));
	movs	r2, #0	@ tmp261,
@ butterworth_pipelined_unrolled4.c:172: {
	subw	sp, sp, #1372	@,,
@ butterworth_pipelined_unrolled4.c:181:         x[n] = (int)(input * (1 << 14));
	add	fp, sp, #1368	@ tmp508,,
	add	r8, sp, #798720	@ _243,,
@ butterworth_pipelined_unrolled4.c:176:         double time = (double)n / SAMPLE_RATE;
	vldr.64	d11, .L14	@ tmp266,
@ butterworth_pipelined_unrolled4.c:177:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d10, .L14+8	@ tmp268,
@ butterworth_pipelined_unrolled4.c:177:         double input = INPUT_AMPLITUDE * sin(
	vldr.64	d9, .L14+16	@ tmp270,
@ butterworth_pipelined_unrolled4.c:181:         x[n] = (int)(input * (1 << 14));
	vldr.64	d8, .L14+24	@ tmp272,
@ butterworth_pipelined_unrolled4.c:181:         x[n] = (int)(input * (1 << 14));
	sub	r3, fp, #1280	@ tmp260, tmp508,
	addw	r8, r8, #1364	@ _243, _243,
	mov	r4, r3	@ ivtmp.25, tmp260
	add	r7, r3, #798720	@ tmp509, ivtmp.25,
	str	r2, [r3]	@ tmp261, x[0]
	mov	r6, r3	@ ivtmp.36, ivtmp.25
.L2:
@ butterworth_pipelined_unrolled4.c:176:         double time = (double)n / SAMPLE_RATE;
	vmov	s15, r5	@ int	@ n, n
@ butterworth_pipelined_unrolled4.c:175:     for (int n = 0; n < N; n++) {
	adds	r5, r5, #1	@ n, n,
@ butterworth_pipelined_unrolled4.c:176:         double time = (double)n / SAMPLE_RATE;
	vcvt.f64.s32	d16, s15	@ _165, n
@ butterworth_pipelined_unrolled4.c:176:         double time = (double)n / SAMPLE_RATE;
	vdiv.f64	d0, d16, d11	@ _203, _165, tmp266
@ butterworth_pipelined_unrolled4.c:177:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d10	@, _203, tmp268
	bl	sin(PLT)	@
@ butterworth_pipelined_unrolled4.c:177:         double input = INPUT_AMPLITUDE * sin(
	vmul.f64	d0, d0, d9	@ input_35, tmp511, tmp270
@ butterworth_pipelined_unrolled4.c:181:         x[n] = (int)(input * (1 << 14));
	vmul.f64	d0, d0, d8	@ _4, input_35, tmp272
@ butterworth_pipelined_unrolled4.c:181:         x[n] = (int)(input * (1 << 14));
	vcvt.s32.f64	s0, d0	@ tmp273, _4
	vmov	r3, s0	@ int	@ tmp273, tmp273
	str	r3, [r6, #4]!	@ tmp273, MEM[(int *)_245]
@ butterworth_pipelined_unrolled4.c:175:     for (int n = 0; n < N; n++) {
	cmp	r8, r6	@ _243, ivtmp.36
	bne	.L2		@,
@ butterworth_pipelined_unrolled4.c:187:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	sub	r1, fp, #1312	@, tmp508,
	movs	r0, #2	@,
	bl	__clock_gettime64(PLT)	@
@ butterworth_pipelined_unrolled4.c:187:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
	cmp	r0, #0	@ current_input
	bne	.L12	@
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r0, r0	@ result, current_input, current_input
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, current_input
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:59:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	str	r3, [sp, #36]	@ current_feedforward, %sfp
	add	r2, r7, #1264	@ _249, tmp509,
	str	r2, [sp, #40]	@ _249, %sfp
@ butterworth_pipelined_unrolled4.c:60:             y = __QADD(y, a2 * y2);
	movw	r6, #58773	@ tmp296,
	movt	r6, 65535	@ tmp296,
@ butterworth_pipelined_unrolled4.c:35:     register int y2 = 0;
	mov	r1, r0	@ y2, current_input
@ butterworth_pipelined_unrolled4.c:59:             register int y = __QADD(current_feedforward, a1 * y1);
	str	fp, [sp, #44]	@ tmp508, %sfp
@ butterworth_pipelined_unrolled4.c:34:     register int y1 = 0;
	mov	r2, r0	@ y1, current_input
@ butterworth_pipelined_unrolled4.c:33:     register int x1 = 0;
	mov	r5, r0	@ x1, current_input
@ butterworth_pipelined_unrolled4.c:50:             register int next_feedforward = __QADD(
	movw	lr, #1105	@ tmp284,
	movw	r8, #2210	@ tmp287,
@ butterworth_pipelined_unrolled4.c:59:             register int y = __QADD(current_feedforward, a1 * y1);
	movw	r7, #18727	@ tmp293,
.L5:
@ butterworth_pipelined_unrolled4.c:49:             register int next_input = x[i + 1];
	ldr	ip, [r4, #4]	@ next_input, MEM[(const int *)_255 + 4B]
@ butterworth_pipelined_unrolled4.c:50:             register int next_feedforward = __QADD(
	mul	r10, r8, r0	@ _60, tmp287, current_input
	mul	r9, lr, ip	@ _58, tmp284, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r10, r9, r10	@ result, _58, _60
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:54:             next_feedforward = __QADD(
	.thumb
	.syntax unified
	mul	r5, lr, r5	@ _63, tmp284, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r5, r10, r5	@ result, result, _63
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:59:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r7, r2	@ _66, tmp293, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	ldr	r3, [sp, #36]	@ current_feedforward, %sfp
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, current_feedforward, _66
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:60:             y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, r6, r1	@ _70, tmp296, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _70
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:73:             register int next_feedforward = __QADD(
	.thumb
	.syntax unified
	mul	r1, r8, ip	@ _82, tmp287, next_input
@ butterworth_pipelined_unrolled4.c:61:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	ip, r3, #0, #14	@ _73, result,,
@ butterworth_pipelined_unrolled4.c:61:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _72, result,
@ butterworth_pipelined_unrolled4.c:61:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _73,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _72
@ butterworth_pipelined_unrolled4.c:72:             register int next_input = x[i + 2];
	ldr	ip, [r4, #8]	@ next_input, MEM[(const int *)_255 + 8B]
@ butterworth_pipelined_unrolled4.c:73:             register int next_feedforward = __QADD(
	mul	fp, lr, ip	@ _81, tmp284, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, fp, r1	@ result, _81, _82
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:77:             next_feedforward = __QADD(
	.thumb
	.syntax unified
	mul	r0, lr, r0	@ _84, tmp284, current_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _84
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:82:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r7, r3	@ _86, tmp293, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r0, r5, r0	@ result, result, _86
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:83:             y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r6, r2	@ _88, tmp296, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r0, r2	@ result, result, _88
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:84:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r0, r2, #0, #14	@ _91, result,,
@ butterworth_pipelined_unrolled4.c:95:             register int next_input = x[i + 3];
	ldr	r5, [r4, #12]	@ x1, MEM[(const int *)_255 + 12B]
@ butterworth_pipelined_unrolled4.c:84:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _90, result,
@ butterworth_pipelined_unrolled4.c:96:             register int next_feedforward = __QADD(
	mul	ip, r8, ip	@ _100, tmp287, next_input
@ butterworth_pipelined_unrolled4.c:84:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r0, #0	@ _91,
	it	ne		@
	orrne	r2, r2, #1	@,, y, _90
@ butterworth_pipelined_unrolled4.c:96:             register int next_feedforward = __QADD(
	mul	r10, lr, r5	@ _99, tmp284, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, r10, ip	@ result, _99, _100
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, ip, r9	@ result, result, _58
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:105:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	r0, r7, r2	@ _103, tmp293, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r0	@ result, result, _103
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:106:             y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r3, r6, r3	@ _105, tmp296, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r1, r1, r3	@ result, result, _105
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:107:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r3, r1, #0, #14	@ _108, result,,
@ butterworth_pipelined_unrolled4.c:118:             register int next_input = x[i + 4];
	ldr	r0, [r4, #16]!	@ current_input, MEM[(const int *)_255 + 16B]
@ butterworth_pipelined_unrolled4.c:107:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r1, #14	@ _107, result,
@ butterworth_pipelined_unrolled4.c:119:             register int next_feedforward = __QADD(
	mul	r9, lr, r0	@ _116, tmp284, current_input
@ butterworth_pipelined_unrolled4.c:107:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r3, #0	@ _108,
	it	ne		@
	orrne	r1, r1, #1	@,, y2, _107
@ butterworth_pipelined_unrolled4.c:119:             register int next_feedforward = __QADD(
	mul	r3, r8, r5	@ _117, tmp287, x1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r9, r3	@ result, _116, _117
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, fp	@ result, result, _81
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:128:             register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	fp, r7, r1	@ _120, tmp293, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	str	r3, [sp, #36]	@ result, %sfp
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd fp, ip, fp	@ result, result, _120
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:129:             y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r6, r2	@ _122, tmp296, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, fp, r2	@ result, result, _122
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:130:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	ip, r2, #0, #14	@ _125, result,,
@ butterworth_pipelined_unrolled4.c:46:     for (i = 0; i + 4 < sample_count; i += 4) {
	ldr	r3, [sp, #40]	@ _249, %sfp
@ butterworth_pipelined_unrolled4.c:130:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _124, result,
@ butterworth_pipelined_unrolled4.c:130:             y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	ip, #0	@ _125,
	it	ne		@
	orrne	r2, r2, #1	@,, y1, _124
@ butterworth_pipelined_unrolled4.c:46:     for (i = 0; i + 4 < sample_count; i += 4) {
	cmp	r3, r4	@ _249, ivtmp.25
	bne	.L5		@,
@ butterworth_pipelined_unrolled4.c:143:         register int next_feedforward = __QADD(
	ldr	fp, [sp, #44]	@ tmp508, %sfp
	ldr	r3, [sp, #36]	@ current_feedforward, %sfp
@ butterworth_pipelined_unrolled4.c:142:         register int next_input = x[i + 1];
	add	r5, fp, #794624	@ tmp357, tmp508,
@ butterworth_pipelined_unrolled4.c:143:         register int next_feedforward = __QADD(
	mul	r0, r8, r0	@ _210, tmp287, current_input
@ butterworth_pipelined_unrolled4.c:142:         register int next_input = x[i + 1];
	ldr	ip, [r5, #4084]	@ next_input, MEM[(const int *)&x + 799988B]
	add	r5, r5, #2816	@ tmp357, tmp357,
@ butterworth_pipelined_unrolled4.c:143:         register int next_feedforward = __QADD(
	mul	r4, lr, ip	@ _211, tmp284, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r0, r4, r0	@ result, _211, _210
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r0, r0, r10	@ result, result, _99
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:152:         register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	r10, r7, r2	@ _201, tmp293, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r10	@ result, current_feedforward, _201
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:153:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, r6, r1	@ _197, tmp296, y2
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r1	@ result, result, _197
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r10, r3, #0, #14	@ _187, result,,
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r1, r3, #14	@ _189, result,
@ butterworth_pipelined_unrolled4.c:142:         register int next_input = x[i + 1];
	ldr	r3, [r5, #1272]	@ next_input, MEM[(const int *)&x + 799992B]
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r10, #0	@ _187,
	it	ne		@
	orrne	r1, r1, #1	@,, y, _189
@ butterworth_pipelined_unrolled4.c:143:         register int next_feedforward = __QADD(
	mul	ip, r8, ip	@ _137, tmp287, next_input
	mul	r10, lr, r3	@ _140, tmp284, next_input
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, r10, ip	@ result, _140, _137
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd ip, ip, r9	@ result, result, _116
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:152:         register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	r9, r7, r1	@ _65, tmp293, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r0, r0, r9	@ result, result, _65
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:153:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r2, r6, r2	@ _59, tmp296, y1
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r0, r2	@ result, result, _59
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:143:         register int next_feedforward = __QADD(
	.thumb
	.syntax unified
	mul	r9, r8, r3	@ _138, tmp287, next_input
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r0, r2, #14	@ _30, result,
@ butterworth_pipelined_unrolled4.c:142:         register int next_input = x[i + 1];
	ldr	r8, [r5, #1276]	@ next_input, MEM[(const int *)&x + 799996B]
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	ubfx	r5, r2, #0, #14	@ _22, result,,
@ butterworth_pipelined_unrolled4.c:143:         register int next_feedforward = __QADD(
	mul	r3, lr, r8	@ _136, tmp284, next_input
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r5, #0	@ _22,
	it	ne		@
	orrne	r0, r0, #1	@,, y, _30
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r9	@ result, _136, _138
@ 0 "" 2
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r4	@ result, result, _211
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:152:         register int y = __QADD(current_feedforward, a1 * y1);
	.thumb
	.syntax unified
	mul	r2, r7, r0	@ _144, tmp293, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, ip, r2	@ result, result, _144
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:153:         y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r1, r6, r1	@ _148, tmp296, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r2, r2, r1	@ result, result, _148
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r1, r2, #0, #14	@ _151, result,,
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r2, r2, #14	@ _150, result,
@ butterworth_pipelined_unrolled4.c:154:         y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r1, #0	@ _151,
	it	ne		@
	orrne	r2, r2, #1	@,, y_154, _150
@ butterworth_pipelined_unrolled4.c:164:     register int y = __QADD(current_feedforward, a1 * y1);
	mul	r2, r7, r2	@ _156, tmp293, y_154
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r2	@ result, result, _156
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:165:     y = __QADD(y, a2 * y2);
	.thumb
	.syntax unified
	mul	r0, r6, r0	@ _158, tmp296, y
@ /home/student/seng440/filter/cmsis_compiler.h:24:     __asm__ volatile (
	.syntax unified
@ 24 "/home/student/seng440/filter/cmsis_compiler.h" 1
	qadd r3, r3, r0	@ result, result, _158
@ 0 "" 2
@ butterworth_pipelined_unrolled4.c:166:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	.thumb
	.syntax unified
	ubfx	r2, r3, #0, #14	@ _161, result,,
@ butterworth_pipelined_unrolled4.c:192:     volatile int y = run_IIR(x, N);
	subw	r4, fp, #1316	@ tmp435, tmp508,
@ butterworth_pipelined_unrolled4.c:166:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	asrs	r3, r3, #14	@ _160, result,
@ butterworth_pipelined_unrolled4.c:194:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	sub	r6, fp, #1296	@ tmp436, tmp508,
	mov	r1, r6	@, tmp436
	movs	r0, #2	@,
@ butterworth_pipelined_unrolled4.c:166:     y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);
	cmp	r2, #0	@ _161,
	it	ne		@
	orrne	r3, r3, #1	@,, y, _160
@ butterworth_pipelined_unrolled4.c:192:     volatile int y = run_IIR(x, N);
	str	r3, [r4]	@ y, y
@ butterworth_pipelined_unrolled4.c:194:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	bl	__clock_gettime64(PLT)	@
@ butterworth_pipelined_unrolled4.c:194:     if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
	mov	r5, r0	@ <retval>, tmp513
	cmp	r0, #0	@ <retval>
	bne	.L13	@
@ butterworth_pipelined_unrolled4.c:210:         (double)x[N - 1] / (1 << 14),
	vmov	s15, r8	@ int	@ next_input, next_input
@ butterworth_pipelined_unrolled4.c:211:         (double)y / (1 << 14)
	ldr	r3, [r4]	@ y.0_13, y
@ butterworth_pipelined_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sub	fp, fp, #1312	@ tmp447, tmp508,
@ butterworth_pipelined_unrolled4.c:203:     printf(
	vldr.64	d18, .L14+32	@ tmp483,
	ldr	r7, .L14+56	@ tmp480,
@ butterworth_pipelined_unrolled4.c:210:         (double)x[N - 1] / (1 << 14),
	vcvt.f64.s32	d16, s15	@ _11, next_input
@ butterworth_pipelined_unrolled4.c:211:         (double)y / (1 << 14)
	vmov	s15, r3	@ int	@ y.0_13, y.0_13
@ butterworth_pipelined_unrolled4.c:203:     printf(
	adr	r3, .L14+48	@,
	ldrd	r2, [r3]	@ tmp487,
.LPIC2:
	add	r7, pc	@ tmp480
	vmul.f64	d16, d16, d18	@ _12, _11, tmp483
@ butterworth_pipelined_unrolled4.c:211:         (double)y / (1 << 14)
	vcvt.f64.s32	d17, s15	@ _14, y.0_13
@ butterworth_pipelined_unrolled4.c:203:     printf(
	strd	r2, [sp, #8]	@ tmp487,,
	vmul.f64	d17, d17, d18	@ _15, _14, tmp483
	vstr.64	d16, [sp, #16]	@ _12,
	vstr.64	d17, [sp, #24]	@ _15,
@ butterworth_pipelined_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	ldrd	r3, r4, [r6]	@ end.tv_sec, tmp497, tmp436
	ldr	r1, [fp]	@ start.tv_sec, start.tv_sec
@ butterworth_pipelined_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldr	r2, [r6, #8]	@ end.tv_nsec, end.tv_nsec
@ butterworth_pipelined_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	subs	r3, r3, r1	@ seconds_39, end.tv_sec, start.tv_sec
@ butterworth_pipelined_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	mov	r1, #51712	@ tmp452,
@ butterworth_pipelined_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	ldrd	r6, r0, [fp, #4]	@ tmp499, start.tv_nsec, tmp447,
@ butterworth_pipelined_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	movt	r1, 15258	@ tmp452,
@ butterworth_pipelined_unrolled4.c:21:     int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
	sbc	r4, r4, r6	@ seconds_39, tmp497, tmp499
@ butterworth_pipelined_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	umull	r3, r6, r3, r1	@ _45, _45, seconds_39, tmp452
	mla	r6, r1, r4, r6	@ tmp458, tmp452, seconds_39, _45
@ butterworth_pipelined_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	subs	r1, r2, r0	@ nanoseconds_44, end.tv_nsec, start.tv_nsec
@ butterworth_pipelined_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	asr	r2, r2, #31	@ tmp465, end.tv_nsec,
@ butterworth_pipelined_unrolled4.c:22:     int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;
	sbc	r2, r2, r0, asr #31	@ nanoseconds_44, tmp465, start.tv_nsec,
@ butterworth_pipelined_unrolled4.c:24:     return (uint64_t)(seconds * 1000000000LL + nanoseconds);
	adds	r4, r3, r1	@ _47, _45, nanoseconds_44
	adc	r6, r6, r2	@ _47, tmp458, nanoseconds_44
@ butterworth_pipelined_unrolled4.c:200:     double ns_per_sample = (double)elapsed_ns / (double)N;
	mov	r0, r4	@, _47
	mov	r1, r6	@, _47
	bl	__aeabi_ul2d(PLT)	@
	vmov	d18, r0, r1	@ tmp514,
@ butterworth_pipelined_unrolled4.c:200:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vldr.64	d17, .L14+40	@ tmp490,
@ butterworth_pipelined_unrolled4.c:203:     printf(
	mov	r1, #3392	@,
	mov	r2, r4	@, _47
	movt	r1, 3	@,
	mov	r3, r6	@, _47
@ butterworth_pipelined_unrolled4.c:200:     double ns_per_sample = (double)elapsed_ns / (double)N;
	vdiv.f64	d16, d18, d17	@ ns_per_sample_26, tmp514, tmp490
@ butterworth_pipelined_unrolled4.c:203:     printf(
	mov	r0, r7	@ tmp480, tmp480
	vstr.64	d16, [sp]	@ ns_per_sample_26,
	bl	printf(PLT)	@
.L1:
@ butterworth_pipelined_unrolled4.c:215: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #798720	@,,
	addw	sp, sp, #1372	@,,
	@ sp needed	@
	vldm	sp!, {d8-d11}	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L12:
@ butterworth_pipelined_unrolled4.c:188:         perror("Unable to start benchmark timer");
	ldr	r0, .L14+60	@,
.LPIC0:
	add	r0, pc	@
	bl	perror(PLT)	@
.L4:
@ butterworth_pipelined_unrolled4.c:189:         return 1;
	movs	r5, #1	@ <retval>,
	b	.L1		@
.L13:
@ butterworth_pipelined_unrolled4.c:195:         perror("Unable to stop benchmark timer");
	ldr	r0, .L14+64	@,
.LPIC1:
	add	r0, pc	@
	bl	perror(PLT)	@
@ butterworth_pipelined_unrolled4.c:196:         return 1;
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
