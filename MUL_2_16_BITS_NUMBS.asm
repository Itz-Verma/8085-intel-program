	   LHLD 5000
	   XCHG
	   LHLD 5002
	   MOV B,H
	   MOV C,L
	   LXI H,0000
	   MVI A,00
	   STA C050	// 8 lsb of 16bits carry msb
	   STA C051	// 8 msb of 16bits carry msb
	   CALL MUL_2_16_BITS_NUMBS
	   SHLD C048
	   HLT

MUL_2_16_BITS_NUMBS:	   DAD D
	   JNC NEXT1
	   LDA C050
	   INR A
	   STA C050
	   JNC NEXT1
	   LDA C051
	   INR A
	   STA C051

NEXT1:	   DCX B
	   MOV A,B
	   ORA C
	   JNZ MUL_2_16_BITS_NUMBS
	   RET
# ORG 5000
# DB FD,FC,FB,FA
