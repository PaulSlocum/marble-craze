;------------------------------
; Marble Craze bank 6
;------------------------------
; Includes:
;	- Level loader
;	- Level 1-10 PF/Color data 
;------------------------------

	org $6000
	rorg $1000


	; inactive player animation
lev00
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %11111111
	byte %00000000

	;PF1.1
	byte %00000000
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00001111
	byte %00001111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %00000000

	;PF1.2
	byte %00000000
	byte %11111111
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11111111
	byte %00000000

lev01
	;PF1/2
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	
	;PF1.1
	byte %11111111	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00111111
	byte %00110000
	byte %00110000
	byte %00111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111

	;PF1.2
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000011
	byte %00000011
	byte %00000011
	byte %00000011
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111

lev02
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00011111
	byte %00011000
	byte %00011000
	byte %00011000
	byte %00011000
	byte %00011111
	byte %00000000
	byte %00000000
	byte %00000000
	
lev03
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %00000000
	byte %00000000

	;PF1.2
	byte %00000000
	byte %00000000
	byte %00111111
	byte %00110000
	byte %00110000
	byte %00110000
	byte %00110000
	byte %00110000
	byte %00110000
	byte %00111111
	byte %00000000
	byte %00000000



;==========================================================================
;
; screenLoader1
;
;==========================================================================
screenLoader1

	cpx #0
	bne rightCopyA

leftCopyA
	;------------------------- Left Copy

	cpy #0
	beq noColorLeftCopy

	; Copy in colors
	ldy #5
leftLoop3
	lda (temp),y
	sta playField+60,y
	dey
	bpl leftLoop3

noColorLeftCopy

	; Copy in left side PF1 and PF2
	ldy #35
	ldx #23					;;;;;;;;;;;;;;; PF DATA
leftLoop1
	lda (screenL),y
	sta playField+12,x
	dey
	dex
	bpl leftLoop1

	; OR in left side PF0
	ldx temp16L
	ldy #11
leftLoop2
	lda (screenL),y
	and #$F0
	sta temp16L
	lda playField,y
	and #$0F
	ora temp16L
	sta playField,y
	dey
	bpl leftLoop2
	stx temp16L

	;*****************
	; QUIT LOADLEVEL2
	;*****************

	jmp rtnScreenLoader1


rightCopyA
	;-------------------------- Right Copy

	cpy #0
	beq noColorRightCopy

	; Copy in colors
	ldy #5
rightLoop3
	lda (temp),y
	sta playField+66,y
	dey
	bpl rightLoop3

noColorRightCopy

	; Copy in right PF1 and PF2
	ldy #35
	ldx #23
rightLoop
	lda (screenL),y
	sta playField+36,x
	dey
	dex
	bpl rightLoop

	; OR in right side PF0
	ldx temp16L
	ldy #11
rightLoop2
	lda (screenL),y
	and #$0F
	sta temp16L
	lda playField,y
	and #$F0
	ora temp16L
	sta playField,y
	dey
	bpl rightLoop2
	stx temp16L
	
	jmp rtnScreenLoader1




col21
col22
col23
col24
col26
col27
col28
col20	
	; colors
	byte $00
;	byte $00
;	byte $00
;	byte $00
;	byte $00
;	byte $00

lev29
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111110
	byte %00001110
	byte %00001110
	byte %00011111
	byte %00011111
	byte %00000000
	byte %00000000

	;PF1.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000


lev22
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11001100
	byte %01110111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000010
	byte %00000010
	byte %00000010
	byte %00000010
	byte %11111010
	byte %00101010
	byte %00101110
	byte %00101000
	byte %00101000
	byte %00111000
	byte %00010000
	byte %00010000

	;PF1.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000


lev27
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00100010
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %00001111
	byte %01111100
	byte %01111100
	byte %00011111
	byte %00000111
	byte %00001110
	byte 111111101
	byte %11101000
	byte %11011100
	byte %00000000

	;PF1.2
	byte %00000000
	byte %11110010
	byte %11111111
	byte %00000111
	byte %00000000
	byte %00000010
	byte %00010000
	byte %00000000
	byte %01000000
	byte %00000000
	byte %00000100
	byte %00000000
	


lev20
	;PF1/2
	byte %00000000	; screen data
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %00000000

	;PF1.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111000
	byte %11111000
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00000000

