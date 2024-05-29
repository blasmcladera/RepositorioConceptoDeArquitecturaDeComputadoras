	.data
base:	.double 5.85
altura:	.double	13.47
result:	.double 2

	.code
	l.d f0,base($zero)
	l.d f1,altura($zero)
	mul.d f0,f0,f1
	l.d f2,result($zero)
	div.d f0,f0,f2
	s.d f0,result($zero)
	halt