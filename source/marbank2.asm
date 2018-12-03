; Marble Craze bank 2
;------------------------------
; Includes:
;
; - VBlank/game logic
;------------------------------


	org $2000
	rorg $1000







			
;==========================================================================
;
; Start of Program
;
;--------------------------------------------------------------------------
; Clear memory, locate character graphics positions and such,
; initialize key memory values, start GameLoop.
;==========================================================================
Start
	sei  	
	 cld  		
	ldx #$FF
	txs  		
	lda #0
clear   
	sta 0,x
	dex
	bne clear	

	; Initialize Variables
	jsr initVar
	



;==========================================================================
;
; GameLoop
;
;==========================================================================
GameLoop


	jmp VSync 	;start vertical retrace
rtnVSync


	lda level
	cmp #255
	beq noGameSelect

	lda SWCHB
	and #2
	beq resetGame


	; ----------------------------------------
	; Reset game when level = 254

	lda level
	cmp #254
	bne noGameSelect

resetGame
	lda #0
	ldx #$78
clrVar
	sta $80,x
	dex
	bpl clrVar

	; Turn off sound
	lda #0
	sta AUDV0
	sta AUDV1

	; Clear pause bits
	lda titleOptions
	and #$0F
	sta titleOptions

	
	lda #255
	sta level

	lda #50
	sta titleBlank
	sta debounce

noGameSelect
	;---------------------------------------



	; if the level is set to 255, the title
	; screen is run.
	lda level
	cmp #255
	bne gameMode


	;------------------------- Play Title Song
	lda titleBlank
	bne rtnSongPlayerT

	jmp songPlayerT
rtnSongPlayerT
	;---------------------------

	jmp titleScreen

gameMode
	jmp VBlank    	; spare time during screen blank
					; uses jmp to avoid extra stack usage
VBlankReturn

	sta CXCLR

	inc frame	

	jmp callKernal	; draw one screen
rtnCallKernal





rtnTitleScreen



	jmp overscan	; do overscan
rtnOverscan

	jmp GameLoop    ;back to top



;==========================================================================
;
; Initialize variables
;
;==========================================================================
initVar

	; Set initialization flag.
	; This stays set until the first frame is drawn.
	lda #$0f	;set text color to white
	sta COLUP0
	sta COLUP1	

	lda #80
	sta padVal1
	sta padVal2
	sta padVal3
	sta padVal4

	lda #128
	sta p1xVel
	sta p1yVel
	sta p2xVel
	sta p2yVel

	lda #120
	sta p2xVel

	lda #STARTUP
	sta p1Status
	sta p2Status

	lda #200
	sta p1Counter
	sta p2Counter

	lda #$25
	sta p2TimeH
	sta p2TimeL

	lda #3
	sta p1Lives
;	sta p2Lives

	lda #255
	sta level

	lda #1
	;sta p1Screen
	;sta p2Screen

	rts


;==========================================================================
;
; VSync
;
;-------------------------------------------------------------------------
; Game timers are elapsed during VSync
;==========================================================================
VSync

	lda #2		;bit 1 needs to be 1 to start retrace
	sta VSYNC	;start retrace
	sta WSYNC 	;wait a few lines




	lda #44		;prepare timer to exit blank period (44)
	sta WSYNC 
	sta TIM64T	;turn it on




	lda #44		;bit 1 needs to be 1 to start retrace
	sta WSYNC 	;wait one more
	sta VSYNC 	;done with retrace, write 0 to bit 1

	jmp rtnVSync





;==========================================================================
;
; VBlank
;
;--------------------------------------------------------------------------
; Handle user input and display setup during the VBLANK period
;==========================================================================
VBlank

	;------------------------- check for Pause
	lda titleOptions
	and #%01000000
	bne endVBlank



	; --------------------- Game logic player 1

	; if at end of level or end of game, skip game logic
	lda level
	and #%11000000
	bne rtnGameLogicA

	; player 1
	ldx #0
	jmp gameLogic
rtnGameLogicA
	;----------------------------------------------



	;-----------------------------------  Load screen data

	; Alternate loading the left and right players to reduce cycles
	lda frame
	and #1
	tax

	jsr loadScreen
	;-------------------------------------


endVBlank

	; ------- Cycle headroom: remove these in release version
