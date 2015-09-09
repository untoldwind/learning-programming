~~~
  LOAD   A <- 0
  LOAD   B <- 1
  LOAD   D <- 12
  LOAD   HL <- 0x20
.loop:
  LOAD   (HL) <- B
  INC    HL
  ADD    A <- B
  LOAD   C <- A
  LOAD   A <- B
  LOAD   B <- C
  DEC    D
  JUMP   NZ, .loop

  HALT
.mem:
~~~
