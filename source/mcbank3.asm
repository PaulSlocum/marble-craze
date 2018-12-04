;------------------------------
; Marble Craze bank 3
;------------------------------
; Includes:
;
; - Level Intro Message kernal and level name data
; - Title Screen kernal
; - Main game kernal startup
;------------------------------

	org $3000
	rorg $1000


;	align 256
p0data1
	byte %00000000
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11011011
	byte %11111111
	byte %11111110
	byte %11111111
	byte %01100110
	byte %01000010
	byte %10000001


p1data1
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
	byte %00000000
	byte %10000001
	byte %11000011
	byte %11000011
	byte %11111111
	byte %01111110
	byte %00111100
	byte %00011000

m0Movement1
	byte %00000000
	byte %00000000
	byte %11110000
	byte %00000000
	byte %00000000
	byte %11110000
	byte %00000000
	byte %00000000
	byte %11110000
	byte %00000000
	byte %00000000
	byte %11110000
	byte %00000000
	byte %00000000
	byte %11110000
	byte %00000000
	byte %00000000
	byte %11110000
	byte %00000000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11100000
	byte %11110000
	byte %11110000
	byte %00110000
	byte %11110000
	byte %11110000
	byte %11110000

m1Movement1
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %11100000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11100000
	byte %11110000
	byte %11110000
	byte %00110000
	byte %11110000
	byte %11110000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %11100000
	byte %00000000
	byte %11110000
	byte %11110000
	byte %00110000
	byte %11110000
	byte %11110000
	byte %11110000

pfData1
	byte %00000000
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %10001011
	byte %11011001
	byte %11011001
	byte %10001000
	byte %10001000

pfData2
	byte %00000000
	byte %00110110
	byte %00110110
	byte %00110110
	byte %00110110
	byte %00110110
	byte %00110110
	byte %00110110
	byte %00110110
	byte %01110111
	byte %01110111
	byte %10110110
	byte %10110110
	byte %10110110
	byte %10110110
	byte %10110010
	byte %10110010
	byte %01110001
	byte %01110001
	
	
pfData3
	byte %00000000
	byte %01111001
	byte %01111001
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01111001
	byte %01111001
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01100101
	byte %01111001
	byte %01111001


pfData4
	byte %00000000
	byte %11110111
	byte %11110111
	byte %11110111
	byte %10110101
	byte %00110101
	byte %00110001
	byte %00110001
	byte %00110001
	byte %01110001
	byte %01110001
	byte %00110001
	byte %00110001
	byte %00110001
	byte %00110001
	byte %10110001
	byte %11110001
	byte %11110001
	byte %11110001




; CRAZE data
;---------------------------------------------------------------------------

;	align 256
p0data2
	byte %00000000
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000011
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %11000000
	byte %00000000
	byte %00000000
	byte %00000000


p1data2
	byte %00000000
	byte %00011111
	byte %00111111
	byte %01111111
	byte %01111001
	byte %01110000
	byte %11110000
	byte %11110000
	byte %11100000
	byte %11100000
	byte %11100000
	byte %11100000
	byte %11100000
	byte %11110000
	byte %11110000
	byte %01110001
	byte %01111001
	byte %01111111
	byte %00111111
	byte %00001111

m1Movement2
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000
	byte %00000000
	byte %00000000
	byte %00010000


pfData5
	byte %00000000
	byte %00000000
	byte %00001111
	byte %00001001
	byte %00001001
	byte %00001001
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001001
	byte %00001001
	byte %00001001
	byte %00001111
	byte %00000000

pfData6
	byte %00000000
	byte %11000110
	byte %11000110
	byte %11000110
	byte %11000110
	byte %11000110
	byte %11000110
	byte %11000110
	byte %11000110
	byte %11001110
	byte %11001110
	byte %11010110
	byte %11010110
	byte %11010110
	byte %11010110
	byte %10010110
	byte %10010110
	byte %00001110
	byte %00001110
	
	
pfData7
	byte %00000000
	byte %01101111 
	byte %01101111
	byte %01101111
	byte %01101001
	byte %01100001
	byte %01100000
	byte %11100000
	byte %11100000
	byte %01100000
	byte %01100000
	byte %01100000
	byte %01100000
	byte %01100000
	byte %01101000
	byte %01001001
	byte %01001111
	byte %10001111
	byte %10001111


pfData8
	byte %00000000
	byte %00011110
	byte %00011110
	byte %00011110
	byte %00010110
	byte %00000110
	byte %00000110
	byte %00000110
	byte %00000110
	byte %00001110
	byte %00001110
	byte %00000110
	byte %00000110
	byte %00000110
	byte %00000110
	byte %00010110
	byte %00011110
	byte %00011110
	byte %00011110









;==========================================================================
;
; Draw Title Screen
;
;--------------------------------------------------------------------------
; Here is where we step down the screen drawing everything
; on the Title Screen
;==========================================================================
drawTitle

	lda #0
	sta p1Lives
	sta p2Lives

	;------------------------- Position P0/P1 for Score

	sta HMCLR
	; Set horizontal player positions for score

	sta WSYNC
	lda #%11000000
	sta HMM0
	lda #%11010000
	sta HMM1

	nop	; 17/9
	nop
	nop
	nop
	nop
	nop
	nop
	lda temp

	sta RESP0
	lda temp
	nop
	nop
	nop
	sta RESM0
	lda temp
	sta RESBL
	nop
	lda temp
	sta RESP1	

	lda #%00100000
	sta HMP0
	lda #%00010000
	sta HMBL
	sta RESM1
	sta WSYNC
	sta HMOVE

	lda #0
	sta COLUBK
	
	;------------------------- draw score

	; Call function to draw score (in bank 4)
	jmp callTitleScore
rtnCallTitleScore

	lda #0
	sta PF0
	sta PF1
	sta PF2
	sta ENABL

	lda measure
	asl
	asl
	asl
	asl
	;and #$F0
	ora #$84
	


	sta pfBuffer

	ldx #0
	stx COLUBK

	; PF0 will always be zero
	lda #0
	sta PF0

	sta RESMP0
	sta RESMP1

	; Set Colors
	lda pfBuffer
	sta COLUPF

	; Fill player graphics
;	sta GRP0
	sta GRP1

	lda #$00
	sta COLUP0
	sta COLUP1


	lda #%00100101
	sta NUSIZ0
	sta NUSIZ1

	; Set PF to reflect
	lda #%00000101
	sta CTRLPF

	lda #2
	sta ENAM0
	sta ENAM1


; Wait for Timer	
;--------------------------------------------------------------------------

pictureLoop
;	lda INTIM	;check timer for end of VBLANK period
;	bne pictureLoop	;loop until it reaches 0

	sta WSYNC
	sta WSYNC
	sta WSYNC
;	sta VBLANK  	;end screen blank


; Delay scanlines for "bouncing"
;--------------------------------------------------------------------------

	; Check Paddles
	lda INPT0			;3
	bmi paddles50		;2 or 3
	lda #0
	sta paddle			;3
paddles50


	ldy bounce
bounce1
	sta WSYNC
	dey
	bne bounce1


; Set MARBLE Positions for Players and Missiles
;--------------------------------------------------------------------------
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC

	
	; -------------------- delay 24 cycles
	ldx #4			;2
positionDelay1		
	dex				;2
	bne positionDelay1	;2*
	
	lda temp
	;--------------------------------------

	sta RESP0
	nop
	lda temp
	sta RESP1
	nop
	nop
	lda temp

	sta RESM0
	nop
	lda temp
	sta RESM1

	lda #%11110000
	sta HMM0
	sta HMM1

	lda #%00010000
	sta HMP1
	sta HMP0

	sta WSYNC
	sta HMOVE

	; Delay a bit
	ldx #7
titleLoop2
	dex
	bne titleLoop2


	sta HMCLR

	lda #%11110000
	sta HMM0
	sta HMM1

	lda pfBuffer
	sta COLUP0
	sta COLUP1



; Draw MARBLE text
;--------------------------------------------------------------------------
	ldy #36

	tya
	lsr
	tax

	lda p0data1,x

Loop1
	sta WSYNC
	sta HMOVE

	sta GRP0
	lda pfData1,x
	sta PF1
	
	lda p1data1,x
	sta GRP1
	lda pfData2,x
	sta PF2
	
	lda m0Movement1,y
	sta HMM0
	lda m1Movement1,y
	sta HMM1

	lda pfData3,x
	sta PF2

	lda pfData4,x
	sta PF1


	tya
	lsr
	tax

	lda p0data1,x

	dey
	bne Loop1