;	sta WSYNC
	;---------------------------------------------------------


	jmp VBlankReturn ; use jmps to avoid extra stack usage	





;==========================================================================
;
; incScore
;
;--------------------------------------------------------------------------
; Increase BCD score by one
; 
; preload
; X: player number (0 or 1)
;==========================================================================
incScore

	sed
	
	lda #1
	clc
	adc p1ScoreL,x
	sta p1ScoreL,x
		
	lda #0
	adc p1ScoreH,x
	sta p1ScoreH,x
	
	cld
	
	rts

;==========================================================================
;
; decTime
;
;--------------------------------------------------------------------------
; Elapse 1/10th of a second of time
;
; preload:
; X: number of player (0 or 1)
;==========================================================================
decTime
	
	sed

	; Make sure it's not already at zero
	lda p1TimeL,x
	bne contDecTime2
	lda p1TimeH,x
	bne contDecTime2
	
	cld	

	rts

contDecTime2
	lda p1TimeL,x
	and #$0F
	sec
	sbc #1
	and #$0F
	sta p1TimeL,x

	lda p1TimeH,x
	sbc #0
	sta p1TimeH,x

	cld
	
	rts	; other rts



;==========================================================================
;
; elapseTime
;
;--------------------------------------------------------------------------
; Elapse 1 frame of time
;
; Max cycles = about 52
;
; preload:
; X: number of player (0 or 1)
;==========================================================================
elapseTime
	
	lda p1TimeL,x	;4
	and #$F0		;2
	bne noDecTime	;2

	sed				;2

	lda p1TimeL,x	;4
	and #$0F		;2
	sec				;2
	sbc #1			;2
	and #$0F		;2
	sta p1TimeL,x	;4

	lda p1TimeH,x	;4
	sbc #0			;2

	; If carry is clear then time rolled...
	bcc setTimeZero	;2

	sta p1TimeH,x	;4

endElapseTime

	cld				;2

	lda p1TimeL,x	;4
	ora #%01010000	;2
	sta p1TimeL,x	;4

	rts	; other rts	;5
	
setTimeZero
	cld
	lda #0
	sta p1TimeL,x
	sta p1TimeH,x
	rts

noDecTime

	lda p1TimeL,x
	sec
	sbc #%00010000
	sta p1TimeL,x

	rts







;==========================================================================
;
; Overscan
;
;==========================================================================
overscan

	sta WSYNC	
	lda #33		; Use the timer to make sure overscan takes (34)
	sta TIM64T	; 30 scan lines.  29 scan lines * 76 = 2204 / 64 = 34.4



	; Skip OS processing if in Title Screen mode
	lda level
	cmp #255
	bne doOS

goEndOS
	jmp endOS
doOS

	;-------------------------------------
	; Invert vertical paddle values (1&3)

	sec			;2 -- about 22 cycles max

	lda frame	;3
	and #1		;2
	bne invPad3	;2*

	lda #161	;2
	sbc padVal1	;3
	sta padVal1	;3
	jmp quitInv	;3

invPad3
	lda #161	;2
	sbc padVal3	;3
	sta padVal3	;3

quitInv
	;--------------------------------------


	
	;---------------------------------------- Pause

	; no pause during gameover/end of level
	lda level
	and #%11000000
	bne goNoPause

	lda p1Status
	cmp #LOADREADY
	beq goNoPause
	cmp #SCREENLOAD
	beq goNoPause

	lda p2Status
	cmp #LOADREADY
	beq goNoPause
	cmp #SCREENLOAD
	beq goNoPause

	lda SWCHA
	eor #$FF
	bne pauseButton

	;reset title debounce
	lda titleOptions
	and #%01111111	
	sta titleOptions

	jmp noPauseButton

goNoPause

	; Set debounce bit to avoid some problems
;	lda titleOptions
;	ora #%10000000
;	sta titleOptions

	jmp noPauseButton

pauseButton
	lda titleOptions
	bmi noPauseButton

	;set debounce bit
	ora #%10000000

	; toggle pause bit
	eor #%01000000
	sta titleOptions

	lda #0
	sta AUDV0
	sta AUDV1

