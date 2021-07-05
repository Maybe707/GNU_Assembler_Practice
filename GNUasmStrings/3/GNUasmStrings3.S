.data

    s1: .ascii "RRR"
    len = . - s1

.bss
    
    .comm s2, 30

.text
    .global _start

_start:

    mov $len, %ecx
    mov $s1,  %esi
    mov $s2,  %edi

.loop_here:

    lodsb
    or  $0x20, %al
    stosb
    loop .loop_here
    cld
    mov $14, %rcx
    rep movsb

    mov $50, %rdx
    mov $s2, %rsi
    mov $1,  %rax
    mov $1,  %rdi
    syscall

    mov $60, %rax
    mov %rdi, %rdi
    syscall
