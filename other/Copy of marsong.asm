; Song Data
; ----------------------------------------------------------
; song1 and song2 are lists of patterns to be played
; out of the patternArray.
; They are played simlutaneously using the two oscillators

	; drums
song1

	; intro beat
;	byte 8, 8, 8, 10
;	byte 8, 8, 8, 10

	; intro arp
;	byte 2,2,4,4
;	byte 2,2,4,4

	; add drums
;	byte 8, 8, 8, 10
;	byte 8, 8, 8, 10

	; add melody
;	byte 12, 12, 12, 10
;	byte 12, 12, 12, 10
;	byte 12, 12, 12, 10
;	byte 12, 12, 12, 10

	; thicker arp
;	byte 2,2,4,4
;	byte 20,20,22,22

;	byte 24,24,26,26
;	byte 24,24,26,26

	byte 0,0,0,0
	byte 0,0,0,0
	
	; 16th drums
	byte 14, 14, 14, 14
	byte 14, 14, 14, 14
	byte 14, 14, 14, 14
	byte 14, 14, 14, 14
	
	; break down
	byte 14, 14, 14, 14
	byte 14, 14, 14, 14
	byte 14, 14, 14, 14
	byte 14, 14, 14, 14

	; just drums
	byte 14, 14, 14, 14
	byte 14, 14, 14, 0
	byte 255


	; arp
song2

	; intro beat
;	byte 0,0,0,0
;	byte 0,0,0,0

	; intro arp
;	byte 2,2,4,4
;	byte 2,2,4,4

	; add drums
;	byte 2,2,4,4
;	byte 2,2,4,4

	; add melody
;	byte 2,2,4,4
;	byte 2,2,4,4
;	byte 6,6,4,4
;	byte 6,6,4,0

	; thicker arp
;	byte 20,20,22,22
;	byte 20,20,22,22

	byte 6,6,16,16
	byte 6,6,16,16

	; 16th beat
	byte 20,20,22,22
	byte 20,20,22,22
	byte 6,6,22,22
	byte 6,6,22,22

	; break down
	byte 12,12,12,10
	byte 12,12,12,10
	byte 18,18,18,10
	byte 18,18,18,10

	; just drums
	byte 8,8,8,10
	byte 8,8,8,10

	byte 255

patternArray
	word patternMute, music1; 0  2
	word music2, music3		; 4  6
	word beat1, beat2		; 8 10
	word beat3, beat4		;12 14
	word music4, beat5		;16 18
	word music5, music6		;20 22
	word bass1, bass2		;24 26




beat1
	byte %11111110, %11111010
	byte 255,255
	byte %01100001, 255
	byte 255,255

	byte %01100101, 255
	byte %01100101, 255
	byte %01100001, 255
	byte 255,255

	byte %11111110, %11111010
	byte 255, 255
	byte %11111110, %11111010
	byte 255, 255

	byte %01100101, 255
	byte %01100101, 255
	byte %01100001, 255
	byte 255, 255

	byte #%10000000, #%10000000, #%10000000, #%10000000


beat2
	byte %11111110, %11111010
	byte 255,255
	byte %01100001, 255
	byte 255,255

	byte %01100101, %01100101
	byte %01100101, %01100101
	byte %01100001, 255
	byte 255,255

	byte %11111110, %11111010
	byte 255, 255
	byte %11111110, %11111010
	byte 255, 255

	byte %01100101, 255
	byte %01100101, 255
	byte %01100101, 255
	byte %01100101, 255

	byte #%10000000, #%11000000, #%10000000, #%10101000

beat4
	byte %11111110, %11111010
	byte %01100001, 255
	byte %01100001, 255
	byte %01100001, 255

	byte %01100101, 255
	byte %01100101, 255
	byte %01100001, 255
	byte %01100001, 255

	byte %11111110, %11111010
	byte %01100001, 255
	byte %11111110, %11111010
	byte %01100001, 255

	byte %01100101, 255
	byte %01100101, 255
	byte %01100001, 255
	byte %01100001, 255

	byte #%10000000, #%10000000, #%10000000, #%10000000

;000 0 Square  = 4  tuned C -10
;001 1 Bass    = 6  +50   
;010 2 Pitfall = 7  +50
;011 3 Noise   = 8  n/a
;100 4 Buzz    = 15 +50
;101 5 Lead    = 12 tuned
;110 6 Saw     = 1  tuned C# scale
;111 7 Engine  = 3  n/a

;  29=11101 26=11010 23=10111 
;  19=10011 17=10001 15=01111
;  14=01110 11=01011  9=01001
;   4=00100  2=00010  1=00001

bass1
	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101

	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101

	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101

	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101
	byte %00001101, %00001101

	byte %10101010, %10101010, %10101010, %10101010

