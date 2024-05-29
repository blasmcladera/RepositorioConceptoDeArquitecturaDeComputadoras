	.data
cadena: .asciiz "aaaafffaaabbbfffffffffbbddceeffffhl"
char:	.asciiz "f"
cant:	.word 0

	.code
	daddi $t3,$zero,1
	lbu  $t0,char($zero) #t0 : char
	dadd $t1,$zero,$zero #t1 : cant
	dadd $t2,$zero,$zero #t2 : iterar
FOR:	beqz $t3,FIN
	lbu  $t3,cadena($t2) #t3 : cadena
	nop
	nop
	bne $t3,$t0,FOR
	daddi $t2,$t2,1
	daddi $t1,$t1,1
	j FOR
	nop
FIN:	sb $t1,cant($zero)
	halt