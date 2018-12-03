
contC0
  byte $F8 ; next up/down
  byte $F1 ; next left/right

  byte 29 ; reset x
  byte 20 ; reset y

  byte SKIPBOTH  ; powerup type

contC1
  byte $F9 ; next up/down
  byte $02 ; next left/right

  byte 75 ; reset x
  byte 47 ; reset y

  byte SKIPBOTH  ; powerup type

contC2
  byte $FA ; next up/down
  byte $13 ; next left/right

  byte 25 ; reset x
  byte 23 ; reset y

  byte SKIPBOTH  ; powerup type

contC3
  byte $FF ; next up/down
  byte $24 ; next left/right

  byte 75 ; reset x
  byte 47 ; reset y

  byte SKIPBOTH  ; powerup type

contC4
  byte $FB ; next up/down
  byte $35 ; next left/right

  byte 75 ; reset x
  byte 115 ; reset y

  byte SKIPBOTH  ; powerup type

contC5
  byte $FF ; next up/down
  byte $46 ; next left/right

  byte 75 ; reset x
  byte 115 ; reset y

  byte SKIPBOTH  ; powerup type

contC6
  byte $FC ; next up/down
  byte $57 ; next left/right

  byte 75 ; reset x
  byte 115 ; reset y

  byte SKIPBOTH  ; powerup type

contC7
  byte $FF ; next up/down
  byte $6F ; next left/right

  byte 70 ; reset x
  byte 25 ; reset y

  byte HPWRKEY ; powerup type
  byte 255 ; alt level mask

  byte 68 ; powerup x
  byte 9 ; powerup y
  byte 4 ; powerup mask

contC8
  byte $0F ; next up/down
  byte $FF ; next left/right

  byte 79 ; reset x
  byte 30 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 36 ; powerup x
  byte 8 ; powerup y
  byte 2 ; powerup mask

contC9
  byte $1F ; next up/down
  byte $FA ; next left/right

  byte 75 ; reset x
  byte 40 ; reset y

  byte SKIPBOTH  ; powerup type

contCA
  byte $2F ; next up/down
  byte $9B ; next left/right

  byte 75 ; reset x
  byte 30 ; reset y

  byte HPWR50PTS ; powerup type
  byte 255 ; alt level mask

  byte 20 ; powerup x
  byte 7 ; powerup y
  byte 8 ; powerup mask

contCB
  byte $4F ; next up/down
  byte $FF ; next left/right

  byte 22 ; reset x
  byte 40 ; reset y

  byte HPWR50PTS ; powerup type
  byte 4 ; alt level mask

  byte 22 ; powerup x
  byte 8 ; powerup y
  byte 16 ; powerup mask

  byte 14 ; alternate screen

contCC
  byte $6F ; next up/down
  byte $FD ; next left/right

  byte 75 ; reset x
  byte 70 ; reset y

  byte SKIPBOTH  ; powerup type

contCD
  byte $FF ; next up/down
  byte $CF ; next left/right

  byte 75 ; reset x
  byte 70 ; reset y

  byte SKIPBOTH  ; powerup type

contCE
  byte $4F ; next up/down
  byte $FF ; next left/right

  byte 22 ; reset x
  byte 40 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 22 ; powerup x
  byte 3 ; powerup y
  byte 32 ; powerup mask

contCF
  byte $EF ; next up/down
  byte $FF ; next left/right

  byte 22 ; reset x
  byte 40 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 22 ; powerup x
  byte 8 ; powerup y
  byte 64 ; powerup mask
