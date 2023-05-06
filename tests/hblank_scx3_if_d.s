; pass - dmg

; ld happens after interrupt

.include "header.inc"

main:
  reset_lcd_for_test

  ; line 0
  set_stat_int_hblank
  set_ie_stat
  ld a, 3
  ldh (SCX), a
  nops 98

  ; line 1
  clear_if
  ei
  xor a
  ld hl, $FF0F
  nops 55
  ld a, (hl)
  di
  test_fail

.org STAT_INT_VECTOR
  test_finish_a $0