noPauseButton

	lda titleOptions
	and #%01000000
	bne goEndOS
	;-----------------------------------------------




	;------------------------ elapse game timer 1
	lda p1Status	;3
	and #NOTIME		;2
	bne noDecTime1	;2

	; Handle Time
	ldx #0			;2
	jsr elapseTime	;5

noDecTime1
	;-------------------------------------------


	;------------------------ elapse game timer 2
	lda p2Status	;3
	and #NOTIME		;2
	bne noDecTime2	;2

	; Handle Time
	ldx #1			;2
	jsr elapseTime	;5

noDecTime2
	;-------------------------------------------



	;---------------------------------------- Play Music
	lda level
	and #%00011111
	cmp #SONG2LEVEL
	bmi playSong2

	jmp callSongB

playSong2
	jmp callSong1
	
rtnCallSong1
rtnCallSongB
	;--------------------------------------------


	;--------------------------------------- Falling Sound Effect
	lda frame
	and #1
	beq noFallSound2

	lda p1Status
	cmp #FALLOFF
	bne noFallSound1

	lda #33
	sbc p1Counter
	lsr
	sta AUDF0
	lda #6
	sta AUDC0
	lda #15
	sta AUDV0

noFallSound1

	lda p2Status
	cmp #FALLOFF
	bne noFallSound2

	lda #33
	sbc p2Counter
	lsr
	sta AUDF1
	lda #6
	sta AUDC1
	lda #15
	sta AUDV1

noFallSound2
	;---------------------------------------


	;---------------------------- Add life every 1000 pts
	lda p1ScoreH
	and #%00010000
	eor titleOptions
	and #%00010000
	beq noExtraLife1

	inc p1Lives

noExtraLife1

	lda p2ScoreH
	and #%00010000
	asl
	eor titleOptions
	and #%00100000
	beq noExtraLife2

	inc p2Lives

noExtraLife2

	; Store the bits of the 1000's place for each player
	; in titleOptions each frame.  

	lda titleOptions
	and #%11001111
	sta titleOptions

	lda p1ScoreH
	and #%00010000
	ora titleOptions
	sta titleOptions

	lda p2ScoreH
	and #%00010000
	asl
	ora titleOptions
	sta titleOptions

	;---------------------------------------------


	

	;----------------------------- Time almost up sound

	; if at end of level or end of game, skip sound
	lda level
	and #%11000000
	bne noTimeSound2

	lda frame
	and #%00000100
	bne noTimeSound2

	lda p1Status
	bne noTimeSound1

	lda p1TimeH
	cmp #$09
	bne noTimeSound1

	lda #8
	sta AUDF0
	lda #1
	sta AUDC0
	lda #15
	sta AUDV0

noTimeSound1

	lda p2Status
	bne noTimeSound2

	lda p2TimeH
	cmp #$09
	bne noTimeSound2

	lda #8
	sta AUDF0
	lda #1
	sta AUDC0
	lda #15
	sta AUDV0

noTimeSound2
	;---------------------------------------




	; --------------- status state machine
	ldx #0
	jsr handleStatus

	ldx #1
	jsr handleStatus
	;------------------------------------



	;------------------- check for end of game
	;jmp endGameCheck
	lda level
	and #%11100000
	bne endGameCheck

	lda p1Status
	and #DONE
	beq endGameCheck
	
	lda p2Status
	and #DONE
	beq endGameCheck

	lda #255
	sta p1Counter
	sta p2Counter

	ldx #0
	jsr endSetup

	ldx #1
	jsr endSetup

	; default to NEXTLEVEL flag
	ldx #NEXTLEVEL

	lda p1Status
	and #NOGAME
	beq setFlag
	
	lda p2Status
	and #NOGAME
	beq setFlag
	
	ldx #ENDGAME

setFlag
	txa
	ora level
	sta level

endGameCheck
	;-------------------------------------



	;----------------------------------handle game/level end flags
	lda p1Counter
	beq nextEndCheck

	jmp endFlags

nextEndCheck
	lda level
	and #ENDGAME
	beq checkEndLevel

	; signal to go back to title screen
	lda #254
	sta level

	; Not doing this causes one extra
	; point to be added to scores at end
	lda #0
	sta pwrArray1
	sta pwrArray2
	
	jmp endFlags

	; check for next level flag
