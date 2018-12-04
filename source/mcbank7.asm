;------------------------------
; Marble Craze bank 7
;------------------------------
; Includes:
;
;
;------------------------------

	org $7000
	rorg $1000

	; inactive player animation
	include levels/LX_SCR.ASM


;==========================================================================
;
; screenLoader1
;
;==========================================================================
screenLoader2

	cpx #0
	bne rightCopyB

leftCopyB
	;------------------------- Left Copy

	cpy #0
	beq noColorLeftCopyB

	; Copy in colors
	ldy #5
leftLoop3B
	lda (temp),y
	sta playField+60,y
	dey
	bpl leftLoop3B

noColorLeftCopyB

	; Copy in left side PF1 and PF2
	ldy #35
	ldx #23					;;;;;;;;;;;;;;; PF DATA
leftLoop1B
	lda (screenL),y
	sta playField+12,x
	dey
	dex
	bpl leftLoop1B

	; OR in left side PF0
	ldx temp16L
	ldy #11
leftLoop2B
	lda (screenL),y
	and #$F0
	sta temp16L
	lda playField,y
	and #$0F
	ora temp16L
	sta playField,y
	dey
	bpl leftLoop2B
	stx temp16L

	;*****************
	; QUIT LOADLEVEL2
	;*****************

	jmp rtnScreenLoader2


rightCopyB
	;-------------------------- Right Copy

	cpy #0
	beq noColorRightCopyB

	; Copy in colors
	ldy #5
rightLoop3B
	lda (temp),y
	sta playField+66,y
	dey
	bpl rightLoop3B

noColorRightCopyB

	; Copy in right PF1 and PF2
	ldy #35
	ldx #23
rightLoopB
	lda (screenL),y
	sta playField+36,x
	dey
	dex
	bpl rightLoopB

	; OR in right side PF0
	ldx temp16L
	ldy #11
rightLoop2B
	lda (screenL),y
	and #$0F
	sta temp16L
	lda playField,y
	and #$F0
	ora temp16L
	sta playField,y
	dey
	bpl rightLoop2B
	stx temp16L
	
	jmp rtnScreenLoader2


lev16
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %11111100
	byte %00000000
	byte %00000000

	;PF1.2
	byte %00111110
	byte %00111110
	byte %00111111
	byte %00111111
	byte %00111111
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
	
lev10
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
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111

	;PF1.2
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
	
lev17
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
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00111111
	byte %00111111
	byte %00111111
	byte %00111110
	byte %00111110
	byte %00111110
	byte %00111110



lev12
	;PF1/2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000

	;PF2.1
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000

	;PF2.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %01111111
	byte %01111111
	byte %01111111
;	byte %00000000
;	byte %00000000
;	byte %00000000


lev13
	;PF1/2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
	byte %00000000

	;PF2.1
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00000000
	byte %00000000
;	byte %00000000

	;PF2.2
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000

lev14
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
	byte %01111111
	byte %01111111
	byte %01111111
	byte %01111100
	byte %01111111
	byte %01111111 
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111

	;PF1.2
	byte %00000000
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011110
	byte %00011110
	byte %00011110
	byte %01111110
	byte %01111110
	byte %01111110
;	byte %00000000
;	byte %00000000
	

lev15
	;PF1/2
	byte %00000000	; screen data
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11001100
	byte %11001100
	byte %11001100
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;PF1.1
	byte %00000000
	byte %00000000
	byte %00011111
	byte %00011111
	byte %00011111
	byte %11111111
	byte %11111111
	byte %11111111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111

	;PF1.2
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000
;	byte %00000000

lev11
	;PF1/2
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

	;PF2.1
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00011111
	byte %00000000

	;PF2.2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %01111111
	byte %01111111
	byte %01111111
	byte %00000000
	byte %00000000
	byte %00000000




col15
col10
	; colors
	byte $f1
	byte $A2
;	byte $f8
;	byte $f8
;	byte $f8
;	byte $f8


col12
col14
col16
col13
	; colors
	byte $f1
	byte $f1
	byte $f1
	byte $f1
	byte $f1
;	byte $f1

col11
	; colors
	byte $f1 
	byte $f5
	byte $f1
	byte $f1
	byte $f1
;	byte $f1
	
col17
	; colors
	byte $f1
	byte $A3
	byte $f1
	byte $f1
	byte $f1
	byte $f1

	



;-----------------------------------------------------




	include levels/L7_SCR.ASM	; waterworld - moderately optimized
	include levels/LB_SCR.ASM	; airworld - moderately optimized
	include levels/LC_SCR.ASM	; xype - optimized
	include levels/LD_SCR.ASM	; major ramps - moderately optimized
	include levels/L9_SCR.ASM  ; pinball - moderate optimization
	include levels/LF_SCR.ASM	; big red
	include levels/LI_SCR.ASM	; haunted house
	include levels/LJ_SCR.ASM	; rainbow road


;==========================================================================
;
; screenLoader2 caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 5
;==========================================================================

	org $7FC3
	rorg $1FC3

	jmp screenLoader2
rtnScreenLoader2
	stx BANK5


;--------------------------------------------------------------------------
; The cart may start up in this bank.  Make sure it switches
; back to bank 2 on startup.
;--------------------------------------------------------------------------
	org $7FED
	rorg $1FED

	lda BANK2

	org $7FFC	; Program startup vector
	.word $1FED
	.word $1FED

