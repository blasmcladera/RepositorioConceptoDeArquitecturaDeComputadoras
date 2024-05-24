	.data
X:	.word 5
CANT:	.word 0
TABLA:	.word 0,1,2,3,4,5,6,7,8,9
RES:	.word 0,0,0,0,0,0,0,0,0,0

	.code
	lw $t0,X($zero)
	daddi $t0,$t0,1
	lw $t1,CANT($zero)
	daddi $t2,$zero,0
FOR:	lw $t3,TABLA($t2)
	slt $t4,$t3,$t0
	xori $t4,$t4,1
	dadd $t1,$t1,$t4
	sw $t4,RES($t2)
	daddi $t5,$t2,-10
	beqz $t5,FOR
	sw $t1,CANT($zero)
	halt