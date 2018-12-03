;------------------------------
; Marble Craze bank 5
;------------------------------
; Includes:
;	level control data
;	some game logic
;------------------------------

	org $5000
	rorg $1000



paddleDecode2
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


slopeUpOffset
	byte 6,7,8,9,10,11,12,13,14,15,15,15,15,15,15,15

slopeDownOffset
	byte 0,0,0,0,0,0,0,1,2,3,4,5,6,7,8,9



; MAY READ 1 LEVEL CONTROL BYTE PER CALL
;--------------------------------------------------------------------------
; checkYPosition
;--------------------------------------------------------------------------
; Takes current X position and new proposed Y position and checks
; for falling off, edge of screen, or walls.
;
; (Currently just loops)
; 
; Preload:
; A: position
; Y: velocity
;
; Returns:
; A: position
; Y: velocity
;
;--------------------------------------------------------------------------
checkYPosition
	
	; Transfer velocity from Y to X
	sty temp
	ldx temp

	cmp #2
	beq topReset
	cmp #3
	beq topReset
	cmp #4
	beq topReset
	cmp #5
	beq topReset

	cmp #156
	beq bottomReset
	cmp #155
	beq bottomReset
	cmp #154
	beq bottomReset
	cmp #153
	beq bottomReset
	jmp noResetY

topReset
	lda status
	and #FALL
	bne topStop

	ldy #CTRLNEXTUD	; get next up
	lda (screenL),y
	lsr				; move "Up" nibble into lower nibble
	lsr
	lsr
	lsr	

	;bmi topStop
;	cmp screen
;	beq topStop

	; preserve wall/falling flags
	sta temp2
	lda #%11100000
	and screen
	ora temp2
	
	; Set next screen
	sta screen

	lda #SCREENLOAD
	sta status

	lda #152
	jmp noResetY

topStop
	; set velocity to zero
	ldx #128

	lda #6
	jmp noResetY



bottomReset
	lda status
	and #FALL
	bne bottomStop

	ldy #CTRLNEXTUD		; next down
	lda (screenL),y
	and $0F				; isolate "down" nibble
	
	;bmi bottomStop
;	cmp screen
;	beq bottomStop


	; preserve wall/falling flags
	sta temp2
	lda #%11100000
	and screen
	ora temp2
	
	; Set next screen
	sta screen

	lda #SCREENLOAD
	sta status

	lda #6
	jmp noResetY

bottomStop
	; set velocity to zero
	ldx #128

	lda #152
	jmp noResetY


noResetY

	; move velocity from X to Y
	stx temp
	ldy temp
	
	jmp rtnCheckYPosition


; MAY READ 1 LEVEL CONTROL BYTE PER CALL
;--------------------------------------------------------------------------
; checkXPosition
;--------------------------------------------------------------------------
; Takes current Y position and new proposed X position and checks
; for falling off, edge of screen, or walls.
;
; (Currently just loops)
; 
; Preload:
; A: X position
; Y: X velocity
;
; Returns:
; A: updated X position
; Y: updated X velocity (may stop if hit wall or side)
;
;--------------------------------------------------------------------------
checkXPosition

	sty temp
	ldx temp

	cmp #255
	beq leftReset
	cmp #0
	beq leftReset
	cmp #1
	beq leftReset
	cmp #2
	beq leftReset

	cmp #145
	beq rightReset
	cmp #146
	beq rightReset
	cmp #147
	beq rightReset
	cmp #148
	beq rightReset
	jmp noResetX

leftReset
	lda status
	and #FALL
	bne leftStop

	; Handle bug where walls are on and player
	; should hit wall on left, but ends up
	; on next screen.
	;-------------------------------------
	ldx player
	ldy p1y,x
	lda div13,y
	tay

	lda #%00010001
	and pf0mask,x
	and playField,y
	beq leftStop
	ldx temp
	;-------------------------------------

	ldy #CTRLNEXTLR	; next left
	lda (screenL),y
	lsr				; move "left" into lower nibble
	lsr
	lsr
	lsr
	
	;bmi leftStop
;	cmp screen
;	beq leftStop


	; preserve wall/falling flags
	sta temp2
	lda #%11100000
	and screen
	ora temp2
	
	; set next screen
	sta screen

	lda #SCREENLOAD
	sta status

	; Remove any Y movement since we're jumping screens
	stx temp2
	ldx player
	lda pMarble2+1
	sta p1y,x
	ldx temp2	


	lda #144
	jmp noResetX

leftStop
	ldx #128
	lda #3
	jmp noResetX

rightReset
	lda status
	and #FALL
	bne rightStop

	ldy #CTRLNEXTLR	; next right
	lda (screenL),y
	and #$0F		; isolate "right" nibble

	;bmi rightStop