noMore

	sta WSYNC
	lda #0
	sta COLUP0
	sta COLUP1
	sta PF1
	sta PF2
	

; Set CRAZE Positions for Players and Missiles
;--------------------------------------------------------------------------
	sta WSYNC

	;--------------------- delay 28 cycles
	ldx #5			;2
positionDelay4
	dex				;2
	bne positionDelay4 ;2*
	nop
	;---------------------------------------

	sta RESP0
	lda temp
	nop
	nop
	sta RESM0
	nop

	sta RESP1
	nop
	nop	
	nop	
	nop


	sta RESM1

	lda #%11110000
	sta HMM0
	sta HMM1


	lda #%00100000
	sta HMP1
	sta HMP0

	sta WSYNC
	sta HMOVE

	;--------------------- delay 36 cycles
	ldx #7			;2
positionDelay5
	dex				;2
	bne positionDelay5 ;2*
	;---------------------------------------


	sta HMCLR

	lda #%11110000
	sta HMM0

	lda pfBuffer

	nop
	nop
	sta COLUP0
	sta COLUP1

; Draw CRAZE text
;--------------------------------------------------------------------------
	ldy #36

	tya
	lsr
	tax

	lda p1data2,x

Loop2
	sta WSYNC
	sta HMOVE

	sta GRP0
	lda pfData5,x
	sta PF1
	
	lda p1data1,x
	sta GRP1
	lda pfData6,x
	sta PF2
	
	lda m0Movement1,y
	sta HMM0
	lda m1Movement2,y
	sta HMM1

	lda pfData7,x
	sta PF2

	lda pfData8,x
	sta PF1

	tya
	lsr
	tax

	lda p1data2,x

	dey
	bne Loop2

	lda #0
	sta COLUP0
	sta COLUP1

	lda #0
	sta PF1
	sta PF2

; Absorb the bounce scanlines
;---------------------------------------------------------------------------
	lda bounce
	sta temp
	lda #45
	clc
	sbc temp
	tay

bounce2	
	sta WSYNC
	dey
	bne bounce2

; Draw the Options
;---------------------------------------------------------------------------

; Set positions of Missiles and Players for options
;--------------------------------------------------------------------------

	; Check Paddles
	lda INPT0			;3
	bmi paddles51		;2 or 3
	lda #1
	sta paddle			;3
paddles51

	sta WSYNC


	;--------------------- delay 23 cycles
	ldx #4			;2
positionDelay2
	dex				;2
	bne positionDelay2 ;2*
	nop
	;---------------------------------------

	sta RESBL

	nop
	nop	
	nop	
	nop
	nop	
	nop	

	sta RESP0
	sta RESP1

	;--------------------- delay 21 cycles
	ldx #4			;2
positionDelay3
	dex				;2
	bne positionDelay3 ;2*
	;---------------------------------------

	sta RESM1

	lda #%11010000
	sta HMM1

	lda #%11100000
	sta HMBL

	lda #%00010000
	sta HMP1

	sta WSYNC
	sta HMOVE

	lda #$0F
	sta COLUPF
	lda #0
	sta GRP0
	sta GRP1

	ldy #255
	sta WSYNC

	; draw white line
	sty PF1
	sty PF2
	lda #$0F
	sta COLUP0
	sta COLUP1

	sta ENABL

	lda #3
	sta NUSIZ0
	lda #0
	sta NUSIZ1

	sta WSYNC
	lda #0
	sta PF1
	sta ENAM0

	sta PF2


; Draw options
;--------------------------------------------------------------------------

	; Make sure stack is set up right
	ldx #255
	txs

	; skip a few lines
	ldx #5
skipLines1
	sta WSYNC
	dex
	bne skipLines1


	; Set text to display
	lda titleOptions
	and #1
	tax
	lda playersOffset,x
	sta temp
	
	; draw selection highlight if selected
	ldx option
	lda optionSelect1b,x
	sta PF1
	lda optionSelect1,x
	sta PF2

	; Players
	jsr drawOptionText

	lda #0
	sta PF2
	sta PF1

	ldx #4
skipLines2
	sta WSYNC
	dex
	bne skipLines2
	
	; Set text to display
	lda #9
	sta temp
	
	; draw selection highlight if selected
	ldx option
	lda optionSelect2b,x
	sta PF1
	lda optionSelect2,x
	sta PF2

	; Start
	jsr drawOptionText

	lda #0
	sta PF2
	sta PF1

	ldx #3
skipLines3
	sta WSYNC
	dex
	bne skipLines3
	
	
	; draw selection highlight if selected
	ldx option
	lda optionSelect3b,x
	sta PF1
	lda optionSelect3,x
	sta PF2

	; Set text to display
	lda titleOptions
	lsr
	lsr
	tax
	lda levelOffset,x
	sta temp

	; Level
	jsr drawOptionText

	lda #0
	sta PF2
	sta PF1

	ldx #6
skipLines4
	sta WSYNC
	dex
	bne skipLines4
	


	lda #255
	sta PF1
	sta PF2
	lda #0
	sta COLUP0
	sta ENABL
	sta COLUP1
	sta WSYNC
	sta PF1
	sta PF2


; Handle the rest of the scanlines
;---------------------------------------------------------------------------

	ldy #1
wasteLines
	sta WSYNC
	dey
	bne wasteLines

	; Check Padddles
	lda INPT0			;3
	bmi paddles52		;2 or 3
	lda #2
	sta paddle			;3
paddles52

	sta WSYNC

	lda #$82
	sta VBLANK	; Finished a screen, blank the beam.
endScreen

	jmp rtnDrawTitle





;==========================================================================
;
; Draw Option Text
;
;==========================================================================
; Preload:
; temp: starting line to display
; temp2: last line to display
drawOptionText

	lda #1
	ldx #9
	stx temp2


optionsLoop
	ldy temp

	sta WSYNC
	sta NUSIZ1
	lda optData1,y
	sta GRP0
;	tax
	lda optData2,y
	sta GRP1
	ldx optData3,y
	lda optData4,y
	sta temp5
	lda optData5,y
	tay
	lda temp5

	dec temp


	stx GRP0
	sta GRP1
	sty GRP0
	lda #0
	sta NUSIZ1
	lda #1

	dec temp2
	bpl optionsLoop

	sta WSYNC

	ldx #253
	txs

	rts


optData1
	; Start
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Players:1
	byte #%00000000
	byte #%00100000
	byte #%00100001
	byte #%00100001
	byte #%00100001
	byte #%00100001
	byte #%00111001
	byte #%00100101
	byte #%00100101
	byte #%00111000

	; Players:2
	byte #%00000000
	byte #%00100000
	byte #%00100001
	byte #%00100001
	byte #%00100001
	byte #%00100001
	byte #%00111001
	byte #%00100101
	byte #%00100101
	byte #%00111000

	; Level:1
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Level:5
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Level:10
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000

	; Level:15
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000

optData5
	; Start
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Players:1
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00111000
	byte #%00010000
	byte #%00010000
	byte #%00010000
	byte #%00010000
	byte #%00010000
	byte #%00110000

	; Players:2
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00111100
	byte #%00100000
	byte #%00010000
	byte #%00001000
	byte #%00000100
	byte #%00100100
	byte #%00011000

	; Level:1
	byte #%00000000
	byte #%00000000
	byte #%10000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Level:5
	byte #%00000000
	byte #%00000000
	byte #%10000000
	byte #%01000000
	byte #%01000000
	byte #%10000000
	byte #%00000000
	byte #%00000000
	byte #%11000000
	byte #%00000000

	; Level:10
	byte #%00000000
	byte #%00000000
	byte #%11000000
	byte #%00100000
	byte #%00100000
	byte #%00100000
	byte #%00100000
	byte #%00100000
	byte #%11000000
	byte #%00000000

	; Level:15
	byte #%00000000
	byte #%00000000
	byte #%11000000
	byte #%00100000
	byte #%00100000
	byte #%11000000
	byte #%00000000
	byte #%00000000
	byte #%11100000
	byte #%00000000






