
contI0
  byte $FF ; next up/down
  byte $1F ; next left/right

  byte 80 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type

contI1
  byte $F2 ; next up/down
  byte $F0 ; next left/right

  byte 85 ; reset x
  byte 80 ; reset y

  byte HPWRLIGHTS ; powerup type
  byte 255 ; alt level mask

  byte 54 ; powerup x
  byte 7 ; powerup y
  byte 1 ; powerup mask

contI2
  byte $1F ; next up/down
  byte $F3 ; next left/right

  byte 75 ; reset x
  byte 75 ; reset y

  byte SKIPBOTH  ; powerup type

contI3
  byte $FF ; next up/down
  byte $24 ; next left/right

  byte 70 ; reset x
  byte 80 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 55 ; powerup x
  byte 10 ; powerup y
  byte 32 ; powerup mask

contI4
  byte $FF ; next up/down
  byte $35 ; next left/right

  byte 105 ; reset x
  byte 85 ; reset y

  byte HPWRLIGHTS ; powerup type
  byte 255 ; alt level mask

  byte 54 ; powerup x
  byte 6  ; powerup y
  byte 2 ; powerup mask

contI5
  byte $6F ; next up/down
  byte $47 ; next left/right

  byte 90 ; reset x
  byte 90 ; reset y

  byte HPWRLIGHTS ; powerup type
  byte 255 ; alt level mask

  byte 52 ; powerup x
  byte 5 ; powerup y
  byte 4 ; powerup mask

contI6
  byte $F5 ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRWALLS ; powerup type
  byte 255 ; alt level mask

  byte 40 ; powerup x
  byte 10 ; powerup y
  byte 8 ; powerup mask

contI7
  byte $8F ; next up/down
  byte $5F ; next left/right

  byte 40 ; reset x
  byte 100 ; reset y

  byte HPWRLIGHTS ; powerup type
  byte 255 ; alt level mask

  byte 20 ; powerup x
  byte 5 ; powerup y
  byte 16 ; powerup mask

contI8
  byte $F7 ; next up/down
  byte $FF ; next left/right

  byte 60 ; reset x
  byte 30 ; reset y

  byte HPWR1UP ; powerup type
  byte 255 ; alt level mask

  byte 55 ; powerup x
  byte 4 ; powerup y
  byte 64 ; powerup mask
