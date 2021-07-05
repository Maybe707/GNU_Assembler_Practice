    .global _start

_start:

    mov $12, %rax
    mov $0x4020ff, %rdi
    syscall

    add $256, %rax
    mov %rax, %rdi
    mov $12, %rax
    syscall

    mov %rax, %rdi
    mov $16, %rcx
    sub $4, %rdi
    mov $22, %rax
    std
    rep stosl
    cld

    mov $60, %rax
    xor %rdi, %rdi
    syscall