optData2
	; Start
	byte #%00001110
	byte #%00010001
	byte #%00000001
	byte #%00000001
	byte #%00000110
	byte #%00001000
	byte #%00010000
	byte #%00010000
	byte #%00001110
	byte #%00000000

	; Players:1
	byte #%00000011
	byte #%00000000
	byte #%00000011
	byte #%00111010
	byte #%01001010
	byte #%00111010
	byte #%00001010
	byte #%00110000
	byte #%00000000
	byte #%00000000

	; Players:2
	byte #%00000011
	byte #%00000000
	byte #%00000011
	byte #%00111010
	byte #%01001010
	byte #%00111010
	byte #%00001010
	byte #%00110000
	byte #%00000000
	byte #%00000000

	; Level:1
	byte #%00001110
	byte #%11101000
	byte #%10101110
	byte #%10001000
	byte #%10001110
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000

	; Level:5
	byte #%00001110
	byte #%11101000
	byte #%10101110
	byte #%10001000
	byte #%10001110
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000

	; Level:10
	byte #%00001110
	byte #%11101000
	byte #%10101110
	byte #%10001000
	byte #%10001110
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000

	; Level:15
	byte #%00001110
	byte #%11101000
	byte #%10101110
	byte #%10001000
	byte #%10001110
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000
	byte #%10000000


optData3
	; Start
	byte #%00001110
	byte #%01010010
	byte #%01001110
	byte #%01000010
	byte #%01001100
	byte #%01000000
	byte #%01000000
	byte #%11100000
	byte #%01000000
	byte #%00000000

	; Players:1
	byte #%10000000
	byte #%10000000
	byte #%10000010
	byte #%10111010
	byte #%10100010
	byte #%10111010
	byte #%10100011
	byte #%00111000
	byte #%00000000
	byte #%00000000

	; Players:2
	byte #%10000000
	byte #%10000000
	byte #%10000010
	byte #%10111010
	byte #%10100010
	byte #%10111010
	byte #%10100011
	byte #%00111000
	byte #%00000000
	byte #%00000000

	; Level:1
	byte #%00000000
	byte #%00001110
	byte #%01001000
	byte #%10101110
	byte #%10101000
	byte #%10101110
	byte #%10100000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Level:5
	byte #%00000000
	byte #%00001110
	byte #%01001000
	byte #%10101110
	byte #%10101000
	byte #%10101110
	byte #%10100000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Level:10
	byte #%00000000
	byte #%00001110
	byte #%01001000
	byte #%10101110
	byte #%10101000
	byte #%10101110
	byte #%10100000
	byte #%00000000
	byte #%00000000
	byte #%00000000

	; Level:15
	byte #%00000000
	byte #%00001110
	byte #%01001000
	byte #%10101110
	byte #%10101000
	byte #%10101110
	byte #%10100000
;	byte #%00000000
;	byte #%00000000
;	byte #%00000000

paddleDecode	; 162
;	byte 0,0,0,0,0,0,1,1,1,1,1,1,1
;	byte 2,2,2,2,2,2,3,3,3,3,3,3,3
;	byte 4,4,4,4,4,4,5,5,5,5,5,5,5
;	byte 6,6,6,6,6,6,6,6,6,6,6,6,6
;	byte 7,7,7,7,7,7,7,7,7,7,7,7,7
;	byte 8,8,8,8,8,8,8,8,8,8,8,8,8
;	byte 8,8,8,8,8,8,8,8,8,8,8,8,8
;	byte  8, 8, 8, 8, 8, 8, 8,9,9,9,9,9,9
;	byte  9, 9, 9, 9, 9, 9, 9,10,10,10,10,10,10
;	byte 10,10,10,10,10,10,10,11,11,11,11,11,11
;	byte 11,11,11,11,11,11,11,12,12,12,12,12,12
;	byte 13,13,13,13,13,13,14,14,14,14,14,14,14
;	byte 15,15,15,15,15,15

	byte 0,0,0,0,0,0,1,1,1,1,1,1,1
	byte 2,2,2,2,2,2,3,3,3,3,3,3,3
	byte 4,4,4,4,4,4,5,5,5,5,5,5,5
	byte 5,5,5,5,5,5,6,6,6,6,6,6,6
	byte 6,6,6,6,6,6,7,7,7,7,7,7,7
	byte 7,7,7,7,7,7,8,8,8,8,8,8,8
	byte 8,8,8,8,8,8,8,8,8,8,8,8,8
	byte 9,9,9,9,9,9,9,9,9,9,9,9,9
	byte 10,10,10,10,10,10,10,10,10,10,10,10,10
	byte 11,11,11,11,11,11,11,11,11,11,11,11,11
	byte 12,12,12,12,12,12,12,12,12,12,12,12,12
	byte 13,13,13,13,13,13,14,14,14,14,14,14,14
	byte 15,15,15,15,15,15



optData4
	; Start
	byte #%00000000
	byte #%10001000
	byte #%10001000
	byte #%10001000
	byte #%10101000
	byte #%11101000
	byte #%00001000
	byte #%00011100
	byte #%00001000
	byte #%00000000

	; Players:1
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00111000
	byte #%10001001
	byte #%10111000
	byte #%10100000
	byte #%00111000
	byte #%00000001
	byte #%00000000

	; Players:2
	byte #%00000000
	byte #%00000000
	byte #%00000000
	byte #%00111000
	byte #%10001001
	byte #%10111000
	byte #%10100000
	byte #%00111000
	byte #%00000001
	byte #%00000000

	; Level:1
	byte #%00000000
	byte #%00000000
	byte #%10000011
	byte #%10010001
	byte #%10000001
	byte #%10000001
	byte #%10000001
	byte #%10010001
	byte #%10000011
	byte #%00000000

	; Level:5
	byte #%00000000
	byte #%00000000
	byte #%10000011
	byte #%10010000
	byte #%10000000
	byte #%10000011
	byte #%10000010
	byte #%10010010
	byte #%10000011
	byte #%00000000

	; Level:10
	byte #%00000000
	byte #%00000000
	byte #%10000100
	byte #%10010101
	byte #%10000101
	byte #%10000101
	byte #%10000101
	byte #%10010101
	byte #%10000100
	byte #%00000000

	; Level:15
	byte #%00000000
	byte #%00000000
	byte #%10000101
	byte #%10010100
	byte #%10000100
	byte #%10000101
	byte #%10000101
	byte #%10010101
	byte #%10000101
	byte #%00000000




	; paddle reading
	;
	; at 0 lines read 0/2
	; after 2 lines read 1/3
	;
	; LOOP1
	; after 8 lines read 0/2
	; after 10 lines read 1/3
	;
	; after 14 read 0/2
	; after 16 read 1/3
	;
	; LOOP2
	; after 22 read 0/2
	; after 24 read 1/3
	;
	; after 28 read 0/2
	; after 30 read 1/3 



;==========================================================================
;
; paddleRead
;
;--------------------------------------------------------------------------
; read paddles during text message drawing
;==========================================================================
paddleRead
	; preload
	; A: offset
	;--------------------------------------------

	; read paddles

	sta pfBuffer+4
	sec
	lda pfBuffer+2
	sbc pfBuffer+4
	tay

	lda frame
	and #1
	beq padFrame98

	lda INPT2
	bmi paddles96		;2 or 3
	sty padVal3			;3

paddles96
	lda INPT3
	bmi paddles99
	sty padVal4
	
	rts



padFrame98
	lda INPT0			;3
	bmi paddles97		;2 or 3
	sty padVal1			;3

paddles97
	lda INPT1			;3
	bmi paddles99		;2 or 3
	sty padVal2			;3

paddles99
	rts
	;--------------------------------------------





;==========================================================================
;
; introMessage
;
;--------------------------------------------------------------------------
; Draw message text
;==========================================================================
introMessage
	
	lda #$0F
	sta COLUPF

	lda #0
	sta PF0
	sta PF1
	sta PF2
	sta GRP1
	sta GRP0
	sta ENAM1
	sta ENAM0
	sta ENABL
	lda #1
	sta CTRLPF

	;--------------------------------------------

	; read paddles

	; Save X and Y values
	tsx
	stx pfBuffer+1
	sty pfBuffer+2

	lda pfBuffer+2
	sec
	sbc #2
	tay

	lda frame
	and #1
	beq padFrame02

	lda INPT3
	bmi paddles21		;2 or 3
	sty padVal4			;3

	jmp paddles21