;	cmp screen
;	beq rightStop


	; preserve wall/falling flags
	sta temp2
	lda #%11100000
	and screen
	ora temp2
	
	; set next screen
	sta screen

	; Remove any Y movement since we're jumping screens
	stx temp2
	ldx player
	lda pMarble2+1
	sta p1y,x
	ldx temp2	

	lda #SCREENLOAD
	sta status

	lda #3
	jmp noResetX

rightStop
	; set velocity to zero
	ldx #128
	lda #144
	
noResetX

	stx temp
	ldy temp

	jmp rtnCheckXPosition


pf0mask
	byte $F0, $0F


collisions
	byte %00010001,0,0,0
	byte %00100010,0,0,0
	byte %01000100,0,0,0
	byte %10001000,0,0,0

	byte 0,%10000000,0,0
	byte 0,%01000000,0,0
	byte 0,%00100000,0,0
	byte 0,%00010000,0,0
	byte 0,%00001000,0,0
	byte 0,%00000100,0,0
	byte 0,%00000010,0,0
	byte 0,%00000001,0,0

	byte 0,0,%00000001,0
	byte 0,0,%00000010,0
	byte 0,0,%00000100,0
	byte 0,0,%00001000,0
	byte 0,0,%00010000,0
	byte 0,0,%00100000,0
	byte 0,0,%01000000,0
	byte 0,0,%01000000,0

	byte 0,0,%01000000,0

div3t4
	byte 0,0,0
	byte 4,4,4,4,4,4,4,4
	byte 8,8,8,8,8,8,8,8
	byte 12,12,12,12,12,12,12,12
	byte 16,16,16,16,16,16,16,16
	byte 20,20,20,20,20,20,20,20
	byte 24,24,24,24,24,24,24,24
	byte 28,28,28,28,28,28,28,28
	byte 32,32,32,32,32,32,32,32
	byte 36,36,36,36,36,36,36,36
	byte 40,40,40,40,40,40,40,40
	byte 44,44,44,44,44,44,44,44
	byte 48,48,48,48,48,48,48,48
	byte 52,52,52,52,52,52,52,52
	byte 56,56,56,56,56,56,56,56
	byte 60,60,60,60,60,60,60,60
	byte 64,64,64,64,64,64,64,64
	byte 68,68,68,68,68,68,68,68
	byte 72,72,72,72,72,72,72,72
	byte 76,76,76,76,76,76,76,76
	byte 80,80,80,80,80,80,80,80

div13
;	byte 12,12,12,12,12,12,12,12,12,12,12,12,12
	byte 11,11,11,11,11,11,11,11,11,11,11,11,11
	byte 10,10,10,10,10,10,10,10,10,10,10,10,10
	byte 9,9,9,9,9,9,9,9,9,9,9,9,9
	byte 8,8,8,8,8,8,8,8,8,8,8,8,8
	byte 7,7,7,7,7,7,7,7,7,7,7,7,7
	byte 6,6,6,6,6,6,6,6,6,6,6,6,6
	byte 5,5,5,5,5,5,5,5,5,5,5,5,5
	byte 4,4,4,4,4,4,4,4,4,4,4,4,4
	byte 3,3,3,3,3,3,3,3,3,3,3,3,3
	byte 2,2,2,2,2,2,2,2,2,2,2,2,2
	byte 1,1,1,1,1,1,1,1,1,1,1,1,1
	byte 0,0,0,0,0,0,0,0,0,0,0,0,0





; HAS TO STAY WITH gameLogic
;--------------------------------------------------------------------------
; Power Up Handlers
;--------------------------------------------------------------------------
handlerArray
	word handle20PTS, handle20PTS, handle50PTS, handle100PTS, handle5SEC, handle10SEC, handle20SEC, handleWALLS
	word handle1UP, handleKEY, handleSTOP, handleZAP, handleLIGHTS, handleWARP, handleRIGHT, handleUP

handleSTOP
	lda #128
	sta p1xVel,x
	sta p1yVel,x
	jmp rtnHandler

handleZAP
	; Zap (Gem) gives you 30 pts
	sed

	lda p1ScoreL,x
	clc
	adc #$30
	sta p1ScoreL,x
	
	lda p1ScoreH,x
	adc #0
	sta p1ScoreH,x

	cld

	txa
	eor #1
	tay
	
	lda p1Status,x
	bne noReload2

	lda #SCREENLOAD
	sta status
noReload2

	lda p1Status,y
	bne noReload3

	lda #SCREENLOAD
	sta p1Status,y
noReload3


	; Getting a ZAP (or Gem) removes it from the other player's board too.
	; flag that power up was "gotten" for the other player too
	ldy #CTRLPWRMASK
	lda (screenL),y
	ora pwrArray1
	sta pwrArray1
	lda (screenL),y
	ora pwrArray2
	sta pwrArray2

;	lda p1Screen
;	eor p2Screen
;	and $0F
;	beq clearPower

	jmp rtnHandler3

clearPower
;	lda #0
;	sta pwr1y
;	sta pwr2y
;	jmp rtnHandler3


