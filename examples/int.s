_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$100, %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$30, %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$2, %eax
#left assign
	movl 	%eax,-12(%ebp)
#end assigning
#assigning
#gen left
#gen right
#adding
#adding
	movl 	-4(%ebp), %eax
	addl 	-8(%ebp), %eax
	movl 	%eax, -36(%EBP)
#end adding
	movl 	-36(%EBP), %eax
	addl 	-12(%ebp), %eax
	movl 	%eax, -40(%EBP)
#end adding
#not ind
#right assign
	movl 	-40(%EBP), %eax
#left assign
	movl 	%eax,-16(%ebp)
#end assigning
#assigning
#gen left
#gen right
#subtracting
#subtracting
	movl 	-4(%ebp), %eax
	subl 	-8(%ebp), %eax
	movl 	%eax, -44(%EBP)
#ending subtract
	movl 	-44(%EBP), %eax
	subl 	-12(%ebp), %eax
	movl 	%eax, -48(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-48(%EBP), %eax
#left assign
	movl 	%eax,-20(%ebp)
#end assigning
#assigning
#gen left
#gen right
#multiply
#multiply
	movl 	-4(%ebp), %eax
	imull 	-8(%ebp), %eax
	movl 	%eax, -52(%EBP)
#ending multiply
	movl 	-52(%EBP), %eax
	imull 	-12(%ebp), %eax
	movl 	%eax, -56(%EBP)
#ending multiply
#multiply
	movl 	-4(%ebp), %eax
	imull 	-8(%ebp), %eax
	movl 	%eax, -60(%EBP)
#ending multiply
#not ind
#right assign
	movl 	-56(%EBP), %eax
#left assign
	movl 	%eax,-24(%ebp)
#end assigning
#assigning
#gen left
#gen right
#adding
#dividing
	movl 	-4(%ebp), %eax
	movl 	-8(%ebp), %ecx
	cltd
	idiv 	%ecx
	movl 	%eax, -64(%EBP)
#ending divide
	movl 	-64(%EBP), %eax
	addl 	-12(%ebp), %eax
	movl 	%eax, -68(%EBP)
#end adding
#not ind
#right assign
	movl 	-68(%EBP), %eax
#left assign
	movl 	%eax,-28(%ebp)
#end assigning
#assigning
#gen left
#gen right
#subtracting
#remainder
	movl 	-4(%ebp), %eax
	movl 	-8(%ebp), %ecx
	cltd
	idivl 	%ecx
	movl 	%edx, -72(%EBP)
#ending remainder
	movl 	-72(%EBP), %eax
	subl 	-12(%ebp), %eax
	movl 	%eax, -76(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-76(%EBP), %eax
#left assign
	movl 	%eax,-32(%ebp)
#end assigning
#calling 2
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L1, %eax
	movl 	%eax, -80(%EBP)
#ending addressing
	movl	-80(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-84(%EBP)
#end calling
#calling 2
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L2, %eax
	movl 	%eax, -88(%EBP)
#ending addressing
	movl	-88(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-92(%EBP)
#end calling
#calling 2
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L3, %eax
	movl 	%eax, -96(%EBP)
#ending addressing
	movl	-96(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-100(%EBP)
#end calling
#calling 2
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L4, %eax
	movl 	%eax, -104(%EBP)
#ending addressing
	movl	-104(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-108(%EBP)
#end calling
#calling 2
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L5, %eax
	movl 	%eax, -112(%EBP)
#ending addressing
	movl	-112(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-116(%EBP)
#end calling
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 136

	.L1: .asciz, "%d\n"
	.L2: .asciz, "%d\n"
	.L3: .asciz, "%d\n"
	.L4: .asciz, "%d\n"
	.L5: .asciz, "%d\n"
