
contE0
  byte $FF ; next up/down
  byte $1F ; next left/right

  byte 75 ; reset x
  byte 85 ; reset y

  byte SKIPBOTH  ; powerup type

contE1
  byte $F2 ; next up/down
  byte $F0 ; next left/right

  byte 60 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type

contE2
  byte $13 ; next up/down
  byte $FF ; next left/right

  byte 53 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type

contE3
  byte $2F ; next up/down
  byte $F4 ; next left/right

  byte 60 ; reset x
  byte 86 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 35 ; powerup x
  byte 4 ; powerup y
  byte 2 ; powerup mask

contE4
  byte $FF ; next up/down
  byte $35 ; next left/right

  byte 70 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type

contE5
  byte $F6 ; next up/down
  byte $4F ; next left/right

  byte 85 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type

contE6
  byte $57 ; next up/down
  byte $FF ; next left/right

  byte 85 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type

contE7
  byte $6F ; next up/down
  byte $8F ; next left/right

  byte 79 ; reset x
  byte 99 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 50 ; powerup x
  byte 4 ; powerup y
  byte 8 ; powerup mask

contE8
  byte $FF ; next up/down
  byte $97 ; next left/right

  byte 30 ; reset x
  byte 40 ; reset y

  byte SKIPBOTH  ; powerup type

contE9
  byte $FA ; next up/down
  byte $F8 ; next left/right

  byte 60 ; reset x
  byte 120 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 35 ; powerup x
  byte 3 ; powerup y
  byte 16 ; powerup mask

contEA
  byte $9F ; next up/down
  byte $FF ; next left/right

  byte 60 ; reset x
  byte 90 ; reset y

  byte HPWRKEY ; powerup type
  byte 128 ; alt level mask

  byte 35 ; powerup x
  byte 5 ; powerup y
  byte 128 ; powerup mask

  byte 11 ; alternate screen

contEB
  byte $CF ; next up/down
  byte $FF ; next left/right

  byte 60 ; reset x
  byte 50 ; reset y

  byte SKIPBOTH  ; powerup type

contEC
  byte $FB ; next up/down
  byte $FF ; next left/right

  byte 60 ; reset x
  byte 80 ; reset y

  byte SKIPBOTH  ; powerup type
