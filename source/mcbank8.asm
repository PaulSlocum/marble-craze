;------------------------------
; Marble Craze bank 5
;------------------------------
; Includes:
;	- Songs 2 and 3
;	- calcMovement fucntion (from game logic)	
;
;------------------------------

	org $8000
	rorg $1000

;==========================================================================
;
; screenLoader3
;
;==========================================================================
screenLoader3

	cpx #0
	bne rightCopyC

leftCopyC
	;------------------------- Left Copy

	cpy #0
	beq noColorLeftCopyC

	; Copy in colors
	ldy #5
leftLoop3C
	lda (temp),y
	sta playField+60,y
	dey
	bpl leftLoop3C

noColorLeftCopyC

	; Copy in left side PF1 and PF2
	ldy #35
	ldx #23					;;;;;;;;;;;;;;; PF DATA
leftLoop1C
	lda (screenL),y
	sta playField+12,x
	dey
	dex
	bpl leftLoop1C

	; OR in left side PF0
	ldx temp16L
	ldy #11
leftLoop2C
	lda (screenL),y
	and #$F0
	sta temp16L
	lda playField,y
	and #$0F
	ora temp16L
	sta playField,y
	dey
	bpl leftLoop2C
	stx temp16L

	;*****************
	; QUIT LOADLEVEL2
	;*****************

	jmp rtnScreenLoader3


rightCopyC
	;-------------------------- Right Copy

	cpy #0
	beq noColorRightCopyC

	; Copy in colors
	ldy #5
rightLoop3C
	lda (temp),y
	sta playField+66,y
	dey
	bpl rightLoop3C

noColorRightCopyC

	; Copy in right PF1 and PF2
	ldy #35
	ldx #23
rightLoopC
	lda (screenL),y
	sta playField+36,x
	dey
	dex
	bpl rightLoopC

	; OR in right side PF0
	ldx temp16L
	ldy #11
rightLoop2C
	lda (screenL),y
	and #$0F
	sta temp16L
	lda playField,y
	and #$F0
	ora temp16L
	sta playField,y
	dey
	bpl rightLoop2C
	stx temp16L
	
	jmp rtnScreenLoader3


	include mcsong2.asm


accArray
	
	byte 252,0,252,0,252,0,252,0
	byte 252,0,252,0,252,0,252,0

	byte 252,0,0,252,0,252,0,252
	byte 0,0,252,0,252,0,252,0

	byte 252,0,0,252,0,0,252,0
	byte 252,0,0,252,0,0,252,0

	byte 252,0,0,252,0,0,252,0
	byte 0,252,0,0,252,0,0,0


	byte 252,0,0,0,252,0,0,0
	byte 252,0,0,0,252,0,0,0

	byte 252,0,0,0,0,252,0,0
	byte 0,0,252,0,0,0,0,0

	byte 252,0,0,0,0,0,0,0
	byte 252,0,0,0,0,0,0,0

	byte 252,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 4,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	
	byte 4,0,0,0,0,0,0,0
	byte 4,0,0,0,0,0,0,0

	byte 4,0,0,0,0,4,0,0
	byte 0,0,4,0,0,0,0,0


	byte 4,0,0,0,4,0,0,0
	byte 4,0,0,0,4,0,0,0

	byte 4,0,0,4,0,0,4,0
	byte 0,4,0,0,4,0,0,0

	byte 4,0,0,4,0,0,4,0
	byte 4,0,0,4,0,0,4,0

	byte 4,0,0,4,0,4,0,4
	byte 0,0,4,0,4,0,4,0


