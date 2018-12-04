; Song Data
; ----------------------------------------------------------
; song1 and song2 are lists of patterns to be played
; out of the patternArray.
; They are played simlutaneously using the two oscillators

	; BASS
song1B
	; intro
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	; melody starts
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	; drums come in
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	byte 22,22
	byte 24,24
	byte 26,26
	byte 28,28

	; 8th HH
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	; add melody
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	byte 22,22
	byte 24,24
	byte 26,26
	byte 28,28

	; alternate melody
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	byte 22,22
	byte 24,24
	byte 26,26
	byte 28,28

	; 16th drums
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	byte 22,22
	byte 24,24
	byte 26,26
	byte 28,28

	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	byte 22,22
	byte 24,24
	byte 26,26
	byte 28,28

	; mixed arp
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	byte 255

	; DRUMS
song2B
	; intro
	byte 2,2
	byte 4,4
	byte 6,6
	byte 8,8

	; melody comes in
	byte 10,10
	byte 12,12
	byte 10,10
	byte 12,12

	; add drums
	byte 14,14
	byte 16,16
	byte 42,42
	byte 16,16

	byte 14,14
	byte 16,16
	byte 42,42
	byte 16,16

	; 8th HH
	byte 18,18
	byte 20,20
	byte 18,18
	byte 20,20

	; add melody
	byte 30,30
	byte 32,32
	byte 44,44
	byte 32,32

	byte 30,30
	byte 32,32
	byte 44,44
	byte 32,32

	; alternate melody
	byte 38,38
	byte 40,40
	byte 38,38
	byte 40,40

	byte 38,38
	byte 40,40
	byte 38,38
	byte 40,40

	; 16th drums
	byte 34,34
	byte 36,36
	byte 34,34
	byte 36,36
	
	byte 34,34
	byte 36,36
	byte 34,34
	byte 36,36

	byte 34,34
	byte 36,36
	byte 34,34
	byte 36,36
	
	byte 34,34
	byte 36,36
	byte 34,34
	byte 36,36

	; mixed arp	
	byte 26,26
	byte 28,28
	byte 2,2
	byte 4,4

	byte 6,6
	byte 8,8
	byte 22,22
	byte 24,24

	byte 255



patternArrayB
	word patternMuteB, arp1		; 0 2
	word arp2, arp3				; 4 6
	word arp4, mel1				; 8 10
	word mel2, mel1b			; 12 14
	word mel2b, beat1b			; 16 18
	word beat2b, arp5			; 20 22
	word arp6, arp7				; 24 26
	word arp8, beat3b			; 28 30
	word beat4b, beat5b			; 32 34
	word beat6b, beat7b			; 36 38
	word beat8b, mel1c			; 40 42
	word beat3c, beat3c			; 44 46
	
	include mcsong3.asm


	



arp8
	byte %10101111, %10110111
	byte %10111101, %10110111
	byte %10101111, %10110111
	byte %10111101, %10110111

	byte %10110011, %10110111
	byte %10111101, %10110111
	byte %10110011, %10110111
	byte %10111101, %10110111

	byte %10110011, %10110111
	byte %10111101, %10110111
	byte %10110011, %10110111
	byte %10111101, %10110111

	byte %10110011, %10110111
	byte %10111101, %10110111
	byte %10110011, %10110111
	byte %10111101, %10110111

	byte #%00000000, #%00000000, #%00000000, #%00000000


beat7b
	byte %00010001, %00000000
	byte %00010001, %00000000
	byte %01100001, %00010111
	byte %00010111, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00001001
	byte %00001001, %00000000

	byte %01100001, %00001001
	byte %00001001, %00000000
	byte %01111110, %00001011
	byte %00001011, %00000000

	byte %01101000, %00000000
	byte %00000000, %00000000
	byte %01100001, %00010001
	byte %00010001, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10000000



beat8b
	byte %01111110, %00001110
	byte %00001110, %00000000
	byte %01100001, %00011010
	byte %00011010, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00000000
	byte %00001001, %00000000

	byte %01100001, %00000000
	byte %00001001, %00000000
	byte %00010111, %00000000
	byte %00001111, %00000000

	byte %01101000, %00000000
	byte %01101000, %00000000
	byte %01100001, %00000000
	byte %00001111, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10100000


