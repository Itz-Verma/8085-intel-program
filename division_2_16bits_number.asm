	   LHLD 5000	// dividend
	   MOV B,H
	   MOV C,L
	   LHLD 5002	// divisor
	   XCHG	// divisor in d-e register pair
	   MVI H,00	// hl pair is for quotient
	   MVI L,00

LOOP:	   MOV A,C
	   SUB E	// 8 lsb subtraction
	   STA FFFF	// storing result for future use
	   JNC NEXT	// account for carry
	   DCR B

NEXT:	   MOV A,B	// 8msb subtraction
	   CMP D	// checking condition if subtraction is feasible
	   JC STORE	// store result if not possible
	   SUB D
	   MOV B,A
	   LDA FFFF	// since division is possible we update lsb of new dividend
	   MOV C,A
	   INX H
	   JMP LOOP

STORE:	   SHLD C050	// quotient
	   MOV H,B
	   MOV L,C
	   SHLD C052	// remainder
	   HLT
// lsb then msb -> ff,fe = feff
# ORG 5000
# DB FF,FE,01,23
