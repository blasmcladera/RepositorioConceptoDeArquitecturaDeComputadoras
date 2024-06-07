	.data
CONTROL:	.word32 0x10000
DATA:		.word32 0x10008

Cursor:	.word32 0x00000000	;negro
Fondo:	.word32 0xFFFFFF00	;blanco	
R:	.word32 0x0000FF00	;R=ROJO
G:	.word32 0x00FF0000	;G=VERDE
B:	.word32 0xFF000000	;B=AZUL

	.code
	daddi $sp,$zero,0x400
	lwu $s0,CONTROL($zero)
	lwu $s1,DATA($zero)
	lwu $s2,Cursor($zero)
	lwu $s3,Fondo($zero)
	daddi $a3,$zero,7

	;INICIALIZAR CURSOR:
	daddi $a0,$zero,25
	daddi $a1,$zero,25

	;MOVER CURSOR
	daddi $v0,$zero,9
	daddi $v1,$zero,5

mov:	sw $s2,0($s1)
	sb $a0,4($s1)
	sb $a1,5($s1)
	sd $v1,0($s0)
	sd $v0,0($s0)
	lb $t4,0($s1)
	daddi $t5,$zero,0x61	;Izquierda
	beq $t4,$t5,izq
	daddi $t5,$zero,0x77	;Arriba
	beq $t4,$t5,ari
	daddi $t5,$zero,0x73	;Abajo
	beq $t4,$t5,aba
	daddi $t5,$zero,0x64	;Derecha
	beq $t4,$t5,der
	daddi $t5,$zero,0x20	;Espacio
	beq $t4,$t5,movesp
	j mov

izq:	daddi $a1,$a1,-1
	j mov

ari:	daddi $a0,$a0,1
	j mov

aba:	daddi $a0,$a0,-1
	j mov

der:	daddi $a1,$a1,1
	j mov

movesp: sw $s2,0($s1)
	sb $a0,4($s1)
	sb $a1,5($s1)
	sd $v1,0($s0)
	sd $v0,0($s0)
	lb $t4,0($s1)
	daddi $t5,$zero,0x61	;Izquierda
	beq $t4,$t5,izqesp
	daddi $t5,$zero,0x77	;Arriba
	beq $t4,$t5,ariesp
	daddi $t5,$zero,0x73	;Abajo
	beq $t4,$t5,abaesp
	daddi $t5,$zero,0x64	;Derecha
	beq $t4,$t5,deresp
	daddi $t5,$zero,0x20	;Espacio
	beq $t4,$t5,mov
	j movesp

izqesp:	sw $s3,0($s1)
	sd $v1,0($s0)
	daddi $a1,$a1,-1
	j movesp

ariesp:	sw $s3,0($s1)
	sd $v1,0($s0)
	daddi $a0,$a0,1
	j movesp

abaesp:	sw $s3,0($s1)
	sd $v1,0($s0)
	daddi $a0,$a0,-1
	j movesp

deresp:	sw $s3,0($s1)
	sd $v1,0($s0)
	daddi $a1,$a1,1
	j movesp
	halt