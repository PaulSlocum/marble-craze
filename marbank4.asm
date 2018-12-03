; Marble Craze bank 4
;------------------------------
; Includes:
;
; - Score/Status display kernal and data
; - In-game Song #1
;------------------------------


	org $4000
	rorg $1000


	include mardigit.asm


pfDigitRef1
	byte 0,5,10,15, 20,25,30,20, 0,20,0,0, 0,0,0,0

	byte 35,40,45,50, 55,60,65,55, 35,55,0,0, 0,0,0,0

	byte 70,75,80,85, 90,95,100,90, 70,90,0,0, 0,0,0,0

	byte 105,110,115,120, 125,130,135,125, 105,125,0,0, 0,0,0,0

	byte 140,145,150,155, 160,165,170,160, 140,160,0,0, 0,0,0,0


	byte 175,180,185,190, 195,200,205,195, 175,195,0,0, 0,0,0,0

	byte 210,215,220,225, 230,235,240,230, 210,230,0,0, 0,0,0,0

	byte 140,145,150,155, 160,165,170,160, 140,160,0,0, 0,0,0,0

	byte 0,5,10,15, 20,25,30,20, 0,20,0,0, 0,0,0,0

	byte 140,145,150,155, 160,165,170,160, 140,160,0,0, 0,0,0,0


	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
	byte %00000000
livesDisplay
	byte %00000000
	byte %00100000
	byte %00100000
	byte %00100000
	byte %00100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000
	byte %10100000

statusOffset
	byte 0,20,40,60,80,100,120,140,160,180,200,220

negConvert
	byte 0,255,254,253,252

	align 256;----------------------------------------- ALIGN 256