checkEndLevel
	lda level
	and #NEXTLEVEL
	beq gameEnd2

	ldx #0
	jsr nextLevelSetup
	ldx #1
	jsr nextLevelSetup

	; reset flags
	inc level
	lda #%00011111
	and level
	sta level	

	cmp #SONG2LEVEL
	beq songReset
	cmp #SONG3LEVEL
	beq songReset

	jmp noSongReset

songReset
	lda #0
	sta measure

noSongReset

	lda #0
	sta pwrArray1
	sta pwrArray2

	; Check to see if the last level was completed
	lda level
	cmp #LASTLEVEL
	bne notLastLevel

	lda level
	ora #WINGAME
	sta level

	ldx #0

	lda p1Status
	cmp #STARTUP
	bne noP1Win

	ldx #255

noP1Win
	stx pwrArray1

	ldx #0

	lda p2Status
	cmp #STARTUP
	bne noP2Win

	ldx #255

noP2Win
	stx pwrArray2

	lda #INACTIVE
	sta p1Status
	sta p2Status

notLastLevel

	lda #250
	sta p1Counter
	sta p2Counter
	sta pfColor

	jmp endFlags

gameEnd2

	; After finishing all levels, go to game over
	lda level
	and #WINGAME
	beq endFlags

	lda level
	and #%00011111
	ora #ENDGAME
	sta level

	lda #255
	sta p1Counter
	sta p2Counter

endFlags
	;---------------------------------------------------


	;----------------------- score end of level
	lda p1Status
	cmp #ENDLEVEL
	bne notScore1
	ldx #0
	jsr scoreLevel
notScore1

	lda p2Status
	cmp #ENDLEVEL
	bne notScore2
	ldx #1
	jsr scoreLevel
notScore2
	;------------------------------------------



	;------------------------ DEBUGGING reset marble with Game Reset/ WALLS

	; Disable player 1 to test as player 2
;	lda #INACTIVE
;	sta p1Status
	
	; Permanent walls
; 	lda p1Screen
;	ora #%10000000
;	sta p1Screen
;	lda p2Screen
;	ora #%10000000
;	sta p2Screen

	; Infinite Time
;	lda $20
;	sta p1TimeH
;	sta p2TimeH

	; Infinite lives
;	lda p1Lives
;	and #$F0
;	ora #$06
;	sta p1Lives
;	lda p2Lives
;	and #$F0
;	ora #$06
;	sta p2Lives


	; Reset marble with Game Reset switch
;	lda SWCHB
;	and #1
;	bne noGameReset3

;	lda #RESET
;	sta p1Status
;	sta p2Status

noGameReset3
	;-----------------------------------------


	;------------------------ end of game bonus
	lda level
	and #WINGAME
	beq noBonus2

	lda pwrArray1
	beq noBonus1
	ldx #0
	jsr incScore

noBonus1
	lda pwrArray2
	beq noBonus2
	ldx #1
	jsr incScore	

noBonus2
	;-----------------------------------------------



	;-------------------------------- Game Logic Player 2

	; if at end of level or end of game, skip game logic
	lda level
	and #%11000000
	bne rtnGameLogicB

	jsr getLevelPointer

	; player 2
	ldx #1
	jmp gameLogic
rtnGameLogicB

	;-----------------------------------------




endOS	

	;---------------- OS cycle overhead: remove in release version
;	sta WSYNC
;	sta WSYNC
;	sta WSYNC
	;---------------------------------------------------------	

endOSLoop
	lda INTIM	; We finished, but wait for timer
	bne endOSLoop	; by looping till zero
	
	sta WSYNC	; End last scanline

	lda #$82
	sta VBLANK

	jmp rtnOverscan




;==========================================================================
;
; scoreLevel
;
;==========================================================================
scoreLevel


	sed

	; Decrease two 1/10th seconds 
	ldy #2

	;--------------------------
scoreLoop
	; Check that score isn't at zero
	lda p1TimeL,x
	bne point
	lda p1TimeH,x
	bne point

	cld

endScoreLevel
	rts

point
	lda frame
	and #%00000111
	bne noScoreSound

	lda #4
	sta AUDC0
	lda #10
	sta AUDV0
	lda #7
	sta AUDF0

