
contD0
  byte $F1 ; next up/down
  byte $FF ; next left/right

  byte 30 ; reset x
  byte 110  ; reset y

  byte SKIPBOTH  ; powerup type

contD1
  byte $02 ; next up/down
  byte $FF ; next left/right

  byte 75 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contD2
  byte $1F ; next up/down
  byte $F3 ; next left/right

  byte 85 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contD3
  byte $FF ; next up/down
  byte $24 ; next left/right

  byte 85 ; reset x
  byte 75 ; reset y

  byte SKIPBOTH  ; powerup type

contD4
  byte $F5 ; next up/down
  byte $3F ; next left/right

  byte 75 ; reset x
  byte 90 ; reset y

  byte HPWR50PTS ; powerup type
  byte 255 ; alt level mask

  byte 40 ; powerup x
  byte 5 ; powerup y
  byte 4 ; powerup mask

contD5
  byte $4F ; next up/down
  byte $6F ; next left/right

  byte 83 ; reset x
  byte 110 ; reset y

  byte SKIPBOTH  ; powerup type

contD6
  byte $FF ; next up/down
  byte $75 ; next left/right

  byte 112 ; reset x
  byte 110 ; reset y

  byte SKIPBOTH  ; powerup type

contD7
  byte $8F ; next up/down
  byte $F6 ; next left/right

  byte 112 ; reset x
  byte 110 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 68 ; powerup x
  byte 3 ; powerup y
  byte 16 ; powerup mask

contD8
  byte $F7 ; next up/down
  byte $F9 ; next left/right

  byte 20 ; reset x
  byte 70 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 20 ; powerup x
  byte 4 ; powerup y
  byte 8 ; powerup mask

contD9
  byte $FA ; next up/down
  byte $8F ; next left/right

  byte 118 ; reset x
  byte 77 ; reset y

  byte SKIPBOTH  ; powerup type

contDA
  byte $9F ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type
