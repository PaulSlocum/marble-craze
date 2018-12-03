
cont80
  byte $FF ; next up/down
  byte $1F ; next left/right

  byte 95 ; reset x
  byte 75 ; reset y

  byte SKIPBOTH  ; powerup type

cont81
  byte $F2 ; next up/down
  byte $F0 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont82
  byte $1F ; next up/down
  byte $F3 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 60 ; powerup x
  byte 6 ; powerup y
  byte 1 ; powerup mask

cont83
  byte $4F ; next up/down
  byte $2F ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont84
  byte $F3 ; next up/down
  byte $5F ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont85
  byte $FF ; next up/down
  byte $64 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont86
  byte $7F ; next up/down
  byte $F5 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 10 ; powerup y
  byte 2 ; powerup mask

cont87
  byte $F6 ; next up/down
  byte $F8 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont88
  byte $F9 ; next up/down
  byte $7F ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 60 ; powerup x
  byte 2 ; powerup y
  byte 4 ; powerup mask

cont89
  byte $8F ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 40 ; reset y

  byte SKIPBOTH  ; powerup type