handleLIGHTS
	lda colorCheckOffset,x
	tay

	lda #06
	sta playField+60,y
	sta playField+61,y
	sta playField+62,y
	sta playField+63,y
	sta playField+64,y
	sta playField+65,y

	jmp rtnNoSound

handleWARP
	jmp rtnHandler

handleRIGHT
	lda #128
	sta p1yVel,x
	lda #240
	sta p1xVel,x
	jmp rtnHandler

handleUP
	lda #8
	sta p1yVel,x
	lda #128
	sta p1xVel,x
	jmp rtnHandler


handle20PTS
	sed

	lda p1ScoreL,x
	clc
	adc #$20
	sta p1ScoreL,x
	
	lda p1ScoreH,x
	adc #0
	sta p1ScoreH,x

	cld

	jmp rtnHandler


handle50PTS
	sed
	
	lda p1ScoreL,x
	clc
	adc #$50
	sta p1ScoreL,x
	
	lda p1ScoreH,x
	adc #0
	sta p1ScoreH,x

	cld

	jmp rtnHandler


handle100PTS
	sed	

	lda p1ScoreH,x
	clc
	adc #$01
	sta p1ScoreH,x
	
	cld

	jmp rtnHandler


handle5SEC
	sed	

	lda p1TimeH,x
	clc
	adc #$05
	sta p1TimeH,x
	
	cld

	jmp rtnHandler


handle10SEC
	sed	

	lda p1TimeH,x
	clc
	adc #$10
	sta p1TimeH,x
	
	cld

	jmp rtnHandler


handle20SEC
	sed	

	lda p1TimeH,x
	clc
	adc #$20
	sta p1TimeH,x
	
	cld

	jmp rtnHandler


handleWALLS
	lda screen
	ora #%10000000
	sta screen

	jmp rtnHandler


handle1UP
	inc p1Lives,x

	jmp rtnHandler


handleKEY
	lda p1Status,x
	bne noReload

	lda #SCREENLOAD
	sta status
noReload

	jmp rtnHandler


colorCheckOffset
	byte 0,6


; HAS UP TO 4 SCREEN READS.   READS LEVEL DATA, COLORS, and calls CHECKPF
;--------------------------------------------------------------------------
; gameLogic
;--------------------------------------------------------------------------
; Handles general game logic for a player.
; 
; Preload:
; X: Player (0 or 1)
;
;--------------------------------------------------------------------------
gameLogic2

	; Reset timer when in startup mode
	lda status
	cmp #STARTUP
	bne noTimerReset

	; Reset time
	lda temp16H		; read this value in gameLogic (bank 2)
	sta p1TimeH,x
	
	lda #0
	sta p1TimeL,x
	
noTimerReset

	; ----------------------- Check for Finish
	lda p1Status,x
	bne notFinish1

	ldy p1y,x
	lda div13,y
	lsr
	clc
	adc colorCheckOffset,x
	tay
	lda playField+60,y

;	ldy #2

	; Check pf color
	cmp temp16L		; got this value in gameLogic (bank 2)
	bne notFinish1

	lda #FINISHED
	sta status

notFinish1
	
	;---------------------- Check for STARTUP (reset)
	; Check status
	lda status

	cmp #STARTUP
	beq resetPos1
	cmp #RESET
	bne noResetPos1

resetPos1

	; reset position
	ldy #CTRLXPOS
	lda (screenL),y	
	sta p1x,x
	ldy #CTRLYPOS
	lda (screenL),y	
	sta p1y,x

	; reset velocity
	lda #128
	sta p1xVel,x
	sta p1yVel,x


noResetPos1
	
	;------------------------------- Stop when falling
	lda status
	cmp #FALLOFF
	bne checkStatus

	lda #128
	sta p1xVel,x
	sta p1yVel,x

checkStatus
	;------------------------------- Check Status
	lda status
	and #FALL 
	bne clearPaddles

	lda status
	beq doLogic
	
	jmp skipP1

	; No movement when in the air
clearPaddles

	lda #80
	sta padVal1,x
	sta padVal2,x
	

doLogic

	; -------------- Check for powerup collision

	; Check to see if the collision is for this player
	lda frame
	and #1
	cmp player
	bne noCollision

	; See if there's a player/missle1 colision
	lda CXM1P
	and #%11000000
	beq noCollision

	; Call power up handler using indirect jump
	lda p1Lives,x
	and #$F0
	lsr
	lsr
	lsr
	tay
	lda handlerArray,y
	sta pfBuffer
	iny
	lda handlerArray,y
	sta pfBuffer+1


	; jmp to handler
	jmp (pfBuffer)
rtnHandler

	; flag that power up was "gotten"
	ldy #CTRLPWRMASK
	lda (screenL),y
	ora pwrArray1,x
	sta pwrArray1,x

rtnHandler2

	; Stop displaying the power up
	lda #0
	sta pwr1y,x

rtnHandler3

	; Power Up Sound
	lda #4
	sta AUDF0
	lda #15
	sta AUDV0
	lda #4
	sta AUDC0

