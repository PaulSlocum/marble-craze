
cont50
  byte $1F ; next up/down
  byte $FF ; next left/right

  byte 75 ; reset x
  byte 97 ; reset y

  byte HPWRWALLS ; powerup type
  byte 255 ; alt level mask

  byte 48 ; powerup x
  byte 5 ; powerup y
  byte 1 ; powerup mask

cont51
  byte $F0 ; next up/down
  byte $2F ; next left/right

  byte 75 ; reset x
  byte 18 ; reset y

  byte SKIPBOTH  ; powerup type

cont52
  byte $FF ; next up/down
  byte $31 ; next left/right

  byte 75 ; reset x
  byte 18 ; reset y

  byte HPWR10SEC ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 11 ; powerup y
  byte 2 ; powerup mask

cont53
  byte $F4 ; next up/down
  byte $F2 ; next left/right

  byte 75 ; reset x
  byte 50 ; reset y

  byte SKIPBOTH  ; powerup type

cont54
  byte $35 ; next up/down
  byte $F2 ; next left/right

  byte 75 ; reset x
  byte 85 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 6 ; powerup y
  byte 4 ; powerup mask

cont55
  byte $4F ; next up/down
  byte $FF ; next left/right

  byte 75 ; reset x
  byte 60 ; reset y

  byte SKIPBOTH  ; powerup type