statusText
	; Nothing
	byte 0,0,0,0
	byte 0,0,0,0
	byte 0,0,0,0
	byte 0,0,0,0
	byte 0,0,0,0

	;+20PTS
	byte %00100011, %11000111, %00011100, %11100111
	byte %00100000, %00101000, %10010010, %01001000
	byte %11111001, %11001000, %10011100, %01000110
	byte %00100010, %00001000, %10010000, %01000001
	byte %00100011, %11100111, %00010000, %01001110

	;+50PTS
	byte %00100011, %11100111, %00011100, %11100111
	byte %00100010, %00001000, %10010010, %01001000
	byte %11111011, %11001000, %10011100, %01000110
	byte %00100000, %00101000, %10010000, %01000001
	byte %00100011, %11000111, %00010000, %01001110

	;+100PTS
	byte %00100010, %01100011, %00011100, %11100111
	byte %00100010, %10010100, %10010010, %01001000
	byte %11111010, %10010100, %10011100, %01000110
	byte %00100010, %10010100, %10010000, %01000001
	byte %00100010, %01100011, %00010000, %01001110

	;+5SEC
	byte %00100011, %11100000, %11101110, %01110000
	byte %00100010, %00000001, %00001000, %10000000
	byte %11111011, %11000000, %11001100, %10000000
	byte %00100000, %00100000, %00101000, %10000000
	byte %00100011, %11000001, %11001110, %01110000
	
	;+10SEC
	byte %00100010, %01100000, %11101110, %01110000
	byte %00100010, %10010001, %00001000, %10000000
	byte %11111010, %10010000, %11001100, %10000000
	byte %00100010, %10010000, %00101000, %10000000
	byte %00100010, %01100001, %11001110, %01110000

	;+20SEC
	byte %00100011, %00011000, %11101110, %01110000
	byte %00100000, %10100101, %00001000, %10000000
	byte %11111001, %00100100, %11001100, %10000000
	byte %00100010, %00100100, %00101000, %10000000
	byte %00100011, %10011001, %11001110, %01110000

	;WALLS
	byte %10001001, %10010001, %00001110, %00000000
	byte %10001010, %01010001, %00010000, %00000000
	byte %10101011, %11010001, %00001100, %00000000
	byte %10101010, %01010001, %00000010, %00000000
	byte %01010010, %01011101, %11011100, %00000000

	; GAMEOVER
	byte %01110010, %01101101, %10010010, %10110110
	byte %10000101, %01010101, %00101010, %10100101
	byte %10110111, %01010101, %10101010, %10110110
	byte %10010101, %01000101, %00101010, %10100101
	byte %01100101, %01000101, %10010001, %00110101

	; PAUSE
	byte %00000001, %10001001, %01001101, %11000000
	byte %00000001, %01010101, %01010001, %00000000
	byte %00000001, %10011101, %01001001, %10000000
	byte %00000001, %00010101, %01000101, %00000000
	byte %00000001, %00010100, %10011001, %11000000
	
	; TIME UP
	byte %00011101, %01101101, %10000101, %01100000
	byte %00001001, %01010101, %00000101, %01010000
	byte %00001001, %01010101, %10000101, %01100000
	byte %00001001, %01000101, %00000101, %01000000
	byte %00001001, %01000101, %10000010, %01000000

	;--------------------------------------------------

	align 256 ;----------------------------------------- ALIGN 256

	;1UP
	byte %00000010, %10010111, %00000000, %00000000
	byte %00000010, %10010100, %10000000, %00000000
	byte %00000010, %10010111, %00000000, %00000000
	byte %00000010, %10010100, %00000000, %00000000
	byte %00000010, %01100100, %00000000, %00000000

	;KEY
	byte %01111000, %00000000, %00000000, %00000000
	byte %10000100, %00000000, %00000000, %00000000
	byte %10000111, %11111111, %00000000, %00000000
	byte %10000100, %00011011, %00000000, %00000000
	byte %01111000, %00011011, %00000000, %00000000

	;STOP
	byte %00000000, %11011111, %01100111, %00000000
	byte %00000001, %00000100, %10010100, %10000000
	byte %00000000, %10000100, %10010111, %00000000
	byte %00000000, %01000100, %10010100, %00000000
	byte %00000001, %10000100, %01100100, %00000000

	;ZAP
	byte %00000010, %01111011, %11011011, %01000000
	byte %00000000, %10000010, %00010101, %00000000
	byte %00000110, %10011011, %00010101, %01100000
	byte %00000000, %10001010, %00010001, %00000000
	byte %00000010, %01110011, %11010001, %01000000

	;LIGHTS
	byte %00001000, %01001110, %10010111, %11001110
	byte %00001000, %01010000, %10010001, %00010000
	byte %00001000, %01010110, %11110001, %00001100
	byte %00001000, %01010010, %10010001, %00000010
	byte %00001111, %01001100, %10010001, %00011100

	;WARP
	byte %00000010, %00100110, %01110011, %10000000
	byte %00000010, %00101001, %01001010, %01000000
	byte %00000010, %10101111, %01110011, %10000000
	byte %00000010, %10101001, %01010010, %00000000
	byte %00000001, %01001001, %01001010, %00000000

	;RIGHT
	byte %00000000, %00000000, %11000000, %00000000
	byte %00000000, %00000000, %11110000, %00000000
	byte %00000000, %11111111, %11111100, %00000000
	byte %00000000, %00000000, %11110000, %00000000
	byte %00000000, %00000000, %11000000, %00000000
	
	;UP
	byte %00000000, %00000001, %00000000, %00000000
	byte %00000000, %00000011, %10000000, %00000000
	byte %00000000, %00000111, %11000000, %00000000
	byte %00000000, %00000001, %00000000, %00000000
	byte %00000000, %00000001, %00000000, %00000000

	; GAMEOVER
	byte %01110010, %01101101, %10010010, %10110110
	byte %10000101, %01010101, %00101010, %10100101
	byte %10110111, %01010101, %10101010, %10110110
	byte %10010101, %01000101, %00101010, %10100101
	byte %01100101, %01000101, %10010001, %00110101

	; PAUSE
	byte %00000001, %10001001, %01001101, %11000000
	byte %00000001, %01010101, %01010001, %00000000
	byte %00000001, %10011101, %01001001, %10000000
	byte %00000001, %00010101, %01000101, %00000000
	byte %00000001, %00010100, %10011001, %11000000
	
	; TIME UP
	byte %00011101, %01101101, %10000101, %01100000
	byte %00001001, %01010101, %00000101, %01010000
	byte %00001001, %01010101, %10000101, %01100000
	byte %00001001, %01000101, %00000101, %01000000
	byte %00001001, %01000101, %10000010, %01000000




;	align 256

