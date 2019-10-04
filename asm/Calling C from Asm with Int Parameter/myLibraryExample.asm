; See Readme for instructions

  global _main
  extern _foo

  section .text
_main:
  sub     rsp, 8

  mov     rdi, 0x55        ; Use this instead of 'mov rdi, message'
  call    _foo
  add     rsp, 8
  ret

  section .data
message:
default rel                     ; Add 'default rel' under label
  db   0x2