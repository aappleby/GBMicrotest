.include "header.inc"

main:
  lcd_off_unsafe

  load_sprite 0 0 0 0 0

  ld a, 7
  ldh (SCX), a

  lcd_on_sprites
  nops 174
  test_finish_stat $83