noScoreSound


	; dec time
	lda p1TimeL,x
	sec
	sbc #1
	and #$0F
	sta p1TimeL,x

	lda p1TimeH,x
	sbc #0
	sta p1TimeH,x

	dey
	bne scoreLoop
	;---------------------------

	lda p1ScoreL,x
	clc
	adc #1
	sta p1ScoreL,x

	lda p1ScoreH,x
	adc #0
	sta p1ScoreH,x

	cld

	rts ; other rts


;==========================================================================
;
; nextLevelSetup
;
;==========================================================================
nextLevelSetup
	lda p1Status,x
	cmp #ENDLEVEL
	bne endLevelSetup

	lda #STARTUP
	sta p1Status,x

	lda #0
	sta p1Screen,x
	
	lda #200
	sta p1Counter,x

endLevelSetup
	lda p1Status,x
	cmp #GAMEOVER
	bne doneLevelSetup
	
	lda #INACTIVE
	sta p1Status,x

doneLevelSetup
	rts



;==========================================================================
;
; endSetup
;
;--------------------------------------------------------------------------
; Adjusts status at end of level/game
;==========================================================================
endSetup
	lda p1Status,x
	cmp #FINISHED
	bne checkGameOver

	lda #ENDLEVEL
	sta p1Status,x

	rts

checkGameOver
;	cmp #GAMEOVER
;	bne doneEndSetup
	
;	lda #INACTIVE
;	sta p1Status,x

doneEndSetup
	rts ; multiple rts



;==========================================================================
;
; handleStatus
;
;--------------------------------------------------------------------------
; Status state machine
;
; Preload:
; X: Player number (0 or 1)
;==========================================================================
handleStatus

	lda p1Counter,x
	beq check
	sec
	sbc #1
	sta p1Counter,x
	rts

check
	; skip all this if WINGAME flag set
	lda level
	and #WINGAME
	bne endStatus	


	lda p1Status,x
	beq endStatus

	cmp #FALLOFF
	bne nextCheck

	; Decrement lives
	lda p1Lives,x
	sec
	sbc #1
	sta p1Lives,x
	and #$0F
	cmp #$0F

	bne notFallGameOver

	lda #0
	sta p1Lives,x

	lda #GAMEOVER
	ldy #0
	
	jmp endStatus

notFallGameOver

	lda #64
	sta p1Counter,x


	lda #RESET
	ldy #130
	jmp endStatus

nextCheck
	cmp #RESET
	bne nextCheck2

	lda #FASTFLASH
	ldy #40
	jmp endStatus

nextCheck2
	cmp #STARTUP
	bne nextCheck3

	lda #GETREADY
	ldy #100
	jmp endStatus

nextCheck3
	cmp #GETREADY
	bne nextCheck4
	
	lda #FASTFLASH
	ldy #40
	jmp endStatus

nextCheck4
	cmp #TIMEUP
	bne nextCheck5

	lda #$15
	sta p1TimeH,x

	lda #RESET
	ldy #80
	jmp endStatus

nextCheck5
	cmp #FASTFLASH
	bne nextCheck6

	lda #NORMAL
	ldy #0
	jmp endStatus

nextCheck6
;	cmp #LOADREADY
;	bne endStatus
	
;	lda #NORMAL
;	ldy #0

endStatus
	sta p1Status,x
	tya
	sta p1Counter,x

	rts ; other rts	in function





;==========================================================================
;
; titleScreen
;
;--------------------------------------------------------------------------
; Handles title screen logic and calls 
; title screen kernal
;==========================================================================
titleScreen


	;--------------------- Game Select
	lda SWCHB
	and #2
	beq incOptions

	sta debounceGS
	jmp endGS

incOptions

	lda debounceGS
	beq endGS

	lda #0
	sta debounceGS

	lda titleOptions
	clc
	adc #%00000011
	and #%00001101
	sta titleOptions


endGS

	;--------------------- Paddle Buttons
	lda SWCHA
	bpl button
	asl
	bpl button
	
	lda #0
	sta debounce

	jmp buttonDone

button
	lda debounce
	bne buttonDone

	lda #255
	sta debounce
	
	lda option
	cmp #1
	beq setStartGame

	lda option
	cmp #2
	bne checkPlayers

	; change selected level
	lda titleOptions
	clc
	adc #4
	and #%00001101
	sta titleOptions

