; pass - dmg

.include "header.inc"

main:
  di
  lcd_off_unsafe
  lcd_on

  xor a
  ldh (DIV), a

  set_ie_vblank
  clear_if
  ei

  xor b
- nops 100
  dec b
  jr nz, -

  test_fail

.org VBLANK_INT_VECTOR
  nops 28
  test_finish_div 0
