	.file	1 "fib.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.rdata
	.align	2
$LC0:
	.ascii	"%d \000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,64,$31		# vars= 32, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,60($sp)
	sw	$fp,56($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,52($fp)
	sw	$0,32($fp)
	li	$2,1			# 0x1
	sw	$2,36($fp)
	li	$2,2			# 0x2
	sw	$2,28($fp)
	.option	pic0
	b	$L2
	nop

	.option	pic2
$L3:
	lw	$2,28($fp)
	addiu	$2,$2,-2
	sll	$2,$2,2
	addiu	$3,$fp,56
	addu	$2,$3,$2
	lw	$3,-24($2)
	lw	$2,28($fp)
	addiu	$2,$2,-1
	sll	$2,$2,2
	addiu	$4,$fp,56
	addu	$2,$4,$2
	lw	$2,-24($2)
	addu	$3,$3,$2
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$4,$fp,56
	addu	$2,$4,$2
	sw	$3,-24($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$2,28($fp)
	slt	$2,$2,5
	bne	$2,$0,$L3
	nop

	sw	$0,28($fp)
	.option	pic0
	b	$L4
	nop

	.option	pic2
$L5:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,56
	addu	$2,$3,$2
	lw	$2,-24($2)
	move	$5,$2
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L4:
	lw	$2,28($fp)
	slt	$2,$2,5
	bne	$2,$0,$L5
	nop

	li	$4,10			# 0xa
	lw	$2,%call16(putchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$4,$2
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$3,52($fp)
	lw	$2,0($2)
	beq	$3,$2,$L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L7:
	move	$2,$4
	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	addiu	$sp,$sp,64
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
