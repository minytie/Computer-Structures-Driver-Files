	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"fib_c.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	fib_c
	.code	16
	.thumb_func
	.type	fib_c, %function
fib_c:
.LFB0:
	.file 1 "fib_c.c"
	.loc 1 37 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 38 0
	mov	r3, #1
	str	r3, [r7, #20]
	.loc 1 39 0
	mov	r3, #1
	str	r3, [r7, #16]
	.loc 1 40 0
	mov	r3, #1
	str	r3, [r7, #12]
	.loc 1 42 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L2
	.loc 1 42 0 is_stmt 0 discriminator 1
	mov	r3, #0
	b	.L3
.L2:
	.loc 1 43 0 is_stmt 1
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L4
	.loc 1 43 0 is_stmt 0 discriminator 1
	mov	r3, #1
	b	.L3
.L4:
	.loc 1 45 0 is_stmt 1
	mov	r3, #0
	str	r3, [r7, #8]
	b	.L5
.L6:
	.loc 1 46 0 discriminator 2
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	add	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 47 0 discriminator 2
	ldr	r3, [r7, #16]
	str	r3, [r7, #20]
	.loc 1 48 0 discriminator 2
	ldr	r3, [r7, #12]
	str	r3, [r7, #16]
	.loc 1 45 0 discriminator 2
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L5:
	.loc 1 45 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	sub	r2, r3, #2
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bgt	.L6
	.loc 1 50 0 is_stmt 1
	ldr	r3, [r7, #12]
.L3:
	.loc 1 52 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE0:
	.size	fib_c, .-fib_c
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x87
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF2
	.byte	0x1
	.4byte	.LASF3
	.4byte	.LASF4
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x25
	.4byte	0x83
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x83
	.uleb128 0x3
	.ascii	"num\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x4
	.4byte	.LASF0
	.byte	0x1
	.byte	0x26
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x1
	.byte	0x27
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x5
	.ascii	"val\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.ascii	"i\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF1:
	.ascii	"prev1\000"
.LASF0:
	.ascii	"prev2\000"
.LASF2:
	.ascii	"GNU C 4.8.4 20140526 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 211358] -mcpu=cortex-m0 -mthumb -g\000"
.LASF5:
	.ascii	"fib_c\000"
.LASF4:
	.ascii	"/u/rpmullig/CS-Spring-2016/HW5\000"
.LASF3:
	.ascii	"fib_c.c\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140526 (release) [ARM/embedded-4_8-branch revision 211358]"
