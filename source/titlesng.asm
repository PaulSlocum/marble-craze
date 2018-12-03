TEMPODELAY equ 3

; Song Data
; ----------------------------------------------------------
; song1 and song2 are lists of patterns to be played
; out of the patternArray.
; They are played simlutaneously using the two oscillators

song1T
	byte 2, 4
	byte 2, 4

	byte 2, 4
	byte 2, 4
	byte 2, 4
	byte 2, 4

	byte 2, 4
	byte 2, 4

	byte 12,14
	byte 12,14

	byte 2, 4
	byte 2, 4

	byte 12,14
	byte 12,14

	byte 2, 4
	byte 2, 4

	byte 12,14
	byte 12,14

	byte 2, 4
	byte 2, 0

	byte 6,6	
	byte 6,6	

	byte 255

song2T
	byte 0, 0
	byte 0, 0

	byte 6, 6
	byte 6, 6
	byte 8, 8
	byte 8, 10

	byte 0, 0
	byte 0, 0

	byte 6, 6
	byte 6, 6

	byte 6, 6
	byte 6, 6

	byte 16, 18
	byte 16, 18

	byte 8, 8
	byte 8, 10

	byte 16, 18
	byte 16, 18

	byte 8, 8
	byte 8, 10

	byte 6,6
	byte 6,0


	byte 255

patternArrayT
	word patternMuteT, bass1		;0 2	
	word bass2, hat					;4 6
	word hatMelody, hatMelody2		;8 10
	word bass3, bass4				;12 14
	word hatMelody3, hatMelody4		;16 18
	word bass5

; Pattern Data
; ----------------------------------------------------------
;
; The patterns are made up of 32 numbers (bytes) of note data followed
; by 4 numbers (bytes) of accent data.
;
; Note Encoding
; ----------------------------------------------------------
;
; The 32 note numbers are encoded with sound type and pitch.
;
; The first three bits (1's and  0's) determine the 
; sound type according to the following table:
;
; 000 Square
; 001 Bass  
; 010 Pitfall
; 011 Noise  
; 100 Buzz   
; 101 Lead   
; 110 Saw    
; 111 Engine 
;
; The remaining 5 bits determine the pitch.
;
; 11111 is a very low pitch
; 00001 us a very high pitch
; 00100 is somewhere in between
;
; Synthcart major scale:
;
;  29=11101 26=11010 23=10111 
;  19=10011 17=10001 15=01111
;  14=01110 11=01011  9=01001
;   4=00100  2=00010  1=00001
;
; (!) Note that 255 or %11111111 means no sound (a rest)
;
; Accent Encoding
; ----------------------------------------------------------
;
; The four numbers at the end of the pattern data 
; that look like this:
;  
;	byte #%10001000, #%10001000, #%10001000, #%10001000
;
; determine which notes are accented.  The 32 bits
; from left to right correspond to the 32 notes in
; the pattern.  0=no accent, 1=accent


hatMelody3
	byte %01100000, 255
	byte 255, 255
	byte %01000100, %01000100
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01001011, %01001011
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01001001, %01001001
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01100000, 255
	byte 255, 255

	byte #%00001000, #%00001000, #%00001000, #%00000000

hatMelody4
	byte %01100000, 255
	byte 255, 255
	byte %01000100, %01001011
	byte %01000100, %01001011

	byte %01100000, %01001011
	byte %01000100, %01001011
	byte %01001011, %01001011
	byte %01001011, %01001011

	byte %01100000, 255
	byte 255, 255
	byte %01000001, 255
	byte %01000010, 255

	byte %01100000, 255
	byte 255, 255
	byte %01000100, 255
	byte %01001011, 255

	byte #%00000000, #%00001000, #%00001000, #%00001000

bass1
	byte %00110001, %00110001
	byte %00110001, %00110001
	byte %11111110, %11111010
	byte 255,255

	byte %01100101, 255
	byte 255,255
	byte 255, 255
	byte 255,255

	byte %00110001, %00110001
	byte 255, 255
	byte %00110001, %00110001
	byte 255, 255

	byte %01100101, 255
	byte 255, 255
	byte %11111110, %11111010
	byte 255, 255

	byte %11001000, %10001000, %11001100, %10001000

bass2
	byte %00101110, %00101110
	byte %00101110, %00101110
	byte %11111110, %11111010
	byte 255,255

	byte %01100101, 255
	byte 255,255
	byte 255, 255
	byte 255,255

	byte %00110011, %00110011
	byte 255, 255
	byte %00110011, %00110011
	byte 255, 255

	byte %01100101, 255
	byte %11111110, %11111010
	byte 255, 255
	byte 255, 255

	byte %11001000, %10001000, %11001100, %10001000

bass3
	byte %00101111, %00101111
	byte %00101111, %00101111
	byte %11111110, %11111010
	byte 255,255

	byte %01100101, 255
	byte 255,255
	byte 255, 255
	byte 255,255

	byte %00101111, %00101111
	byte 255, 255
	byte %00101111, %00101111
	byte %01100101, %01100101

	byte %01100101, 255
	byte 255, 255
	byte %11111110, %11111010
	byte 255, 255

	byte %11001000, %10001000, %11001100, %10001000

bass4
	byte %00110111, %00110111
	byte %00110111, %00110111
	byte %11111110, %11111010
	byte 255,255

	byte %01100101, 255
	byte 255,255
	byte 255, 255
	byte 255,255

	byte %00101001, %00101001
	byte 255, 255
	byte %00101001, %00101001
	byte 255, 255

	byte %01100101, 255
	byte %11111110, %11111010
	byte %01100101, 255
	byte 255, 255

	byte %11001000, %10001000, %11001100, %10001000

