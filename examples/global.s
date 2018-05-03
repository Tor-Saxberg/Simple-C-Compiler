_foo:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$foo.size, %esp
#assigning
#gen left
#gen right
#adding
	movl 	_x, %eax
	addl 	$1, %eax
	movl 	%eax, -4(%EBP)
#end adding
#not ind
#right assign
	movl 	-4(%EBP), %eax
#left assign
	movl 	%eax,_x
#end assigning
#returning
#adding
	movl 	_x, %eax
	addl 	$1, %eax
	movl 	%eax, -8(%EBP)
#end adding
	movl	-8(%EBP), %eax
	jmp	.L0
#end return
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_foo
	.set	foo.size, 8

_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$65, %eax
#left assign
	movl 	%eax,_x
#end assigning
#calling 2
	movl	_x, %eax
	movl	%eax, 0(%esp)
	call	_putchar
	movl 	%eax,-4(%EBP)
#end calling
#calling 2
#calling 2
	call	_foo
	movl 	%eax,-8(%EBP)
#end calling
	movl	-8(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_putchar
	movl 	%eax,-12(%EBP)
#end calling
#calling 2
	movl	_x, %eax
	movl	%eax, 0(%esp)
	call	_putchar
	movl 	%eax,-16(%EBP)
#end calling
#calling 2
	movl	$10, %eax
	movl	%eax, 0(%esp)
	call	_putchar
	movl 	%eax,-20(%EBP)
#end calling
.L1:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 24

	.data
	.comm	_x, 4, 4
