	.text
	.file	"factorial.ll"
	.globl	func.factorial          # -- Begin function func.factorial
	.p2align	4, 0x90
	.type	func.factorial,@function
func.factorial:                         # @func.factorial
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	%edi, 12(%rsp)
	testl	%edi, %edi
	jne	.LBB0_3
# %bb.1:                                # %then_0
	movl	$1, %eax
	jmp	.LBB0_2
.LBB0_3:                                # %else_0
	movl	12(%rsp), %ebx
	leal	-1(%rbx), %edi
	callq	func.factorial
	imull	%ebx, %eax
.LBB0_2:                                # %then_0
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func.factorial, .Lfunc_end0-func.factorial
	.cfi_endproc
                                        # -- End function
	.globl	func.factorial2         # -- Begin function func.factorial2
	.p2align	4, 0x90
	.type	func.factorial2,@function
func.factorial2:                        # @func.factorial2
	.cfi_startproc
# %bb.0:
	movl	%edi, -4(%rsp)
	movl	$1, -8(%rsp)
	movl	$1, -12(%rsp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_2:                                # %for_body_0
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%rsp), %eax
	movl	-12(%rsp), %ecx
	imull	%eax, %ecx
	movl	%ecx, -12(%rsp)
	incl	%eax
	movl	%eax, -8(%rsp)
.LBB1_1:                                # %cond_for_0
                                        # =>This Inner Loop Header: Depth=1
	movl	-8(%rsp), %eax
	cmpl	-4(%rsp), %eax
	jle	.LBB1_2
# %bb.3:                                # %for_end_0
	movl	-12(%rsp), %eax
	retq
.Lfunc_end1:
	.size	func.factorial2, .Lfunc_end1-func.factorial2
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, program.args(%rip)
	movq	8(%rsi), %rdi
	callq	atoi
	movl	%eax, 4(%rsp)
	movl	%eax, %edi
	callq	func.factorial
	movl	%eax, %ecx
	movl	$.L.str_int, %edi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	printf
	movl	4(%rsp), %edi
	callq	func.factorial2
	movl	%eax, %ecx
	movl	$.L.str_int, %edi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	printf
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str_int,@object      # @.str_int
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str_int:
	.asciz	"%d\n"
	.size	.L.str_int, 4

	.type	.L.str_float,@object    # @.str_float
.L.str_float:
	.asciz	"%.08f\n"
	.size	.L.str_float, 7

	.type	.L.str_string,@object   # @.str_string
.L.str_string:
	.asciz	"%s\n"
	.size	.L.str_string, 4

	.type	.L.false,@object        # @.false
.L.false:
	.asciz	"false\n"
	.size	.L.false, 7

	.type	.L.true,@object         # @.true
.L.true:
	.asciz	"true\n"
	.size	.L.true, 6

	.type	.L.new_line,@object     # @.new_line
.L.new_line:
	.asciz	"\n"
	.size	.L.new_line, 2

	.type	program.args,@object    # @program.args
	.bss
	.globl	program.args
	.p2align	3
program.args:
	.quad	0
	.size	program.args, 8

	.type	.arg,@object            # @.arg
	.globl	.arg
	.p2align	2
.arg:
	.long	0                       # 0x0
	.size	.arg, 4


	.section	".note.GNU-stack","",@progbits
