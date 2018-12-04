;---------------------------------------------------------------------------
; Marble Craze by Paul Slocum
; 2002-2018
;---------------------------------------------------------------------------

;------------------------------
; Marble Craze bank 1
;------------------------------
; Includes:
;
; - Game Kernal
; - Variable Initialization
; - Game Loop Logic
;------------------------------


	processor 6502	
	include vcs.h	


	;--------------------------- TODO
	;
	;--------------------------------

	;------------------------ TODO LATER
	;
	;------------------------------------
	
	;-------------------- SUGGESTIONS:
	;
	; Difficulty switches?
	;
	; Vertical paddle center?
	;
	;------------------------------------

	;-------------------- LEVEL IDEAS
	;
	; Cube level
	; Easier jump level
	; 1234 puzzle level
	; Big open level
	;
	; Combat
	; Dungeon
	; Grand Prix 2
	; Tightrope
	; Warps?
	;-------------------------------------



;---------------------------------------------------------------------------
; Constants
;---------------------------------------------------------------------------

STARTLEVA equ 0
STARTLEVB equ 4
STARTLEVC equ 9
STARTLEVD equ 14

SONG1LEVEL equ 0
SONG2LEVEL equ 6
SONG3LEVEL equ 12

LASTLEVEL equ 18

LEVELBANKSWITCH equ 9
BANK8LEVEL equ 7

KERNAL_DELAY equ 8

TIMECOLOR equ $86
STATUSCOLOR equ $48
INTROCOLOR equ $8A

; Flags in level variable
ENDGAME equ %10000000
NEXTLEVEL equ %01000000
WINGAME equ %00100000

NUMBEROFLIVES equ 6

;---------------------------- status
;Status bits
FALL equ 8
FLASH equ 16
NOGAME equ 32
NOTIME equ 64
DONE equ 128

; Status
RESET 		equ 1 + NOTIME + FLASH
STARTUP 	equ 2 + NOTIME + FLASH
GETREADY 	equ 3 + NOTIME + FLASH
GAMEOVER 	equ 4 + NOTIME + FLASH + DONE + NOGAME
FASTFLASH 	equ 5 + NOTIME + FLASH
TIMEUP 		equ 6 + FLASH
INACTIVE 	equ 7 + NOTIME + DONE + NOGAME + FLASH

NORMAL 		equ 0
FALLOFF		equ 1 + NOTIME 
FINISHED 	equ 2 + NOTIME + DONE
FALLING		equ 3 + NOTIME + FALL
ENDLEVEL 	equ 4 + NOTIME
SCREENLOAD 	equ 5
LOADREADY 	equ 6
;--------------------------------------


;-------------------------- power ups
PWR20PTS equ 	$01
PWR50PTS equ 	$02
PWR100PTS equ 	$03
PWR5SEC equ 	$04
PWR10SEC equ 	$05
PWR20SEC equ 	$06
PWRWALLS equ 	$07
PWR1UP equ 		$08
PWRKEY equ 		$09
PWRSTOP equ		$0A
PWRZAP equ		$0B
PWRLIGHTS equ	$0C
PWRWARP	equ		$0D
PWRRIGHT equ	$0E
PWRUP equ		$0F

HPWR20PTS equ 	$10
HPWR50PTS equ 	$20
HPWR100PTS equ 	$30
HPWR5SEC equ 	$40
HPWR10SEC equ 	$50
HPWR20SEC equ 	$60
HPWRWALLS equ 	$70
HPWR1UP equ 	$80
HPWRKEY equ 	$90
HPWRSTOP equ	$A0
HPWRZAP equ		$B0
HPWRLIGHTS equ	$C0
HPWRWARP equ	$D0
HPWRRIGHT equ	$E0
HPWRUP	equ		$F0

SKIPBOTH equ	$FF
;-------------------------------------


;-------------------------- control structure offsets
CTRLNEXTUD equ 0
;CTRLNEXTDOWN equ 1
CTRLNEXTLR equ 1
;CTRLNEXTRIGHT equ 3

CTRLXPOS equ 2
CTRLYPOS equ 3

CTRLPWRTYPE equ 4
CTRLALTMASK equ 5

