; pass - dmg

.include "header.inc"

; LCD on -> HBLANK int

;-------------------------------------------------------------------------------

main:
  di
  clear_if

  lcd_off_unsafe
  lcd_on

  nops 114

  ld a, 4
  ldh (SCX), a

  set_stat_int_hblank
  set_ie_stat
  ei

  xor a
.repeat 200
  inc a
.endr

  test_fail

.org STAT_INT_VECTOR
  test_finish_a 46

;-------------------------------------------------------------------------------