checkPlayers
	lda option
	cmp #0
	bne buttonDone

	; change selected players
	lda titleOptions
	clc
	adc #1
	and #%00001101
	sta titleOptions

buttonDone
	
	;-------------------------- Only allow 3 level selections
;	lda titleOptions
;	and #%00001100
;	cmp #%00001100
;	bne noLevelReset

;	lda titleOptions
;	and #%11110011
;	sta titleOptions

noLevelReset
	;---------------------------------



	;---------------------------------
	; Reset game with Reset Switch

	lda SWCHB
	and #1
	bne noGameReset2

setStartGame

	; Blank screen and start game after a short delay
	lda #64
	sta titleBlank
	sta startGame
	sta AUDV0
	sta AUDV1

noGameReset2
	;----------------------------------


	;-----------------check for game startup
	lda startGame
	beq noGameStart
	lda titleBlank
	cmp #1
	bne noGameStart


	ldx #STARTUP
	stx p1Status

	lda titleOptions
	and #1
	bne go2Player
	
	ldx #INACTIVE
go2Player
	stx p2Status


	lda #255
	sta p1Counter
	sta p2Counter

	lda titleOptions
	lsr
	lsr
	tax
	lda startupLevels,x
	sta level
	
	lda #0
	sta p1ScoreL
	sta p1ScoreH
	sta p2ScoreL
	sta p2ScoreH
	sta beat
	sta measure

	;-----------------------------------------------
	; DEBUG start with 999 points to test extra lives
;	lda #$09
;	sta p1ScoreH
;	sta p2ScoreH
;	lda #$99
;	sta p1ScoreL
;	sta p2ScoreL
	;------------------------------------------------

	lda titleOptions
	;set debounce bit
	ora #%10000000
	sta titleOptions

	lda #NUMBEROFLIVES
	sta p1Lives
	sta p2Lives

noGameStart
	;----------------------------------



	; Set option from paddle read
	lda paddle
	sta option



	; Get bounce from beat
	lda beat
	lsr
	lsr
	lsr
	lsr
	lsr
	and #%00000011
	sta temp
	lda beat
	and #%00001111
	asl
	asl
	ora temp
	tay
	lda bounceArray,y
	sta bounce	
	

	; check for title blank
	lda titleBlank
	bne blankScreen

	jmp callDrawTitle
rtnCallDrawTitle

	jmp rtnTitleScreen


startupLevels
	byte STARTLEVA,STARTLEVB,STARTLEVC,STARTLEVD
	
;==========================================================================
;
; blankScreen
;
;--------------------------------------------------------------------------
; Draw Blank Screen
;==========================================================================
blankScreen
	dec titleBlank

pictureLoop2
	lda INTIM	;check timer for end of VBLANK period
	bne pictureLoop2	;loop until it reaches 0

	sta WSYNC
	sta VBLANK  	;end screen blank

	ldx #196
noDraw
	sta WSYNC
	dex
	bne noDraw

	jmp rtnCallDrawTitle




;==========================================================================
;
; getLevelPointer
;
;------------------------------------------------------------------------
; Get pointer to the level data structure
;==========================================================================
getLevelPointer

	; Get level pointer	
	lda level
	and #%00011111
	asl
	tay
	lda levels,y
	sta levelL
	lda levels+1,y
	sta levelH

	rts








;==========================================================================
;
; gameLogic
;
;--------------------------------------------------------------------------
; Handles general game logic for a player.
; 
; Preload:
; X: Player (0 or 1)
;
; temp variables:
; 	screenL/screenH: control pointer
;	pMarble: 		"screen"
; 	pMarble+1: 		"player"
;	temp5: 			"status"
;	temp16L: 		finish color
;	temp16H:		reset time/general temp
;	pMarble2:		old y coord
; 	pMarble2+1:		old x coord
;==========================================================================
gameLogic

	stx player
	
	; move status to general status variable
	lda p1Status,x
	sta status

	; No need for game logic if inactive
	cmp #INACTIVE
	bne continueLogic

	jmp endLogic

