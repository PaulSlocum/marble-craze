
contF0
  byte $FF ; next up/down
  byte $F1 ; next left/right

  byte 35 ; reset x
  byte 37 ; reset y

  byte SKIPBOTH  ; powerup type

contF1
  byte $FF ; next up/down
  byte $02 ; next left/right

  byte 75 ; reset x
  byte 22 ; reset y

  byte HPWR20PTS ; powerup type
  byte 255 ; alt level mask

  byte 48 ; powerup x
  byte 3 ; powerup y
  byte 16 ; powerup mask

contF2
  byte $F8 ; next up/down
  byte $13 ; next left/right

  byte 75 ; reset x
  byte 59 ; reset y

  byte SKIPBOTH  ; powerup type

contF3
  byte $F7 ; next up/down
  byte $2F ; next left/right

  byte 75 ; reset x
  byte 48 ; reset y

  byte HPWR50PTS ; powerup type
  byte 255 ; alt level mask

  byte 52 ; powerup x
  byte 8 ; powerup y
  byte 2 ; powerup mask

contF4
  byte $F5 ; next up/down
  byte $F6 ; next left/right

  byte 50 ; reset x
  byte 97 ; reset y

  byte SKIPBOTH  ; powerup type

contF5
  byte $4F ; next up/down
  byte $FF ; next left/right

  byte 36 ; reset x
  byte 35 ; reset y

  byte HPWR100PTS ; powerup type
  byte 255 ; alt level mask

  byte 52 ; powerup x
  byte 9 ; powerup y
  byte 4 ; powerup mask

contF6
  byte $2A ; next up/down
  byte $47 ; next left/right

  byte 45 ; reset x
  byte 87 ; reset y

  byte SKIPBOTH  ; powerup type

contF7
  byte $3B ; next up/down
  byte $8F ; next left/right

  byte 75 ; reset x
  byte 84 ; reset y

  byte SKIPBOTH  ; powerup type

contF8
  byte $2A ; next up/down
  byte $57 ; next left/right

  byte 110 ; reset x
  byte 40 ; reset y

  byte SKIPBOTH  ; powerup type

contF9
  byte $FD ; next up/down
  byte $FA ; next left/right

  byte 75 ; reset x
  byte 97 ; reset y

  byte SKIPBOTH  ; powerup type

contFA
  byte $6E ; next up/down
  byte $9C ; next left/right

  byte 75 ; reset x
  byte 97 ; reset y

  byte SKIPBOTH  ; powerup type

contFB
  byte $7F ; next up/down
  byte $AF ; next left/right

  byte 75 ; reset x
  byte 47 ; reset y

  byte SKIPBOTH  ; powerup type

contFC
  byte $CC ; next up/down
  byte $AF ; next left/right

  byte 35 ; reset x
  byte 87 ; reset y

  byte SKIPBOTH  ; powerup type

contFD
  byte $9F ; next up/down
  byte $FE ; next left/right

  byte 75 ; reset x
  byte 123 ; reset y

  byte SKIPBOTH  ; powerup type

contFE
  byte $AF ; next up/down
  byte $DF ; next left/right

  byte 73 ; reset x
  byte 87 ; reset y

  byte HPWR50PTS ; powerup type
  byte 255 ; alt level mask

  byte 65 ; powerup x
  byte 4 ; powerup y
  byte 8 ; powerup mask

contFF
  byte $BF ; next up/down
  byte $EF ; next left/right

  byte 45 ; reset x
  byte 32 ; reset y

  byte SKIPBOTH  ; powerup type
