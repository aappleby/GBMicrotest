.include "header.inc"

main:
  // turn lcd off
  ld a, $00;
  ldh ($40), a;

  // enable cart ram
  ld a, $0A
  ld ($0000), a

  // sentinel bytes already in rom







  // copy dma func to zram
  ld hl, $FF90;
  ld a, $E0;
  ld (hl+), a;
  ld a, $46;
  ld (hl+), a;
  ld a, $3E;
  ld (hl+), a;
  ld a, $28;
  ld (hl+), a;
  ld a, $3D;
  ld (hl+), a;
  ld a, $20;
  ld (hl+), a;
  ld a, $FD;
  ld (hl+), a;
  ld a, $C9;
  ld (hl+), a;

  // call dma func
  ld a, $10;
  call $FF90;

  // read endpoints of oam
  ld a, $00
  ld hl, $FE00;
  add (hl);
  ld hl, $FE9F;
  add (hl);
  ld b, a

  // turn lcd on
  ld a, $91
  ldh ($40), a

  // check result
  ld a, b
  test_finish_a $99

.org $1000
.db $27 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $72