CTRLPWRX equ 6
CTRLPWRY equ 7
CTRLPWRMASK equ 8

CTRLALTSCREEN equ 9
;------------------------------------




; Bankswitching
; 16K
;BANK1 equ $1FF6
;BANK2 equ $1FF7
;BANK3 equ $1FF8
;BANK4 equ $1FF9

; 32K
BANK1 equ $1FF4
BANK2 equ $1FF5
BANK3 equ $1FF6
BANK4 equ $1FF7

BANK5 equ $1FF8
BANK6 equ $1FF9
BANK7 equ $1FFA
BANK8 equ $1FFB


;---------------------------------------------------------------------------
; RAM Variables 
;---------------------------------------------------------------------------

playField equ $80 			; 72 bytes (12 lines * 5) + 12 color bytes

;--------------- playField array layout
; 
; 0-11  [4-7]=PF0 left [0-3]=PF0 right
; 12-23 PF1 left
; 24-35 PF2 left
; 36-47 PF1 right
; 48-59 PF2 right
; 60-65 PFCOLOR left
; 66-71 PFCOLOR right
;
;------------------------------


; Variables for title screen only
option equ $80
paddle equ $81
debounce equ $84
bounce equ $85
titleBlank equ $86
startGame equ $87
debounceGS equ $88

;------------------------------------ 8 bytes 
; 16 bit temp (overlaps with pfBuffer)
temp16L equ $C8
temp16H equ $C9

levelL equ $CA	; temp level pointer (during game logic)
levelH equ $CB

screenL equ $CC	; temp screen pointer (during game logic)
screenH equ $CD

temp equ $CE 	; two more temps (for game logic)
temp2 equ $CF

;------
pfBuffer equ $C8	; 8 bytes
;------------------------------------

pMarble equ $D0; 2 bytes
pMarble2 equ $D2; 2 bytes
pfColor equ $D4

frame equ $D5

p1x equ $D6
p2x equ $D7

p1y equ $D8
p2y equ $D9

p1xVel equ $DA
p2xVel equ $DB

p1yVel equ $DC
p2yVel equ $DD

pwr1x equ $DE
pwr2x equ $DF

pwr1y equ $E0
pwr2y equ $E1

padVal1 equ $E2
padVal3 equ $E3

padVal2 equ $E4
padVal4 equ $E5 ; 102 bytes total

level equ $E6

p1Screen equ $E7	; bit 7 = WALLS flag, bit 6 & 5 = falling count
p2Screen equ $E8	; ""

p1Status equ $E9
p2Status equ $EA

p1Counter equ $EB
p2Counter equ $EC

p1TimeL equ $ED
p2TimeL equ $EE

p1TimeH equ $EF
p2TimeH equ $F0

temp5 equ $F1

p1Lives equ $F2		; High 4 bits store power up type
p2Lives equ $F3		; High 4 bits store power up type

bkColor equ $F4

pwrArray1 equ $F5
pwrArray2 equ $F6

beat equ $F7
measure equ $F8

p1ScoreL equ $F9
p2ScoreL equ $FA

p1ScoreH equ $FB
p2ScoreH equ $FC

titleOptions equ $FD ; bits 6&7 pause, bits 4&5 extra lives via score

; 126 bytes total (added titleOptions)

;-------------------------------------------------
; Temporary Game Logic Variables
;-------------------------------------------------
screen equ pMarble
player equ pMarble+1

status equ temp5

;--------------------------------------------------







; These two temp variables are in the stack area,
; and are only used during the kernal where
; the stack is not used.
temp3 equ $FE
temp4 equ $FF















;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
	org $1000
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

marbleData2
; Marble Shape 1A SOLID
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00111100
	byte #%01111110
	byte #%01111110
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%01111110
	byte #%01111110
	byte #%00111100


	align 256
marbleData3
; Marble Shape 1B SOLID
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00111100
	byte #%01111110
	byte #%01111110
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111101
	byte #%11111101
	byte #%01111010
	byte #%01100110
	byte #%00111100		; total = 99 bytes

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	align 256
; Marble Shape 2A BOTTOM HIGHLIGHT
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00111100
	byte #%01111110
	byte #%01111110
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111101
	byte #%11111101
	byte #%01111010
	byte #%01100110
	byte #%00111100


	align 256