padFrame02
	lda INPT1			;3
	bmi paddles21		;2 or 3
	sty padVal2			;3

paddles21

	;--------------------------------------------
	sta WSYNC

	lda #$FF
	sta PF1
	sta PF2

	lda #$00
	sta COLUBK
	
	sta HMCLR
	
	lda #INTROCOLOR
	sta COLUP0
	sta COLUP1


	sta WSYNC

	lda #0
	sta PF1
	sta PF2
	sta GRP0
	sta GRP1

	lda  #$03           ; set both players to 3 copies
	sta  NUSIZ0
	sta  NUSIZ1

	lda  #$01           ; set vertical delay on for both players
	sta  VDELP0
	sta  VDELP1

	nop
	nop
	nop

	sta RESP0
	sta RESP1

	lda #%00010000
	sta HMP1

	lda #%00000000
	sta HMP0

	sta WSYNC
	sta HMOVE

	sta WSYNC
	sta WSYNC

	; Read Paddles ++++++++++++++++++++++++++++++++
	ldx #<pfBuffer+6
	txs
	lda #9
	jsr paddleRead

	sta WSYNC

	; Check for end of level or game over
	lda level
	and #%11100000
	beq displayLevelNumber

	;----------------------------------- GAME OVER / TIME BONUS
	ldx #7
	lda level
	and #ENDGAME
	beq checkWinGame

	ldx #0

	jmp displayTimeBonus

checkWinGame
	
	lda level
	and #WINGAME
	beq displayTimeBonus
	ldx #14

	lda p1Counter
	bmi displayTimeBonus

	ldx #21

displayTimeBonus

	txa
	txs
	clc
	adc #7
	sta pfBuffer


	; Display name of level

messageDisplayLoop2
	lda  statusText1,x   ;4 get player0 copy1 data

	sta  GRP0			;3
	sta  WSYNC			;3
	txs
	nop

	lda  statusText2,x	;4 get player1 copy1 data
	sta  GRP1			;3
	lda  statusText3,x	;4 get player0 copy2 data
	sta  GRP0			;3
	lda  statusText4,x	;4 get player1 copy2 data
	sta  pfBuffer+3	;3
	lda  statusText5,x	;4 get player0 copy3 data
	tay					;2
	lda  statusText6,x	;4 get player1 copy3 data
	tax					;2
	lda pfBuffer+3		;3

	sta GRP1			;3
	sty GRP0			;3
	stx GRP1			;3
	sta GRP0			;3

	tsx					;2
	inx					;2
	cpx pfBuffer		;3
	bne messageDisplayLoop2	;3 (4 if page crossed) loop until done
	
	jmp nextDisplay


	;-------------------------------- LEVEL: #

displayLevelNumber
	; Set up level digit pointer
	lda #>levelDigits
	sta pfBuffer+5
	lda level
	and #%00111111
	tax
	lda times5,x
	sta pfBuffer+4

	lda #0
	tax
	txs
	clc
	adc #5
	sta pfBuffer


	; Draw "LEVEL:#"
levelLoop

	txs
	txa
	tay

	lda  levelText1,x   ;4 get player0 copy1 data

	sta  WSYNC			;3
	sta  GRP0			;3

	lda  levelText2,x	;4 get player1 copy1 data
	sta  GRP1			;3
	lda  levelText3,x	;4 get player0 copy2 data
	sta  GRP0			;3
	lda  levelText4,x	;4 get player1 copy2 data
	sta  pfBuffer+3	;3
	lda  (pfBuffer+4),y	;4 get player0 copy3 data
	tay					;2
	lda  levelText1,x	;4 get player1 copy3 data
	tax					;2
	lda pfBuffer+3		;3

	sta GRP1			;3
	sty GRP0			;3
	stx GRP1			;3
	sta GRP0			;3

	tsx					;2
	inx					;2
	cpx pfBuffer		;3
	bne levelLoop		;3 (4 if page crossed) loop until done

nextDisplay
	lda  #$00           ; clear player graphics
	sta  GRP1
	sta  GRP0
	sta  GRP1
	sta  GRP0

	sta WSYNC

	; Read Paddles ++++++++++++++++++++++++++++++++
	ldx #<pfBuffer+6
	txs
	lda #15
	jsr paddleRead

	sta WSYNC
	sta WSYNC




	;-------------------------------- LEVEL NAME
	
	ldx #5
	lda level
	and #%11100000
	beq normalLevelDisplay

	; don't diplay level if end of game or end of level
	lda #0
	sta COLUP0
	sta COLUP1
	ldx #3

normalLevelDisplay
	stx temp	

	lda level
	and #%00111111
	tax
	lda times5,x
	tax
	txs
	clc
	adc temp
	sta pfBuffer


	; Display name of level

messageDisplayLoop
	lda  introText1,x   ;4 get player0 copy1 data

	sta  GRP0			;3
	sta  WSYNC			;3
	txs
	nop

	lda  introText2,x	;4 get player1 copy1 data
	sta  GRP1			;3
	lda  introText3,x	;4 get player0 copy2 data
	sta  GRP0			;3
	lda  introText4,x	;4 get player1 copy2 data
	sta  pfBuffer+3	;3
	lda  introText5,x	;4 get player0 copy3 data
	tay					;2
	lda  introText6,x	;4 get player1 copy3 data
	tax					;2
	lda pfBuffer+3		;3

	sta GRP1			;3
	sty GRP0			;3
	stx GRP1			;3
	sta GRP0			;3

	tsx					;2
	inx					;2
	cpx pfBuffer		;3
	bne messageDisplayLoop	;3 (4 if page crossed) loop until done


	lda  #$00           ; clear player graphics
	sta  GRP1
	sta  GRP0
	sta  GRP1
	sta  GRP0

	sta WSYNC
	sta HMCLR

	; Read Paddles ++++++++++++++++++++++++++++++++
	ldx #<pfBuffer+6
	txs
	lda #23
	jsr paddleRead

	sta WSYNC

	lda #$0F
	sta COLUP0
	sta COLUP1


	; Now, have to reposition the player graphics
	; since they were moved to display the text..
	
	; Indicate that we're not at the start of the kernal
	; since the following positioning routines are also
	; used there.
	ldy #255
	
	;**************** Position P0 (Left Marble) ***************

positionMarbles
	lda p1x
	lsr
	tax
	STA WSYNC
	; Uses a lookup table to get the fine and course movement
	lda movement,x
	STA HMP0
	AND #$0F
	TAX

pPos5
	DEX
	BPL pPos5
	STA RESP0


	STA WSYNC
	STA HMOVE

	;**************** Position P1 (Right Marble) ***************

	nop
	nop

	lda p2x
	clc
	adc #5
	
	lsr
	tax

	; Uses a lookup table to get the fine and course movement
	lda movement,x
	STA HMP1

	ldx #0
	stx HMP0
	stx HMM0

	AND #$0F
	TAX

pPos6
	DEX
	BPL pPos6

	STA RESP1

	STA WSYNC
	STA HMOVE

	;----------------------------------------------------------
	; This positioning routine is also used at the start of the kernal
	cpy #0
	bne continueMessageDisplay

	jmp backToKernalStart

continueMessageDisplay
	;------------------------------------------------------------

	lda #255
	sta PF1
	sta PF2

	; ***********************************************************

	; Restore remaining registers and variables to resume
	; drawing the screen...

	; restore X and Y
	ldx pfBuffer+1
	txs
	ldy pfBuffer+2


	lda #32		;2
	sta  NUSIZ1

	lda  #$00           ; set both players to normal
	sta  NUSIZ0
	sta  VDELP0
	sta  VDELP1

	tya
	sec
	sbc #31
	tay

	sta WSYNC

	lda bkColor
	sta COLUBK

	lda #0
	sta PF1
	sta PF2

	tsx			;2
	dex			;2
	dex			;2
	txa			;2
	lsr			;2
	sta temp4	;3
	tax			;2


	; Load the next right-playfield color
	lda playField+65,x	;4 66 
	sta pfBuffer+7			;3 

	lda playField+59,x	;4 66 
	sta pfBuffer+6

	tsx
	dex
	dex
	dex
	txs

	; Don't change number of cycles after this...
	sta WSYNC
	
	lda #0
	sta PF1
	sta PF2

	lda #%00010000
	sta CTRLPF

	lda pfColor			;3
	sta COLUPF			;3

	lda #255
	sta ENAM0

	jmp rtnIntroMessage








