	.data
X:	.word 5
CANT:	.word 0
TABLA:	.word 0,1,2,3,4,5,6,7,8,9
RES:	.word 0,0,0,0,0,0,0,0,0,0

	.code
	dadd $t2,$zero,$zero
	ld $t0,X($zero)
	ld $t1,CANT($zero)
	daddi $t6,$zero,80
FOR:	ld $t3,TABLA($t2)
	nop
	slt $t4,$t3,$t0
	xori $t4,$t4,1
	beq $t3,$t0,CONT
	dadd $t1,$t1,$t4
	sw $t4,RES($t2)
CONT:	daddi $t2,$t2,8
	nop
	bne $t2,$t6,FOR
	sw $t1,CANT($zero)
	halt
