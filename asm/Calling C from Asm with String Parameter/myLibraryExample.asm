; See Readme for instructions

  global _main
  extern _doo

  section .text
_main:
  sub     rsp, 8

  lea     rdi, [message]        ; Use this instead of 'mov rdi, message'
  call    _doo
  add     rsp, 8
  ret

  section .data
message:
default rel                     ; Add 'default rel' under label
  db   "Hey there, World!",0