arp7
	byte %10100100, %10101111
	byte %10111010, %10101111
	byte %10100100, %10101111
	byte %10111010, %10101111

	byte %10100100, %10101111
	byte %10111010, %10101111
	byte %10100100, %10101111
	byte %10111010, %10101111

	byte %10100100, %10101111
	byte %10111010, %10101111
	byte %10100100, %10101111
	byte %10111010, %10101111

	byte %10100100, %10101111
	byte %10111010, %10101111
	byte %10100100, %10101111
	byte %10111010, %10101111

	byte #%00000000, #%00000000, #%00000000, #%00000000

arp6
	byte %10101011, %10110001
	byte %10111101, %10110001
	byte %10101011, %10110001
	byte %10111101, %10110001

	byte %10101011, %10110001
	byte %10111101, %10110001
	byte %10101011, %10110001
	byte %10111101, %10110001

	byte %10101011, %10110001
	byte %10111101, %10110001
	byte %10101011, %10110001
	byte %10111101, %10110001

	byte %10101011, %10110001
	byte %10111101, %10110001
	byte %10101011, %10110001
	byte %10111101, %10110001

	byte #%00000000, #%00000000, #%00000000, #%00000000


arp5
	byte %10100100, %10110011
	byte %10110111, %10110011
	byte %10100100, %10110011
	byte %10110111, %10110011

	byte %10100100, %10110011
	byte %10110111, %10110011
	byte %10100100, %10110011
	byte %10110111, %10110011

	byte %10100100, %10110011
	byte %10110111, %10110011
	byte %10100100, %10110011
	byte %10110111, %10110011

	byte %10100100, %10110011
	byte %10110111, %10110011
	byte %10100100, %10110011
	byte %10110111, %10110011

	byte #%00000000, #%00000000, #%00000000, #%00000000


beat6b
	byte %01111110, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00000000
	byte %01100001, %00000000

	byte %01100001, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000

	byte %01101000, %00000000
	byte %01101000, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000

	byte #%10000000, #%10000000, #%10000000, #%10000000

beat5b
	byte %01100001, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00000000
	byte %01100001, %00000000

	byte %01100001, %00000000
	byte %01100001, %00000000
	byte %01111110, %00000000
	byte %01100001, %00000000

	byte %01101000, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000
	byte %01100001, %00000000

	byte #%10000000, #%10000000, #%10000000, #%10000000

beat2b
	byte %01111110, %00000000
	byte %00000000, %00000000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte %01100001, %00000000
	byte %00000000, %00000000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte %01101000, %00000000
	byte %01101000, %00000000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10100000

beat1b
	byte %01100001, %00000000
	byte %00000000, %00000000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte %01100001, %00000000
	byte %00000000, %00000000
	byte %01111110, %00000000
	byte %00000000, %00000000

	byte %01101000, %00000000
	byte %00000000, %00000000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10000000

beat4b
	byte %01111110, %00010011
	byte %00010011, %00000000
	byte %01100001, %00011010
	byte %00011010, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00000000
	byte %00000000, %00000000

	byte %01100001, %00000000
	byte %00010001, %00000000
	byte %00010111, %00000000
	byte %00010001, %00000000

	byte %01101000, %00000000
	byte %01101000, %00000000
	byte %01100001, %00000000
	byte %00010011, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10100000


; 000 Square
; 001 Bass  
; 010 Pitfall
; 011 Noise  
; 100 Buzz / Chord
; 101 Lead   
; 110 Saw    
; 111 Engine 
;
;  29=11101 26=11010 23=10111 
;  19=10011 17=10001 15=01111
;  14=01110 11=01011  9=01001
;   4=00100  2=00010  1=00001

beat3c
	byte %00011101, %00000000
	byte %00011101, %00000000
	byte %01100001, %00011010
	byte %00011010, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00010001
	byte %00010001, %00000000

	byte %01100001, %10101011
	byte %10101011, %00000000
	byte %01111110, %00010111
	byte %00010111, %00000000

	byte %01101000, %00000000
	byte %00000000, %00000000
	byte %01100001, %00011101
	byte %00011101, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10000000

mel1c
	byte %00011101, %00000000
	byte %00011101, %00000000
	byte %00011010, %00011010
	byte %00000000, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %00010001, %00010001
	byte %00000000, %00000000

	byte %10101011, %00000000
	byte %10101011, %00000000
	byte %01111110, %00010111
	byte %00000000, %00000000

	byte %01101000, %00000000
	byte %00000000, %00000000
	byte %00011101, %00011101
	byte %00000000, %00000000

	byte #%10100000, #%10000000, #%00001000, #%10000000