bass2
	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000

	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000

	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000

	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000
	byte %10111000, %10111000

	byte %10101010, %10101010, %10101010, %10101010


music6
	byte %11001001, 255
	byte %11011010, %11011010
	byte %11001111, %11001111
	byte %11011010, %11011010

	byte %11001001, 255
	byte %11001111, %11001111
	byte %11011010, %11011010
	byte %11001111, %11001111

	byte %11001001, 255
	byte %11011010, 255
	byte %11001111, 255
	byte %11011010, 255

	byte %11001001, 255
	byte %11001111, 255
	byte %11011010, 255
	byte %11001111, 255

	byte #%00000000, #%00000000, #%00000000, #%00000000

music5
	byte %11010111, %11010111
	byte %11001111, %11001111
	byte %11000100, %11000100
	byte %11010111, %11010111

	byte %11000100, %11000100
	byte %11010111, %11010111
	byte %11000100, %11000100
	byte %11001111, %11001111

	byte %11010111, %11010111
	byte %11001111, %11001111
	byte %11000100, %11000100
	byte %11010111, %11010111

	byte %11000100, %11000100
	byte %11010111, %11010111
	byte %11000100, %11000100
	byte %11001111, %11001111

	byte #%00000000, #%00000000, #%00000000, #%00000000

music1
	byte %11011101, %11011101
	byte %11001111, %11001111
	byte %11000100, 255
	byte %11011101, %11011101

	byte %11000100, %11000100
	byte %11011101, %11011101
	byte %11000100, 255
	byte %11001111, %11001111

	byte %11011101, 255
	byte %11001111, 255
	byte %11000100, 255
	byte %11011101, 255

	byte %11000100, 255
	byte %11011101, 255
	byte %11000100, 255
	byte %11001111, 255

	byte #%00000000, #%00000000, #%00000000, #%00000000

music2
	byte %11011010, %11011010
	byte %11001110, %11001110
	byte %11000100, 255
	byte %11011010, %11011010

	byte %11001110, %11001110
	byte %11011010, %11011010
	byte %11000100, 255
	byte %11001110, %11001110

	byte %11011010, 255
	byte %11001110, 255
	byte %11000010, 255
	byte %11011010, 255

	byte %11001110, 255
	byte %11011010, 255
	byte %11000010, 255
	byte %11001110, 255

	byte #%00000000, #%00000000, #%00000000, #%00000000

music4
	byte %11000100, 255
	byte %11011010, %11011010
	byte %11001110, %11001110
	byte %11011010, %11011010

	byte %11000100, 255
	byte %11001110, %11001110
	byte %11011010, %11011010
	byte %11001110, %11001110

	byte %11000010, 255
	byte %11011010, 255
	byte %11001110, 255
	byte %11011010, 255

	byte %11000010, 255
	byte %11001110, 255
	byte %11011010, 255
	byte %11001110, 255

	byte #%00000000, #%00000000, #%00000000, #%00000000


beat3
	byte %11001001, %11111010
	byte %11001001,255
	byte %01100001, 255
	byte 255,255

	byte %01100101, 255
	byte %01100101, 255
	byte %01100001, 255
	byte %11001001,%11001001

	byte %11111110, %11111010
	byte 255, 255
	byte %11111110, %11111010
	byte 255, 255

	byte %01100101, 255
	byte %01100101, 255
	byte %11001001, 255
	byte 255, 255

	byte #%10000000, #%10000000, #%10000000, #%10000000

beat5
	byte %11001001, %11111010
	byte %11001001,255
	byte %01100001, 255
	byte %11000010,255

	byte %01100101, 255
	byte %01100101, 255
	byte %01100001, 255
	byte %11001001,%11001001

	byte %11111110, %11111010
	byte %11000011,255
	byte %11111110, %11111010
	byte %11000011,255

	byte %01100101, 255
	byte %01100101, 255
	byte %11001001, 255
	byte %11000010,255

	byte #%10000000, #%10000000, #%10000000, #%10000000


music3
	byte %11011101, %11011101
	byte %11001111, %11001111
	byte %11000100, %11000100
	byte %11011101, %11011101

	byte %11000100, %11000100
	byte %11011101, %11011101
	byte %11000100, %11000100
	byte %11001111, %11001111

	byte %11011101, %11011101
	byte %11001111, %11001111
	byte %11000100, %11000100
	byte %11011101, %11011101

	byte %11000100, %11000100
	byte %11011101, %11011101
	byte %11000100, %11000100
	byte %11001111, %11001111

	byte #%00000000, #%00000000, #%00000000, #%00000000


patternMute
	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255

	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255


;--------------------------------------------------------------------------
; songPlayer
;--------------------------------------------------------------------------
; Plays up to two pre-programmed patterns simlutaneously.
;
; Call this once per screen-draw.
;
; Keep this at the beginning of songplay.h to avoid an extra JMP
;--------------------------------------------------------------------------
songPlayer

