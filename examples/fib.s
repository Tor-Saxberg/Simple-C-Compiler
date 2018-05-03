_fib:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$fib.size, %esp
#IF
#logical or left
#equal
	movl 	8(%ebp), %eax
	cmpl 	$0, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -8(%EBP)
#end equal
	movl 	-8(%EBP), %eax
	cmpl 	 $0, %eax
	jne 	.L3
#logical or right
#equal
	movl 	8(%ebp), %eax
	cmpl 	$1, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -12(%EBP)
#end equal
	movl 	-12(%EBP), %eax
	cmpl $0, %eax
.L3:
	setne 	%al
	movzbl 	%al, %eax
	movl 	%eax, -4(%EBP)
#end logical or
	movl 	-4(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L2
#returning
	movl	$1, %eax
	jmp	.L0
#end return
	jmp 	.L2
.L2:
#end IF
#returning
#adding
#calling 2
#subtracting
	movl 	8(%ebp), %eax
	subl 	$1, %eax
	movl 	%eax, -16(%EBP)
#ending subtract
	movl	-16(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_fib
	movl 	%eax,-20(%EBP)
#end calling
#calling 2
#subtracting
	movl 	8(%ebp), %eax
	subl 	$2, %eax
	movl 	%eax, -24(%EBP)
#ending subtract
	movl	-24(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_fib
	movl 	%eax,-28(%EBP)
#end calling
	movl 	-20(%EBP), %eax
	addl 	-28(%EBP), %eax
	movl 	%eax, -32(%EBP)
#end adding
	movl	-32(%EBP), %eax
	jmp	.L0
#end return
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_fib
	.set	fib.size, 40

_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#calling 2
#addressing
	leal 	-4(%ebp), %eax
	movl 	%eax, -8(%EBP)
#ending addressing
	movl	-8(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L5, %eax
	movl 	%eax, -12(%EBP)
#ending addressing
	movl	-12(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_scanf
	movl 	%eax,-16(%EBP)
#end calling
#calling 2
#calling 2
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_fib
	movl 	%eax,-20(%EBP)
#end calling
	movl	-20(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L6, %eax
	movl 	%eax, -24(%EBP)
#ending addressing
	movl	-24(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-28(%EBP)
#end calling
.L4:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 40

	.L5: .asciz, "%d"
	.L6: .asciz, "%d\n"
