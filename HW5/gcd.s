	.text
	.syntax unified
	.thumb
	.global	gcd	
	.type gcd, %function
/*gcd:
	push {r4-r7}
	movs r2, #0	  @ this is D
	movs r3, #1	  @ as a place holder
	b while_statement1

while_statement1:
	movs r4, r0	@setup 2 variables for comparison
	movs r5, r1
	
	ands r4, r3	@ set them as the D variable
	ands r5, r3

	orrs r4,r4,r5   @ this is: (A&1) || (B&1)
	cmp r4, r5
	beq while_statement2
	
	asrs r0, r3	@shift A & B >>> 1 (or r5 here)
	asrs r2, r3	
	
	adds r2, r3	@ increment D
	b while_statement1

while_statement2:
	cmp r0, r1	@while (a != b)
	beq FINAL

	
	
	movs r4, r0	@set r4 to A and r5 to D
	movs r5, r1

	ands r4, r3	@(A &1)
	cmp  r4, r3	@(A &1) == 1
	bne  shift_left_a

	ands r5, r3	@(B & 1)
	cmp r5, r3	@(B & 1)
	bne shift_left_b @(B & 1) == 1

	cmp r0, r1
	bgt reset	@ redo the temporary variables r4 and r5
	b reset2


shift_left_a:
	lsls r0,r3 	@shift by D
	b while_statement2
	

shift_left_b:
	asrs r1, r3	  @ b>>> 1
	b while_statement2


shift_1:
	asrs r0, r3	 @ a>>> 1
	b while_statement2

	
reset:
	movs r4, r0 	@ reset r4 and r5 temporary variables
	movs r5, r1
	
	subs r4, r5  	@ a = (a-b)
	asrs r4, r3  	@ a = (a-b) >> 1
	movs r0, r4  	@ put r4(a) into r1

	b while_statement2

	
reset2:
	movs r4, r0
	movs r5, r1
	
	subs r5, r4 	@ b = (b -a) 
	asrs r5, r3	@ b = (b - a) >> 1
	movs r1, r5	@ put value into r1 

	b while_statement2
	
	


	Your implementation goes here. 
FINAL:	
	pop {r4-r7}
	bx	lr
*/
gcd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push {r4-r7}
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	movs r4, #1	  		@ as a place holder
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
	ands	r3, r3, r4
	cmp	r3, #0
	bne	.L3
	ldr	r3, [r7]
	ands	r3, r3, r4
	cmp	r3, #0
	beq	.L4
.L3:
	b	.L5
.L9:
	ldr	r3, [r7, #4]
	ands	r3, r3, r4
	cmp	r3, #0
	bne	.L6
	ldr	r3, [r7, #4]
	asrs	r3, r3, #1
	str	r3, [r7, #4]
	b	.L5
.L6:
	ldr	r3, [r7]
	ands	r3, r3, r4
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
	lsls	r3, r2
	mov	r0, r3
	adds	r7, r7, #20
	pop {r4-r7}
	bx	lr
