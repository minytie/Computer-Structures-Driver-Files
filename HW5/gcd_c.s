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
	.file	"gcd_c.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	gcd_c
	.code	16
	.thumb_func
	.type	gcd_c, %function
gcd_c:
.LFB0:
	.file 1 "gcd_c.c"
	.loc 1 39 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 40 0
	mov	r3, #0
	str	r3, [r7, #12]
	.loc 1 42 0
	b	.L2
.L4:
	.loc 1 43 0
	ldr	r3, [r7, #4]
	asr	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 44 0
	ldr	r3, [r7]
	asr	r3, r3, #1
	str	r3, [r7]
	.loc 1 45 0
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	.loc 1 42 0 discriminator 1
	ldr	r2, [r7, #4]
	mov	r3, #1
	and	r3, r2
	bne	.L3
	.loc 1 42 0 is_stmt 0 discriminator 2
	ldr	r2, [r7]
	mov	r3, #1
	and	r3, r2
	beq	.L4
.L3:
	.loc 1 47 0 is_stmt 1
	b	.L5
.L9:
	.loc 1 48 0
	ldr	r2, [r7, #4]
	mov	r3, #1
	and	r3, r2
	bne	.L6
	.loc 1 48 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	asr	r3, r3, #1
	str	r3, [r7, #4]
	b	.L5
.L6:
	.loc 1 49 0 is_stmt 1
	ldr	r2, [r7]
	mov	r3, #1
	and	r3, r2
	bne	.L7
	.loc 1 49 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	asr	r3, r3, #1
	str	r3, [r7]
	b	.L5
.L7:
	.loc 1 50 0 is_stmt 1
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	ble	.L8
	.loc 1 50 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	sub	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [r7, #4]
	b	.L5
.L8:
	.loc 1 51 0 is_stmt 1
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	sub	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [r7]
.L5:
	.loc 1 47 0 discriminator 1
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L9
	.loc 1 53 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	mov	r1, r2
	lsl	r1, r1, r3
	mov	r3, r1
	.loc 1 54 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE0:
	.size	gcd_c, .-gcd_c
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x67
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0x1
	.4byte	.LASF1
	.4byte	.LASF2
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x27
	.4byte	0x63
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x63
	.uleb128 0x3
	.ascii	"a\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.ascii	"b\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.ascii	"d\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x5
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
	.ascii	"gcd_c.c\000"
.LASF2:
	.ascii	"/u/rpmullig/CS-Spring-2016/HW5\000"
.LASF0:
	.ascii	"GNU C 4.8.4 20140526 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 211358] -mcpu=cortex-m0 -mthumb -g\000"
.LASF3:
	.ascii	"gcd_c\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140526 (release) [ARM/embedded-4_8-branch revision 211358]"