speedArray
	byte 0,0,0,0,0,0,0,0 ;1
	byte 0,0,0,0,0,0,0,0 ;1
	byte 1,0,0,0,0,0,0,0 ;2
	byte 1,0,0,0,1,0,0,0 ;3
	byte 1,0,0,1,0,0,1,0 ;4
	byte 1,0,1,0,1,0,1,0 ;5
	byte 1,1,0,1,0,1,0,1 ;6
	byte 1,1,1,0,1,1,1,0 ;7
	byte 1,1,1,1,1,1,1,0 ;8
	byte 1,1,1,1,1,1,1,1 ;9
	byte 2,1,1,1,1,1,1,1 ;10
	byte 2,1,1,1,2,1,1,1 ;11
	byte 2,1,1,2,1,1,2,1 ;12
	byte 2,1,2,1,2,1,1,2 ;13
	byte 2,1,2,2,1,2,2,1 ;14
	byte 2,2,2,1,2,2,2,1 ;15
	byte 2,2,2,2,2,2,2,1 ;16
	byte 2,2,2,2,2,2,2,2 ;17
	byte 3,2,2,2,2,2,2,2 ;18
	byte 3,2,2,2,3,2,2,2 ;19
	byte 3,2,2,3,2,2,3,2 ;20
	byte 3,2,3,2,3,2,3,2 ;21
	byte 3,3,2,3,3,2,3,2 ;22
	byte 3,3,3,2,3,3,3,2 ;23
	byte 3,3,3,3,3,3,3,2 ;24
	byte 3,3,3,3,3,3,3,3 ;25
	byte 4,3,3,3,3,3,3,3 ;26
	byte 4,3,3,3,4,3,3,3 ;27
	byte 4,3,3,4,3,3,4,3 ;28
	byte 4,3,4,3,4,3,4,3 ;29
	byte 4,4,3,4,4,3,4,3 ;30
	byte 4,4,4,3,4,4,4,3 ;31
	

;--------------------------------------------------------------------------
; Takes a paddle position, position, and speed, and calculates the
; new speed and position.
;
; Preload:
; A: paddle position
; Y: speed
; temp2: position
;
; Returns:
; temp: speed
; A: position
;--------------------------------------------------------------------------
calcMovement
	ldx temp2

	sty temp16H

	
	; The acceleration speed is determined by
	; the 4 high bits
	asl
	asl
	asl
	asl
	sta temp

	; Set the current step of acceleration
	lda frame
	and #%00001111
	clc
	adc temp

	; Determine the amount of acceleration
	; for this frame
	tax
	lda accArray,x

	sta temp
	tya
	
	; Add it to the current speed
	clc
	adc temp


	; Check for max speeds
	cmp #0
	beq noSetVal

	cmp #248
	beq noSetVal

	; Set the speed
	;sta temp16H
	tay

noSetVal

	; Get the new speed	
	tya
	;lda temp16H

	; If it's positive speed, go to 
	; the positive speed handler
	bmi posVel

	; Negative speed handler

	; Invert the speed
	asl
	sta temp
	lda #0
	sbc temp
	
	; Set up the current frame
	sta temp
	lda frame
	and #%00000111
	adc temp

	; Get the current speed increment
	tax
	lda speedArray,x

	; Subtract the increment from
	; the current position
	sta temp
	lda temp2
	sec
	sbc temp

	jmp endVel

posVel
	asl

	; Set up the frame counter
	sta temp
	lda frame
	and #%00000111
	adc temp

	; Get the current speed increment
	tax
	lda speedArray,x

	; Add it to the position
	clc
	adc temp2

endVel
	
	; Y = speed
	; A = position

	jmp rtnCalcMovement


	include mcsongb.asm


	include levels/L6_SCR.ASM	; grand prix - optimized


;==========================================================================
;
; screenLoader3 caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 5
;==========================================================================

	org $8F73
	rorg $1F73

	jmp screenLoader3
rtnScreenLoader3
	stx BANK5



;==========================================================================
;
; pattern reader 2
;
;--------------------------------------------------------------------------
; reads song1 pattern for first song then returns to bank 4
;==========================================================================

	org $8F83
	rorg $1F83
	ldx song2,y
	stx BANK4


;==========================================================================
;
; songPlayerB caller
;
;==========================================================================

	org $8F93
	rorg $1F93

	jmp songPlayerB
rtnSongPlayerB
	stx BANK2

;==========================================================================
;
; calcMovement caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 5.
;==========================================================================

	org $8FA3
	rorg $1FA3

	jmp calcMovement
rtnCalcMovement
	stx BANK5 

;==========================================================================
;
; pattern reader 1
;
;--------------------------------------------------------------------------
; reads song1 pattern for first song then returns to bank 4
;==========================================================================

	org $8FC3
	rorg $1FC3
	ldx song1,y
	stx BANK4





;--------------------------------------------------------------------------
; The cart may start up in this bank.  Make sure it switches
; back to bank 2 on startup.
;--------------------------------------------------------------------------
	org $8FED
	rorg $1FED

	lda BANK2

	org $8FFC	; Program startup vector
	.word $1FED
	.word $1FED