;==========================================================================
;
; displayText
;
;--------------------------------------------------------------------------
; This is part of the drawScore function.
;
; This part of the status kernal is located at the beginning
; of this bank since it's sensitive to page boundaries
;==========================================================================
displayText
	;-------------set up text to display
	lda frame
	and #1
	tay

	; default to blank display
	ldx #0

	; Set up test pointers
	stx pfBuffer
	lda #>statusText
	sta pfBuffer+1

	lda p1Lives,y
	and #$F0
	beq noPowerUpDisplay

	bpl useFirstPage

	inc pfBuffer+1

useFirstPage	

	lsr
	lsr
	lsr
	lsr
	and #%00000111
	tax

noPowerUpDisplay

	lda level
	and #ENDGAME
	bne endStatusCheck

	lda titleOptions
	and #%01000000
	beq checkGODisplay

	; Pause
	ldx #9
	
	jmp endStatusCheck
	


checkGODisplay
	lda p1Status,y
	cmp #GAMEOVER
	bne notGameOver1

	; "GAMEOVER"
	ldx #8
	jmp endStatusCheck

notGameOver1
	cmp #TIMEUP
	bne endStatusCheck

	ldx #10

endStatusCheck

	;-------------------------------------


	sta WSYNC

	lda statusOffset,x
	tay
	clc

	adc #20
	sta temp2

	
	lda #STATUSCOLOR
	sta COLUP0
	sta COLUP1


	;------------------------------------------------
	; Draw LEFT player status/powerup info
	;------------------------------------------------

	lda frame
	and #1
	beq drawLeftSide

	jmp drawRightSide

drawLeftSide

	sta RESP0
	sta RESP1
	lda #STATUSCOLOR
	sta COLUP0
	sta COLUP1

	lda #%01010000
	sta HMP0
	lda #%01100000
	sta HMP1

	lda #1
	sta NUSIZ0
	sta NUSIZ1

	lda (pfBuffer),y
	sta GRP0

	sta WSYNC
	sta HMOVE

	lda temp	; waste 3 cycles

iLoop1

	iny
	lda (pfBuffer),y
	sta GRP1

	iny
	lda (pfBuffer),y
	tax
	iny
	lda (pfBuffer),y
	
	stx GRP0
	sta GRP1

	iny

	lda (pfBuffer),y
	sta GRP0

	sta WSYNC

	cpy temp2

	bne iLoop1

	lda #0
	sta GRP0
	sta GRP1

	jmp rtnDrawScore

;	align 64


	;------------------------------------------------
	; Draw RIGHT player status/powerup info
	;------------------------------------------------

	
drawRightSide

	lda #%00110000
	sta HMP0
	lda #%01000000
	sta HMP1

	lda #1
	sta NUSIZ0
	sta NUSIZ1
	nop

	nop
	nop

	sta RESP0
	sta RESP1

	sta WSYNC
	sta HMOVE

	lda temp

iLoop2
	lda (pfBuffer),y
	sta GRP0
	iny
	lda (pfBuffer),y
	sta GRP1

	iny
	lda (pfBuffer),y
	tax
	iny
	lda (pfBuffer),y

	iny

	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop

	stx GRP0
	sta GRP1

	STA WSYNC

	cpy temp2
	bne iLoop2

	lda #0
	sta GRP0
	sta GRP1

	jmp rtnDrawScore	





grpDigitRef1

	byte 0,3,6,6, 9,6,6,12, 6,15,0,0, 0,0,0,0

	byte 18,21,24,24, 27,24,24,30, 24,33,0,0, 0,0,0,0

	byte 36,39,42,42, 45,42,42,48, 42,51,0,0, 0,0,0,0

	byte 36,39,42,42, 45,42,42,48, 42,51,0,0, 0,0,0,0

	byte 54,57,60,60, 63,60,60,66, 60,69,0,0, 0,0,0,0

	
	byte 36,39,42,42, 45,42,42,48, 42,51,0,0, 0,0,0,0

	byte 36,39,42,42, 45,42,42,48, 42,51,0,0, 0,0,0,0

	byte 72,75,78,78, 81,78,78,84, 78,87,0,0, 0,0,0,0

	byte 36,39,42,42, 45,42,42,48, 42,51,0,0, 0,0,0,0

	byte 90,93,96,96, 99,96,96,102, 96,105,0,0, 0,0,0,0






marbleFrame
	byte 0,4,0,2

marbleFallingFrame
	byte 8,8,8,6



