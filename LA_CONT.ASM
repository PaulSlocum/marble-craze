
contA0
  byte $FF ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRKEY ; powerup type
  byte 1   ; alt level mask

  byte 47 ; powerup x
  byte 9 ; powerup y
  byte 1 ; powerup mask

  byte 1 ; alternate screen

contA1
  byte $FF ; next up/down
  byte $F2 ; next left/right

  byte 70 ; reset x
  byte 110 ; reset y

  byte SKIPBOTH  ; powerup type

contA2
  byte $FF ; next up/down
  byte $1F ; next left/right

  byte 70 ; reset x
  byte 95 ; reset y

  byte HPWRKEY ; powerup type
  byte 2 ; alt level mask

  byte 50 ; powerup x
  byte 5 ; powerup y
  byte 2 ; powerup mask

  byte 3 ; alternate screen

contA3
  byte $FF ; next up/down
  byte $F4 ; next left/right

  byte 105 ; reset x
  byte 95 ; reset y

  byte SKIPBOTH  ; powerup type

contA4
  byte $FF ; next up/down
  byte $3F ; next left/right

  byte 30 ; reset x
  byte 90 ; reset y

  byte HPWRKEY ; powerup type
  byte 4 ; alt level mask

  byte 35 ; powerup x
  byte 5 ; powerup y
  byte 4 ; powerup mask

  byte 5 ; alternate screen

contA5
  byte $FF ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWRKEY ; powerup type
  byte 8 ; alt level mask

  byte 65 ; powerup x
  byte 10 ; powerup y
  byte 8 ; powerup mask

  byte 6 ; alternate screen

contA6
  byte $7F ; next up/down
  byte $FF ; next left/right

  byte 40 ; reset x
  byte 30 ; reset y

  byte SKIPBOTH  ; powerup type

contA7
  byte $F6 ; next up/down
  byte $FF ; next left/right

  byte 105 ; reset x
  byte 50 ; reset y

  byte HPWRKEY ; powerup type
  byte 16 ; alt level mask

  byte 65 ; powerup x
  byte 5 ; powerup y
  byte 16 ; powerup mask

  byte 8 ; alternate screen

contA8
  byte $9F ; next up/down
  byte $FF ; next left/right

  byte 110 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

contA9
  byte $F8 ; next up/down
  byte $FF ; next left/right

  byte 110 ; reset x
  byte 90 ; reset y

  byte HPWRKEY ; powerup type
  byte 32  ; alt level mask

  byte 60 ; powerup x
  byte 10 ; powerup y
  byte 32 ; powerup mask

  byte 10 ; alternate screen

contAA
  byte $FF ; next up/down
  byte $FB ; next left/right

  byte 110 ; reset x
  byte 30 ; reset y

  byte SKIPBOTH  ; powerup type

contAB
  byte $FF ; next up/down
  byte $AF ; next left/right

  byte 110 ; reset x
  byte 50 ; reset y

  byte HPWRKEY ; powerup type
  byte 64  ; alt level mask

  byte 66 ; powerup x
  byte 7 ; powerup y
  byte 64 ; powerup mask

  byte 12 ; alternate screen

contAC
  byte $FF ; next up/down
  byte $FF ; next left/right

  byte 110 ; reset x
  byte 90 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 66 ; powerup x
  byte 6 ; powerup y
  byte 128 ; powerup mask