lev21
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %01000000
	byte %00000010
	byte %00011111
	byte %11111111 
	byte %11111111
	byte %00000011
	byte %00000010
	byte %01000010
	byte %00010010
	byte %00000010

	;PF1.2
	byte %00000000
	byte %00001000
	byte %00000000
	byte %01000000
	byte %00000000
	byte %00100000
	byte %00000000
	byte %00000100
	byte %00000000
	byte %01000000
	byte %00000000
	byte %00000001
	


lev23
	;PF1/2
	byte %00000000
	byte %00100010
	byte %00000000
	byte %00000000
	byte %10001000
	byte %10001000
	byte %00000000
	byte %00010001
	byte %00000000
	byte %00000000
	byte %01000100
	byte %00000000

	;PF1.1
	byte %00010010	; screen data
	byte %01010000
	byte %00010011
	byte %11111111
	byte %10111101
	byte %11111111
	byte %11101111
	byte %11111111
	byte %00000001
	byte %01000011
	byte %00000100
	byte %00010000

	;PF1.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000001 
	byte %00000000
	byte %00000011
	byte %00000001
	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000

lev24
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %10001000
	byte %11001100
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00100010
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00100000
	byte %00000110
	byte %00110011
	byte %11111111
	byte %11110000
	byte %11110000
	byte %01111111
	byte %01101011
	byte %00001111
	byte %00000000
	byte %00000000

	;PF1.2
	byte %00000000
	byte %00100000
	byte %00000010
	byte %00000000
	byte %00011111
	byte %11111100
	byte %00011100
	byte %00000010
	byte %00100000
;	byte %00000000
;	byte %00000000
;	byte %00000000
	

lev25
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00010000
	byte %00010000
	byte %01010000
	byte %00010010
	byte %00011111
	byte %11111111 
	byte %11111111
	byte %00000011
	byte %00000010
	byte %01000010
	byte %00010010
	byte %00000010

	;PF1.2
	byte %00000000
	byte %00001000
	byte %00000000
	byte %01000000
	byte %00000000
	byte %00100000
	byte %00000000
	byte %00000100
	byte %00000000
	byte %01000000
	byte %00000000
;	byte %00000000
	
col25
	; colors
	byte $02
	byte $02
	byte $00
	byte $00
	byte $00
	byte $00

lev26
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00010001
	byte %00000000
	byte %00000000
	byte %00100010
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %11111000
	byte %11111011
	byte %00001111
	byte %00011111
	byte %00000011
	byte %01000110
	byte %00000111
	byte %00010111
	byte %00111110
	byte %00010000
	byte %00010000

	;PF1.2
	byte %00000000
	byte %00000010
	byte %00100000
	byte %00000000
	byte %00000000
	byte %00000010
	byte %00001000
	byte %00000000
	byte %00000000
	byte %00100000
	byte %00000100
	byte %00000000
	


lev28
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00010001
	byte %00000000
	byte %00000000
	byte %00100010
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %11111000
	byte %11111011
	byte %00001111
	byte %00011111
	byte %00000011
	byte %01000110
	byte %00000111
	byte %00010111
	byte %00111110
	byte %00010000
	byte %00010000

	;PF1.2
	byte %00000000
	byte %00000010
	byte %00100000
	byte %00000000
	byte %00011000
	byte %11111111
	byte %00011000
	byte %00000000
	byte %00000000
	byte %00100000
	byte %00000100
	byte %00000000
	

col29
	; colors
	byte $00
	byte $45
	byte $00
	byte $00
	byte $45
	byte $00



lev40
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00001100
	byte %00001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %00001100

	;PF1.2
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000011
	byte %00000011
	byte %11110011
	byte %11110011
	byte %00110011


lev41
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11001100

	;PF1.1
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000011
	byte %00000011
	byte %11110011
	byte %11110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011

	;PF1.2
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111100
	byte %11111100
	byte %00001100
	byte %00001100
	byte %11111100
	byte %11111100
	byte %00000000


lev42
	;PF1/2
	byte %11111111	; screen data
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %01110111
	byte %01110111
	byte %01110111
	byte %01110111
	byte %01110111
	byte %01110111
	byte %01110111

	;PF1.1
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110000
	byte %00110000
	byte %00111111
	byte %00111111
	byte %00000011

	;PF1.2
	byte %00000000
	byte %11111100
	byte %11111100
	byte %00001100
	byte %00001100
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111100
	byte %11111100
	byte %00001100


lev43
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %00001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11111100
	byte %11111100
	byte %00000000
	byte %00000000
	byte %11001111
	byte %11001111
	byte %11001100

	;PF1.2
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11100011
	byte %11100011
	byte %11100011
	byte %11100011
	byte %11100011
	byte %11100011
	byte %11100000