;==========================================================================
;
; Draw Score
;
;==========================================================================
drawScore

	;pfBuffer+0, pfBuffer+1
	;2,3
	;4,5
	;6,7

	; p1 grp
	;pMarble equ pfBuffer + 8; 2 bytes
	;temp3 equ $FE

	; p2 grp
	;pMarble2 equ pMarble + 2; 2 bytes
	;temp4 equ $FF

	; set up player 1 score

	lda #>pfDigits1
	sta pfBuffer+1
	sta pfBuffer+5

	lda #>pfDigits2
	sta pfBuffer+3
	sta pfBuffer+7

	ldy p1ScoreH		;3
	lda pfDigitRef1,y
	sta pfBuffer+0
	
	lda grpDigitRef1,y
	tay
	ldx p1ScoreL
	lda grpDigitRef1,x
	tax

	lda grpDigits1,y
	ora grpDigits2,x

	sta ENAM0
	and #%01111101
	sta GRP0

	lda grpDigits1+1,y
	ora grpDigits2+1,x
	sta pMarble+1
	lda grpDigits1+2,y
	ora grpDigits2+2,x
	sta temp3

	ldy p1ScoreL		;3
	lda pfDigitRef1,y
	sta pfBuffer+2

	; set up player 2 score

	ldy p2ScoreH		;3
	lda pfDigitRef1,y
	sta pfBuffer+4

	lda grpDigitRef1,y
	tay
	ldx p2ScoreL
	lda grpDigitRef1,x
	tax

	lda grpDigits1,y
	ora grpDigits2,x

	sta ENAM1
	and #%01111101
	sta GRP1

	lda grpDigits1+1,y
	ora grpDigits2+1,x
	sta pMarble2+1
	lda grpDigits1+2,y
	ora grpDigits2+2,x
	sta temp4

	ldy p2ScoreL		;3
	lda pfDigitRef1,y
	sta pfBuffer+6

;	lda pMarble
;	sta ENAM0
;	and #%01111101
;	sta GRP0

	lda #%00100111
	sta NUSIZ0
	sta NUSIZ1

	lda #0
	sta COLUP0
	sta COLUP1
	sta CTRLPF


	; Set score color
	ldx #$0F

	lda level
	cmp #255
	bne notTitle3

	; Dim score in title screen
	ldx #$04

notTitle3

    STX COLUPF
	stx ENABL

	sta HMCLR
	lda #%01110000
	sta HMM0
	sta HMM1

	; if title screen is active, don't show ball (divider line)
	lda level
	cmp #255
	bne notTitle2
	
	lda #0
	sta ENABL

notTitle2


	lda p1Lives
	and #$0F
	sta pMarble

	lda p2Lives
	and #$0F
	sta pMarble2

	lda pMarble2
	tax
	lda livesDisplay,x
	sta temp5
	
	lda pMarble
	tax
	lda livesDisplay,x		;4
	sta PF0					;3



	; ***************** Wait for Timer ******************

	; Wait for timer
timer2
    LDA INTIM
    BNE timer2 ;Loops until the timer is done - that means we're
                   ;somewhere in the last line of vertical blank.


    STA WSYNC      ;End the current scanline - the last line of VBLANK.
    STA VBLANK     ;End the VBLANK period.  The TIA will display stuff
                   ;starting with the next scanline.  We do have 23 cycles
                   ;of horizontal blank before it displays anything.

	; Score Kernal -------------------------------------

	ldy #0
	
	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2


	lda temp5
	sta PF0

;	lda pMarble2
;	sta ENAM1
;	and #%01111101
;	sta GRP1
	nop
	nop
	nop
	nop
	lda temp ; waste 3 cycles

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y
	sta PF2

	iny

	lda #%01001001
	sta GRP0
	lda #255
	sta ENAM0
	
	;--------------
	sta WSYNC

	lda #0					;2
	sta PF0					;3

	lda (pfBuffer+0),y		;5
	sta PF1					;3
	lda (pfBuffer+2),y		;5
	sta PF2					;3

	ldx pMarble2
	lda livesDisplay-1,x
	sta temp5
	ldx pMarble

	lda #%01001001			;2
	sta GRP1				;3
	lda #255				;2
	sta ENAM1				;3

	lda (pfBuffer+4),y		;5
	sta PF1					;3
	lda (pfBuffer+6),y		;5
	sta PF2					;3