rtnNoSound

noCollision

	;------------------- Friction

	lda frame
	and #%00011111
	bne noXFriction
	

	ldy padVal1,x
	lda paddleDecode2,y
	cmp #8
	bne noYFriction

	lda p1yVel,x
	cmp #128
	beq noYFriction
	
	clc
	lda #4

	ldy p1yVel,x
	bpl downFriction

	lda #252

downFriction
	adc p1yVel,x
	sta p1yVel,x

noYFriction
	
	ldy padVal2,x
	lda paddleDecode2,y
	cmp #8
	bne noXFriction

	lda p1xVel,x
	cmp #128
	beq noXFriction
	
	clc
	lda #4

	ldy p1xVel,x
	bpl rightFriction

	lda #252

rightFriction
	adc p1xVel,x
	sta p1xVel,x

noXFriction


	; --------------Y coord


	; save y position in temp2
	lda p1y,x
	sta temp2

;	jmp normalY

	; No paddle control when falling
	lda #status
	and #FALL
	beq getYPaddle

	; Center paddle
	lda #8
	jmp endYPaddle

	;----------------------- Check for slope
getYPaddle
	ldy p1y,x
	lda div13,y
	lsr
	clc
	adc colorCheckOffset,x
	tay
	lda playField+60,y

	sec
	sbc pfColor

	cmp #2
	beq slopeUp	
	cmp #4
	beq slopeUp
	cmp #254
	beq slopeDown
	cmp #252
	beq slopeDown

normalY
	; no slope
	ldy padVal1,x
	lda paddleDecode2,y
	jmp endYPaddle

slopeUp
	; Get paddle value from table (0-15)
	ldy padVal1,x
	lda paddleDecode2,y
	tay
	lda slopeUpOffset,y
	jmp endYPaddle

slopeDown
	; Get paddle value from table (0-15)
	ldy padVal1,x
	lda paddleDecode2,y
	tay
	lda slopeDownOffset,y

endYPaddle

	ldy p1yVel,x

	jsr callCalcMovement	; FUNCTION CALL

	jmp checkYPosition	; FUNCTION CALL
rtnCheckYPosition

	ldx player
	sta p1y,x
	sty p1yVel,x

	; --------------X coord

	; If checking the Y axis caused a screenload,
	; then skip the X processing.  Otherwise
	; marble could get stuck in wall
	lda status
	cmp #SCREENLOAD
	beq skipP1

	; Store x position in temp2
	lda p1x,x
	sta temp2

	; No paddle control when falling
	lda #status
	and #FALL
	beq getXPaddle

	; Center paddle
	lda #8
	jmp endXPaddle

getXPaddle
	; Get paddle value from table (0-15)
	ldy padVal2,x
	lda paddleDecode2,y
endXPaddle

	ldy p1xVel,x

	jsr callCalcMovement	; FUNCTION CALL

	jmp checkXPosition	; FUNCTION CALL
rtnCheckXPosition

	ldx player
	sta p1x,x
	sty p1xVel,x


skipP1

	;---------------------- check for time up

	lda status
	cmp #FALLING 
	beq timeCheck

	lda status
	bne noFallOff1

timeCheck

	; Check for time up
	lda p1TimeL,x
	bne noTimeUp
	lda p1TimeH,x
	bne noTimeUp

	lda #140
	sta p1Counter,x

	lda #TIMEUP
	sta status
	
	jmp decLives

noTimeUp
	
	; ------------------------ check fall off

	lda screen
	bpl noWalls

	; Check for wall collision and adjust position/vel
	jmp wallCheck

noWalls

	; Check for fall off
	lda p1x,x
	ldy p1y,x
	
	jsr checkPlayfield	; FUNCTION CALL

	beq fallOff

	lda status
	cmp #FALLING
	bne noSetNormal
	
	lda #NORMAL
	sta status
	
noSetNormal

	; Clear "fall off" bits
	lda #%10011111
	and screen
	sta screen
	jmp noFallOff1

fallOff

	lda status
	cmp #NORMAL
	bne notFalling
	
	lda #FALLING
	sta status
	jmp noFallOff1
	
notFalling

	; Increment "fall off" counter (stored in bit 5&6 of screen)
	lda screen
	clc
	adc #%00100000
	sta screen

	; Check for full fall off
	and #%01100000
	cmp #%01100000
	bne noFallOff1

	; Restore player index
	ldx player

;	lda status
;	bne noFallOff1

	lda #FALLOFF
	sta status
	lda #32
	sta p1Counter,x
	jmp noFallOff1

decLives

	; Decrement lives
	lda p1Lives,x
	sec
	sbc #1
	sta p1Lives,x
	and #$0F
	cmp #$0F

	bne notGameOver

	lda #GAMEOVER
	sta status

	lda #0
	sta p1Lives,x

notGameOver

	lda status
	cmp #TIMEUP
	beq noFallOff1

	lda #64
	sta p1Counter,x

