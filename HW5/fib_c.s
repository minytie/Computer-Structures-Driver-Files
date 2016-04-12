	.syntax unified
	.cpu cortex-m3
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"fib_c.c"
	.text
	.align	2
	.global	fib_c
	.thumb
	.thumb_func
	.type	fib_c, %function
fib_c:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #1
	str	r3, [r7, #20]
	movs	r3, #1
	str	r3, [r7, #16]
	movs	r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L2
	movs	r3, #0
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L4
	movs	r3, #1
	b	.L3
.L4:
	movs	r3, #0
	str	r3, [r7, #8]
	b	.L5
.L6:
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #16]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L5:
	ldr	r3, [r7, #4]
	subs	r2, r3, #2
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bgt	.L6
	ldr	r3, [r7, #12]
.L3:
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	fib_c, .-fib_c
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140526 (release) [ARM/embedded-4_8-branch revision 211358]"