mel2b
	byte %01111110, %00000000
	byte %00010011, %00000000
	byte %00011010, %00011010
	byte %00000000, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %00010001, %00010001
	byte %00000000, %00000000

	byte %00010001, %00000000
	byte %00010001, %00000000
	byte %00010111, %00010111
	byte %00010011, %00000000

	byte %01101000, %00000000
	byte %01101000, %00000000
	byte %00010011, %00010011
	byte %00000000, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10100000

beat3b
	byte %00011101, %00000000
	byte %00011101, %00000000
	byte %01100001, %00011010
	byte %00011010, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %01100001, %00001110
	byte %00001110, %00000000

	byte %01100001, %00001110
	byte %00001110, %00000000
	byte %01111110, %00010001
	byte %00010001, %00000000

	byte %01101000, %00000000
	byte %00000000, %00000000
	byte %01100001, %00011101
	byte %00011101, %00000000

	byte #%10100000, #%10000000, #%10100000, #%10000000

mel1b
	byte %00011101, %00000000
	byte %00011101, %00000000
	byte %00011010, %00011010
	byte %00000000, %00000000

	byte %01101000, %01101000
	byte %01101000, %01101000
	byte %00001110, %00001110
	byte %00000000, %00000000

	byte %00001110, %00000000
	byte %00001110, %00000000
	byte %01111110, %00010001
	byte %00000000, %00000000

	byte %01101000, %00000000
	byte %00000000, %00000000
	byte %00011101, %00011101
	byte %00000000, %00000000

	byte #%10100000, #%10000000, #%10101000, #%10000000

mel2
	byte %00010011, %00000000
	byte %00010011, %00000000
	byte %00011010, %00011010
	byte %00000000, %00000000

	byte %00000000, %00000000
	byte %00000000, %00000000
	byte %00010001, %00010001
	byte %00000000, %00000000

	byte %00010001, %00000000
	byte %00010001, %00000000
	byte %00010111, %00010111
	byte %00000000, %00000000

	byte %00000000, %00000000
	byte %00000000, %00000000
	byte %00010011, %00010011
	byte %00000000, %00000000

	byte #%10100000, #%00000000, #%10100000, #%00000000

mel1
	byte %00011101, %00000000
	byte %00011101, %00000000
	byte %00011010, %00011010
	byte %00000000, %00000000

	byte %00000000, %00000000
	byte %00000000, %00000000
	byte %00001110, %00001110
	byte %00000000, %00000000

	byte %00001110, %00000000
	byte %00001110, %00000000
	byte %00010001, %00010001
	byte %00000000, %00000000

	byte %00000000, %00000000
	byte %00000000, %00000000
	byte %00011101, %00011101
	byte %00000000, %00000000

	byte #%10100000, #%00000000, #%10100000, #%00000000

arp4

	byte %10101111, %10110011
	byte %10111010, %10110011
	byte %10101111, %10110011
	byte %10111010, %10110011

	byte %10101111, %10110011
	byte %10111010, %10110011
	byte %10101111, %10110011
	byte %10111010, %10110011

	byte %10101111, %10110011
	byte %10111010, %10110011
	byte %10101111, %10110011
	byte %10111010, %10110011

	byte %10101111, %10110011
	byte %10111010, %10110011
	byte %10101111, %10110011
	byte %10111010, %10110011

	byte #%00000000, #%00000000, #%00000000, #%00000000

arp3

	byte %10110001, %10110111
	byte %10111101, %10110111
	byte %10110001, %10110111
	byte %10111101, %10110111

	byte %10110001, %10110111
	byte %10111101, %10110111
	byte %10110001, %10110111
	byte %10111101, %10110111

	byte %10110001, %10110111
	byte %10111101, %10110111
	byte %10110001, %10110111
	byte %10111101, %10110111

	byte %10110001, %10110111
	byte %10111101, %10110111
	byte %10110001, %10110111
	byte %10111101, %10110111

	byte #%00000000, #%00000000, #%00000000, #%00000000

arp2
	byte %10101001, %10101111
	byte %10111010, %10101111
	byte %10101001, %10101111
	byte %10111010, %10101111

	byte %10101001, %10101111
	byte %10111010, %10101111
	byte %10101001, %10101111
	byte %10111010, %10101111

	byte %10101001, %10101111
	byte %10111010, %10101111
	byte %10101001, %10101111
	byte %10111010, %10101111

	byte %10101001, %10101111
	byte %10111010, %10101111
	byte %10101001, %10101111
	byte %10111010, %10101111

	byte #%00000000, #%00000000, #%00000000, #%00000000


