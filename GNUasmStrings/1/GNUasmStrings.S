.data

    s1: .ascii "Hello, World\n"
    len = . - s1

.bss

    .comm s2, 20

.text

    .global _start

_start:

    mov $len, %rcx
    mov $s1,  %rsi
    mov $s2,  %rdi
    cld
    rep movsb
    

    mov $20,  %rdx
    mov $s2,  %rsi
    mov $1,   %rdi
    mov $1,   %rax
    syscall

    mov $60,  %rax
    xor %rdi, %rdi
    syscall