;	iny


	lda #%01001001			;2
	sta GRP0				;3
	lda #255				;2
	sta ENAM0				;3
	
	;--------------
	sta WSYNC

	lda livesDisplay-1,x		;4
	sta PF0						;3

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

;	nop
;	nop
;	nop

	lda temp5
	sta PF0


	lda #%01001001
	sta GRP1
	lda #255
	sta ENAM1

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y
	sta PF2

	iny


	lda pMarble+1
	sta ENAM0
	and #%01111101
	sta GRP0

	lda #0

	;-----------------
	sta WSYNC

	sta PF0

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	ldx pMarble2
	lda livesDisplay-2,x
	sta temp5
	ldx pMarble

	lda pMarble2+1
	sta ENAM1
	and #%01111101
	sta GRP1

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y
	sta PF2

	iny

	lda #%01001001
	sta GRP0
	lda #255
	sta ENAM0

	;---------------
	sta WSYNC

	lda livesDisplay-2,x		;4
	sta PF0						;3

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	lda temp5
	sta PF0

	lda #%01001001
	sta GRP1
	lda #255
	sta ENAM1

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y
	sta PF2

	lda #%01001001
	sta GRP0
	lda #255
	sta ENAM0

	lda #0

	;---------------
	sta WSYNC

	sta PF0

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	ldx pMarble2
	lda livesDisplay-3,x
	sta temp5
	ldx pMarble

	lda #%01001001
	sta GRP1
	lda #255
	sta ENAM1

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y
	sta PF2

	iny

	lda temp3
	sta ENAM0
	and #%01111101
	sta GRP0			;71

	;----------------
	;sta WSYNC

	lda livesDisplay-3,x		;4
	sta PF0						;3

	lda (pfBuffer+0),y	;6
	sta PF1				;3
	lda (pfBuffer+2),y	;6
	sta PF2				;3


	; Start setting up timer display
	ldx p1TimeH			;3
	;ldx #$25
	lda pfDigitRef1,x	;4
	sta pfBuffer+0		;3

	lda temp5
	sta PF0

	lda temp4			;3
	sta ENAM1			;3
	and #%01111101		;2
	sta GRP1			;3

	lda (pfBuffer+4),y	;6
	sta PF1				;3
	lda (pfBuffer+6),y	;6
	sta PF2				;3 = 53


	; Start setting up timer display
	lda grpDigitRef1,x	;4
	tay					;2

	;---------- end of score display
	

	lda p1TimeL			;3

	sta WSYNC
	sta HMOVE

	and #$0F
	tax
	lda grpDigitRef1,x	;4
	tax					;2

	;-----------------------------------------------------------------
	; Draw Timers
	;-----------------------------------------------------------------


	lda #0
	sta PF0
	sta PF1
	sta PF2
	sta GRP0
	sta GRP1
	sta ENAM0
	sta ENAM1



	lda #%00010111
	sta NUSIZ0
	sta NUSIZ1

	; Timers

	
	lda #>pfDigits3
	sta pfBuffer+3
	sta pfBuffer+7

	lda #%11000000
	sta HMP0
	sta HMP1
	lda #%01010000
	sta HMM0
	sta HMM1

	;sta COLUBK


	lda grpDigits1,y
	asl
	ora grpDigits3,x
;	sta pMarble
	and #%11111101
	sta GRP0
	lda grpDigits1+1,y
	asl
	ora grpDigits3+1,x
	sta pMarble+1
	lda grpDigits1+2,y
	asl
	ora grpDigits3+2,x
	sta temp3


	lda level
	cmp #255
	bne notTitleScreen

	jmp rtnTitleScore

notTitleScreen


	lda p1TimeL			;3
	and #$0F
	tay
	lda pfDigitRef1,y
	sta pfBuffer+2

	; set up player 2 score

	ldy p2TimeH			;3
	lda pfDigitRef1,y
	sta pfBuffer+4

	lda grpDigitRef1,y
	tay
	lda p2TimeL
	and #$0F
	tax
	lda grpDigitRef1,x
	tax

	lda grpDigits1,y
	asl
	ora grpDigits3,x
	sta pMarble2
	lda grpDigits1+1,y
	asl
	ora grpDigits3+1,x
	sta pMarble2+1
	lda grpDigits1+2,y
	asl
	ora grpDigits3+2,x
	sta temp4

	lda p2TimeL			;3
	and #$0F
	tay
	lda pfDigitRef1,y
	sta pfBuffer+6


	lda #TIMECOLOR
	sta COLUPF


	sta WSYNC
	sta HMOVE
	
	ldx #$0F
	sta ENAM0
	sta ENAM1

	; Timer Kernal -------------------------------------

	ldy #0

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