rtnWallCheck
noFallOff1

	ldx player

	; restore status
	lda status
	sta p1Status,x

	; restore screen
	lda screen
	sta p1Screen,x

	jmp rtnGameLogic2




yReset
	byte 5,5,5,5,5,5,5,5
	byte 13,13,13,13,13,13,13,13,13,13,13,13,13
	byte 26,26,26,26,26,26,26,26,26,26,26,26,26
	byte 39,39,39,39,39,39,39,39,39,39,39,39,39
	byte 52,52,52,52,52,52,52,52,52,52,52,52,52
	byte 65,65,65,65,65,65,65,65,65,65,65,65,65
	byte 78,78,78,78,78,78,78,78,78,78,78,78,78
	byte 91,91,91,91,91,91,91,91,91,91,91,91,91
	byte 104,104,104,104,104,104,104,104,104,104,104,104,104
	byte 117,117,117,117,117,117,117,117,117,117,117,117,117
	byte 130,130,130,130,130,130,130,130,130,130,130,130,130
	byte 143,143,143,143,143,143,143,143,143,143,143,143,143
	byte 156,156,156,156,156,156,156,156,156,156,156,156,156	

xReset
	byte 0,0
	byte 4,4,4,4
	byte 8,8,8,8
	byte 12,12,12,12
	byte 16,16,16,16
	byte 20,20,20,20
	byte 24,24,24,24
	byte 28,28,28,28
	byte 32,32,32,32
	byte 36,36,36,36
	byte 40,40,40,40
	byte 44,44,44,44
	byte 48,48,48,48
	byte 52,52,52,52
	byte 56,56,56,56
	byte 60,60,60,60
	byte 64,64,64,64
	byte 68,68,68,68
	byte 72,72,72,72
	byte 76,76,76,76
	byte 80,80,80,80
	byte 84,84,84,84
	byte 88,88,88,88
	byte 92,92,92,92
	byte 96,96,96,96
	byte 100,100,100,100
	byte 104,104,104,104
	byte 108,108,108,108
	byte 112,112,112,112
	byte 116,116,116,116
	byte 120,120,120,120
	byte 124,124,124,124
	byte 128,128,128,128
	byte 132,132,132,132
	byte 136,136,136,136
	byte 140,140,140,140
	byte 144,144,144,144

; ALWAYS READS 3 LEVEL PLAYFIELD BYTES (could be preloaded)
;--------------------------------------------------------------------------
; checkPlayfield
;--------------------------------------------------------------------------
; Determine if marble has fallen off / hit a wall
;
; Preload:
; A: marble x position
; Y: marble y position
; player must be loaded with the player#
;
; Return:
; A: 255 = safe, 0 = fall off
;--------------------------------------------------------------------------
checkPlayfield

	cpx #1
	beq checkPlayer2

	tax

	; Set up Y
	lda div13,y
	tay

	; Set up X
	lda div3t4,x
	tax

	; PF0
	lda collisions,x
	and #$F0
	and playField,y
	bne safe
	inx

	; PF1
	lda collisions,x
	and playField+12,y
	bne safe
	inx

	; PF2
	lda collisions,x
	and playField+24,y
	bne safe

	lda #0
	rts

safe
	
	lda #255
	rts

checkPlayer2

	tax

	; Set up Y
	lda div13,y
	tay

	; Set up X
	lda div3t4,x
	tax

	; PF0
	lda collisions,x
	and #$0F
	and playField,y
	bne safe
	inx

	; PF1
	lda collisions,x
	and playField+36,y
	bne safe
	inx

	; PF2
	lda collisions,x
	and playField+48,y
	bne safe

	lda #0
	rts



; CALLS CHECKPF TWICE, BUT NO SCREEN READS
;--------------------------------------------------------------------------
; wallCheck
;--------------------------------------------------------------------------
; Checks for wall collision and adjust position and velocity
; accordingly.  To be called from gameLogic function.
;--------------------------------------------------------------------------
wallCheck

	;------------------------- Check X axis for wall

	ldx player

	; Load correct X axis
	lda p1x,x

	; But load old Y axis
	ldy pMarble2+1
	
	jsr checkPlayfield	; FUNCTION CALL

	bne noXFallOff

	ldx player

	lda p1Screen,x
	sta screen

	; The reset needs to be
	; adjusted based on the X movement direction
	ldy p1xVel,x
	bpl goingLeft

	; Bounce left
	lda p1xVel,x
	and #%01110000
	lsr
	lsr
	sta temp
	lda #128
	sbc temp
	and #%01111100
	sta p1xVel,x
		

	; Restore old X coordinate
	ldy pMarble2

	; Bias for moving right
	iny

	lda xReset,y

	sec
	sbc #2

	jmp endLeft

goingLeft

	; Bounce right
	lda #128
	sec
	sbc p1xVel,x
	lsr
	lsr
	and #%11111100
	ora #128
	sta p1xVel,x

	; Restore old X coordinate
	ldy pMarble2
	lda xReset,y

	sec
	sbc #1
