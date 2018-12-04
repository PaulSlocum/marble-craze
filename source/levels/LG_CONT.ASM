
contG0
  byte $12 ; next up/down
  byte $F7 ; next left/right

  byte 91 ; reset x
  byte 64 ; reset y

  byte HPWRZAP ; powerup type
  byte 255 ; alt level mask

  byte 45 ; powerup x
  byte 6 ; powerup y
  byte 2 ; powerup mask

contG1
  byte $20 ; next up/down
  byte $95 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRZAP ; powerup type
  byte 255 ; alt level mask

  byte 47 ; powerup x
  byte 7 ; powerup y
  byte 128 ; powerup mask

contG2
  byte $01 ; next up/down
  byte $A8 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRZAP ; powerup type
  byte 255 ; alt level mask

  byte 47 ; powerup x
  byte 5 ; powerup y
  byte 32 ; powerup mask

contG3
  byte $54 ; next up/down
  byte $69 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRZAP ; powerup type
  byte 255 ; alt level mask

  byte 47 ; powerup x
  byte 7 ; powerup y
  byte 4 ; powerup mask

contG4
  byte $35 ; next up/down
  byte $7F ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contG5
  byte $43 ; next up/down
  byte $8A ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRZAP ; powerup type
  byte 255 ; alt level mask

  byte 47 ; powerup x
  byte 5 ; powerup y
  byte 16 ; powerup mask

contG6
  byte $D7 ; next up/down
  byte $13 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte 0 ; powerup type
  byte 246 ; alt level mask

  byte 0 ; powerup x
  byte 0 ; powerup y
  byte 0 ; powerup mask

  byte 11 ; alternate screen

contG7
  byte $68 ; next up/down
  byte $04 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRZAP ; powerup type
  byte 255 ; alt level mask

  byte 47 ; powerup x
  byte 7 ; powerup y
  byte 64 ; powerup mask

contG8
  byte $7E ; next up/down
  byte $25 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte 0 ; powerup type
  byte 246 ; alt level mask

  byte 0 ; powerup x
  byte 0 ; powerup y
  byte 0 ; powerup mask

  byte 12 ; alternate screen

contG9
  byte $AF ; next up/down
  byte $31 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contGA
  byte $F9 ; next up/down
  byte $52 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contGB
  byte $D7 ; next up/down
  byte $13 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contGC
  byte $7E ; next up/down
  byte $25 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contGD
  byte $FB ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contGE
  byte $CF ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contGF
  byte $35 ; next up/down
  byte $40 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWR1UP ; powerup type
  byte 255 ; alt level mask

  byte 47 ; powerup x
  byte 6 ; powerup y
  byte 1 ; powerup mask