; Marble Shape 2B BOTTOM HIGHLIGHT

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00111100
	byte #%01111110
	byte #%01111110
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111101
	byte #%11111101
	byte #%01111010
	byte #%01100110
	byte #%00111100		; total = 99 bytes

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	align 256
; Marble Shape 3A TOP HIGHLIGHT
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00111100
	byte #%01100110
	byte #%01011110
	byte #%10111111
	byte #%10111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%01111110
	byte #%01111110
	byte #%00111100


	align 256
; Marble Shape 3B TOP HIGHLIGHT
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00111100
	byte #%01100110
	byte #%01011110
	byte #%10111111
	byte #%10111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%11111111
	byte #%01111110
	byte #%01111110
	byte #%00111100		; total = 99 bytes

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	align 256
; Marble Shape 4A SMALL
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00000000
	byte #%00111100
	byte #%00111100
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%00111100
	byte #%00111100
	byte #%00000000


	align 256
; Marble Shape 4B SMALL

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%00000000
	byte #%00111100
	byte #%00111100
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%01111110
	byte #%00111100
	byte #%00111100
	byte #%00000000		; total = 99 bytes

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	align 256
; Marble Shape 5A SMALLER
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%10000001
	byte #%01000010
	byte #%01000010
	byte #%00000000
	byte #%00000000
	byte #%00011000
	byte #%00011000
	byte #%00000000
	byte #%00000000
	byte #%01000010
	byte #%01000010
	byte #%10000001


	align 256
; Marble Shape 5B SMALLER
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0

	byte #%10000001
	byte #%01000010
	byte #%01000010
	byte #%00000000
	byte #%00000000
	byte #%00011000
	byte #%00011000
	byte #%00000000
	byte #%00000000
	byte #%01000010
	byte #%01000010
	byte #%10000001

	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0
	byte 0,0,0,0,0,0,0,0

	align 256

	; Playfield Reference
	;
	; pfBuffer
	; 0 = PF0.1
	; 1 = PF1.1
	; 2 = PF2.1
	; 3 = PF0.2
	; 4 = PF1.2
	; 5 = PF2.2
	; 6 = PFCOLOR1
	; 7 = PFCOLOR2
	;
	;  0  Hblank  22 PF0 28   PF1   38   PF2   48 PF0 56   PF1   66   PF2   76
	;  |----22----||--6--||---10----||---10----||--6--||---10----||---10----||
	;               4---7  7-------0  0-------7  4---7  7-------0  0-------7


;==========================================================================
;
; mainKernal
;
;--------------------------------------------------------------------------
; draw game area
;==========================================================================
mainKernal

	; Alternate the two kernals every frame
	lda frame
	and #%00000001
	beq kernalA
;	nop

	jmp kernalB	

;==========================================================================
;
; KERNAL A
;
;==========================================================================
kernalA

	nop
	nop
	nop
	nop
	lda temp
	lda temp ; waste 3 cycles

	; PreLoad the next right-playfield color
	lda playField+71
	sta pfBuffer+7

	; preload temp2 value (x/2)
	lda #6
	sta temp4


	; number of blocks
	ldx #12			;2 = 18

	; Use Y to track the actual line
	ldy #156		;2 20

scanLoop2

	txs					;2  waste cycles

	lda playField-1,x	;4

	; 1A) setup
	;---------------------------------------

	sta PF0				;3
	sta pfBuffer		;3
	lda (pMarble),y		;5*
	sta GRP0			;3
	lda playField+11,x	;4
	sta PF1				;3
	lda playField+23,x	;4
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	lda pfBuffer		;3
	asl					;2
	asl					;2
	asl					;2
	asl					;2
	sta PF0				;3
	sta pfBuffer+3		;3

	lda playField+35,x	;4
	sta PF1				;3
	lda playField+47,x	;4
	sta PF2				;3
