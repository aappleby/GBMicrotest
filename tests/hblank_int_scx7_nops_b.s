.include "header.inc"

main:
  nops 123

  ld a, 7
  ldh (SCX), a
  ld hl, $FF0F

  set_stat_int_hblank
  set_ie_stat
  clear_if
  ei

  xor a
  ldh (DIV), a

  nops 39

  di
  test_fail

.org STAT_INT_VECTOR
  nops 17
  test_finish_div 1