arp1

	byte %10101110, %10110001
	byte %10110111, %10110001
	byte %10101110, %10110001
	byte %10110111, %10110001

	byte %10101110, %10110001
	byte %10110111, %10110001
	byte %10101110, %10110001
	byte %10110111, %10110001

	byte %10101110, %10110001
	byte %10110111, %10110001
	byte %10101110, %10110001
	byte %10110111, %10110001

	byte %10101110, %10110001
	byte %10110111, %10110001
	byte %10101110, %10110001
	byte %10110111, %10110001

	byte #%00000000, #%00000000, #%00000000, #%00000000



patternMuteB
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
songPlayerB


; Now the actual player
;--------------------------------------------------------------------------

; Tempo
;--------------------------------------------------------------------------
	; I'm using the top 3 bits of the beat as a tempo counter.
	; I increase the beat number every 3 screen draws.

	lda beat
	and #%11100000
	beq tempoStep1B

	cmp #%00100000
	beq tempoStep2B

	;reset tempo count
	lda beat
	and #%00011111
	sta beat

	tax
	inx
	stx beat
	cpx #32
	bne quitTempoB

	inc measure

	lda #0
	sta beat

	jmp quitTempoB

tempoStep1B
	lda beat
	ora #%00100000
	sta beat
	jmp quitTempoB

tempoStep2B
	lda beat
	ora #%01100000
	sta beat
	
quitTempoB


; Pattern Player ------------------------

	ldy measure	
	ldx song1B,y

	; Check to see if we've switched to song 3
	lda level
	and #%00011111
	cmp #SONG3LEVEL
	bmi noSongSwitch1

	ldx song1C,y

noSongSwitch1
	

	; Check to see if the end of the song was reached
	cpx #255
	bne notEndOfSongB
	
	; Go back to the first measure
	ldy #0
	sty measure

notEndOfSongB


	lda #1 ; oscillator one
	jsr playPatternB

	ldy measure	
	ldx song2B,y

	; Check to see if we've switched to song 3
	lda level
	and #%00011111
	cmp #SONG3LEVEL
	bmi noSongSwitch2

	ldx song2C,y

noSongSwitch2

	lda #0 ; oscillator zero
	jsr playPatternB



	jmp rtnSongPlayerB
							
;--------------------------------------------------







soundTypeArrayB
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
bitMaskArrayB
	byte #%10000000
	byte #%01000000
	byte #%00100000
	byte #%00010000
	byte #%00001000
	byte #%00000100
	byte #%00000010
	byte #%00000001

accentReaderB
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
	and bitMaskArrayB,x
	beq noAccentB

	; It's an Accent, so don't attenuate
	lda #15

	jmp rtnAccentReaderB

noAccentB

	; No accent, so use a lower volume
	lda #6

	jmp rtnAccentReaderB


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
extractPatternDataB


	cmp #255
	beq noNoteB
	
	tax

noChord	
	txa

	; Extract freq data
	and #%00011111

	tay

	txa
	lsr
	lsr
	lsr
	lsr
	lsr
	tax
	
	lda soundTypeArrayB,x

	tax
	tya

	;rts
	jmp rtnExtractPatternDataB

noNoteB
	lda #255

	jmp rtnExtractPatternDataB





;--------------------------------------------------------------------------
; playPattern
;--------------------------------------------------------------------------
; Plays a pattern
;
; - X should contain the offset in the patternArray of the pattern to play
; - ACC should contain the oscillator to be used (0 or 1)
;
;--------------------------------------------------------------------------
playPatternB

	; save osc number
	sta temp

	; Get address of selected pattern
	lda patternArrayB,x
	sta temp16L
	inx
	lda patternArrayB,x
	sta temp16H

	; The variable, beat, contains the 32nd note
	; that the beat is currently on.
	lda beat
	and #%00011111
	tay

	lda (temp16L),y

	jmp extractPatternDataB
rtnExtractPatternDataB


	; Get the osc number again
	ldy temp

	sta AUDF0,y
	stx AUDC0,y	

	cmp #255
	beq noteOff1B

	tax
	lda beat
	and #%00011111
	tay
	txa
	

	jmp accentReaderB
rtnAccentReaderB

	;rts

	; Get the osc number again
	ldy temp
	sta AUDV0,y

	rts
noteOff1B

	lda #0
	ldy temp
	sta AUDV0,y

	rts ; playPattern




