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
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$5, %eax
#left assign
	movl 	%eax,_a
#end assigning
#assigning
#gen left
#gen right
#calling 2
	movl	$4, %eax
	movl	%eax, 0(%esp)
	call	_malloc
	movl 	%eax,-12(%EBP)
#end calling
#not ind
#right assign
	movl 	-12(%EBP), %eax
#left assign
	movl 	%eax,_b
#end assigning
#assigning
#gen left
#gen right
#calling 2
	movl	$4, %eax
	movl	%eax, 0(%esp)
	call	_malloc
	movl 	%eax,-16(%EBP)
#end calling
#not ind
#right assign
	movl 	-16(%EBP), %eax
#left assign
	movl 	%eax,_c
#end assigning
#IF
#Less than
	movl 	_a, %eax
	cmpl 	$10, %eax
	setl 	%al
	movzbl 	%al, %eax
	movl %eax, -20(%EBP)
#end Less than
	movl 	-20(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L3
#IF
#less or equal
	movl 	_a, %eax
	cmpl 	$10, %eax
	setle 	%al
	movzbl 	%al, %eax
	movl %eax,-24(%EBP)
#end less or equal
	movl 	-24(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L5
#IF
#greater than
	movl 	_a, %eax
	cmpl 	$1, %eax
	setg 	%al
	movzbl 	%al, %eax
	movl %eax, -28(%EBP)
#end greater than
	movl 	-28(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L7
#IF
#greater or equal
	movl 	_a, %eax
	cmpl 	$1, %eax
	setge 	%al
	movzbl 	%al, %eax
	movl %eax, -32(%EBP)
#end greater or equal
	movl 	-32(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L9
#IF
#not equal
	movl 	_a, %eax
	cmpl 	$1, %eax
	setne 	%al
	movzbl 	%al, %eax
	movl 	%eax, -40(%EBP)
#end not equal
	movl 	-40(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L11
#IF
#equal
	movl 	_a, %eax
	cmpl 	$5, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -44(%EBP)
#end equal
	movl 	-44(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L13
#while
.L14:
#comparing
#not equal
#negating
	movl 	$1, %eax
	negl 	%eax
	movl 	%eax, -52(%EBP)
#ending negate
	movl 	_a, %eax
	cmpl 	-52(%EBP), %eax
	setne 	%al
	movzbl 	%al, %eax
	movl 	%eax, -56(%EBP)
#end not equal
	movl 	-56(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L15
#calling 2
#addressing
	leal 	.L16, %eax
	movl 	%eax, -60(%EBP)
#ending addressing
	movl	-60(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-64(%EBP)
#end calling
#assigning
#gen left
#dereference ind
#end dereference ind
#gen right
#ind
#right assign
	movl 	_a, %eax
#left assign
	movl 	_b, %ecx
	movl 	%eax, (%ecx)
#end assigning
#calling 2
#dereference
	movl 	_b, %eax
	movl 	 (%eax), %eax
	movl 	%eax, -68(%EBP)
#end dereference
	movl	-68(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L17, %eax
	movl 	%eax, -72(%EBP)
#ending addressing
	movl	-72(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-76(%EBP)
#end calling
#assigning
#gen left
#gen right
#subtracting
	movl 	_a, %eax
	subl 	$1, %eax
	movl 	%eax, -80(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-80(%EBP), %eax
#left assign
	movl 	%eax,_a
#end assigning
	jmp 	 .L14
.L15:
#end while
	jmp 	.L13
.L13:
#end IF
	jmp 	.L11
.L11:
#end IF
	jmp 	.L9
.L9:
#end IF
	jmp 	.L7
.L7:
#end IF
	jmp 	.L5
.L5:
#end IF
	jmp 	.L3
.L3:
#end IF
#assigning
#gen left
#dereference ind
#end dereference ind
#gen right
#ind
#right assign
	movl 	_b, %eax
#left assign
	movl 	_c, %ecx
	movl 	%eax, (%ecx)
#end assigning
#assigning
#gen left
#dereference ind
#dereference
	movl 	_c, %eax
	movl 	 (%eax), %eax
	movl 	%eax, -84(%EBP)
#end dereference
#end dereference ind
#gen right
#ind
#right assign
	movl 	_a, %eax
#left assign
	movl 	-84(%EBP), %ecx
	movl 	%eax, (%ecx)
#end assigning
#calling 2
#dereference
#dereference
	movl 	_c, %eax
	movl 	 (%eax), %eax
	movl 	%eax, -88(%EBP)
#end dereference
	movl 	-88(%EBP), %eax
	movl 	 (%eax), %eax
	movl 	%eax, -92(%EBP)
#end dereference
	movl	-92(%EBP), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L18, %eax
	movl 	%eax, -96(%EBP)
#ending addressing
	movl	-96(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-100(%EBP)
#end calling
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 120

	.data
	.comm	_a, 4, 4
	.comm	_b, 4, 4
	.comm	_c, 4, 4
	.L1: .asciz, "starting\n"
	.L16: .asciz, "in while\n"
	.L17: .asciz, "b = %d\n"
	.L18: .asciz, "**c = %d\n"