; Now the actual player
;--------------------------------------------------------------------------

; Tempo
;--------------------------------------------------------------------------
	; I'm using the top 3 bits of the beat as a tempo counter.
	; I increase the beat number every 3 screen draws.

	lda beat
	and #%11100000
	beq tempoStep1

	cmp #%00100000
	beq tempoStep2

	;reset tempo count
	lda beat
	and #%00011111
	sta beat

	tax
	inx
	stx beat
	cpx #32
	bne quitTempo

	inc measure

	lda #0
	sta beat

	jmp quitTempo

tempoStep1
	lda beat
	ora #%00100000
	sta beat
	jmp quitTempo

tempoStep2
	lda beat
	ora #%01100000
	sta beat
	
quitTempo


; Pattern Player ------------------------

	ldy measure	
	ldx song1,y

	; Check to see if the end of the song was reached
	cpx #255
	bne notEndOfSong
	
	; Go back to the first measure
	ldy #0
	sty measure

notEndOfSong


	lda #1 ; oscillator one
	jsr playPattern

	ldy measure	
	ldx song2,y

	lda #0 ; oscillator zero
	jsr playPattern



	jmp rtnSongPlayer		
							
;--------------------------------------------------







soundTypeArray
	byte 4,6,7,8
	byte 15,12,1,3





;--------------------------------------------------------------------------
; Accent Reader
;--------------------------------------------------------------------------
; Each set of pattern data is followed by 4 accept bytes.
; Each bit in order represents the accent (on or off)
; of its corresponding 32nd note.  This function
; returns the attenuation of a note in a pattern.
;
; - temp16 must contain an indirect pointer to the pattern data
; - Y must contain the current 32nd note (beat)
;
; = will return the volume in ACC
;
; changes X,Y,ACC
;--------------------------------------------------------------------------
bitMaskArray
	byte #%10000000
	byte #%01000000
	byte #%00100000
	byte #%00010000
	byte #%00001000
	byte #%00000100
	byte #%00000010
	byte #%00000001

accentReader
	; There are 4 accent bytes.  Get the
	; correct one.
	tya

	; Now set up a mask for the bit
	and #%00000111
	tax
	tya

	and #%00011000
	lsr
	lsr
	lsr

	; The 4 accent bytes are after the 32 bytes
	; that make up the pattern.
	clc
	adc #32
	tay
	
	lda (temp16L),y
	and bitMaskArray,x
	beq noAccent

	; It's an Accent, so don't attenuate
	lda #15

	jmp rtnAccentReader

noAccent

	; No accent, so use a lower volume
	lda #5

	;rts ; accentReader
	jmp rtnAccentReader


;--------------------------------------------------------------------------
; Extract Pattern Data
;--------------------------------------------------------------------------
; Each byte of pattern data contains the frequency and 
; sound type data.  This function separates and decodes them.
;
; The encoding is: the 3 high bits contain the encoded sound
; type and the lower 5 bits contain the freq data.
;
; - ACC must contain pattern byte
;
; = ACC will return the freq
; = X will return the sound type
; 
; changes ACC,X,Y
;--------------------------------------------------------------------------
extractPatternData


	cmp #255
	beq noNote
	
	tax

	; Extract freq data and push it
	and #%00011111

	;jmp rtnExtractPatternData

	tay

	txa
	lsr
	lsr
	lsr
	lsr
	lsr
	tax
	
	lda soundTypeArray,x

	tax
	tya

	;rts
	jmp rtnExtractPatternData

noNote
	lda #255

	;rts ; extractPatternData : other rts
	jmp rtnExtractPatternData





;--------------------------------------------------------------------------
; playPattern
;--------------------------------------------------------------------------
; Plays a pattern
;
; - X should contain the offset in the patternArray of the pattern to play
; - ACC should contain the oscillator to be used (0 or 1)
;
;--------------------------------------------------------------------------
playPattern

	; save osc number
	sta temp

	; Get address of selected pattern
	lda patternArray,x
	sta temp16L
	inx
	lda patternArray,x
	sta temp16H

	; The variable, beat, contains the 32nd note
	; that the beat is currently on.
	lda beat
	and #%00011111
	tay

	lda (temp16L),y

	jmp extractPatternData
rtnExtractPatternData


	; Get the osc number again
	ldy temp

	sta AUDF0,y
	stx AUDC0,y	

	cmp #255
	beq noteOff1

	tax
	lda beat
	and #%00011111
	tay
	txa
	

	jmp accentReader
rtnAccentReader

	;rts

	; Get the osc number again
	ldy temp
	sta AUDV0,y

	rts
noteOff1

	lda #0
	ldy temp
	sta AUDV0,y

	rts ; playPattern