endLeft

	sta p1x,x

noXFallOff


	;------------------------- Check Y axis for wall

	ldx player

	; Get positions (X is now adjusted if needed)
	lda p1x,x
	ldy p1y,x
	
	jsr checkPlayfield	; FUNCTION CALL

	bne noYFallOff

	ldx player

	; If the Y velocity is in the downward direction,
	; the reset position needs to be biased up
 	; (to avoid being stuck in a wall)
	ldy p1yVel,x
	bpl goingUp

	; Bounce up
	lda p1yVel,x
	and #%01100000
	lsr
	lsr
	sta temp
	lda #128
	sbc temp
	and #%01111100
	sta p1yVel,x
		

	; Restore old Y coordinate using lookup table
	ldy pMarble2+1
	lda yReset,y

	sec
	sbc #1

	sta p1y,x
	
	jmp endUp

goingUp

	; Bounce down
	lda #128
	sec
	sbc p1yVel,x
	lsr
	lsr
	and #%11111100
	ora #128
	sta p1yVel,x

	; Restore old Y coordinate using lookup table
	ldy pMarble2+1
	lda yReset,y

	sta p1y,x

endUp

noYFallOff

	jmp rtnWallCheck




;------------------------------------------------------------------------
; loadScreen2
;------------------------------------------------------------------------
; load the playfield data for player 1 and/or 2 as needed
;
; Preload:
; X: player to process (0 or 1)
;------------------------------------------------------------------------
loadScreen2

	lda p1Status,x
	cmp #INACTIVE
	bne normalDisplay

	;------------------- inactive screen setup

	; Get screen pointer

	lda beat	;;;;;;;;;;;;;;;;;;;;;;;; LEVEL POINTER READ

	lsr
;	lsr
;	lsr
	and #%00000110
	tay
	lda level0,y
	sta screenL
	iny
	lda level0,y
	sta screenH


	lda measure
	asl
	asl
	asl
	asl
	and #%00110000
	sta pfBuffer
	lda pfColor
	and #%11001111
	ora pfBuffer

	cpx #0
	bne rightInactive

	; Copy in colors
	ldy #5
leftLoop5
	sta playField+60,y
	dey
	bpl leftLoop5

	; No animation if B&W switch set
	lda SWCHB
	and #8
	beq clearLeftSide

	; no colors
	ldy #0

	jmp screenCopy

clearLeftSide
	
	; Clear left side PF1 and PF2
	lda #0
	ldy #23
leftClearLoop
	sta playField+12,y
	dey
	bpl leftClearLoop

	; Set to clear PF0 left
	lda #$0F
	sta temp5

	jmp finishClear

rightInactive

	; Copy in colors
	ldy #5
rightLoop5
	sta playField+66,y
	dey
	bpl rightLoop5

	; No animation if B&W switch set
	lda SWCHB
	and #8
	beq clearRightSide

	; no colors
	ldy #0

	jmp screenCopy

clearRightSide
	; Clear right side PF1 and PF2
	lda #0
	ldy #23
rightClearLoop
	sta playField+36,y
	dey
	bpl rightClearLoop

	; Set to clear PF0 right
	lda #$F0
	sta temp5

finishClear
	
	; clear PF0
	ldy #11
finishClearLoop
	lda temp5
	and playField,y
	sta playField,y
	dey
	bpl finishClearLoop


	;******************
	;QUIT FUNCTION HERE
	;******************

	jmp rtnLoadScreen2


	;--------------------- normal screen setup
normalDisplay

	; x y type mask keymask altlevel

	; Never use alternate screen at STARTUP
	lda p1Status,x
	cmp #STARTUP
	beq noAltScreen

	; Check for alternate screen key
	ldy #CTRLPWRTYPE
	lda (pMarble2),y
	cmp #$FF
	beq noAltScreen
	lda pwrArray1,x
	ldy #CTRLALTMASK
	and (pMarble2),y 			;;;;;;;;;;;;;;;;;; CONTROL READ
	cmp #255			; 255=no alt screen
	beq noAltScreen
	cmp (pMarble2),y
	bne noAltScreen	

	; Get alternate screen pointer
	ldy #CTRLALTSCREEN
	lda p1Screen,x
	and #%11100000
	ora (pMarble2),y			;;;;;;;;;;;;;;; CONTROL READ
	
	sta p1Screen,x

	lda #LOADREADY
	sta p1Status,x
	
	;******************
	;QUIT FUNCTION HERE
	;******************

	jmp rtnLoadScreen2

