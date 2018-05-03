_allocate:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$allocate.size, %esp
#assigning
#gen left
#gen right
#calling 2
#multiply
	movl 	8(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -12(%EBP)
#ending multiply
	movl	-12(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_malloc
	movl 	%eax,-16(%EBP)
#end calling
#not ind
#right assign
	movl 	-16(%EBP), %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
#for
#initializing
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
.L1:
#comparing
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	8(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -20(%EBP)
#end Less than
	movl 	-20(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L2
#excecuting body
#assigning
#gen left
#dereference ind
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -24(%EBP)
#ending multiply
	movl 	-8(%ebp), %eax
	addl 	-24(%EBP), %eax
	movl 	%eax, -28(%EBP)
#end adding
#end dereference ind
#gen right
#calling 2
#multiply
	movl 	8(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -32(%EBP)
#ending multiply
	movl	-32(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_malloc
	movl 	%eax,-36(%EBP)
#end calling
#ind
#right assign
	movl 	-36(%EBP), %eax
#left assign
	movl 	-28(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
#incrementing
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -40(%EBP)
#end adding
#not ind
#right assign
	movl 	-40(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	.L1
.L2:
#end for
#returning
	movl	-8(%ebp), %eax
	jmp	.L0
#end return
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_allocate
	.set	allocate.size, 56

_initialize:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$initialize.size, %esp
#for
#initializing
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
.L4:
#comparing
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	12(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -12(%EBP)
#end Less than
	movl 	-12(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L5
#excecuting body
#for
#initializing
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
.L6:
#comparing
#Less than
	movl 	-8(%ebp), %eax
	cmpl 	12(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -16(%EBP)
#end Less than
	movl 	-16(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L7
#excecuting body
#assigning
#gen left
#dereference ind
#adding
#dereference
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -20(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-20(%EBP), %eax
	movl 	%eax, -24(%EBP)
#end adding
	movl 	-24(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -28(%EBP)
#end dereference
#multiply
	movl 	-8(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -32(%EBP)
#ending multiply
	movl 	-28(%EBP), %eax
	addl 	-32(%EBP), %eax
	movl 	%eax, -36(%EBP)
#end adding
#end dereference ind
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	-8(%ebp), %eax
	movl 	%eax, -40(%EBP)
#end adding
#ind
#right assign
	movl 	-40(%EBP), %eax
#left assign
	movl 	-36(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
#incrementing
#assigning
#gen left
#gen right
#adding
	movl 	-8(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -44(%EBP)
#end adding
#not ind
#right assign
	movl 	-44(%EBP), %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
	jmp 	.L6
.L7:
#end for
#incrementing
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -48(%EBP)
#end adding
#not ind
#right assign
	movl 	-48(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	.L4
.L5:
#end for
.L3:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_initialize
	.set	initialize.size, 56

_display:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$display.size, %esp
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#while
.L9:
#comparing
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	12(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -16(%EBP)
#end Less than
	movl 	-16(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L10
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
#while
.L11:
#comparing
#Less than
	movl 	-8(%ebp), %eax
	cmpl 	12(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -20(%EBP)
#end Less than
	movl 	-20(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L12
#assigning
#gen left
#gen right
#dereference
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -24(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-24(%EBP), %eax
	movl 	%eax, -28(%EBP)
#end adding
	movl 	-28(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -32(%EBP)
#end dereference
#not ind
#right assign
	movl 	-32(%EBP), %eax
#left assign
	movl 	%eax,-12(%ebp)
#end assigning
#calling 2
#dereference
#adding
#multiply
	movl 	-8(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -36(%EBP)
#ending multiply
	movl 	-12(%ebp), %eax
	addl 	-36(%EBP), %eax
	movl 	%eax, -40(%EBP)
#end adding
	movl 	-40(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -44(%EBP)
#end dereference
	movl	-44(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L13, %eax
	movl 	%eax, -48(%EBP)
#ending addressing
	movl	-48(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-52(%EBP)
#end calling
#assigning
#gen left
#gen right
#adding
	movl 	-8(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -56(%EBP)
#end adding
#not ind
#right assign
	movl 	-56(%EBP), %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
	jmp 	 .L11
.L12:
#end while
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -60(%EBP)
#end adding
#not ind
#right assign
	movl 	-60(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
#addressing
	leal 	.L14, %eax
	movl 	%eax, -64(%EBP)
#ending addressing
	movl	-64(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-68(%EBP)
#end calling
	jmp 	 .L9
.L10:
#end while
.L8:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_display
	.set	display.size, 88

_deallocate:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$deallocate.size, %esp
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#while
.L16:
#comparing
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	12(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -8(%EBP)
#end Less than
	movl 	-8(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L17
#calling 2
#dereference
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -12(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-12(%EBP), %eax
	movl 	%eax, -16(%EBP)
#end adding
	movl 	-16(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -20(%EBP)
#end dereference
	movl	-20(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_free
	movl 	%eax,-20(%EBP)
#end calling
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -24(%EBP)
#end adding
#not ind
#right assign
	movl 	-24(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	 .L16
.L17:
#end while
#calling 2
	movl	8(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_free
	movl 	%eax,-24(%EBP)
#end calling
.L15:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_deallocate
	.set	deallocate.size, 40

_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#calling 2
#addressing
	leal 	-8(%ebp), %eax
	movl 	%eax, -12(%EBP)
#ending addressing
	movl	-12(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L19, %eax
	movl 	%eax, -16(%EBP)
#ending addressing
	movl	-16(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_scanf
	movl 	%eax,-20(%EBP)
#end calling
#assigning
#gen left
#gen right
#calling 2
	movl	-8(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_allocate
	movl 	%eax,-24(%EBP)
#end calling
#not ind
#right assign
	movl 	-24(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_initialize
	movl 	%eax,-28(%EBP)
#end calling
#calling 2
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_display
	movl 	%eax,-32(%EBP)
#end calling
#calling 2
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_deallocate
	movl 	%eax,-36(%EBP)
#end calling
.L18:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 56

	.L13: .asciz, "%d "
	.L14: .asciz, "\n"
	.L19: .asciz, "%d"
