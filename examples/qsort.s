_readarray:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$readarray.size, %esp
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
.L1:
#comparing
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	_n, %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -8(%EBP)
#end Less than
	movl 	-8(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L2
#calling 2
#addressing
#dereference ind
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -12(%EBP)
#ending multiply
	movl 	_a, %eax
	addl 	-12(%EBP), %eax
	movl 	%eax, -16(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-16(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L3, %eax
	movl 	%eax, -20(%EBP)
#ending addressing
	movl	-20(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_scanf
	movl 	%eax,-24(%EBP)
#end calling
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -28(%EBP)
#end adding
#not ind
#right assign
	movl 	-28(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	 .L1
.L2:
#end while
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_readarray
	.set	readarray.size, 40

_writearray:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$writearray.size, %esp
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
.L5:
#comparing
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	_n, %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -8(%EBP)
#end Less than
	movl 	-8(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L6
#calling 2
#dereference
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -12(%EBP)
#ending multiply
	movl 	_a, %eax
	addl 	-12(%EBP), %eax
	movl 	%eax, -16(%EBP)
#end adding
	movl 	-16(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -20(%EBP)
#end dereference
	movl	-20(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L7, %eax
	movl 	%eax, -24(%EBP)
#ending addressing
	movl	-24(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-28(%EBP)
#end calling
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -32(%EBP)
#end adding
#not ind
#right assign
	movl 	-32(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	 .L5
.L6:
#end while
#calling 2
#addressing
	leal 	.L8, %eax
	movl 	%eax, -36(%EBP)
#ending addressing
	movl	-36(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-40(%EBP)
#end calling
.L4:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_writearray
	.set	writearray.size, 56

_exchange:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$exchange.size, %esp
#assigning
#gen left
#gen right
#dereference
	movl 	8(%ebp), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -8(%EBP)
#end dereference
#not ind
#right assign
	movl 	-8(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#dereference ind
#end dereference ind
#gen right
#dereference
	movl 	12(%ebp), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -12(%EBP)
#end dereference
#ind
#right assign
	movl 	-12(%EBP), %eax
#left assign
	movl 	8(%ebp), %ecx
	movl 	%eax, (%ecx)
#end assigning
#assigning
#gen left
#dereference ind
#end dereference ind
#gen right
#ind
#right assign
	movl 	-4(%ebp), %eax
#left assign
	movl 	12(%ebp), %ecx
	movl 	%eax, (%ecx)
#end assigning
.L9:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_exchange
	.set	exchange.size, 24

_partition:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$partition.size, %esp
#assigning
#gen left
#gen right
#dereference
#adding
#multiply
	movl 	12(%ebp), %eax
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
#assigning
#gen left
#gen right
#subtracting
	movl 	12(%ebp), %eax
	subl 	$1, %eax
	movl 	%eax, -36(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-36(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#adding
	movl 	16(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -40(%EBP)
#end adding
#not ind
#right assign
	movl 	-40(%EBP), %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
#while
.L11:
#comparing
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	-8(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -44(%EBP)
#end Less than
	movl 	-44(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L12
#assigning
#gen left
#gen right
#subtracting
	movl 	-8(%ebp), %eax
	subl 	$1, %eax
	movl 	%eax, -48(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-48(%EBP), %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
#while
.L13:
#comparing
#greater than
#dereference
#adding
#multiply
	movl 	-8(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -52(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-52(%EBP), %eax
	movl 	%eax, -56(%EBP)
#end adding
	movl 	-56(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -60(%EBP)
#end dereference
	movl 	-60(%EBP), %eax
	cmpl 	-12(%ebp), %eax
	setg 	%al
	movzbl 	%al, %eax
	movl %eax, -64(%EBP)
#end greater than
	movl 	-64(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L14
#assigning
#gen left
#gen right
#subtracting
	movl 	-8(%ebp), %eax
	subl 	$1, %eax
	movl 	%eax, -68(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-68(%EBP), %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
	jmp 	 .L13
.L14:
#end while
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -72(%EBP)
#end adding
#not ind
#right assign
	movl 	-72(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#while
.L15:
#comparing
#Less than
#dereference
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -76(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-76(%EBP), %eax
	movl 	%eax, -80(%EBP)
#end adding
	movl 	-80(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -84(%EBP)
#end dereference
	movl 	-84(%EBP), %eax
	cmpl 	-12(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -88(%EBP)
#end Less than
	movl 	-88(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L16
#assigning
#gen left
#gen right
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -92(%EBP)
#end adding
#not ind
#right assign
	movl 	-92(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	 .L15
.L16:
#end while
#IF
#Less than
	movl 	-4(%ebp), %eax
	cmpl 	-8(%ebp), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -96(%EBP)
#end Less than
	movl 	-96(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L18
#assigning
#gen left
#gen right
#dereference
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -100(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-100(%EBP), %eax
	movl 	%eax, -104(%EBP)
#end adding
	movl 	-104(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -108(%EBP)
#end dereference
#not ind
#right assign
	movl 	-108(%EBP), %eax
#left assign
	movl 	%eax,-16(%ebp)
#end assigning
#assigning
#gen left
#gen right
#dereference
#adding
#multiply
	movl 	-8(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -112(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-112(%EBP), %eax
	movl 	%eax, -116(%EBP)
#end adding
	movl 	-116(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -120(%EBP)
#end dereference
#not ind
#right assign
	movl 	-120(%EBP), %eax
#left assign
	movl 	%eax,-20(%ebp)
#end assigning
#calling 2
#addressing
#dereference ind
#adding
#multiply
	movl 	-8(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -124(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-124(%EBP), %eax
	movl 	%eax, -128(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-128(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
#dereference ind
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -132(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-132(%EBP), %eax
	movl 	%eax, -136(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-136(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_exchange
	movl 	%eax,-140(%EBP)
#end calling
	jmp 	.L18
.L18:
#end IF
	jmp 	 .L11
.L12:
#end while
#returning
	movl	-8(%ebp), %eax
	jmp	.L10
#end return
.L10:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_partition
	.set	partition.size, 152

_quicksort:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$quicksort.size, %esp
#IF
#greater than
	movl 	16(%ebp), %eax
	cmpl 	12(%ebp), %eax
	setg 	%al
	movzbl 	%al, %eax
	movl %eax, -8(%EBP)
#end greater than
	movl 	-8(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L21
#assigning
#gen left
#gen right
#calling 2
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_partition
	movl 	%eax,-12(%EBP)
#end calling
#not ind
#right assign
	movl 	-12(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_quicksort
	movl 	%eax,-16(%EBP)
#end calling
#calling 2
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
#adding
	movl 	-4(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -20(%EBP)
#end adding
	movl	-20(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_quicksort
	movl 	%eax,-24(%EBP)
#end calling
	jmp 	.L21
.L21:
#end IF
.L19:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_quicksort
	.set	quicksort.size, 40

_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$8, %eax
#left assign
	movl 	%eax,_n
#end assigning
#assigning
#gen left
#gen right
#calling 2
#multiply
	movl 	_n, %eax
	imull 	$4, %eax
	movl 	%eax, -4(%EBP)
#ending multiply
	movl	-4(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_malloc
	movl 	%eax,-8(%EBP)
#end calling
#not ind
#right assign
	movl 	-8(%EBP), %eax
#left assign
	movl 	%eax,_a
#end assigning
#calling 2
	call	_readarray
	movl 	%eax,-12(%EBP)
#end calling
#calling 2
#subtracting
	movl 	_n, %eax
	subl 	$1, %eax
	movl 	%eax, -16(%EBP)
#ending subtract
	movl	-16(%EBP), %eax
	movl	%eax, 8(%esp)
	movl	$0, %eax
	movl	%eax, 4(%esp)
	movl	_a, %eax
	movl	%eax, 0(%esp)
	call	_quicksort
	movl 	%eax,-20(%EBP)
#end calling
#calling 2
	call	_writearray
	movl 	%eax,-24(%EBP)
#end calling
.L22:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 40

	.data
	.comm	_n, 4, 4
	.comm	_a, 4, 4
	.L3: .asciz, "%d"
	.L7: .asciz, "%d "
	.L8: .asciz, "\n"
