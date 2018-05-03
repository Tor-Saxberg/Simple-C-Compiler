_insert:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$insert.size, %esp
#IF
#not
	movl 	8(%ebp), %eax
	cmpl 	$0, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -4(%EBP)
#ending not
	movl 	-4(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L1
#assigning
#gen left
#gen right
#calling 2
#multiply
	movl 	$3, %eax
	imull 	$4, %eax
	movl 	%eax, -8(%EBP)
#ending multiply
	movl	-8(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_malloc
	movl 	%eax,-12(%EBP)
#end calling
#not ind
#right assign
	movl 	-12(%EBP), %eax
#left assign
	movl 	%eax,8(%ebp)
#end assigning
#assigning
#gen left
#dereference ind
#adding
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -16(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-16(%EBP), %eax
	movl 	%eax, -20(%EBP)
#end adding
#end dereference ind
#gen right
#ind
#right assign
	movl 	12(%ebp), %eax
#left assign
	movl 	-20(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
#assigning
#gen left
#dereference ind
#adding
#multiply
	movl 	$1, %eax
	imull 	$4, %eax
	movl 	%eax, -24(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-24(%EBP), %eax
	movl 	%eax, -28(%EBP)
#end adding
#end dereference ind
#gen right
#ind
#right assign
	movl 	_null, %eax
#left assign
	movl 	-28(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
#assigning
#gen left
#dereference ind
#adding
#multiply
	movl 	$2, %eax
	imull 	$4, %eax
	movl 	%eax, -32(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-32(%EBP), %eax
	movl 	%eax, -36(%EBP)
#end adding
#end dereference ind
#gen right
#ind
#right assign
	movl 	_null, %eax
#left assign
	movl 	-36(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
	jmp 	.L2
#ELSE
.L1:
#IF
#Less than
#dereference
#adding
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -40(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-40(%EBP), %eax
	movl 	%eax, -44(%EBP)
#end adding
	movl 	-44(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -48(%EBP)
#end dereference
	movl 	12(%ebp), %eax
	cmpl 	-48(%EBP), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -52(%EBP)
#end Less than
	movl 	-52(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L3
#assigning
#gen left
#dereference ind
#adding
#multiply
	movl 	$1, %eax
	imull 	$4, %eax
	movl 	%eax, -56(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-56(%EBP), %eax
	movl 	%eax, -60(%EBP)
#end adding
#end dereference ind
#gen right
#calling 2
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
#dereference
#adding
#multiply
	movl 	$1, %eax
	imull 	$4, %eax
	movl 	%eax, -64(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-64(%EBP), %eax
	movl 	%eax, -68(%EBP)
#end adding
	movl 	-68(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -72(%EBP)
#end dereference
	movl	-72(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-76(%EBP)
#end calling
#ind
#right assign
	movl 	-76(%EBP), %eax
#left assign
	movl 	-60(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
	jmp 	.L4
#ELSE
.L3:
#IF
#greater than
#dereference
#adding
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -80(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-80(%EBP), %eax
	movl 	%eax, -84(%EBP)
#end adding
	movl 	-84(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -88(%EBP)
#end dereference
	movl 	12(%ebp), %eax
	cmpl 	-88(%EBP), %eax
	setg 	%al
	movzbl 	%al, %eax
	movl %eax, -92(%EBP)
#end greater than
	movl 	-92(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L6
#assigning
#gen left
#dereference ind
#adding
#multiply
	movl 	$2, %eax
	imull 	$4, %eax
	movl 	%eax, -96(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-96(%EBP), %eax
	movl 	%eax, -100(%EBP)
#end adding
#end dereference ind
#gen right
#calling 2
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
#dereference
#adding
#multiply
	movl 	$2, %eax
	imull 	$4, %eax
	movl 	%eax, -104(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-104(%EBP), %eax
	movl 	%eax, -108(%EBP)
#end adding
	movl 	-108(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -112(%EBP)
#end dereference
	movl	-112(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-116(%EBP)
#end calling
#ind
#right assign
	movl 	-116(%EBP), %eax
#left assign
	movl 	-100(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
	jmp 	.L6
.L6:
#end IF
#end ELSE
.L4:
#end IF
#end ELSE
.L2:
#end IF
#returning
	movl	8(%ebp), %eax
	jmp	.L0
#end return
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_insert
	.set	insert.size, 136

_search:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$search.size, %esp
#IF
#not
	movl 	8(%ebp), %eax
	cmpl 	$0, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -4(%EBP)
#ending not
	movl 	-4(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L9
#returning
	movl	$0, %eax
	jmp	.L7
#end return
	jmp 	.L9
.L9:
#end IF
#IF
#Less than
#dereference
#adding
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -8(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-8(%EBP), %eax
	movl 	%eax, -12(%EBP)
#end adding
	movl 	-12(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -16(%EBP)
#end dereference
	movl 	12(%ebp), %eax
	cmpl 	-16(%EBP), %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -20(%EBP)
#end Less than
	movl 	-20(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L11
#returning
#calling 2
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
#dereference
#adding
#multiply
	movl 	$1, %eax
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
	movl	-32(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_search
	movl 	%eax,-36(%EBP)
#end calling
	movl	-36(%EBP), %eax
	jmp	.L7
#end return
	jmp 	.L11
.L11:
#end IF
#IF
#greater than
#dereference
#adding
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -40(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-40(%EBP), %eax
	movl 	%eax, -44(%EBP)
#end adding
	movl 	-44(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -48(%EBP)
#end dereference
	movl 	12(%ebp), %eax
	cmpl 	-48(%EBP), %eax
	setg 	%al
	movzbl 	%al, %eax
	movl %eax, -52(%EBP)
#end greater than
	movl 	-52(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L13
#returning
#calling 2
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
#dereference
#adding
#multiply
	movl 	$2, %eax
	imull 	$4, %eax
	movl 	%eax, -56(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-56(%EBP), %eax
	movl 	%eax, -60(%EBP)
#end adding
	movl 	-60(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -64(%EBP)
#end dereference
	movl	-64(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_search
	movl 	%eax,-68(%EBP)
#end calling
	movl	-68(%EBP), %eax
	jmp	.L7
#end return
	jmp 	.L13
.L13:
#end IF
#returning
	movl	$1, %eax
	jmp	.L7
#end return
.L7:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_search
	.set	search.size, 88

_preorder:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$preorder.size, %esp
#IF
	movl 	8(%ebp), %eax
	cmpl 	$0, %eax
	je 	.L16
#assigning
#gen left
#gen right
#dereference
#adding
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -8(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-8(%EBP), %eax
	movl 	%eax, -12(%EBP)
#end adding
	movl 	-12(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -16(%EBP)
#end dereference
#not ind
#right assign
	movl 	-16(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
#dereference
	movl 	-4(%ebp), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -20(%EBP)
#end dereference
	movl	-20(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L17, %eax
	movl 	%eax, -24(%EBP)
#ending addressing
	movl	-24(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-28(%EBP)
#end calling
#calling 2
#dereference
#adding
#multiply
	movl 	$1, %eax
	imull 	$4, %eax
	movl 	%eax, -32(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-32(%EBP), %eax
	movl 	%eax, -36(%EBP)
#end adding
	movl 	-36(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -40(%EBP)
#end dereference
	movl	-40(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_preorder
	movl 	%eax,-40(%EBP)
#end calling
#calling 2
#dereference
#adding
#multiply
	movl 	$2, %eax
	imull 	$4, %eax
	movl 	%eax, -44(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-44(%EBP), %eax
	movl 	%eax, -48(%EBP)
#end adding
	movl 	-48(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -52(%EBP)
#end dereference
	movl	-52(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_preorder
	movl 	%eax,-52(%EBP)
#end calling
	jmp 	.L16
.L16:
#end IF
.L14:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_preorder
	.set	preorder.size, 72

_inorder:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$inorder.size, %esp
#IF
	movl 	8(%ebp), %eax
	cmpl 	$0, %eax
	je 	.L20
#assigning
#gen left
#gen right
#dereference
#adding
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -8(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-8(%EBP), %eax
	movl 	%eax, -12(%EBP)
#end adding
	movl 	-12(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -16(%EBP)
#end dereference
#not ind
#right assign
	movl 	-16(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
#dereference
#adding
#multiply
	movl 	$1, %eax
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
	movl	-28(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_inorder
	movl 	%eax,-28(%EBP)
#end calling
#calling 2
#dereference
	movl 	-4(%ebp), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -32(%EBP)
#end dereference
	movl	-32(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L21, %eax
	movl 	%eax, -36(%EBP)
#ending addressing
	movl	-36(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-40(%EBP)
#end calling
#calling 2
#dereference
#adding
#multiply
	movl 	$2, %eax
	imull 	$4, %eax
	movl 	%eax, -44(%EBP)
#ending multiply
	movl 	8(%ebp), %eax
	addl 	-44(%EBP), %eax
	movl 	%eax, -48(%EBP)
#end adding
	movl 	-48(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -52(%EBP)
#end dereference
	movl	-52(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_inorder
	movl 	%eax,-52(%EBP)
#end calling
	jmp 	.L20
.L20:
#end IF
.L18:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_inorder
	.set	inorder.size, 72

_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,-48(%ebp)
#end assigning
#while
.L23:
#comparing
#Less than
	movl 	-48(%ebp), %eax
	cmpl 	$8, %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -52(%EBP)
#end Less than
	movl 	-52(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L24
#assigning
#gen left
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -56(%EBP)
#ending addressing
#multiply
	movl 	-48(%ebp), %eax
	imull 	$4, %eax
	movl 	%eax, -60(%EBP)
#ending multiply
	movl 	-56(%EBP), %eax
	addl 	-60(%EBP), %eax
	movl 	%eax, -64(%EBP)
#end adding
#end dereference ind
#gen right
#ind
#right assign
	movl 	-48(%ebp), %eax
#left assign
	movl 	-64(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
#assigning
#gen left
#gen right
#adding
	movl 	-48(%ebp), %eax
	addl 	$1, %eax
	movl 	%eax, -68(%EBP)
#end adding
#not ind
#right assign
	movl 	-68(%EBP), %eax
#left assign
	movl 	%eax,-48(%ebp)
#end assigning
	jmp 	 .L23
.L24:
#end while
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	_null, %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -72(%EBP)
#ending addressing
#multiply
	movl 	$7, %eax
	imull 	$4, %eax
	movl 	%eax, -76(%EBP)
#ending multiply
	movl 	-72(%EBP), %eax
	addl 	-76(%EBP), %eax
	movl 	%eax, -80(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-80(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-84(%EBP)
#end calling
#not ind
#right assign
	movl 	-84(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -88(%EBP)
#ending addressing
#multiply
	movl 	$4, %eax
	imull 	$4, %eax
	movl 	%eax, -92(%EBP)
#ending multiply
	movl 	-88(%EBP), %eax
	addl 	-92(%EBP), %eax
	movl 	%eax, -96(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-96(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-100(%EBP)
#end calling
#not ind
#right assign
	movl 	-100(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -104(%EBP)
#ending addressing
#multiply
	movl 	$1, %eax
	imull 	$4, %eax
	movl 	%eax, -108(%EBP)
#ending multiply
	movl 	-104(%EBP), %eax
	addl 	-108(%EBP), %eax
	movl 	%eax, -112(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-112(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-116(%EBP)
#end calling
#not ind
#right assign
	movl 	-116(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -120(%EBP)
#ending addressing
#multiply
	movl 	$0, %eax
	imull 	$4, %eax
	movl 	%eax, -124(%EBP)
#ending multiply
	movl 	-120(%EBP), %eax
	addl 	-124(%EBP), %eax
	movl 	%eax, -128(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-128(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-132(%EBP)
#end calling
#not ind
#right assign
	movl 	-132(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -136(%EBP)
#ending addressing
#multiply
	movl 	$5, %eax
	imull 	$4, %eax
	movl 	%eax, -140(%EBP)
#ending multiply
	movl 	-136(%EBP), %eax
	addl 	-140(%EBP), %eax
	movl 	%eax, -144(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-144(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-148(%EBP)
#end calling
#not ind
#right assign
	movl 	-148(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -152(%EBP)
#ending addressing
#multiply
	movl 	$2, %eax
	imull 	$4, %eax
	movl 	%eax, -156(%EBP)
#ending multiply
	movl 	-152(%EBP), %eax
	addl 	-156(%EBP), %eax
	movl 	%eax, -160(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-160(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-164(%EBP)
#end calling
#not ind
#right assign
	movl 	-164(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -168(%EBP)
#ending addressing
#multiply
	movl 	$3, %eax
	imull 	$4, %eax
	movl 	%eax, -172(%EBP)
#ending multiply
	movl 	-168(%EBP), %eax
	addl 	-172(%EBP), %eax
	movl 	%eax, -176(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-176(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-180(%EBP)
#end calling
#not ind
#right assign
	movl 	-180(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
#addressing
#dereference ind
#adding
#addressing
	leal 	-44(%ebp), %eax
	movl 	%eax, -184(%EBP)
#ending addressing
#multiply
	movl 	$6, %eax
	imull 	$4, %eax
	movl 	%eax, -188(%EBP)
#ending multiply
	movl 	-184(%EBP), %eax
	addl 	-188(%EBP), %eax
	movl 	%eax, -192(%EBP)
#end adding
#end dereference ind
#ending addressing
	movl	-192(%EBP), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_insert
	movl 	%eax,-196(%EBP)
#end calling
#not ind
#right assign
	movl 	-196(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
#addressing
	leal 	.L25, %eax
	movl 	%eax, -200(%EBP)
#ending addressing
	movl	-200(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-204(%EBP)
#end calling
#calling 2
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_preorder
	movl 	%eax,-204(%EBP)
#end calling
#calling 2
#addressing
	leal 	.L26, %eax
	movl 	%eax, -208(%EBP)
#ending addressing
	movl	-208(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-212(%EBP)
#end calling
#calling 2
	movl	-4(%ebp), %eax
	movl	%eax, 0(%esp)
	call	_inorder
	movl 	%eax,-212(%EBP)
#end calling
.L22:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 232

	.data
	.comm	_null, 4, 4
	.L17: .asciz, "%d\n"
	.L21: .asciz, "%d\n"
	.L25: .asciz, "preorder traversal:\n"
	.L26: .asciz, "inorder traversal:\n"