lev44
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %00000000
	byte %11001111
	byte %11001111
	byte %00001111
	byte %00001111
	byte %11111111
	byte %11111111
	byte %11000000
	byte %11000000
	byte %11001111
	byte %11001111
	byte %00001100

	;PF1.2
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11110000
	byte %11110000
	byte %11110011
	byte %11110011
	byte %11110011

lev45
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111

	;PF1.1
	byte %00000000
	byte %11111100
	byte %11111100
	byte %11111100
	byte %11111100
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00111111
	byte %00111111
	byte %00110011

	;PF1.2
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00001111
	byte %00001111
	byte %00001100
	byte %00001100
	byte %11111100
	byte %11111100
	byte %00000000

lev46
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %00001100
	byte %11001111
	byte %11001111
	byte %11000000
	byte %11000000
	byte %11111111
	byte %11111111
	byte %00000011
	byte %00000011
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.2
	byte %00110011
	byte %00110011
	byte %00110011
	byte %00110000
	byte %00110000
	byte %00111111
	byte %00111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000


lev48
	;PF1/2
	byte %01110111	; screen data
	byte %01110111
	byte %01110111
	byte %01110111
	byte %01110111
	byte %11111111
	byte %11111111
	byte %01110111
	byte %01110111
	byte %11111111
	byte %11111111
	byte %11111111

	;PF1.1
	byte %00000011
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %11111100
	byte %11111100
	byte %00111100
	byte %00111100
	byte %00111100
	byte %00111100
	byte %00000000

	;PF1.2
	byte %00001100
	byte %11111100
	byte %11111100
	byte %00000000
	byte %00000000
	byte %00001111
	byte %00001111
	byte %00001111
	byte %00001111
	byte %11111111 
	byte %11111111
	byte %00000000

lev49
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %11001100
	byte %11001111
	byte %11001111
	byte %00000000
	byte %00000000
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %00000000

	;PF1.2
	byte %11100000
	byte %11100111
	byte %11100111
	byte %11100000
	byte %11100000
	byte %11111111
	byte %11111111
	byte %11100011
	byte %11100011
	byte %11110011 
	byte %11110011
	byte %11110000

lev4C
	;PF1/2
	byte %00000000	; screen data
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %11001100
	byte %11001111
	byte %11001111
	byte %00000000
	byte %00000000
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %11110011
	byte %00000000

	;PF1.2
	byte %11100000
	byte %11100111
	byte %11100111
	byte %11100011
	byte %11100011
	byte %11111111
	byte %11111111
	byte %11100011
	byte %11100011
	byte %11110011 
	byte %11110011
	byte %11110000

lev4A
	;PF1/2
	byte %00000000	; screen data
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %00000000

	;PF1.1
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.2
	byte %11110000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000

lev4B
	;PF1/2
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.2
	byte %00000000
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00000000

lev47
	;PF1/2
	byte %11001100	; screen data
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %11001100
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.1
	byte %00110011
	byte %00111111
	byte %00111111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00001100
	byte %00001100
	byte %11111111
	byte %11111111
	byte %00000000

	;PF1.2
	byte %00000000
	byte %11111100
	byte %11111100
	byte %00001100
	byte %00001100
	byte %00001111
	byte %00001111
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %00000000



col40
col41
col42
col43
col44
col45
col46
col47
col48
col49
col4C
	; colors
	byte $08
	byte $08
	byte $08
	byte $08
	byte $08
	byte $08

col4A
col4B
	; colors
	byte $08
	byte $08
	byte $08
	byte $08
	byte $00
	byte $00


	; include level editor output
	include L_SCR.ASM

	include L5_SCR.ASM	; easy does it - could not optimize
	include L3_SCR.ASM	; atariage - could not optimize
	include L8_SCR.ASM	; no walls - minimal optimization
	include LE_SCR.ASM  ; minor ramps - optimized
	include LG_SCR.ASM	; get the gems
	include LA_SCR.ASM	; golf - optimized


;==========================================================================
;
; screenLoader1 caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 5
;==========================================================================

	org $6FB3
	rorg $1FB3

	jmp screenLoader1
rtnScreenLoader1
	stx BANK5



;==========================================================================
;
; The cart may start up in this bank.  Make sure it switches
; back to bank 2 on startup.
;
;==========================================================================
	org $6FED
	rorg $1FED

	lda BANK2

	org $6FFC	; Program startup vector
	.word $1FED
	.word $1FED

