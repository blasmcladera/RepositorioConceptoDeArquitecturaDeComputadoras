	.data
CONTROL:	.word32 0x10000
DATA:		.word32 0x10008
	.code
	lwu $s0,CONTROL($zero)
	lwu $s1,DATA($zero)
	daddi $t0,$zero,8
	sd $t0,0($s0)	;Ingreso float
	l.d f0,0($s1)	;Guardo float en f0
	sd $t0,0($s0)	;Ingreso int
	ld $a0,0($s1)	;Guardo int en a0
	jal pot
	s.d f0,0($s1)
	daddi $t0,$zero,3
	sd $t0,0($s0)
	halt

pot:	daddi $a0,$a0,-1
	mtc1 $a0,f1
	cvt.d.l f1,f1		;En f1 tengo base-1
	daddi $t0,$zero,1
	mtc1 $t0,f2
	cvt.d.l f2,f2		;En f2 itero
	mov.d f3,f0		;Copio float en f3

for:	mul.d f0,f0,f3
	add.d f4,f4,f2
	c.eq.d f4,f1
	bc1f for
	jr $ra
	