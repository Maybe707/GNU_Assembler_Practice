    .globl _start

_start:

    mov     $0x9e, %rax
    mov     $4098, %rdi
    mov     %rsp, %rsi
    syscall

    mov     $10, %ax
    mov     %ax, %fs:0x4
    movl     $1, %fs:0
    pushq $0x8
    mov     %fs:-0x8, %rax

    mov     $60, %rax
    xor     %rdi, %rdi
    syscall

    .data

var:    .long 100
var2:   .long 300
