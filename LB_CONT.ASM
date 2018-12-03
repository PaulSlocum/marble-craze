
contB0
  byte $FF ; next up/down
  byte $F1 ; next left/right

  byte 50 ; reset x
  byte 105 ; reset y

  byte SKIPBOTH  ; powerup type

contB1
  byte $FF ; next up/down
  byte $02 ; next left/right

  byte 60 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type

contB2
  byte $FF ; next up/down
  byte $13 ; next left/right

  byte 70 ; reset x
  byte 80 ; reset y

  byte HPWR50PTS ; powerup type
  byte 255 ; alt level mask

  byte 55 ; powerup x
  byte 7 ; powerup y
  byte 1 ; powerup mask

contB3
  byte $F4 ; next up/down
  byte $2F ; next left/right

  byte 115 ; reset x
  byte 50 ; reset y

  byte 0 ; powerup type
  byte 2 ; alt level mask

  byte 0 ; powerup x
  byte 0 ; powerup y
  byte 0 ; powerup mask

  byte 5 ; alternate screen

contB4
  byte $3F ; next up/down
  byte $FF ; next left/right

  byte 60 ; reset x
  byte 80 ; reset y

  byte HPWRKEY ; powerup type
  byte 255 ; alt level mask

  byte 57 ; powerup x
  byte 3 ; powerup y
  byte 2 ; powerup mask

contB5
  byte $F4 ; next up/down
  byte $26 ; next left/right

  byte 120 ; reset x
  byte 30 ; reset y

  byte SKIPBOTH  ; powerup type

contB6
  byte $FF ; next up/down
  byte $57 ; next left/right

  byte 70 ; reset x
  byte 120 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 68 ; powerup x
  byte 7 ; powerup y
  byte 4 ; powerup mask

contB7
  byte $8F ; next up/down
  byte $6F ; next left/right

  byte 85 ; reset x
  byte 105 ; reset y

  byte HPWRUP ; powerup type
  byte 255 ; alt level mask

  byte 49 ; powerup x
  byte 6 ; powerup y
  byte 8 ; powerup mask

contB8
  byte $97 ; next up/down
  byte $FF ; next left/right

  byte 85 ; reset x
  byte 105 ; reset y

  byte SKIPBOTH  ; powerup type

contB9
  byte $F8 ; next up/down
  byte $FA ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRRIGHT ; powerup type
  byte 255 ; alt level mask

  byte 45 ; powerup x
  byte 10 ; powerup y
  byte 32 ; powerup mask

contBA
  byte $FF ; next up/down
  byte $9B ; next left/right

  byte 80 ; reset x
  byte 80 ; reset y

  byte HPWRSTOP ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 10 ; powerup y
  byte 64 ; powerup mask

contBB
  byte $FF ; next up/down
  byte $9F ; next left/right

  byte 40 ; reset x
  byte 90 ; reset y

  byte HPWR1UP ; powerup type
  byte 255 ; alt level mask

  byte 30 ; powerup x
  byte 6 ; powerup y
  byte 16 ; powerup mask