continueLogic

	; Save the X and Y coordinates in case
	; the "walls" check needs to override the paddle control
	lda p1x,x
	sta pMarble2
	lda p1y,x
	sta pMarble2+1

	; move screen to general status variable
	lda p1Screen,x
	sta screen

	; Get screen pointer
	
	; remove walls/falling flags
	and #%00011111
	tay
	lda screenPtrOffset,y
	clc
	adc #4
	tay
	lda (levelL),y
	sta screenL
	iny
	lda (levelL),y
	sta screenH

	; get reset time
	ldy #3
	lda (levelL),y
	sta temp16H

	; get finish color
	ldy #2
	lda (levelL),y
	sta temp16L

	jmp callGameLogic2


rtnCallGameLogic2
endLogic

	cpx #1
	beq return2

	jmp rtnGameLogicA

return2
	jmp rtnGameLogicB





 
;==========================================================================
;
; loadScreen
;
;------------------------------------------------------------------------
; load the playfield data for player 1 and/or 2 as needed
;
; Preload:
; X: player to process (0 or 1)
;
; uses these temps:
;   screenL/screenH 	: pointer to pf data
;   temp/temp2			: pointer to color data
;   pMarble2,pMarble2+1	: pointer to control data
;==========================================================================
loadScreen

	lda p1Status,x
	cmp #INACTIVE
	beq goInactive

	; Skip loadScreen if GAMEOVER or NEXTLEVEL flags are set
	lda level
	and #%11000000
	bne noLoad1

	lda p1Status,x
	cmp #LOADREADY
	beq load1
	cmp #RESET
	beq load2
	cmp #STARTUP
	beq load2

	cmp #SCREENLOAD
	bne noLoad1

	lda #LOADREADY
	sta p1Status,x

noLoad1
	rts

	;------------------- inactive screen setup
goInactive
	lda #0
	sta p1TimeL,x
	sta p1TimeH,x
	sta p1Lives,x
	sta pwr1x,x
	sta pwr1y,x
	
	lda #162
	sta p1y,x


	;**************
	; LOAD SCREEN 2
	;**************

	jmp callLoadScreen2


	;--------------------- normal screen setup
load1
	lda #NORMAL
	sta p1Status,x
load2

	; Get screen pointer
	lda p1Screen,x
	
	; Get all the pointers
	and #%00011111
	tay
	lda screenPtrOffset,y
	tay

	; playfield pointer
	lda (levelL),y
	sta screenL
	iny
	lda (levelL),y
	sta screenH
	iny 

	; color pointer
	lda (levelL),y
	sta temp
	iny 
	lda (levelL),y
	sta temp2
	iny 
	
	; control pointer
	lda (levelL),y
	sta pMarble2
	iny 
	lda (levelL),y
	sta pMarble2+1
	iny 

	; Get colors
	ldy #0
	lda (levelL),y			;;;;;;;;;;;;;;; LEVEL SETUP READ
	sta bkColor
	iny
	lda (levelL),y
	sta pfColor
	
	;**************
	; LOAD SCREEN 2
	;**************
	
	jmp callLoadScreen2

rtnCallLoadScreen2
	rts




;==========================================================================
;
; Level Pointers
;
;==========================================================================

screenPtrOffset
	byte 4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106


; Adventure blue maze
level4
	byte $86		; bk color
	byte $08		; pf color
	byte $00		; finish color
	byte $50		; time

	word lev40, col40, cont40
	word lev41, col41, cont41
	word lev42, col42, cont42
	word lev43, col43, cont43
	word lev44, col44, cont44
	word lev45, col45, cont45
	word lev46, col46, cont46
	word lev47, col47, cont47
	word lev48, col48, cont48
	word lev49, col49, cont49
	word lev4A, col4A, cont4A
	word lev4B, col4B, cont4B
	word lev4C, col4C, cont4C

; gray platform/ earthworld
level1
	byte $c4		; bk color
	byte $f1		; pf color
	byte $A3		; finish color
	byte $30		; time

	word lev10, col10, cont10
	word lev11, col11, cont11
	word lev12, col12, cont12
	word lev13, col13, cont13
	word lev14, col14, cont14
	word lev15, col15, cont15
	word lev16, col16, cont16
	word lev17, col17, cont17

