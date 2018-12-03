
cont70
  byte $FF ; next up/down
  byte $F1 ; next left/right

  byte 80 ; reset x
  byte 110 ; reset y

  byte SKIPBOTH  ; powerup type

cont71
  byte $52 ; next up/down
  byte $0F ; next left/right

  byte 40 ; reset x
  byte 20 ; reset y

  byte SKIPBOTH  ; powerup type

cont72
  byte $1F ; next up/down
  byte $F3 ; next left/right

  byte 70 ; reset x
  byte 105 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 5 ; powerup y
  byte 2 ; powerup mask

cont73
  byte $4F ; next up/down
  byte $2F ; next left/right

  byte 70 ; reset x
  byte 95 ; reset y

  byte SKIPBOTH  ; powerup type

cont74
  byte $53 ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 20 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 30 ; powerup x
  byte 3 ; powerup y
  byte 4 ; powerup mask

cont75
  byte $F4 ; next up/down
  byte $6F ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont76
  byte $FF ; next up/down
  byte $F5 ; next left/right

  byte 70 ; reset x
  byte 125 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 3 ; powerup y
  byte 8 ; powerup mask
