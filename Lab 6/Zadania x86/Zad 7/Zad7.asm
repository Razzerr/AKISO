	.file	"Zad7.c"
	.text
.Ltext0:
	.section	.rodata
.LC1:
	.string	"Iteracja: %i, %f\n"
.LC4:
	.string	"Your result is: %f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.file 1 "Zad7.c"
	.loc 1 6 0
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$192, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	.loc 1 6 0
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
.LBB2:
	.loc 1 8 0
	movl	$0, -160(%ebp)
	jmp	.L2
.L3:
	.loc 1 9 0 discriminator 3
	leal	-140(%ebp), %edx
	movl	-160(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	.loc 1 8 0 discriminator 3
	addl	$1, -160(%ebp)
.L2:
	.loc 1 8 0 is_stmt 0 discriminator 1
	cmpl	$127, -160(%ebp)
	jle	.L3
.LBE2:
	.loc 1 11 0 is_stmt 1
	movl	stdin@GOT(%ebx), %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$128
	leal	-140(%ebp), %eax
	pushl	%eax
	call	fgets@PLT
	addl	$16, %esp
.LBB3:
	.loc 1 12 0
	movl	$0, -156(%ebp)
	jmp	.L4
.L5:
	.loc 1 13 0 discriminator 3
	leal	-140(%ebp), %edx
	movl	-156(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	putchar@PLT
	addl	$16, %esp
	.loc 1 12 0 discriminator 3
	addl	$1, -156(%ebp)
.L4:
	.loc 1 12 0 is_stmt 0 discriminator 1
	cmpl	$127, -156(%ebp)
	jle	.L5
.LBE3:
	.loc 1 16 0 is_stmt 1
	movl	$0, -152(%ebp)
	.loc 1 17 0
	movl	$0, -148(%ebp)
	.loc 1 18 0
	fldz
	fstps	-164(%ebp)
	.loc 1 19 0
	movl	$0, -144(%ebp)
	.loc 1 20 0
	jmp	.L6
.L18:
	.loc 1 21 0
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -184(%ebp)
	fildl	-184(%ebp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	-152(%ebp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	.loc 1 22 0
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	jne	.L7
	.loc 1 22 0 is_stmt 0 discriminator 1
	cmpl	$0, -148(%ebp)
	jne	.L7
	.loc 1 23 0 is_stmt 1
#APP
# 23 "Zad7.c" 1
	FLD -164(%ebp);
# 0 "" 2
	.loc 1 24 0
#NO_APP
	fldz
	fstps	-164(%ebp)
	.loc 1 25 0
	movl	$0, -144(%ebp)
	jmp	.L8
.L7:
	.loc 1 26 0
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	jne	.L9
	.loc 1 27 0
	movl	$1, -144(%ebp)
	jmp	.L8
.L9:
	.loc 1 28 0
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jle	.L10
	.loc 1 28 0 is_stmt 0 discriminator 1
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	jg	.L10
	.loc 1 29 0 is_stmt 1
	cmpl	$0, -144(%ebp)
	jne	.L11
	.loc 1 30 0
	flds	-164(%ebp)
	flds	.LC2@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -184(%ebp)
	fildl	-184(%ebp)
	faddp	%st, %st(1)
	fstps	-164(%ebp)
	.loc 1 29 0
	jmp	.L8
.L11:
	.loc 1 32 0
	flds	-164(%ebp)
	fstpl	-184(%ebp)
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -192(%ebp)
	fildl	-192(%ebp)
	fstpl	-192(%ebp)
	fildl	-144(%ebp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	fldl	.LC3@GOTOFF(%ebx)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	call	pow@PLT
	addl	$16, %esp
	fdivrl	-192(%ebp)
	faddl	-184(%ebp)
	fstps	-172(%ebp)
	flds	-172(%ebp)
	fstps	-164(%ebp)
	.loc 1 33 0
	addl	$1, -144(%ebp)
	.loc 1 29 0
	jmp	.L8
.L10:
	.loc 1 36 0
	movl	$1, -148(%ebp)
	.loc 1 37 0
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	cmpl	$43, %eax
	je	.L13
	cmpl	$43, %eax
	jg	.L14
	cmpl	$42, %eax
	je	.L15
	jmp	.L8
.L14:
	cmpl	$45, %eax
	je	.L16
	cmpl	$47, %eax
	je	.L17
	jmp	.L8
.L15:
	.loc 1 39 0
#APP
# 39 "Zad7.c" 1
	FMULP
# 0 "" 2
	.loc 1 40 0
#NO_APP
	jmp	.L8
.L13:
	.loc 1 42 0
#APP
# 42 "Zad7.c" 1
	FADDP;
# 0 "" 2
	.loc 1 43 0
#NO_APP
	jmp	.L8
.L17:
	.loc 1 45 0
#APP
# 45 "Zad7.c" 1
	FDIVP;
# 0 "" 2
	.loc 1 46 0
#NO_APP
	jmp	.L8
.L16:
	.loc 1 48 0
#APP
# 48 "Zad7.c" 1
	FSUBP;
# 0 "" 2
	.loc 1 49 0
#NO_APP
	nop
.L8:
	.loc 1 52 0
	addl	$1, -152(%ebp)
.L6:
	.loc 1 20 0
	leal	-140(%ebp), %edx
	movl	-152(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	jne	.L18
	.loc 1 54 0
#APP
# 54 "Zad7.c" 1
	fst -164(%ebp);
# 0 "" 2
	.loc 1 55 0
#NO_APP
	flds	-164(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	.loc 1 56 0
	nop
	.loc 1 57 0
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L20
	call	__stack_chk_fail_local
.L20:
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC2:
	.long	1092616192
	.align 8
.LC3:
	.long	0
	.long	1076101120
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB6:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE6:
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/bits/sys_errlist.h"
	.file 7 "/usr/include/math.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x411
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF71
	.byte	0xc
	.long	.LASF72
	.long	.LASF73
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd8
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x37
	.long	0x61
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x8c
	.long	0x85
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x8d
	.long	0x6f
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.long	0x9f
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x7
	.long	0x9f
	.uleb128 0x8
	.long	.LASF43
	.byte	0x94
	.byte	0x4
	.byte	0xf1
	.long	0x228
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0xf2
	.long	0x5a
	.byte	0
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xf7
	.long	0x99
	.byte	0x4
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xf8
	.long	0x99
	.byte	0x8
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0xf9
	.long	0x99
	.byte	0xc
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0xfa
	.long	0x99
	.byte	0x10
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0xfb
	.long	0x99
	.byte	0x14
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0xfc
	.long	0x99
	.byte	0x18
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0xfd
	.long	0x99
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0xfe
	.long	0x99
	.byte	0x20
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x100
	.long	0x99
	.byte	0x24
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x101
	.long	0x99
	.byte	0x28
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x102
	.long	0x99
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x104
	.long	0x260
	.byte	0x30
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x106
	.long	0x266
	.byte	0x34
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x108
	.long	0x5a
	.byte	0x38
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x10c
	.long	0x5a
	.byte	0x3c
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x10e
	.long	0x7a
	.byte	0x40
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x112
	.long	0x3e
	.byte	0x44
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x113
	.long	0x4c
	.byte	0x46
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x114
	.long	0x26c
	.byte	0x47
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x118
	.long	0x27c
	.byte	0x48
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x121
	.long	0x8c
	.byte	0x4c
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x129
	.long	0x97
	.byte	0x54
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x12a
	.long	0x97
	.byte	0x58
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x12b
	.long	0x97
	.byte	0x5c
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x12c
	.long	0x97
	.byte	0x60
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.value	0x12e
	.long	0x25
	.byte	0x64
	.uleb128 0xa
	.long	.LASF41
	.byte	0x4
	.value	0x12f
	.long	0x5a
	.byte	0x68
	.uleb128 0xa
	.long	.LASF42
	.byte	0x4
	.value	0x131
	.long	0x282
	.byte	0x6c
	.byte	0
	.uleb128 0xb
	.long	.LASF74
	.byte	0x4
	.byte	0x96
	.uleb128 0x8
	.long	.LASF44
	.byte	0xc
	.byte	0x4
	.byte	0x9c
	.long	0x260
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0x9d
	.long	0x260
	.byte	0
	.uleb128 0x9
	.long	.LASF46
	.byte	0x4
	.byte	0x9e
	.long	0x266
	.byte	0x4
	.uleb128 0x9
	.long	.LASF47
	.byte	0x4
	.byte	0xa2
	.long	0x5a
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x22f
	.uleb128 0x6
	.byte	0x4
	.long	0xab
	.uleb128 0xc
	.long	0x9f
	.long	0x27c
	.uleb128 0xd
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x228
	.uleb128 0xc
	.long	0x9f
	.long	0x292
	.uleb128 0xd
	.long	0x30
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.long	.LASF75
	.uleb128 0xf
	.long	.LASF48
	.byte	0x4
	.value	0x13b
	.long	0x292
	.uleb128 0xf
	.long	.LASF49
	.byte	0x4
	.value	0x13c
	.long	0x292
	.uleb128 0xf
	.long	.LASF50
	.byte	0x4
	.value	0x13d
	.long	0x292
	.uleb128 0x6
	.byte	0x4
	.long	0xa6
	.uleb128 0x7
	.long	0x2bb
	.uleb128 0x10
	.long	.LASF51
	.byte	0x5
	.byte	0x87
	.long	0x266
	.uleb128 0x10
	.long	.LASF52
	.byte	0x5
	.byte	0x88
	.long	0x266
	.uleb128 0x10
	.long	.LASF53
	.byte	0x5
	.byte	0x89
	.long	0x266
	.uleb128 0x10
	.long	.LASF54
	.byte	0x6
	.byte	0x1a
	.long	0x5a
	.uleb128 0xc
	.long	0x2c1
	.long	0x2fd
	.uleb128 0x11
	.byte	0
	.uleb128 0x7
	.long	0x2f2
	.uleb128 0x10
	.long	.LASF55
	.byte	0x6
	.byte	0x1b
	.long	0x2fd
	.uleb128 0x3
	.byte	0xc
	.byte	0x4
	.long	.LASF56
	.uleb128 0xf
	.long	.LASF57
	.byte	0x7
	.value	0x14a
	.long	0x5a
	.uleb128 0x12
	.byte	0x5
	.byte	0x4
	.long	0x5a
	.byte	0x7
	.value	0x233
	.long	0x34d
	.uleb128 0x13
	.long	.LASF58
	.sleb128 -1
	.uleb128 0x14
	.long	.LASF59
	.byte	0
	.uleb128 0x14
	.long	.LASF60
	.byte	0x1
	.uleb128 0x14
	.long	.LASF61
	.byte	0x2
	.uleb128 0x14
	.long	.LASF62
	.byte	0x3
	.byte	0
	.uleb128 0x15
	.long	.LASF63
	.byte	0x7
	.value	0x239
	.long	0x320
	.uleb128 0xf
	.long	.LASF64
	.byte	0x7
	.value	0x23e
	.long	0x34d
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF65
	.uleb128 0x16
	.long	.LASF76
	.byte	0x1
	.byte	0x5
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x3fd
	.uleb128 0x17
	.long	.LASF66
	.byte	0x1
	.byte	0x7
	.long	0x3fd
	.uleb128 0x3
	.byte	0x75
	.sleb128 -140
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x10
	.long	0x5a
	.uleb128 0x3
	.byte	0x75
	.sleb128 -152
	.uleb128 0x17
	.long	.LASF67
	.byte	0x1
	.byte	0x11
	.long	0x5a
	.uleb128 0x3
	.byte	0x75
	.sleb128 -148
	.uleb128 0x17
	.long	.LASF68
	.byte	0x1
	.byte	0x12
	.long	0x40d
	.uleb128 0x3
	.byte	0x75
	.sleb128 -164
	.uleb128 0x17
	.long	.LASF69
	.byte	0x1
	.byte	0x13
	.long	0x5a
	.uleb128 0x3
	.byte	0x75
	.sleb128 -144
	.uleb128 0x19
	.long	.LBB2
	.long	.LBE2-.LBB2
	.long	0x3e5
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x8
	.long	0x5a
	.uleb128 0x3
	.byte	0x75
	.sleb128 -160
	.byte	0
	.uleb128 0x1a
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0xc
	.long	0x5a
	.uleb128 0x3
	.byte	0x75
	.sleb128 -156
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x9f
	.long	0x40d
	.uleb128 0xd
	.long	0x30
	.byte	0x7f
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF70
	.byte	0
	.section	.debug_abbrev,"",@progbits
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"__off_t"
.LASF15:
	.string	"_IO_read_ptr"
.LASF27:
	.string	"_chain"
.LASF8:
	.string	"size_t"
.LASF33:
	.string	"_shortbuf"
.LASF50:
	.string	"_IO_2_1_stderr_"
.LASF21:
	.string	"_IO_buf_base"
.LASF7:
	.string	"long long unsigned int"
.LASF6:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF28:
	.string	"_fileno"
.LASF16:
	.string	"_IO_read_end"
.LASF11:
	.string	"long int"
.LASF62:
	.string	"_ISOC_"
.LASF14:
	.string	"_flags"
.LASF22:
	.string	"_IO_buf_end"
.LASF31:
	.string	"_cur_column"
.LASF60:
	.string	"_XOPEN_"
.LASF9:
	.string	"__quad_t"
.LASF65:
	.string	"double"
.LASF30:
	.string	"_old_offset"
.LASF35:
	.string	"_offset"
.LASF69:
	.string	"decimalflag"
.LASF44:
	.string	"_IO_marker"
.LASF51:
	.string	"stdin"
.LASF0:
	.string	"unsigned int"
.LASF3:
	.string	"long unsigned int"
.LASF75:
	.string	"_IO_FILE_plus"
.LASF19:
	.string	"_IO_write_ptr"
.LASF59:
	.string	"_SVID_"
.LASF54:
	.string	"sys_nerr"
.LASF46:
	.string	"_sbuf"
.LASF67:
	.string	"opStart"
.LASF2:
	.string	"short unsigned int"
.LASF64:
	.string	"_LIB_VERSION"
.LASF23:
	.string	"_IO_save_base"
.LASF73:
	.string	"/home/razzer/Desktop/List6/Zadania x86"
.LASF34:
	.string	"_lock"
.LASF29:
	.string	"_flags2"
.LASF41:
	.string	"_mode"
.LASF52:
	.string	"stdout"
.LASF48:
	.string	"_IO_2_1_stdin_"
.LASF56:
	.string	"long double"
.LASF20:
	.string	"_IO_write_end"
.LASF71:
	.string	"GNU C11 7.2.0 -m32 -mtune=generic -march=i686 -g -fstack-protector-strong"
.LASF74:
	.string	"_IO_lock_t"
.LASF43:
	.string	"_IO_FILE"
.LASF70:
	.string	"float"
.LASF47:
	.string	"_pos"
.LASF55:
	.string	"sys_errlist"
.LASF26:
	.string	"_markers"
.LASF58:
	.string	"_IEEE_"
.LASF1:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF63:
	.string	"_LIB_VERSION_TYPE"
.LASF32:
	.string	"_vtable_offset"
.LASF49:
	.string	"_IO_2_1_stdout_"
.LASF66:
	.string	"input"
.LASF13:
	.string	"char"
.LASF72:
	.string	"Zad7.c"
.LASF45:
	.string	"_next"
.LASF12:
	.string	"__off64_t"
.LASF17:
	.string	"_IO_read_base"
.LASF25:
	.string	"_IO_save_end"
.LASF36:
	.string	"__pad1"
.LASF37:
	.string	"__pad2"
.LASF38:
	.string	"__pad3"
.LASF39:
	.string	"__pad4"
.LASF40:
	.string	"__pad5"
.LASF42:
	.string	"_unused2"
.LASF53:
	.string	"stderr"
.LASF57:
	.string	"signgam"
.LASF68:
	.string	"tempfloat"
.LASF24:
	.string	"_IO_backup_base"
.LASF61:
	.string	"_POSIX_"
.LASF76:
	.string	"main"
.LASF18:
	.string	"_IO_write_base"
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