;	nop
	nop

	lda pMarble2
	nop
	and #%11111101
	sta GRP1


	stx COLUPF

	lda (pfBuffer+4),y
	sta PF1

	lda #TIMECOLOR
	sta COLUPF

	lda (pfBuffer+6),y
	sta PF2

	iny

	lda #%10010001
	sta GRP0
	
	;--------------
	sta WSYNC

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	nop
	nop
	nop

	lda #%10010001
	sta GRP1
	lda #255
	nop

	lda (pfBuffer+4),y
	sta PF1

	lda (pfBuffer+6),y

	stx COLUPF
	sta PF2

	lda #TIMECOLOR
	sta COLUPF



	lda #%10010001
	sta GRP0
	
	;--------------
	sta WSYNC

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	nop
	nop
	nop

	lda #%10010001
	sta GRP1
	lda #255
	nop

	lda (pfBuffer+4),y
	sta PF1

	lda (pfBuffer+6),y

	stx COLUPF
	sta PF2

	lda #TIMECOLOR
	sta COLUPF

	iny


	lda pMarble+1
	and #%11111101
	sta GRP0

	;-----------------
	sta WSYNC

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	nop
	nop
	nop


	lda pMarble2+1
	nop
	and #%11111101
	sta GRP1

	lda (pfBuffer+4),y
	sta PF1

	lda (pfBuffer+6),y

	stx COLUPF

	sta PF2

	lda #TIMECOLOR
	sta COLUPF

	iny

	lda #%10010001
	sta GRP0
	lda #255

	;---------------
	sta WSYNC

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	nop
	nop
	nop

	lda #%10010001
	sta GRP1
	lda #255
	nop

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y

	stx COLUPF	

	sta PF2

	lda #TIMECOLOR
	sta COLUPF

	lda #%10010001
	sta GRP0

	;---------------
	sta WSYNC

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	nop
	nop
	nop

	lda #%10010001
	sta GRP1
	lda #255
	nop

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y

	stx COLUPF

	sta PF2

	lda #TIMECOLOR
	sta COLUPF

	iny

	lda temp3
	and #%11111101
	sta GRP0

	;----------------
	sta WSYNC

	lda (pfBuffer+0),y
	sta PF1
	lda (pfBuffer+2),y
	sta PF2

	nop
	nop
	nop

	lda temp4
	nop
	and #%11111101
	sta GRP1

	lda (pfBuffer+4),y
	sta PF1
	lda (pfBuffer+6),y

	stx COLUPF	

	sta PF2

	lda #TIMECOLOR
	sta COLUPF

	;---------- last one
	lda #0
	sta ENAM0
	sta GRP0

	ldx #$0F
	sta WSYNC
	
	stx COLUPF
	sta PF1
	sta PF2
	sta GRP1
	sta ENAM1

	;------------------------------------------------------------------
	; Set Up Marble Shape Pointers 
	;-------------------------------------------------------------------

	; Set up P0 (Left Player)

	; Make it flash if it's in falloff/startup mode
	lda p1Status
	cmp #GAMEOVER
	beq noMarble

	lda p1Status
	cmp #FASTFLASH	
	beq fastFlash
	and #FLASH

	and frame
	beq draw1	
	bne noMarble

fastFlash

	lda #4
	and frame
	beq draw1



noMarble
	; Draw it off screen
	lda #>marbleData3
	sta pMarble+1
	
	lda #99
	sta pMarble
	
	jmp noOffset

draw1
	; Draw it normally
	lda #>marbleData2
	sta pMarble+1

	lda p1y
	sta pMarble

	; For vertical values >100 a different page of image data is used
	cmp #100
	bmi noOffset

	sbc #64
	sta pMarble			;3

	lda #>marbleData3
	sta pMarble+1

