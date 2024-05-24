	.data
A:	.word 9
B:	.word 5
C:	.word 0
R:	.word 0
	.code
	lw $t0,A($zero)
	lw $t1,B($zero)
	lw $t2,C($zero)
	daddi $t4,$zero,0
	#Comparacion:
	dsub $t3,$t0,$t1
	slti $t3,$t3,1
	dadd $t4,$t4,$t3
	dsub $t3,$t0,$t2
	slti $t3,$t3,1
	dadd $t4,$t4,$t3
	dsub $t3,$t1,$t0
	slti $t3,$t3,1
	dadd $t4,$t4,$t3
	dsub $t3,$t1,$t2
	slti $t3,$t3,1
	dadd $t4,$t4,$t3
	dsub $t3,$t2,$t0
	slti $t3,$t3,1
	dadd $t4,$t4,$t3
	dsub $t3,$t2,$t1
	slti $t3,$t3,1
	dadd $t4,$t4,$t3
	#Almaceno resultado:
	daddi $t1,$zero,0
	slti $t0,$t4,5
	beqz $t0,TRES
	slti $t0,$t4,1
	beqz $t0,FIN
	daddi $t1,$zero,2
	j FIN
TRES:	daddi $t1,$zero,3
FIN:	sw $t1,R($zero)
	halt

	