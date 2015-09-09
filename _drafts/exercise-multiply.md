~~~
  LOAD   A <- 6
  LOAD   B <- 0
  LOAD   C <- 37
  CALL   .multiply
  HALT

.multiply:
  LOAD   HL <- 0x0
.multiply_loop:
  SHR    A
  JUMP   NC, .multiply_skip
  ADD    HL <- BC
.multiply_skip:
  RET    Z
  SHL    C
  ROTLC  B
  JUMP   .multiply_loop
~~~
