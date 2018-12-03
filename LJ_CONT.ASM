
contJ0
  byte $1F ; next up/down
  byte $FF ; next left/right

  byte 68 ; reset x
  byte 85 ; reset y

  byte SKIPBOTH  ; powerup type

contJ1
  byte $20 ; next up/down
  byte $FF ; next left/right

  byte 123 ; reset x
  byte 75 ; reset y

  byte SKIPBOTH  ; powerup type

contJ2
  byte $F1 ; next up/down
  byte $3F ; next left/right

  byte 125 ; reset x
  byte 100 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 20 ; powerup x
  byte 11 ; powerup y
  byte 2 ; powerup mask

contJ3
  byte $F4 ; next up/down
  byte $F2 ; next left/right

  byte 19 ; reset x
  byte 135 ; reset y

  byte SKIPBOTH  ; powerup type

contJ4
  byte $3F ; next up/down
  byte $F5 ; next left/right

  byte 40 ; reset x
  byte 80 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 60 ; powerup x
  byte 3 ; powerup y
  byte 4 ; powerup mask

contJ5
  byte $FF ; next up/down
  byte $46 ; next left/right

  byte 15 ; reset x
  byte 115 ; reset y

  byte SKIPBOTH  ; powerup type

contJ6
  byte $FF ; next up/down
  byte $57 ; next left/right

  byte 15 ; reset x
  byte 105 ; reset y

  byte SKIPBOTH  ; powerup type

contJ7
  byte $F8 ; next up/down
  byte $6F ; next left/right

  byte 19 ; reset x
  byte 90 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 20 ; powerup x
  byte 5 ; powerup y
  byte 8 ; powerup mask

contJ8
  byte $79 ; next up/down
  byte $FF ; next left/right

  byte 115 ; reset x
  byte 85 ; reset y

  byte SKIPBOTH  ; powerup type

contJ9
  byte $8F ; next up/down
  byte $FF ; next left/right

  byte 30 ; reset x
  byte 15 ; reset y

  byte SKIPBOTH  ; powerup type