bass5
;	byte %00110111, %00110111
;	byte %00110111, %00110111
;	byte %11111110, %11111010
;	byte 255,255

;	byte %01100101, 255
;	byte 255,255
;	byte 255, 255
;	byte 255,255

;	byte %00101001, %00101001
;	byte 255, 255
;	byte %00101001, %00101001
;	byte 255, 255

;	byte %01100101, 255
;	byte %11111110, %11111010
;	byte %01100101, 255
;	byte %01100101, 255

;	byte %11001000, %10001000, %11001100, %10001010


hat
	byte %01100000, 255
	byte 255, 255
	byte %01100000, 255
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01100000, 255
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01100000, 255
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01100000, 255
	byte %01100000, 255

	byte #%00000000, #%00000000, #%00000000, #%00000000

hatMelody
	byte %01100000, 255
	byte 255, 255
	byte %01000001, %01000001
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01000010, %01000010
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01000100, %01000100
	byte 255, 255

	byte %01100000, 255
	byte 255, 255
	byte %01100000, 255
	byte 255, 255

	byte #%00001000, #%00001000, #%00001000, #%00000000

hatMelody2
	byte %01100000, 255
	byte 255, 255
	byte %01000001, 255
	byte %01000001, 255

	byte %01100000, 255
	byte 255, 255
	byte %01000010, 255
	byte %01000010, 255

	byte %01100000, 255
	byte 255, 255
	byte %01001011, %01001011
	byte %01001011, %01001011

	byte %01001001, %01001001
	byte %01001001, %01001001
	byte %01001001, %01001001
	byte %01001001, %01001001

	byte #%00001000, #%00001000, #%00000000, #%00000000


patternMuteT
	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255

	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255
	byte 255,255,255,255




soundTypeArrayT
	byte 4,6,7,8
	byte 15,12,1,3


;--------------------------------------------------------------------------
; songPlayer
;--------------------------------------------------------------------------
; Plays up to two pre-programmed patterns simlutaneously.
;
; Call this once per screen-draw.
;
; Keep this at the beginning of songplay.h to avoid an extra JMP
;--------------------------------------------------------------------------
songPlayerT

; Now the actual player
;--------------------------------------------------------------------------

; Tempo
;--------------------------------------------------------------------------
	; I'm using the top 3 bits of the beat as a tempo counter.
	; I increase the beat number every 3 screen draws.

	lda beat
	and #%11100000
	beq tempoStep1T

	cmp #%00100000
	beq tempoStep2T

	;reset tempo count
	lda beat
	and #%00011111
	sta beat

	tax
	inx
	stx beat
	cpx #32
	bne quitTempoT

	inc measure

	lda #0
	sta beat

	jmp quitTempoT

tempoStep1T
	lda beat
	ora #%00100000
	sta beat
	jmp quitTempoT

tempoStep2T
	lda beat
	ora #%01100000
	sta beat
	
quitTempoT


; Pattern Player ------------------------

	ldy measure	
	ldx song1T,y

	; Check to see if the end of the song was reached
	cpx #255
	bne notEndOfSongT
	
	; Go back to the first measure
	ldy #0
	sty measure

notEndOfSongT


	lda #1 ; oscillator one
	jsr playPatternT

	ldy measure	
	ldx song2T,y

	lda #0 ; oscillator zero
	jsr playPatternT



	jmp rtnSongPlayerT
							
;--------------------------------------------------






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
bitMaskArrayT
	byte #%10000000
	byte #%01000000
	byte #%00100000
	byte #%00010000
	byte #%00001000
	byte #%00000100
	byte #%00000010
	byte #%00000001

accentReaderT
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
	and bitMaskArrayT,x
	beq noAccentT

	; It's an Accent, so don't attenuate
	lda #15

	jmp rtnAccentReaderT

noAccentT

	; No accent, so use a lower volume
	lda #5

	jmp rtnAccentReaderT


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
extractPatternDataT


	cmp #255
	beq noNoteT
	
	tax

	; Extract freq data and push it
	and #%00011111


	tay

	txa
	lsr
	lsr
	lsr
	lsr
	lsr
	tax
	
	lda soundTypeArrayT,x

	tax
	tya

	jmp rtnExtractPatternDataT

noNoteT
	lda #255

	jmp rtnExtractPatternDataT





;--------------------------------------------------------------------------
; playPattern
;--------------------------------------------------------------------------
; Plays a pattern
;
; - X should contain the offset in the patternArray of the pattern to play
; - ACC should contain the oscillator to be used (0 or 1)
;
;--------------------------------------------------------------------------
playPatternT

	; save osc number
	sta temp

	; Get address of selected pattern
	lda patternArrayT,x
	sta temp16L
	inx
	lda patternArrayT,x
	sta temp16H

	; The variable, beat, contains the 32nd note
	; that the beat is currently on.
	lda beat
	and #%00011111
	tay

	lda (temp16L),y

	jmp extractPatternDataT
rtnExtractPatternDataT


	; Get the osc number again
	ldy temp

	sta AUDF0,y
	stx AUDC0,y	

	cmp #255
	beq noteOff1T

	tax
	lda beat
	and #%00011111
	tay
	txa
	

	jmp accentReaderT
rtnAccentReaderT

	; Get the osc number again
	ldy temp
	sta AUDV0,y

	rts
noteOff1T

	lda #0
	ldy temp
	sta AUDV0,y

	rts ; playPattern