;==========================================================================
;
; kernal
;
;==========================================================================
kernal
	;******************* Position P0/P1 for Score ***********************

	sta HMCLR
	; Set horizontal player positions for score

	sta WSYNC
	lda #%11000000
	sta HMM0
	lda #%11010000
	sta HMM1

	nop ; 9/17
	nop
	nop	
	nop	
	nop
	nop	
	nop	
	lda temp

	sta RESP0
	lda temp
	nop
	nop	
	nop	
	sta RESM0
	lda temp
	sta RESBL
	nop
	lda temp
	sta RESP1	

	lda #%00100000
	sta HMP0
	lda #%00010000
	sta HMBL
	sta RESM1
	sta WSYNC
	sta HMOVE

	lda #0
	sta COLUBK
	
	; ************** Score Draw Loop ********************

	jmp callDrawScore

rtnCallDrawScore


	; ************** Future Status and Timer (22 lines) ****************


	lda #$0F
	sta COLUPF


	; ***************** Position Game Objects *********************

	nop
	lda temp ; waste 3 cycles
	sta temp
	
	; Set sizes
	lda #32		;2
	sta NUSIZ1	;3
	lda #0
	sta NUSIZ0	;3


	; ***************** Position M0 (Divider Line) *********************
	
	sta RESM0
	sta PF1		;3

	; DEBUG LIVES PROBLEM
;	lda #$0F
;	sta PF2		;3

	sta HMCLR
	lda #%01000000
	sta HMM0

	lda #6
	sta temp4

	; preLoad playfield color buffer
	lda playField+71+6
	sta pfBuffer+7


	sta WSYNC


	; Set player colors
	lda #$0F
	sta COLUP0
	sta COLUP1
	


	; ------------------------------ Use marble positioning routine in the "introMessage" function
	; Setting Y to zero tells it to come back here
	; when it's done.
	ldy #0

	jmp positionMarbles
	
backToKernalStart
	;-----------------------------------------------------




	; ***************** Position M1 (Power UP) *********************

	; Power up flickers between player 1 and 2
	; power up.
	ldx pwr1x
	lda frame
	and #%00000001
	beq powerUp1

	lda pwr2x	
	clc
	adc #77
	tax

powerUp1

	; Uses a lookup table to get the fine and course movement
	lda movement,x
	ldy #$0F


	sta WSYNC
	sta HMCLR

	STA HMM1

	AND #$0F
	TAY
pPos3
	DEY
	BPL pPos3
	STA RESM1


	sta WSYNC
	sta HMOVE

	; The Ball is used to show the center divider in the score
	; area, but M0 is used in the game area.  Turn on M0 here.
	lda #$FF
	sta ENAM0

	;******* Calculate line position of Vertical Paddle bar (Ball) *******

	lda frame
	and #1
	tay

	; temp16L stores the position
	; of the vertical paddle indicator
	ldx padVal1,y
	lda paddleDecode,x
;	jmp getPaddleA
rtnGetPaddleA


	sta temp3
	lda #14
	sec
	sbc temp3
	bcc padZero

	clc
	adc #1
	jmp notPadZero

padZero 
	lda #1
notPadZero

	sta temp3

	ldx #$0

	cmp #13
	bmi ballOff

	lda p1Status,y
	cmp #INACTIVE
	beq ballOff

	ldx #$FF

ballOff

	stx ENABL

	lda #%00010000
	sta CTRLPF

	ldy bkColor


	sta WSYNC

	; Draw top white line
	lda #$0F
	sta COLUBK

	lda #%00000110
	sta PF1
	lda #$08
	sta COLUPF
	sta COLUPF
	

	;*********** Position Ball (shows vertical Paddle position) ***********

	; The ball graphics flickers between the left side and right side
	; to indicate both player's vertical paddle positions

	lda frame
	and #1
	bne right

	ldx #2
ballL
	dex
	bne ballL

	lda #%11010000
	sta HMBL	

	lda #$FF
	sta RESBL

	jmp endBallPos

right
	ldx #7
ballR
	dex
	bne ballR

	lda #%10110000
	sta HMBL	

	lda #$FF
	sta RESBL

endBallPos


	sta WSYNC
	sta HMOVE

	stx PF1
	sty COLUBK

	sta ENAM0
	
	;--------------------------- set startup text to display (or not)
	; 147 = no intro display
	ldx #147

	; Check for GAMEOVER/ENDLEVEL flags
	lda level
	and #%11100000
	bne showDisplay

	; Check for startup
	lda p2Status
	cmp #STARTUP
	beq showDisplay
	lda p1Status
	cmp #STARTUP
	bne noStartup
showDisplay
	ldx #148 ; 148 = show display
noStartup
	stx temp5
	;------------------------------------------

	;***************** General Setup for Screen Drawing *******************


	; Alternate the two kernals every frame
	lda frame
	and #%00000001
	bne prepareKernalB

	jmp prepareKernalA	


	;------------------------------ prepare kernal B

prepareKernalB

	; ******* Draw horizontal Paddle Indicator Right *******	

	lda pfColor
	sta COLUPF
	
	lda p2Status
	cmp #INACTIVE
	bne showBall2
	
	lda #255
	sta temp3 ; location of ball line position
	lda #0
	sta ENABL
	sta WSYNC
 	sta WSYNC	
	jmp	endPaddleDisplay2

showBall2 

	ldy #2
hLoopB
	sta WSYNC

	; Get paddle value
	ldx padVal4
	lda paddleDecode,x
;	jmp getPaddleB
rtnGetPaddleB


	ldx #0
	stx PF0
	stx PF1
	stx PF2

	asl
	asl
	
	ldx #2
hPadB
	dex
	bne hPadB

	tax
	lda hPaddleDisplay,x
	sta PF0
	lda hPaddleDisplay+1,x
	sta PF1
	lda hPaddleDisplay+2,x
	sta PF2


	dey
	bne hLoopB

endPaddleDisplay2
	sta WSYNC

	ldx #0
	stx PF0
	stx PF1
	stx PF2

	jmp callMainKernal


	;--------------------------------------------- prepare kernal A

prepareKernalA	
	; ********* Draw Horizontal Paddle Indicator Left *********

	lda pfColor
	sta COLUPF

	; Don't show paddles if INACTIVE
	lda p1Status
	cmp #INACTIVE
	bne showBall
	
	lda #255
	sta temp3 ; location of ball line position
	lda #0
	sta ENABL
	sta WSYNC
	sta WSYNC	
	jmp	endPaddleDisplay


showBall
	; Get paddle value
	ldx padVal2
	lda paddleDecode,x
;	jmp getPaddleC
rtnGetPaddleC
;	sta pfBuffer

	ldy #2

hLoopA	
	sta WSYNC
	
	asl
	asl
	tax
	
	; Use array to convert paddle value
	; to playfield data
	lda hPaddleDisplay,x
	sta PF0
	lda hPaddleDisplay+1,x
	sta PF1
	lda hPaddleDisplay+2,x
	sta PF2

	nop
	nop
	nop
	nop
	nop	

	; Turn off display
	lda #0
	sta PF0
	sta PF1
	sta PF2

	; Get paddle value
	ldx padVal2
	lda paddleDecode,x
;	jsr getPaddle

	dey
	bne hLoopA

endPaddleDisplay
	sta WSYNC

	; ***************** Prepare for Kernal Loop ****************

	; Set starting Paddle counter values
	lda #161
	sta padVal1
	sta padVal2

	jmp callMainKernal



	;-----------------------------------------------------------------------

getPaddleC
;	sta.w temp
;	lda paddleDecode,x
;	sta.w temp
;	jmp rtnGetPaddleC

getPaddleB
;	sta.w temp
;	lda paddleDecode,x
;	sta.w temp
;	jmp rtnGetPaddleB

getPaddleA
;	sta.w temp
;	lda paddleDecode,x
;	sta.w temp
;	jmp rtnGetPaddleA


;	align 256