; get the keys
level2
	byte $68		; bk color
	byte $00		; pf color
	byte $45		; finish color
	byte $45		; time

	word lev20, col20, cont20
	word lev21, col21, cont21
	word lev22, col22, cont22
	word lev23, col23, cont23
	word lev24, col24, cont24
	word lev25, col25, cont25
	word lev26, col26, cont26
	word lev27, col27, cont27
	word lev28, col28, cont28
	word lev29, col29, cont29


	include L3_PTR.ASM
	include L5_PTR.ASM
	include L6_PTR.ASM
	include L7_PTR.ASM
	include L8_PTR.ASM
	include L9_PTR.ASM
	include LA_PTR.ASM
	include LB_PTR.ASM
	include LC_PTR.ASM
	include LD_PTR.ASM
	include LE_PTR.ASM
	include LF_PTR.ASM
	include LG_PTR.ASM
	include LI_PTR.ASM
	include LJ_PTR.ASM

; level 1 -- earthworld (gray platform)
; level 2 -- get the keys
; level 4 -- blue maze

;	3	; atariage - could not optimize
;	5	; easy does it - could not optimize
;	6	; grand prix - optimized
;	7	; waterworld - moderately optimized
;	8	; no walls - minimal optimization
;	9   ; pinball - moderate optimization

;	A	; golf - optimized
;	B	; airworld
;	C	; xype - optimized
;	D	; major ramps - moderately optimized
;	E   ; minor ramps - optimized
;	F	; fireworld (big red)
;	G	; get the gems
;	I	; haunted house
;	J	; rainbow road

levels
	word level5, level3, level2, level4

	word level8, levelG, levelE, level6, levelA 

	word level1, level9, levelC, levelF, levelI

	word levelD, level7, levelB, levelJ






	include titlesng.asm




	; Output from level generator
	include L_PTR.ASM





bounceArray
	byte 42,35,31,26
	byte 22,19,16,14
	byte 11,9,7,5
	byte 3,2,1,1
	byte 1,1,2,3
	byte 4,6,8,10
	byte 13,15,17,21
	byte 24,28,33,38

	byte 40,35,31,26
	byte 22,19,16,14
	byte 11,9,7,5
	byte 3,2,1,1
	byte 1,1,2,3
	byte 4,6,8,10
	byte 13,15,17,21
	byte 24,28,33,40




;==========================================================================
;
; callSongB
;
;--------------------------------------------------------------------------
; Call to bank 4
;==========================================================================

	org $2F90
	rorg $1F90

callSongB
	stx BANK8
	nop         
	nop         
	nop         
	nop         
	nop         
	nop         
	jmp rtnCallSongB


;==========================================================================
;
; callKernal
;
;--------------------------------------------------------------------------
; Call to bank 3
;==========================================================================

	org $2FA0
	rorg $1FA0

callKernal
	stx BANK3
	nop         
	nop         
	nop         
	nop         
	nop         
	nop         
	jmp rtnCallKernal



;==========================================================================
;
; callSong1
;
;--------------------------------------------------------------------------
; Call to bank 4
;==========================================================================

	org $2FB0
	rorg $1FB0

callSong1
	stx BANK4	
	nop         
	nop         
	nop         
	nop         
	nop         
	nop         
	jmp rtnCallSong1



;==========================================================================
;
; callDrawTitle
;
;--------------------------------------------------------------------------
; Call to bank 3
;==========================================================================

	org $2FC0
	rorg $1FC0

callDrawTitle
	stx BANK3
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	jmp rtnCallDrawTitle



;==========================================================================
;
; callLoadScreen2
;
;--------------------------------------------------------------------------
; Call to bank 5
;==========================================================================

	org $2FD0
	rorg $1FD0

callLoadScreen2
	stx BANK5	
	nop         
	nop         
	nop         
	nop         
	nop         
	nop         
	jmp rtnCallLoadScreen2



;==========================================================================
;
; callGameLogic2
;
;--------------------------------------------------------------------------
; Call to bank 5
;==========================================================================

	org $2FE0
	rorg $1FE0

callGameLogic2
	stx BANK5	
	nop         
	nop         
	nop         
	nop         
	nop         
	nop         
	jmp rtnCallGameLogic2


;==========================================================================
;
; Program Startup Vector
;
;==========================================================================
	org $2FF0  	; The game starts in this bank (2)
	rorg $1FF0				

	jmp Start   ; Start program


	org $2FFC	; Program startup vector
	.word $1FF0
	.word $1FF0