noOffset

	
	; Set up P1 (Right Player)

	; Make it flash if it's in falloff/startup mode
	lda p2Status
	cmp #GAMEOVER
	beq noMarble2

	lda p2Status
	cmp #FASTFLASH	

	beq fastFlash2
	and #FLASH

	and frame
	beq draw2
	bne noMarble2

fastFlash2

	lda #4
	and frame
	beq draw2

noMarble2

	
	; Draw it off screen
	lda #>marbleData3
	sta pMarble2+1
	
	lda #99
	sta pMarble2
	
	jmp noOffset2

draw2
	; Draw it normally
	lda #>marbleData2
	sta pMarble2+1

	lda p2y
	sta pMarble2

	; For vertical values >100 a different page of image data is used
	cmp #100
	bmi noOffset2
	sbc #64
	sta pMarble2			;3

	lda #>marbleData3
	sta pMarble2+1

noOffset2

	nop
	nop
	nop

	lda p1Counter		;3
	lsr					;2
	lsr					;2
	lsr					;2
	tay					;2

	;------------------------------- Alternate Marble Shapes



	lda p1Status
	cmp #FALLOFF

	sta WSYNC

	bne showRotation1


	lda p1Counter		
	and #16				
	beq clearMarble1	
;	lda p1Counter		;3
;	lsr					;2
;	lsr					;2
;	lsr					;2
;	tay					;2
	lda marbleFallingFrame,y
	clc
	adc pMarble+1
	sta pMarble+1
	jmp shape2

clearMarble1
	; Draw it off screen
	lda #>marbleData3
	sta pMarble+1
	
	lda #99
	sta pMarble
	jmp shape2

showRotation1
	; Show rotation 1
	lda p1y
	sbc p1x
	and #%00011000
	lsr
	lsr
	lsr
	tay
	lda marbleFrame,y
	clc
	adc pMarble+1
	sta pMarble+1
		
	;------------------- right player shape

shape2

	lda p2Status
	cmp #FALLOFF
	bne showRotation2

	lda p2Counter
	and #16
	beq clearMarble2
	lda p2Counter
	lsr
	lsr
	lsr
	tay
	lda marbleFallingFrame,y
	clc
	adc pMarble2+1
	sta pMarble2+1
	jmp endShape

clearMarble2
	; Draw it off screen
	lda #>marbleData3
	sta pMarble2+1
	
	lda #99
	sta pMarble2
	jmp endShape

showRotation2
	; Show rotation 2
	lda p2y
	sbc p2x
	and #%00011000
	lsr
	lsr
	lsr
	tay
	lda marbleFrame,y
	clc
	adc pMarble2+1
	sta pMarble2+1

endShape		

	; the rest of the status kernal is located at the beginning
	; of this bank since it's sensitive to page boundaries
	jmp displayText





	include marsong.asm












;==========================================================================
;
; readPattern2 caller
;
;--------------------------------------------------------------------------
; I had to move part of the song pattern to bank 8 to 
; fit the first song in here.
;==========================================================================
	org $4F80
	rorg $1F80

callReadPattern2
	stx BANK8
	nop
	nop
	nop
	nop
	nop
	nop
	jmp rtnCallReadPattern2

;==========================================================================
;
; songPlayer caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 2.
;==========================================================================

	org $4FB3
	rorg $1FB3

	jmp songPlayer
rtnSongPlayer
	stx BANK2


;==========================================================================
;
; readPattern1 caller
;
;--------------------------------------------------------------------------
; I had to move part of the song pattern to bank 8 to 
; fit the first song in here.
;==========================================================================
	org $4FC0
	rorg $1FC0

callReadPattern1
	stx BANK8
	nop
	nop
	nop
	nop
	nop
	nop
	jmp rtnCallReadPattern1

;==========================================================================
;
; drawScore caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 1.
;==========================================================================

	org $4FD3
	rorg $1FD3

	jmp drawScore
rtnDrawScore
	stx BANK3


;==========================================================================
;
; titleScore caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 3.
;==========================================================================

	org $4FE3
	rorg $1FE3

	jmp drawScore
rtnTitleScore
	stx BANK3



;==========================================================================
;
; The cart may start up in this bank.  Make sure it switches
; back to bank 2 on startup.
;
;==========================================================================
	org $4FED
	rorg $1FED

	sta BANK2  ; switch to bank 2 (3 bytes)

	org $4FFC	; Program startup vector
	.word $1FED
	.word $1FED