movement ; 130
	byte #%01110001, #%01100001, #%01010001, #%01000001, #%00110001, #%00100001, #%00010001, #%00000001
	byte #%11110001, #%11100001, #%11010001, #%11000001, #%10110001, #%10100001, #%10010001

	byte #%01110010, #%01100010, #%01010010, #%01000010, #%00110010, #%00100010, #%00010010, #%00000010
	byte #%11110010, #%11100010, #%11010010, #%11000010, #%10110010, #%10100010, #%10010010

	byte #%01110011, #%01100011, #%01010011, #%01000011, #%00110011, #%00100011, #%00010011, #%00000011
	byte #%11110011, #%11100011, #%11010011, #%11000011, #%10110011, #%10100011, #%10010011

	byte #%01110100, #%01100100, #%01010100, #%01000100, #%00110100, #%00100100, #%00010100, #%00000100
	byte #%11110100, #%11100100, #%11010100, #%11000100, #%10110100, #%10100100, #%10010100

	byte #%01110101, #%01100101, #%01010101, #%01000101, #%00110101, #%00100101, #%00010101, #%00000101
	byte #%11110101, #%11100101, #%11010101, #%11000101, #%10110101, #%10100101, #%10010101

	byte #%01110110, #%01100110, #%01010110, #%01000110, #%00110110, #%00100110, #%00010110, #%00000110
	byte #%11110110, #%11100110, #%11010110, #%11000110, #%10110110, #%10100110, #%10010110

	byte #%01110111, #%01100111, #%01010111, #%01000111, #%00110111, #%00100111, #%00010111, #%00000111
	byte #%11110111, #%11100111, #%11010111, #%11000111, #%10110111, #%10100111, #%10010111

	byte #%01111000, #%01101000, #%01011000, #%01001000, #%00111000, #%00101000, #%00011000, #%00001000
	byte #%11111000, #%11101000, #%11011000, #%11001000, #%10111000, #%10101000, #%10011000

	byte #%01111001, #%01101001, #%01011001, #%01001001, #%00111001, #%00101001, #%00011001, #%00001001
	byte #%11111001, #%11101001, #%11011001, #%11001001, #%10111001, #%10101001, #%10011001

	byte #%01111010, #%01101010, #%01011010, #%01001010, #%00111010, #%00101010, #%00011010, #%00001010
	byte #%11111010, #%11101010, #%11011010, #%11001010, #%10111010, #%10101010, #%10011010


hPaddleDisplay	; 64 bytes
	byte %00010000, %00000000, %00000000, %00000000
	byte %00010000, %00000000, %00000000, %00000000
	byte %00010000, %00000000, %00000000, %00000000
	byte %00010000, %00000000, %00000000, %00000000
	byte %01100000, %00000000, %00000000, %00000000
	byte %10000000, %10000000, %00000000, %00000000
	byte %00000000, %01100000, %00000000, %00000000
	byte %00000000, %00011000, %00000000, %00000000
	byte %00000000, %00000110, %00000000, %00000000
	byte %00000000, %00000001, %00000001, %00000000
	byte %00000000, %00000000, %00000110, %00000000
	byte %00000000, %00000000, %00011000, %00000000
	byte %00000000, %00000000, %01100000, %00000000
	byte %00000000, %00000000, %10000000, %00000000
	byte %00000000, %00000000, %10000000, %00000000
	byte %00000000, %00000000, %10000000;, %00000000







	;---------------------------------------- Level Text Data



	org $3B3F
	rorg $1B3F
levelText1
	byte %00000000, %00000000,%00000000,%00000000,%00000000 
	byte 0,0,0,0,0
levelText2
	byte %10001110,%10001000,%10001100, %10001000, %11101110 

levelText3
	byte %10101110, %10101000, %10101100, %10101000, %01001110 

levelText4
	byte %10000000, %10000100, %10000000, %10000100, %11100000 

	; GAME OVER / TIME BONUS
statusText1
	; game over
	byte %00011000
	byte %00100101
	byte %00100001
	byte %00101101
	byte %00100101
	byte %00100101
	byte %00011001

	; time bonus
	byte %00111110
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000
	byte %00001000

	; you finished!
	byte %10100110
	byte %10101001
	byte %10101001
	byte %10101001
	byte %01001001
	byte %01001001
	byte %01000110

	; bonus 400 !!!
	byte %00001110
	byte %00001001
	byte %00001001
	byte %00001110
	byte %00001001
	byte %00001001
	byte %00001110

statusText2
	byte %11001000
	byte %00101101
	byte %00101010
	byte %11101000
	byte %00101000
	byte %00101000
	byte %00101000

	byte %10100010
	byte %10110110
	byte %10101010
	byte %10100010
	byte %10100010
	byte %10100010
	byte %10100010

	byte %01001000
	byte %01001000
	byte %01001000
	byte %01001000
	byte %01001000
	byte %01001000
	byte %00110000

	byte %00110010
	byte %01001011
	byte %01001010
	byte %01001010
	byte %01001010
	byte %01001010
	byte %00110010

statusText3
	byte %10111000
	byte %10100000
	byte %10100000
	byte %10110000
	byte %10100000
	byte %10100000
	byte %10111000

	byte %11100011
	byte %10000010
	byte %10000010
	byte %11000011
	byte %10000010
	byte %10000010
	byte %11100011

	byte %11101010
	byte %10001011
	byte %10001010
	byte %11001010
	byte %10001010
	byte %10001010
	byte %10001010

	byte %01010010
	byte %01010010
	byte %11010010
	byte %01010010
	byte %01010010
	byte %01010010
	byte %01001100

statusText4 
	byte %00001100
	byte %00010010
	byte %00010010
	byte %00010010
	byte %00010010
	byte %00010010
	byte %00001100

	byte %10001100
	byte %01010010
	byte %01010010
	byte %10010010
	byte %01010010
	byte %01010010
	byte %10001100

	byte %01010011
	byte %01010100
	byte %11010100
	byte %01010011
	byte %01010000
	byte %01010100
	byte %01010011

	byte %01100000
	byte %10010001
	byte %10000000
	byte %01100000
	byte %00010000
	byte %10010001
	byte %01100001


statusText5
	byte %10001011
	byte %10001010
	byte %10001010
	byte %10001011
	byte %10001010
	byte %01010010
	byte %00100011

	byte %10010100
	byte %11010100
	byte %10110100
	byte %10010100
	byte %10010100
	byte %10010100
	byte %10010011

	byte %00101011
	byte %10101010
	byte %00101010
	byte %00111011
	byte %10101010
	byte %10101010
	byte %00101011

	byte %10011100
	byte %01010001
	byte %01010001
	byte %10011101
	byte %10000101
	byte %00000101
	byte %11011000


statusText6
	byte %10111000
	byte %00100100
	byte %00100100
	byte %00111000
	byte %00110000
	byte %00101000
	byte %10100100

	byte %10011000
	byte %10100100
	byte %10100000
	byte %10011000
	byte %10000100
	byte %10100100
	byte %00011000

	byte %10111001
	byte %00100101
	byte %00100101
	byte %00100101
	byte %00100101
	byte %00100100
	byte %10111001

	byte %10010000
	byte %01010000
	byte %01010000
	byte %01010000
	byte %01010000
	byte %01000000
	byte %10010000



	org $3C00
	rorg $1C00
levelDigits
	byte %11100010,	%10100010,	%10100010,	%10100010,	%11100010	;01
	byte %11101110,	%10100010,	%10101110,	%10101000,	%11101110	;02
	byte %11101110, %10100010,  %10101110,  %10100010,  %11101110	;03
	byte %11101010, %10101010,  %10101110,  %10100010,  %11100010	;04
	byte %11101110,	%10101000,	%10101110,	%10100010,	%11101110	;05
	byte %11101110,	%10101000,	%10101110,	%10101010,	%11101110	;06
	byte %11101110,	%10100010,	%10100010,	%10100010,	%11100010	;07
	byte %11101110,	%10101010,	%10101110,	%10101010,	%11101110	;08
	byte %11101110,	%10101010,	%10101110,	%10100010,	%11100010	;09

	byte %00101110,	%00101010,	%00101010,	%00101010,	%00101110	;10
	byte %00100010,	%00100010,	%00100010,	%00100010,	%00100010	;11
	byte %00101110,	%00100010,	%00101110,	%00101000,	%00101110	;12
	byte %00101110, %00100010,  %00101110,  %00100010,  %00101110	;13
	byte %00101010, %00101010,  %00101110,  %00100010,  %00100010	;14
	byte %00101110,	%00101000,	%00101110,	%00100010,	%00101110	;15
	byte %00101110,	%00101000,	%00101110,	%00101010,	%00101110	;16
	byte %00101110,	%00100010,	%00100010,	%00100010,	%00100010	;17
	byte %00101110,	%00101010,	%00101110,	%00101010,	%00101110	;18
	byte %00101110,	%00101010,	%00101110,	%00100010,	%00100010	;19

	byte %11101110,	%00101010,	%11101010,	%10001010,	%11101110	;20
	byte %11100010,	%00100010,	%11100010,	%10000010,	%11100010	;21
	byte %11101110,	%00100010,	%11101110,	%10001000,	%11101110	;22
	byte %11101110, %00100010,  %11101110,  %10000010,  %11101110	;23
	byte %11101010, %00101010,  %11101110,  %10000010,  %11100010	;24
	byte %11101110,	%00101000,	%11101110,	%10000010,	%11101110	;25



	org $3C80
	rorg $1C80