noAltScreen

	; See if power up has got gotten
	ldy #CTRLPWRMASK
	lda pwrArray1,x
	and (pMarble2),y
	bne clearPowerUp

	; Get powerup type
	; The powerup type is stored in the upper 4 bits of the "lives" variables
	ldy #CTRLPWRTYPE
	lda (pMarble2),y
	beq clearPowerUp	; 0=no power up
	cmp #$FF
	beq clearPowerUp
	and #$F0
	sta temp5
	lda p1Lives,x
	and #$0F
	ora temp5
	sta p1Lives,x

	; Get powerup position
	ldy #CTRLPWRX
	lda (pMarble2),y
	sta pwr1x,x
	ldy #CTRLPWRY
	lda (pMarble2),y
	sta pwr1y,x



	jmp endPowerUp

clearPowerUp
	lda #0
	sta pwr1y,x
	lda p1Lives,x
	and #$0F
	sta p1Lives,x

endPowerUp

	; Flag to copy colors
	ldy #1

screenCopy
	;------------------------- Screen Copy


	; Preset Y
	; Y=0=nocolor Y=1=color

	lda p1Status,x
	cmp #INACTIVE
	beq goCall1

	lda level
;	beq goCall3
	cmp #BANK8LEVEL
	beq goCall3
	cmp #LEVELBANKSWITCH
	bmi goCall1

	jmp callScreenLoader2

goCall1

	jmp callScreenLoader1

goCall3
	
	jmp callScreenLoader3

rtnCallScreenLoader1	
rtnCallScreenLoader2
rtnCallScreenLoader3

	;****************
	;QUIT LOAD LEVEL2
	;****************
	
	jmp rtnLoadScreen2




level0
	word lev03, lev00, lev01, lev02





cont11
	byte $F0	; next up
	byte $F2	; next right

	byte 70		; reset x
	byte 145	; reset y

	byte HPWRKEY; powerup type
	byte 255	; key mask

	byte 39		; powerup x
	byte 11		; powerup y
	byte 1		; powerup mask


cont12
	byte $FF	; next up
	byte $13	; next left

	byte 7		; reset x
	byte 55		; reset y

	byte SKIPBOTH		; powerup type


cont13
	byte $F4	; next down
	byte $2F	; next left

	byte 7		; reset x
	byte 55		; reset y

	byte HPWR50PTS	; powerup type
	byte 255	; key mask

	byte 39		; powerup x
	byte 4		; powerup y
	byte 2		; powerup mask


cont14
	byte $3F	; next up
	byte $F6	; next right

	byte 70		; reset x
	byte 10		; reset y

	byte HPWR10SEC	; powerup type
	byte 255	; key mask

	byte 35 		; powerup x
	byte 5 		; powerup y
	byte 32		; powerup mask


cont15
	byte $1F	; next up
	byte $FF	; next left

	byte 70		; reset x
	byte 117	; reset y

	byte HPWR100PTS	; powerup type
	byte 255	; key mask

	byte 20		; powerup x
	byte 7		; powerup y
	byte 8		; powerup mask


cont16
	byte $F7	; next down
	byte $4F	; next left

	byte 70		; reset x
	byte 117	; reset y

	byte SKIPBOTH		; powerup type


cont17
	byte $6F	; next up
	byte $FF	; next left

	byte 120		; reset x
	byte 20		; reset y

	byte SKIPBOTH		; powerup type


cont21
	byte $26	; next up
	byte $0F	; next left

	byte 7		; reset x
	byte 84 	; reset y

	byte 0		; powerup type
	byte 2		; key mask

	byte 0 		; powerup x
	byte 0   	; powerup y
	byte 0		; powerup mask

	byte 5		; alternate screen


	

cont22
	byte $31	; next up
	byte $4F	; next left

	byte 7		; reset x
	byte 84 	; reset y

	byte SKIPBOTH		; powerup type



cont23
	byte $F2	; next down
	byte $FF	; next right

	byte 60		; reset x
	byte 90 	; reset y

	byte HPWRKEY; powerup type
	byte 255	; key mask

	byte 50		; powerup x
	byte 10   	; powerup y
	byte 2		; powerup mask



	
cont24
	byte $FF	; next up
	byte $F2	; next right

	byte 45		; reset x
	byte 84 	; reset y

	byte HPWR20SEC	; powerup type
	byte 255	; key mask

	byte 40		; powerup x
	byte 10   	; powerup y
	byte 4		; powerup mask




cont25
	byte $26		; next up
	byte $0F		; next left

	byte 7		; reset x
	byte 84 	; reset y

	byte SKIPBOTH		; powerup type



cont26
	byte $5F		; next up
	byte $7F		; next left

	byte 80		; reset x
	byte 52 	; reset y

	byte 0		; powerup type
	byte 8		; key mask

	byte 0 		; powerup x
	byte 0   	; powerup y
	byte 0		; powerup mask

	byte 8		; alternate screen


cont27
	byte $F5		; next down
	byte $F6		; next right

	byte 55		; reset x
	byte 100 	; reset y

	byte HPWRKEY; powerup type
	byte 255	; key mask

	byte 30		; powerup x
	byte 11   	; powerup y
	byte 8		; powerup mask