;	sta pfBuffer+5		;3

	dey					;2
	lda (pMarble),y		;5*
	
	; 2A) colors
	;---------------------------------------
	sta GRP0			;3

	lda pfBuffer		;3
	sta PF0				;3

	ldx temp4			;3
	lda playField+59,x	;4
	sta COLUPF			;3
	sta pfBuffer+6		;3 
	tsx					;2

	lda playField+11,x	;4
	sta PF1				;3
	lda playField+23,x	;4
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda playField+35,x	;4
	sta PF1				;3

	lda pfBuffer+7		;3
	sta.w COLUPF			;3

;	lda pfBuffer+5		;3
	lda playField+47,x	;4
	sta PF2				;3
	sta pfBuffer+5		;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3

	; 3A) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3
	lda pfColor			;3
	sta COLUPF			;3

	lda playField+11,x	;4
	sta PF1				;3
	sta pfBuffer+1		;3

	lda playField+23,x	;4
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3
	
;	nop

	lda pfBuffer+3		;3
	sta PF0				;3

	lda playField+35,x	;4
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3

	lda INPT0			;3
	bmi paddles1		;2 or 3
	sty padVal1			;3
paddles1

	lda pfBuffer		;3
	sta PF0				;3

	sta WSYNC			;3

	; 4A) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	lda pfBuffer+1		;3
	sta PF1				;3

	lda playField+23,x	;4
	sta PF2				;3
	sta pfBuffer+2		;3

	lda (pMarble2),y	;5*
	sta GRP1			;3
	

	lda pfBuffer+3		;3
	sta PF0				;3

	lda playField+35,x	;4
	sta PF1				;3

	lda pfBuffer+7		;3
	sta COLUPF			;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2

	lda (pMarble),y		;5*
	sta GRP0			;3

	lda pfBuffer		;3
	sta PF0				;3

	; 5A) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3

	lda pfColor			;3
	sta COLUPF			;3

	lda pfBuffer+1		;3
	sta PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda playField+35,x	;4
	sta PF1				;3
	sta pfBuffer+4		;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3
	lda pfBuffer		;3
	sta PF0				;3
	
	lda INPT1			;3
	bmi paddles2		;2 or 3
	sty padVal2			;3
paddles2

	sta WSYNC			;3

	; 6A) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	txs
	ldx pfBuffer+1		;3
	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	dey					;2
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta.w PF1				;3

	lda pfBuffer+7		;3
	sta COLUPF			;3

	lda pfBuffer+5		;3
	sta PF2				;3


	lda (pMarble),y		;5*
	sta GRP0			;3

	lda pfBuffer		;3
	sta PF0				;3

	; 7A) more setup
	;---------------------------------------

	lda pfColor			;3
	stx PF1				;3
	sta COLUPF			;3

	; Draw the power up (using missile 1)
	tsx					;2
	txa					;2
	ldx #ENABL			;2
	txs					;2

	cmp temp3			;3
	php					;3
	cmp pwr1y			;2
	php					;3
	tax					;2

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	lda pfBuffer+3		;3
	sta PF0				;3


	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3
	
;	nop					;2
;	lda temp

;	cpx #7
;	beq loopIn
	
;	stx ENABL	
loopIn


	txs					;2

	lda pfBuffer		;3

	sta WSYNC


	sta PF0				;3
	ldx pfBuffer+1		;3

	; 8A) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	dey					;2
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3


	lda pfBuffer+7		;3
	sta COLUPF			;3

	lda pfBuffer+5		;3
	sta PF2				;3

	lda (pMarble),y		;5*
	sta GRP0			;3

	lda pfBuffer		;3
	sta PF0				;3

	; 9A) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3

	lda pfColor			;3
	sta COLUPF			;3

	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3


	cpy temp5			;3      Check for message display
	bne noMessageDisplay;2* 	display message
	
	jmp messageDisplay	;3

noMessageDisplay

	nop					;2

	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3
	lda pfBuffer		;3
	sta PF0				;3
	
	lda INPT0			;3
	bmi paddles3		;2 or 3
	sty padVal1			;3
