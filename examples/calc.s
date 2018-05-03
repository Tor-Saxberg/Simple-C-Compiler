_lexan:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$lexan.size, %esp
#IF
#equal
	movl 	_c, %eax
	cmpl 	$0, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -12(%EBP)
#end equal
	movl 	-12(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L2
#assigning
#gen left
#gen right
#calling 2
	call	_getchar
	movl 	%eax,-16(%EBP)
#end calling
#not ind
#right assign
	movl 	-16(%EBP), %eax
#left assign
	movl 	%eax,_c
#end assigning
	jmp 	.L2
.L2:
#end IF
#while
.L3:
#comparing
#logical and left
#calling 2
	movl	_c, %eax
	movl	%eax, 0(%esp)
	call	_isspace
	movl 	%eax,-24(%EBP)
#end calling
	movl 	-24(%EBP), %eax
	cmpl 	 $0, %eax
	je 	.L5
#logical and left
#not equal
	movl 	_c, %eax
	cmpl 	$10, %eax
	setne 	%al
	movzbl 	%al, %eax
	movl 	%eax, -32(%EBP)
#end not equal
	movl 	-32(%EBP), %eax
	cmpl $0, %eax
	je 	.L5
.L5:
	setne 	%al
	movzbl 	%al, %eax
	movl 	%eax, -20(%EBP)
#end logical and
	movl 	-20(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L4
#assigning
#gen left
#gen right
#calling 2
	call	_getchar
	movl 	%eax,-36(%EBP)
#end calling
#not ind
#right assign
	movl 	-36(%EBP), %eax
#left assign
	movl 	%eax,_c
#end assigning
	jmp 	 .L3
.L4:
#end while
#IF
#not
#calling 2
	movl	_c, %eax
	movl	%eax, 0(%esp)
	call	_isdigit
	movl 	%eax,-40(%EBP)
#end calling
	movl 	-40(%EBP), %eax
	cmpl 	$0, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -44(%EBP)
#ending not
	movl 	-44(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L7
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	_c, %eax
#left assign
	movl 	%eax,-8(%ebp)
#end assigning
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	$0, %eax
#left assign
	movl 	%eax,_c
#end assigning
#returning
	movl	-8(%ebp), %eax
	jmp	.L0
#end return
	jmp 	.L7
.L7:
#end IF
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
.L8:
#comparing
#calling 2
	movl	_c, %eax
	movl	%eax, 0(%esp)
	call	_isdigit
	movl 	%eax,-48(%EBP)
#end calling
	movl 	-48(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L9
#assigning
#gen left
#gen right
#subtracting
#adding
#multiply
	movl 	-4(%ebp), %eax
	imull 	$10, %eax
	movl 	%eax, -52(%EBP)
#ending multiply
	movl 	-52(%EBP), %eax
	addl 	_c, %eax
	movl 	%eax, -56(%EBP)
#end adding
	movl 	-56(%EBP), %eax
	subl 	$48, %eax
	movl 	%eax, -60(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-60(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#assigning
#gen left
#gen right
#calling 2
	call	_getchar
	movl 	%eax,-64(%EBP)
#end calling
#not ind
#right assign
	movl 	-64(%EBP), %eax
#left assign
	movl 	%eax,_c
#end assigning
	jmp 	 .L8
.L9:
#end while
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	-4(%ebp), %eax
#left assign
	movl 	%eax,_lexval
#end assigning
#returning
	movl	_NUM, %eax
	jmp	.L0
#end return
.L0:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_lexan
	.set	lexan.size, 72

_match:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$match.size, %esp
#IF
#not equal
	movl 	_lookahead, %eax
	cmpl 	8(%ebp), %eax
	setne 	%al
	movzbl 	%al, %eax
	movl 	%eax, -8(%EBP)
#end not equal
	movl 	-8(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L12
#calling 2
	movl	_lookahead, %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L13, %eax
	movl 	%eax, -12(%EBP)
#ending addressing
	movl	-12(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-16(%EBP)
#end calling
#calling 2
	movl	$1, %eax
	movl	%eax, 0(%esp)
	call	_exit
	movl 	%eax,-16(%EBP)
#end calling
	jmp 	.L12
.L12:
#end IF
#assigning
#gen left
#gen right
#calling 2
	call	_lexan
	movl 	%eax,-20(%EBP)
#end calling
#not ind
#right assign
	movl 	-20(%EBP), %eax
#left assign
	movl 	%eax,_lookahead
#end assigning
.L10:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_match
	.set	match.size, 40

_factor:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$factor.size, %esp
#IF
#equal
	movl 	_lookahead, %eax
	cmpl 	$40, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -8(%EBP)
#end equal
	movl 	-8(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L16
#calling 2
	movl	$40, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-8(%EBP)
#end calling
#assigning
#gen left
#gen right
#calling 2
	call	_expr
	movl 	%eax,-12(%EBP)
#end calling
#not ind
#right assign
	movl 	-12(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
	movl	$41, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-12(%EBP)
#end calling
#returning
	movl	-4(%ebp), %eax
	jmp	.L14
#end return
	jmp 	.L16
.L16:
#end IF
#assigning
#gen left
#gen right
#not ind
#right assign
	movl 	_lexval, %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
	movl	_NUM, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-12(%EBP)
#end calling
#returning
	movl	-4(%ebp), %eax
	jmp	.L14
#end return
.L14:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_factor
	.set	factor.size, 24

_term:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$term.size, %esp
#assigning
#gen left
#gen right
#calling 2
	call	_factor
	movl 	%eax,-8(%EBP)
#end calling
#not ind
#right assign
	movl 	-8(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#while
.L18:
#comparing
	movl 	$1, %eax
	cmpl 	$0, %eax
	je 	.L19
#IF
#equal
	movl 	_lookahead, %eax
	cmpl 	$42, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -12(%EBP)
#end equal
	movl 	-12(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L20
#calling 2
	movl	$42, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-12(%EBP)
#end calling
#assigning
#gen left
#gen right
#multiply
#calling 2
	call	_factor
	movl 	%eax,-16(%EBP)
#end calling
	movl 	-4(%ebp), %eax
	imull 	-16(%EBP), %eax
	movl 	%eax, -20(%EBP)
#ending multiply
#not ind
#right assign
	movl 	-20(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	.L21
#ELSE
.L20:
#IF
#equal
	movl 	_lookahead, %eax
	cmpl 	$47, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -24(%EBP)
#end equal
	movl 	-24(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L22
#calling 2
	movl	$47, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-24(%EBP)
#end calling
#assigning
#gen left
#gen right
#dividing
#calling 2
	call	_factor
	movl 	%eax,-28(%EBP)
#end calling
	movl 	-4(%ebp), %eax
	movl 	-28(%EBP), %ecx
	cltd
	idiv 	%ecx
	movl 	%eax, -32(%EBP)
#ending divide
#not ind
#right assign
	movl 	-32(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	.L23
#ELSE
.L22:
#break
	jmp 	.L19
#end break
#end ELSE
.L23:
#end IF
#end ELSE
.L21:
#end IF
	jmp 	 .L18
.L19:
#end while
#returning
	movl	-4(%ebp), %eax
	jmp	.L17
#end return
.L17:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_term
	.set	term.size, 40

_expr:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$expr.size, %esp
#assigning
#gen left
#gen right
#calling 2
	call	_term
	movl 	%eax,-8(%EBP)
#end calling
#not ind
#right assign
	movl 	-8(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#while
.L25:
#comparing
	movl 	$1, %eax
	cmpl 	$0, %eax
	je 	.L26
#IF
#equal
	movl 	_lookahead, %eax
	cmpl 	$43, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -12(%EBP)
#end equal
	movl 	-12(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L27
#calling 2
	movl	$43, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-12(%EBP)
#end calling
#assigning
#gen left
#gen right
#adding
#calling 2
	call	_term
	movl 	%eax,-16(%EBP)
#end calling
	movl 	-4(%ebp), %eax
	addl 	-16(%EBP), %eax
	movl 	%eax, -20(%EBP)
#end adding
#not ind
#right assign
	movl 	-20(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	.L28
#ELSE
.L27:
#IF
#equal
	movl 	_lookahead, %eax
	cmpl 	$45, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -24(%EBP)
#end equal
	movl 	-24(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L29
#calling 2
	movl	$45, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-24(%EBP)
#end calling
#assigning
#gen left
#gen right
#subtracting
#calling 2
	call	_term
	movl 	%eax,-28(%EBP)
#end calling
	movl 	-4(%ebp), %eax
	subl 	-28(%EBP), %eax
	movl 	%eax, -32(%EBP)
#ending subtract
#not ind
#right assign
	movl 	-32(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
	jmp 	.L30
#ELSE
.L29:
#break
	jmp 	.L26
#end break
#end ELSE
.L30:
#end IF
#end ELSE
.L28:
#end IF
	jmp 	 .L25
.L26:
#end while
#returning
	movl	-4(%ebp), %eax
	jmp	.L24
#end return
.L24:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_expr
	.set	expr.size, 40

_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$main.size, %esp
#assigning
#gen left
#gen right
#calling 2
	call	_lexan
	movl 	%eax,-8(%EBP)
#end calling
#not ind
#right assign
	movl 	-8(%EBP), %eax
#left assign
	movl 	%eax,_lookahead
#end assigning
#while
.L32:
#comparing
#not equal
#negating
	movl 	$1, %eax
	negl 	%eax
	movl 	%eax, -16(%EBP)
#ending negate
	movl 	_lookahead, %eax
	cmpl 	-16(%EBP), %eax
	setne 	%al
	movzbl 	%al, %eax
	movl 	%eax, -20(%EBP)
#end not equal
	movl 	-20(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L33
#assigning
#gen left
#gen right
#calling 2
	call	_expr
	movl 	%eax,-24(%EBP)
#end calling
#not ind
#right assign
	movl 	-24(%EBP), %eax
#left assign
	movl 	%eax,-4(%ebp)
#end assigning
#calling 2
	movl	-4(%ebp), %eax
	movl	%eax, 4(%esp)
#addressing
	leal 	.L34, %eax
	movl 	%eax, -28(%EBP)
#ending addressing
	movl	-28(%EBP), %eax
	movl	%eax, 0(%esp)
	call	_printf
	movl 	%eax,-32(%EBP)
#end calling
#while
.L35:
#comparing
#equal
	movl 	_lookahead, %eax
	cmpl 	$10, %eax
	sete 	%al
	movzbl 	%al, %eax
	movl 	%eax, -36(%EBP)
#end equal
	movl 	-36(%EBP), %eax
	cmpl 	$0, %eax
	je 	.L36
#calling 2
	movl	$10, %eax
	movl	%eax, 0(%esp)
	call	_match
	movl 	%eax,-36(%EBP)
#end calling
	jmp 	 .L35
.L36:
#end while
	jmp 	 .L32
.L33:
#end while
.L31:
	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	_main
	.set	main.size, 56

	.data
	.comm	_NUM, 4, 4
	.comm	_lookahead, 4, 4
	.comm	_c, 4, 4
	.comm	_lexval, 4, 4
	.L13: .asciz, "syntax error at %d\n"
	.L34: .asciz, "%d\n"
