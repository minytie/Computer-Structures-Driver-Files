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
	.file	"gcd_c.c"
	.text
	.align	2
	.global	gcd_c
	.thumb
	.thumb_func
	.type	gcd_c, %function
gcd_c:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L4:
	ldr	r3, [r7, #4]
	asrs	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7]
	asrs	r3, r3, #1
	str	r3, [r7]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #4]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L3
	ldr	r3, [r7]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L4
.L3:
	b	.L5
.L9:
	ldr	r3, [r7, #4]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L6
	ldr	r3, [r7, #4]
	asrs	r3, r3, #1
	str	r3, [r7, #4]
	b	.L5
.L6:
	ldr	r3, [r7]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L7
	ldr	r3, [r7]
	asrs	r3, r3, #1
	str	r3, [r7]
	b	.L5
.L7:
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	ble	.L8
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	subs	r3, r2, r3
	asrs	r3, r3, #1
	str	r3, [r7, #4]
	b	.L5
.L8:
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	asrs	r3, r3, #1
	str	r3, [r7]
.L5:
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L9
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	lsl	r3, r2, r3
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	gcd_c, .-gcd_c
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140526 (release) [ARM/embedded-4_8-branch revision 211358]"