paddles3

	sta WSYNC			;3


	; 10A) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	stx PF1				;3

	lda #0				;2
	sta ENAM1			;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	dey					;2

	lda pfBuffer+7		;3
	sta.w COLUPF			;3

	lda pfBuffer+5		;3
	sta PF2				;3

	lda (pMarble),y		;5*
	sta GRP0			;3

	lda pfBuffer		;3
	sta PF0				;3

	; 11A) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3

	lda pfColor			;3
	sta COLUPF			;3

	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	; This gets X out of the stack register,
	; divides it by two and stores it for use
	; with the color shading.
	tsx					;2
	txa					;2
	lsr					;2
	sta temp4			;3

	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3
	lda pfBuffer		;3
	sta PF0				;3

	lda INPT1			;3
	bmi paddles4		;2 or 3
	sty padVal2			;3
paddles4

	sta WSYNC

	; 12A) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	lda pfBuffer+1		;3
	sta PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	; Grab that color pointer
	ldx temp4
	dey					;2
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+7		;3
	sta COLUPF			;3

	lda pfBuffer+5		;3
	sta PF2				;3

	lda (pMarble),y		;5*
	sta GRP0			;3

	lda pfBuffer		;3
	sta PF0				;3

	; 13A) setup for loop
	;---------------------------------------


	lda pfBuffer+1		;3
	sta PF1				;3

	lda pfColor			;3
	sta COLUPF			;3
	;nop

	; Load the next right-playfield color
	lda playField+65,x	;4 66 
	sta pfBuffer+7		;3 

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	tsx					;2
	dey					;2

	lda pfBuffer+3		;3
	sta PF0				;3
	lda pfBuffer+4		;3
	sta PF1				;3
	lda pfBuffer+5		;3
	sta PF2				;3


    dex					;2
    beq quitScanLoop2   ;2
	jmp scanLoop2		;3 must be 70

	;******************* End Of Kernal A *******************


paddlesOut1
;   	jmp  paddlesIn1

;==========================================================================
;
; KERNAL CLEAN UP
;
;==========================================================================
quitScanLoop2

	;--------------------------- Finish up the Kernal
	sta WSYNC

	; Draw the white line at the bottom
	lda #$0F
	sta COLUPF
	lda #255
	sta PF0
	sta PF1
	sta PF2

endOfScreen
	
	; One more scanline
	sta WSYNC
	lda #0
	sta COLUBK
	sta PF0
	sta ENABL
	sta ENAM0
	sta PF1
	sta PF2
	sta COLUP0
	sta COLUP1

	; restore stack
	ldx #255
	txs
	;-------------------------------------------------

    jmp rtnMainKernal



;==========================================================================
;
; messageDisplay
;
;--------------------------------------------------------------------------
; Displays text in middle of game screen
;==========================================================================
messageDisplay

	; Finish current line (cuts in a 9th scanline in loop)
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;4
	sta PF2				;3

	lda frame
	and #1
	beq padFrame01

	lda INPT2
	bmi paddles13		;2 or 3
	sty padVal3			;3

	jmp paddles13

padFrame01
	lda INPT0			;3
	bmi paddles13		;2 or 3
	sty padVal1			;3

paddles13

	sta WSYNC

	; call function to display text in bank 3
	jmp callIntroMessage
rtnCallIntroMessage
		
	; Figure out whether to return to Kernal A or Kernal B
	lda frame
	and #1

	beq reEnterLoop2


	ldx #2	;2
messageLoop1
	dex		;2
	bne messageLoop1	;2*

;	nop
;	nop

	tsx	

	jmp scanLoop3



reEnterLoop2

	ldx #1		;2
messageLoop2	
	dex			;2
	bne messageLoop2	;2*
	
;	nop
;	nop
	nop

	tsx	

	jmp scanLoop2






;==========================================================================
;
; KERNAL B
;
;==========================================================================
kernalB

	; PreLoad the next right-playfield color
	lda playField+71
	sta pfBuffer+7

	; PreLoad the next left-playfield color
	lda playField+59+6;
	sta pfBuffer+6


	; Set starting paddle counter values
	lda #161
	sta padVal3
	sta.w padVal4

	; number of blocks
	ldx #12			;2 = 18

	; Use Y to track the actual line
	ldy #156		;2 20


scanLoop3
	lda pfColor
