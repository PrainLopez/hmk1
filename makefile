out: RRscanner

RRscanner: lex.yy.c rrScan.h
	gcc -o $@ $<

lex.yy.c: rrScan.l
	flex $<