introText1

	;EASY DOES IT
	byte %11100100,%10001010,%11001110,%10001010,%11101010

	;ATARI AGE
	byte %00000000
	byte %00000001
	byte %00000001
	byte %00000001
	byte %00000001

	; FIND THE KEYS
	byte %11101010
	byte %10001011
	byte %11001010
	byte %10001010
	byte %10001010

	; "BLUE MAZE"
	byte %00101011
	byte %00000010
	byte %00000011
	byte %00000010
	byte %00000011

	;NO MORE WALLS!
	byte %10010010
	byte %11010101
	byte %10110101
	byte %10010101
	byte %10010010

	;GET THE GEMS
	byte %00111011
	byte %01000010
	byte %01011011
	byte %01001010
	byte %00110011

	;MINOR RAMPS
	byte %00011011
	byte %00010101
	byte %00010101
	byte %00010001
	byte %00010001

	;GRAND PRIX
	byte %00000111
	byte %00001000
	byte %00001011
	byte %00001001
	byte %00000110

	;MINI GOLF
	byte %11011001
	byte %10101010
	byte %10101011
	byte %10001010
	byte %10001010

	; EARTHWORLD
	byte %11100100
	byte %10001010
	byte %11001110
	byte %10001010
	byte %11101010
	
	;VIDEO PINBALL
	byte %10101011
	byte %10101010
	byte %10101010
	byte %10101010
	byte %01001011

	;GREAT GAMES =
	byte %01110110
	byte %10000101
	byte %10110110
	byte %10010101
	byte %01100101

	;FIREWORLD
	byte %00000011
	byte %00000010
	byte %00000011
	byte %00000010
	byte %00000010

	;HAUNTED HOUSE
	byte %10100100
	byte %10101010
	byte %11101110
	byte %10101010
	byte %10101010

	;MAJOR RAMPS
	byte %00110110
	byte %00101010
	byte %00101010
	byte %00100010
	byte %00100010

	; WATERWORLD
	byte %10001001
	byte %10001010
	byte %10001011
	byte %10101010
	byte %01010010
	
	; AIRWORLD
	byte %00000001
	byte %00000010
	byte %00000011
	byte %00000010
	byte %00000010

	; RAINBOW ROAD	
	byte %11000100
	byte %10101010
	byte %11001110
	byte %10101010
	byte %10101010

	org $3D00
	rorg $1D00
introText2
	; EASY DOES IT
	byte %01101010,%10001010,%01000100,%00100100,%11000100

	;ATARI AGE
	byte %10011100
	byte %01001001
	byte %11001001
	byte %01001001
	byte %01001001

	; FIND THE KEYS
	byte %01011000
	byte %01010100
	byte %11010100
	byte %01010100
	byte %01011000

	; BLUE MAZE
	byte %00100010
	byte %10100010
	byte %00100010
	byte %10100010
	byte %00111001

	;NO MORE WALLS!
	byte %00011011
	byte %00010101
	byte %00010101
	byte %00010001
	byte %00010001

	;GET THE GEMS
	byte %10111000
	byte %00010000
	byte %00010000
	byte %00010000
	byte %10010000

	;MINOR RAMPS
	byte %01010010
	byte %01011010
	byte %01010110
	byte %01010010
	byte %01010010

	;GRAND PRIX
	byte %01100010
	byte %01010101
	byte %01100111
	byte %01010101
	byte %01010101

	;MINI GOLF
	byte %00110011
	byte %10101010
	byte %10110011
	byte %10101010
	byte %10101011

	; EARTHWORLD
	byte %11001110
	byte %10100100
	byte %11000100
	byte %10100100
	byte %10100100
	
	;VIDEO PINBALL
	byte %00111001
	byte %10100010
	byte %10110010
	byte %10100010
	byte %00111001

	;GREAT GAMES =
	byte %01110010
	byte %01000101
	byte %01100111
	byte %01000101
	byte %01110101

	; FIREWORLD
	byte %01011001
	byte %01010101
	byte %01011001
	byte %01010101
	byte %01010101

	;HAUNTED HOUSE
	byte %10101001
	byte %10101101
	byte %10101011
	byte %10101001
	byte %01001001

	;MAJOR RAMPS
	byte %01001110
	byte %10100100
	byte %11100100
	byte %10100100
	byte %10101100

	; WATERWORLD
	byte %00111011
	byte %10010010
	byte %10010011
	byte %10010010
	byte %10010011
	
	; AIRWORLD
	byte %00101100
	byte %10101010
	byte %10101100
	byte %10101010
	byte %10101010
	
	; RAINBOW ROAD	
	byte %10100101
	byte %10110101
	byte %10101101
	byte %10100101
	byte %10100101

	org $3D80
	rorg $1D80
introText3
	; EASY DOES IT
	byte %00001110,%00001001,%00001001,%00001001,%00001110

	;ATARI AGE
	byte %10011001
	byte %01010101
	byte %11011001
	byte %01010101
	byte %01010101

	; FIND THE KEYS
	byte %01110101
	byte %00100101
	byte %00100111
	byte %00100101
	byte %00100101

	; BLUE MAZE
	byte %10111000
	byte %10100000
	byte %10110000
	byte %10100000
	byte %00111000

	;NO MORE WALLS!
	byte %00100110
	byte %01010101
	byte %01010110
	byte %01010101
	byte %00100101

	;GET THE GEMS
	byte %11101010
	byte %01001010
	byte %01001110
	byte %01001010
	byte %01001010

	;MINOR RAMPS
	byte %01001100
	byte %10101010
	byte %10101100
	byte %10101010
	byte %01001010

	;GRAND PRIX
	byte %01001011
	byte %01101010
	byte %01011010
	byte %01001010
	byte %01001011

	;MINI GOLF
	byte %00100011
	byte %10100010
	byte %00100011
	byte %10100010
	byte %00111011

	;EARTHWORLD
	byte %10100010
	byte %10100010
	byte %11100010
	byte %10100010
	byte %10100001
	
	;VIDEO PINBALL
	byte %00000110
	byte %10000101
	byte %10000110
	byte %10000100
	byte %00000100

	;GREAT GAMES =
	byte %01110000
	byte %00100001
	byte %00100001
	byte %00100001
	byte %00100000

	;FIREWORLD
	byte %10100010
	byte %00100010
	byte %10101010
	byte %00101010
	byte %10010100

	;HAUNTED HOUSE
	byte %01110110
	byte %00100100
	byte %00100110
	byte %00100100
	byte %00100110

	;MAJOR RAMPS
	byte %01001100
	byte %10101010
	byte %10101100
	byte %10101010
	byte %01001010

	; WATERWORLD
	byte %10110010
	byte %00101010
	byte %10110010
	byte %00101010
	byte %10101001
	
	; AIRWORLD
	byte %00000010
	byte %00000010
	byte %00000010
	byte %00000010
	byte %00000001
	
	; RAINBOW ROAD	
	byte %10001001
	byte %01010101
	byte %10010101
	byte %01010101
	byte %10001000

	org $3E00
	rorg $1E00