;	sta COLUPF

	lda playField-1,x	;4

	; 1B) setup
	;---------------------------------------

	sta PF0				;3
	sta pfBuffer		;3
	lda (pMarble),y		;5*
	sta GRP0			;3
	lda playField+11,x	;4
	sta PF1				;3
	lda playField+23,x	;4
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	lda pfBuffer		;3
	asl					;2
	asl					;2
	asl					;2
	asl					;2
	sta PF0				;3
	sta pfBuffer+3		;3

	lda playField+35,x	;4
	sta PF1				;3
	lda playField+47,x	;4
	sta PF2				;3
	sta pfBuffer+5		;3
	dey				;2

	lda (pMarble),y		;5*
	sta GRP0			;3


	; 2B) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3

	lda playField+11,x	;4
	sta PF1				;3
	sta pfBuffer+1		;3

	lda playField+23,x	;4
	sta PF2				;3
	sta pfBuffer+2		;3

	lda (pMarble2),y	;5*
	sta GRP1			;3
	
	dey					;2

	lda pfBuffer+3		;3
	sta PF0				;3

	lda playField+35,x	;4
	sta PF1				;3
	sta pfBuffer+4		;3

	lda pfBuffer+5		;4
	sta PF2				;3

	lda (pMarble),y		;5*
	sta GRP0			;3

	lda INPT2			;3
	bmi paddles5		;2 or 3
	sty padVal3			;3
paddles5

	lda pfBuffer		;3
	sta PF0				;3

	sta WSYNC


	
	; 3B) colors
	;---------------------------------------

	lda pfBuffer+6		;4 66 
	sta COLUPF			;3
	nop
	nop

	lda pfBuffer+1		;3
	sta PF1				;3
	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3
	
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3


	lda pfBuffer+7		;3
	sta.w COLUPF			;3

	nop	



	lda pfBuffer+5		;4
	sta PF2				;3


	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3


	; 4B) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3

	lda pfColor			;3
	sta COLUPF			;3

	lda pfBuffer+1		;3
	sta PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	dey					;2
	nop
	nop
	nop
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;4
	sta PF2				;3

	lda (pMarble),y		;5*
	sta GRP0			;3
	lda pfBuffer		;3
	sta PF0				;3
	
	lda INPT3			;3
	bmi paddles6		;2 or 3
	sty padVal4			;3
paddles6

	sta WSYNC

	; 5B) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	lda pfBuffer+1		;3
	sta PF1				;3

	lda playField+23,x	;4
	sta PF2				;3
	sta pfBuffer+2		;3

	lda (pMarble2),y	;5*
	sta GRP1			;3


	lda pfBuffer+3		;3
	sta PF0				;3

	lda playField+35,x	;4
	sta PF1				;3

	lda pfBuffer+7		;3
	sta COLUPF			;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2

	lda (pMarble),y		;5*
	sta GRP0			;3

	lda pfBuffer		;3
	sta PF0				;3


	; 6B) more setup
	;---------------------------------------

	lda pfColor			;3
	sta COLUPF			;3

	lda pfBuffer+1		;3
	sta PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	; Draw the power up (using missile 1)
	txa					;2
	ldx #ENABL			;2
	txs					;2
	cmp temp3			;3
	php					;3
	cmp pwr2y			;3
	php					;3


	ldx pfBuffer+3		;3
	stx PF0				;3

	tax					;2

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3
	

	lda pfBuffer		;3
	sta PF0				;3
	nop					;2


	; 7B) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	txs					;2
	ldx pfBuffer+1		;3
	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	dey					;2

	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+7		;3
	sta COLUPF			;3

	nop

	lda pfBuffer+5		;3
	sta PF2				;3


	lda (pMarble),y		;5*
	sta GRP0			;3


	; 8B) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3

	lda pfColor			;3
	sta COLUPF			;3

	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	nop					;8
	nop
	nop
	nop
	nop
	nop
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3
	lda pfBuffer		;3
	sta PF0				;3
	
	lda INPT2			;3
	bmi paddles7		;2 or 3
	sty padVal3			;3
paddles7

	sta WSYNC



	; 9B) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	cpy temp5
	bne noMessage2

	jmp messageDisplay

