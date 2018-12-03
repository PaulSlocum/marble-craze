
cont90
  byte $1F ; next up/down
  byte $FF ; next left/right

  byte 106 ; reset x
  byte 90 ; reset y

  byte HPWRUP ; powerup type
  byte 255 ; alt level mask

  byte 63 ; powerup x
  byte 7 ; powerup y
  byte 1 ; powerup mask

cont91
  byte $F0 ; next up/down
  byte $2F ; next left/right

  byte 60 ; reset x
  byte 75 ; reset y

  byte HPWRSTOP ; powerup type
  byte 255 ; alt level mask

  byte 63 ; powerup x
  byte 7 ; powerup y
  byte 2 ; powerup mask

cont92
  byte $3F ; next up/down
  byte $F1 ; next left/right

  byte 60 ; reset x
  byte 75 ; reset y

  byte HPWRUP ; powerup type
  byte 255 ; alt level mask

  byte 36 ; powerup x
  byte 10 ; powerup y
  byte 4 ; powerup mask

cont93
  byte $A2 ; next up/down
  byte $F4 ; next left/right

  byte 120 ; reset x
  byte 65 ; reset y

  byte HPWRRIGHT ; powerup type
  byte 255 ; alt level mask

  byte 45 ; powerup x
  byte 8 ; powerup y
  byte 8 ; powerup mask

cont94
  byte $5F ; next up/down
  byte $3F ; next left/right

  byte 82 ; reset x
  byte 70 ; reset y

  byte HPWRUP ; powerup type
  byte 255 ; alt level mask

  byte 51 ; powerup x
  byte 8 ; powerup y
  byte 16 ; powerup mask

cont95
  byte $F4 ; next up/down
  byte $F6 ; next left/right

  byte 85 ; reset x
  byte 70 ; reset y

  byte HPWRSTOP ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 8 ; powerup y
  byte 32 ; powerup mask

cont96
  byte $7F ; next up/down
  byte $5F ; next left/right

  byte 90 ; reset x
  byte 70 ; reset y

  byte SKIPBOTH  ; powerup type

cont97
  byte $F6 ; next up/down
  byte $F8 ; next left/right

  byte 90 ; reset x
  byte 78 ; reset y

  byte HPWRRIGHT ; powerup type
  byte 255 ; alt level mask

  byte 72 ; powerup x
  byte 7 ; powerup y
  byte 128 ; powerup mask

cont98
  byte $FF ; next up/down
  byte $79 ; next left/right

  byte 120 ; reset x
  byte 80  ; reset y

  byte SKIPBOTH  ; powerup type

cont99
  byte $AF ; next up/down
  byte $8F ; next left/right

  byte 107 ; reset x
  byte 85 ; reset y

  byte HPWRUP ; powerup type
  byte 255 ; alt level mask

  byte 70 ; powerup x
  byte 7 ; powerup y
  byte 64 ; powerup mask

cont9A
  byte $F9 ; next up/down
  byte $FF ; next left/right

  byte 70 ; reset x
  byte 90 ; reset y

  byte SKIPBOTH  ; powerup type