introText4
	; EASY DOES IT
	byte %00100111,%01010100,%01010110,%01010100,%00100111
	
	;ATARI AGE
	byte %00000010
	byte %00000101
	byte %00000111
	byte %00000101
	byte %00000101

	; FIND THE KEYS
	byte %01110001
	byte %01000001
	byte %01100001
	byte %01000001
	byte %01110001

	; BLUE MAZE
	byte %11011001
	byte %10101010
	byte %10101011
	byte %10001010
	byte %10001010

	;NO MORE WALLS!
	byte %01100100
	byte %01000100
	byte %01100101
	byte %01000101
	byte %01100010

	;GET THE GEMS
	byte %11100001
	byte %10000010
	byte %11000010
	byte %10000010
	byte %11100001

	;MINOR RAMPS
	byte %00011000
	byte %00010101
	byte %00011001
	byte %00010101
	byte %00010101

	;GRAND PRIX
	byte %00000110
	byte %10000101
	byte %10000110
	byte %10000100
	byte %00000100

	;MINI GOLF
	byte %10000001
	byte %00000010
	byte %00000010
	byte %00000010
	byte %10000001

	;EARTHWORLD
	byte %00100100
	byte %00101010
	byte %10101010
	byte %10101010
	byte %01000100
	
	;VIDEO PINBALL
	byte %01010010
	byte %01011010
	byte %01010110
	byte %01010010
	byte %01010010

	;GREAT GAMES =
	byte %11100100
	byte %00001010
	byte %01101110
	byte %00101010
	byte %11001010

	;FIREWORLD
	byte %01001100
	byte %10101010
	byte %10101100
	byte %10101010
	byte %01001010

	;HAUNTED HOUSE
	byte %11000010
	byte %10100010
	byte %10100011
	byte %10100010
	byte %11000010

	;MAJOR RAMPS
	byte %00011000
	byte %00010101
	byte %00011001
	byte %00010101
	byte %00010101

	; WATERWORLD
	byte %00100100
	byte %00101010
	byte %10101010
	byte %10101010
	byte %01000100
	
	; AIRWORLD
	byte %00100100
	byte %00101010
	byte %10101010
	byte %10101010
	byte %01000100
	
	; RAINBOW ROAD	
	byte %00010000
	byte %00010000
	byte %01010000
	byte %01010000
	byte %10100000

	org $3E80
	rorg $1E80
introText5
	; EASY DOES IT
	byte %00110000,%01000000,%00100000,%00010000,%01100000

	;ATARI AGE
	byte %00110011
	byte %01000010
	byte %01011011
	byte %01001010
	byte %00110011

	; FIND THE KEYS
	byte %00011101
	byte %01010001
	byte %10011000
	byte %01010000
	byte %01011100

	; BLUE MAZE
	byte %00111011
	byte %10001010
	byte %10010011
	byte %10100010
	byte %10111011

	;NO MORE WALLS!
	byte %01001001
	byte %01010101
	byte %01011101
	byte %01010101
	byte %10010101

	;GET THE GEMS
	byte %11011101
	byte %00010001
	byte %11011001
	byte %01010001
	byte %10011101

	;MINOR RAMPS
	byte %10011011
	byte %01010101
	byte %11010101
	byte %01010001
	byte %01010001

	;GRAND PRIX
	byte %01100101
	byte %01010100
	byte %01100100
	byte %01010100
	byte %01010101

	;MINI GOLF
	byte %11001001
	byte %00010101
	byte %11010101
	byte %01010101
	byte %10001001

	;EARTHWORLD
	byte %11001000
	byte %10101000
	byte %11001000
	byte %10101000
	byte %10101110
	
	;VIDEO PINBALL
	byte %11000100
	byte %10101010
	byte %11001110
	byte %10101010
	byte %11001010

	;GREAT GAMES =
	byte %11011011
	byte %10101010
	byte %10101011
	byte %10001010
	byte %10001011

	;FIREWORLD
	byte %10001100
	byte %10001010
	byte %10001010
	byte %10001010
	byte %11101100

	;HAUNTED HOUSE
	byte %10010010
	byte %10101010
	byte %10101010
	byte %10101010
	byte %10010001

	;MAJOR RAMPS
	byte %10011011
	byte %01010101
	byte %11010101
	byte %01010001
	byte %01010001

	; WATERWORLD
	byte %11001000
	byte %10101000
	byte %11001000
	byte %10101000
	byte %10101110
	
	; AIRWORLD
	byte %11001000
	byte %10101000
	byte %11001000
	byte %10101000
	byte %10101110
	
	; RAINBOW ROAD	
	byte %11000100
	byte %10101010
	byte %11001010
	byte %10101010
	byte %10100100

	org $3F00
	rorg $3F00
introText6
	; EASY DOES IT
	byte %10111000,%10010000,%10010000,%10010000,%10010000

	;ATARI AGE
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	; FIND THE KEYS
	byte %01001100
	byte %01010000
	byte %10001000
	byte %10000100
	byte %10011000

	; BLUE MAZE
	byte %10101000
	byte %00000000
	byte %10000000
	byte %00000000
	byte %10000000

	;NO MORE WALLS!
	byte %00100011
	byte %00100100
	byte %00100010
	byte %00100001
	byte %10110110

	;GET THE GEMS
	byte %10110011
	byte %01010100
	byte %01010010
	byte %00010001
	byte %00010110

	;MINOR RAMPS
	byte %01100011
	byte %01010100
	byte %01100010
	byte %01000001
	byte %01000110

	;GRAND PRIX
	byte %00010000
	byte %10100000
	byte %01000000
	byte %10100000
	byte %00010000

	;MINI GOLF
	byte %00011100
	byte %00010000
	byte %00011000
	byte %00010000
	byte %11010000

	;EARTHWORLD
	byte %11000100
	byte %10100100
	byte %10100100
	byte %10100000
	byte %11000100
	
	;VIDEO PINBALL
	byte %10001000
	byte %10001000
	byte %10001000
	byte %10001000
	byte %11101110

	;GREAT GAMES =
	byte %00110000
	byte %01000111
	byte %00100000
	byte %00010111
	byte %01100000

	;FIREWORLD
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000

	;HAUNTED HOUSE
	byte %10011011
	byte %10100010
	byte %10010011
	byte %10001010
	byte %00110011

	;MAJOR RAMPS
	byte %01100011
	byte %01010100
	byte %01100010
	byte %01000001
	byte %01000110

	; WATERWORLD
	byte %11000100
	byte %10100100
	byte %10100100
	byte %10100000
	byte %11000100
	
	; AIRWORLD
	byte %11000000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %11000000
	
	; RAINBOW ROAD	
	byte %01001100
	byte %10101010
	byte %11101010
	byte %10101010
	byte %10101100


	org $3F80
	rorg $1F80


times5
	byte 0,5,10,15,20,25,30,35,40,45,50,55,60,65,70
	byte 75,80,85,90,95,100,105,110,115,120,125

times7
	byte 0,7

optionSelect3b
	byte 0,0,#%01111111



;==========================================================================
;
; kernal caller / callMainKernal
;
;--------------------------------------------------------------------------
; the kernal is called from bank 2, then mainKernal is called from
; here, then mainKernal returns directly to bank2.
;==========================================================================

	org $3FA0
	rorg $1FA0

callMainKernal
	stx BANK1
	jmp kernal ; 1FA5



optionSelect1
	byte #%00000111,0,0
optionSelect1b
	byte #%01111111,0,0
optionSelect3
	byte 0,0,#%00001111




;==========================================================================
;
; introMessage caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 1.
;--------------------------------------------------------------------------

	org $3FB3
	rorg $1FB3

	jmp introMessage
rtnIntroMessage
	ldx BANK1



levelOffset
	byte 39,49,59,69



;==========================================================================
;
; drawTitleScreen caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 1.
;==========================================================================

	org $3FC3
	rorg $1FC3

	jmp drawTitle
rtnDrawTitle
	stx BANK2



playersOffset
	byte 19,29

optionSelect2b
	byte 0,#%01111111,0

;==========================================================================
;
; callDrawScore
;
;--------------------------------------------------------------------------
; Call to bank 4
;==========================================================================

	org $3FD0
	rorg $1FD0

callDrawScore
	stx BANK4
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	jmp rtnCallDrawScore

optionSelect2
	byte 0,#%00011111,0



;==========================================================================
;
; callTitleScore
;--------------------------------------------------------------------------
; Call to bank 4
;
;==========================================================================

	org $3FE0
	rorg $1FE0

callTitleScore
	stx BANK4
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	jmp rtnCallTitleScore



;==========================================================================
;
; The cart may start up in this bank.  Make sure it switches
; back to bank 2 on startup.
;
;==========================================================================
	org $3FED
	rorg $1FED

	sta BANK2

	org $3FFC	; Program startup vector
	.word $1FED
	.word $1FED

