
cont30
  byte $1F ; next up/down
  byte $FF ; next left/right

  byte 75 ; reset x
  byte 87 ; reset y

  byte HPWRWALLS ; powerup type
  byte 255 ; alt level mask

  byte 48 ; powerup x
  byte 6 ; powerup y
  byte 1 ; powerup mask

cont31
  byte $F0 ; next up/down
  byte $F2 ; next left/right

  byte 100 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont32
  byte $FF ; next up/down
  byte $13 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont33
  byte $FF ; next up/down
  byte $24 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont34
  byte $FF ; next up/down
  byte $35 ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont35
  byte $FF ; next up/down
  byte $46 ; next left/right

  byte 80 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont36
  byte $7F ; next up/down
  byte $5F ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont37
  byte $86 ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type

cont38
  byte $F7 ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type