noMessage2

	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+7		;3
	ldx #0				;2
	sta COLUPF			;3

	stx ENAM1			;3

	dey					;2

	lda pfBuffer+5		;3
	sta PF2				;3
	
	lda (pMarble),y		;5*
	sta GRP0			;3


	; 10B) paddles
	;---------------------------------------

	lda pfBuffer		;3
	sta PF0				;3

	lda pfColor			;3
	sta COLUPF			;3

	ldx pfBuffer+1		;3
	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	lda temp3  			; waste 3 cycles
;	nop					;2
	nop					;2
	nop					;2
	dey					;2

	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	lda (pMarble),y		;5*
	sta GRP0			;3
	lda pfBuffer		;3
	sta PF0				;3
	
	lda INPT3			;3
	bmi paddles8		;2 or 3
	sty padVal4			;3
paddles8

	sta WSYNC


	; 11B) colors
	;---------------------------------------

	lda pfBuffer+6		;3
	sta COLUPF			;3

	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	nop
	nop					;8
	nop
	dey					;2
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+7		;3
	sta COLUPF			;3


	lda pfBuffer+5		;3
	sta PF2				;3

	lda (pMarble),y		;5*
	sta GRP0			;3

	nop
	nop

	lda pfBuffer		;3
	sta PF0				;3


	; 12B) nothing
	;---------------------------------------

	lda pfColor			;3
	sta COLUPF			;3

	stx PF1				;3

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3

	; This gets X out of the stack register,
	; divides it by two and stores it for use
	; with the color shading.
	tsx					;2
	txa					;2
	lsr					;2
	nop					;2
	tax					;2
	lda playField+59,x	;4
	sta pfBuffer+6		;3
	
	lda pfBuffer+3		;3
	sta PF0				;3

	lda pfBuffer+4		;3
	sta PF1				;3

	lda pfBuffer+5		;3
	sta PF2				;3

	dey					;2
	lda (pMarble),y		;5*
	sta GRP0			;3

	nop					;2

	lda pfBuffer		;3
	sta PF0				;3

	; 13B) setup for loop
	;---------------------------------------


	lda pfBuffer+1		;3
	sta PF1				;3

	; Load the next right-playfield color
	lda playField+65,x	;4
	sta pfBuffer+7		;3 
	tsx					;2

	lda pfBuffer+2		;3
	sta PF2				;3

	lda (pMarble2),y	;5*
	sta GRP1			;3
	
	nop					;2
	dey					;2

	lda pfBuffer+3		;3
	sta PF0				;3
	lda pfBuffer+4		;3
	sta PF1				;3
	lda pfBuffer+5		;3
	sta PF2				;3


    dex					;2
    beq quitScanLoop3   ;2
	jmp scanLoop3		;3 must be 70

quitScanLoop3
	sta WSYNC

	lda #$0F
	sta COLUPF
	lda #255
	sta PF0
	sta PF1
	sta PF2
	
	jmp endOfScreen

	; ******************* End of Kernal B ******************




;==========================================================================
;
; Version Number
;
;==========================================================================
	org $1FA0
	byte 0,9,7


;==========================================================================
;
; mainKernal caller
;
;--------------------------------------------------------------------------
; This function is called from bank 3, but returns to bank 2
;==========================================================================

	org $1FA3

	jmp mainKernal
rtnMainKernal
	stx BANK2


;==========================================================================
;
; callIntroMessage
;
;--------------------------------------------------------------------------
; Call to bank 3
;==========================================================================

	org $1FB0

callIntroMessage
	stx BANK3
	nop      
	nop      
	nop      
	nop      
	nop      
	nop      
	jmp rtnCallIntroMessage





;==========================================================================
;
; The cart may start up in this bank.  Make sure it switches
; back to bank 2 on startup.
;
;==========================================================================
	org $1FED

	sta BANK2

	org $1FFC	; Program startup vector
	.word $1FED
	.word $1FED

;==========================================================================
;
; Include Source for banks 2-8
;
;==========================================================================
	include mcbank2.asm
	include mcbank3.asm
	include mcbank4.asm

	include mcbank5.asm
	include mcbank6.asm
	include mcbank7.asm
	include mcbank8.asm
