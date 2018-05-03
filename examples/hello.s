_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#calling 2
#addressing
	leal 	.L1, %eax
	movl 	%eax, -4(%EBP)
#ending addressing
	movl	-4(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-8(%EBP)
#end calling
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 24

	.L1: .asciz, "hello world\n"