cont28
	byte $5F		; next up
	byte $79		; next left

	byte 80		; reset x
	byte 52 	; reset y

	byte SKIPBOTH		; powerup type


	

cont29
	byte $FF	; next up
	byte $8F	; next left

	byte 7		; reset x
	byte 84 	; reset y

	byte SKIPBOTH		; powerup type


cont43
	byte $94		; next up
	byte $12		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type


cont44
	byte $3F		; next up
	byte $75		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type

cont45
	byte $2F	; next up
	byte $49	; next left

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type

cont46
	byte $F0		; next down
	byte $87		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type

cont47
	byte $F1		; next down
	byte $64		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte HPWRKEY; powerup type
	byte 255	; key mask

	byte 35		; powerup x
	byte 3   	; powerup y
	byte 2		; powerup mask


cont48
	byte $B2		; next up
	byte $96		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type

cont49
	byte $A3		; next up
	byte $58		; next left

	byte 140	; reset x
	byte 80	; reset y

	byte HPWR50PTS	; powerup type
	byte 2		; key mask

	byte 30
	byte 8
	byte 4

	byte 12		; alternate screen

cont4C
	byte $A3		; next up
	byte $58		; next left

	byte 130	; reset x
	byte 80	; reset y

	byte HPWR50PTS	; powerup type
	byte 255	; key mask

	byte 30
	byte 8
	byte 4

cont4A
	byte $F9		; next down
	byte $FB		; next right

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type

cont4B
	byte $F8		; next down
	byte $AF		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type

cont42
	byte $85		; next up
	byte $30		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type

cont41
	byte $7F		; next up
	byte $03		; next left

	byte 130		; reset x
	byte 137	; reset y

	byte SKIPBOTH		; powerup type


cont40
	byte $6F		; next up
	byte $21		; next left

	byte 130	; reset x
	byte 137	; reset y

	byte HPWRWALLS	; powerup type
	byte 255	; key mask

	byte 69		; powerup x
	byte 2	 	; powerup y
	byte 1		; powerup mask


cont10
	byte $1F	; next up
	byte $FF	; next right

	byte 70		; reset x
	byte 112	; reset y

;	byte HPWRWALLS	; powerup type
	byte HPWR20PTS
	byte 1		; key mask

	byte 39		; powerup x
	byte 4		; powerup y
	byte 16		; powerup mask

	byte 5		; alternate screen


cont20
	byte $FF	; next up
	byte $F1	; next left

	byte 18		; reset x
	byte 126	; reset y

	byte HPWRWALLS		; powerup type
	byte 255	; key mask

	byte 11 	; powerup x
	byte 3   	; powerup y
	byte 1		; powerup mask


	include L_CONT.ASM

	include L3_CONT.ASM
	include L5_CONT.ASM
	include L6_CONT.ASM
	include L7_CONT.ASM
	include L8_CONT.ASM
	include L9_CONT.ASM
	include LA_CONT.ASM
	include LB_CONT.ASM
	include LC_CONT.ASM
	include LD_CONT.ASM
	include LE_CONT.ASM
	include LF_CONT.ASM
	include LG_CONT.ASM
	include LI_CONT.ASM
	include LJ_CONT.ASM


;==========================================================================
;
; callScreenLoader3
;
;--------------------------------------------------------------------------
; Call to bank 7
;==========================================================================

	org $5F70
	rorg $1F70

callScreenLoader3
	stx BANK8
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	jmp rtnCallScreenLoader3


;==========================================================================
;
; callCalcMovement
;
;--------------------------------------------------------------------------
; Call to bank 2
;==========================================================================

	org $5FA0
	rorg $5FA0

callCalcMovement
	stx BANK8
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	rts





;==========================================================================
;
; callScreenLoader1
;
;--------------------------------------------------------------------------
; Call to bank 6
;==========================================================================

	org $5FB0
	rorg $5FB0

callScreenLoader1
	stx BANK6
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	jmp rtnCallScreenLoader2


;==========================================================================
;
; callScreenLoader2
;
;--------------------------------------------------------------------------
; Call to bank 7
;==========================================================================

	org $5FC0
	rorg $1FC0

callScreenLoader2
	stx BANK7
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	jmp rtnCallScreenLoader2



;==========================================================================
;
; loadScreen2 caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 2.
;==========================================================================

	org $5FD3
	rorg $1FD3

	jmp loadScreen2
rtnLoadScreen2
	stx BANK2 

;==========================================================================
;
; gameLogic2 caller
;
;--------------------------------------------------------------------------
; call function then switch back to bank 2.
;==========================================================================

	org $5FE3
	rorg $1FE3

	jmp gameLogic2
rtnGameLogic2
	stx BANK2 



;==========================================================================
;
; The cart may start up in this bank.  Make sure it switches
; back to bank 2 on startup.
;
;==========================================================================
	org $5FED
	rorg $1FED

	sta BANK2

	org $5FFC	; Program startup vector
	.word $1FED
	.word $1FED

