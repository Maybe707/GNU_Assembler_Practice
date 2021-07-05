    .equ VARIABLE,    10

    .data
massage:     .asciz "Some string "
lenMsg = . - massage
array1: .long 55,65,67,76,99
value:  .byte 57
massage2:    .asciz "Second string "
lenMsg2 = . - massage2

    .LC0:

    .long -687194767
    .long 1077178531

    .bss
    .comm var1, 4
    .comm var2, 8

    .text
    .global _start

_start:

    pushq   %rbp
    movq    %rsp, %rbp
    movsd   .LC0(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    movl    $0, %eax
    popq    %rbp
    ret

    mov $0b10000000, %al
    mov $0b00000001, %bl

    sub %bl, %al

    mov $0b00000000, %al
    mov $0b00000001, %bl

    sub %bl, %al

    mov $0b00111111, %al
    mov $0b00000001, %bl

    add %bl, %al

    mov $0b11111101, %ax
    mov $0b00000101, %bl

    add %bl, %al

    mov $0b11111101, %al
    mov $0b00011110, %bl

    add %bl, %al

    mov $0b11111100, %al
    mov $0b00000101, %bl

    add %bl, %al

    mov $0b01000000, %al
    mov $0b11000000, %bl

    add %bl, %al

    mov $0b11100000, %al
    mov $0b11000000, %bl

    add %bl, %al

    mov $0b01100000, %al
    mov $0b11100000, %bl

    add %bl, %al

    mov $0b11100000, %al
    mov $0b11100000, %bl

    add %bl, %al

    mov $0b11000000, %al
    mov $0b11000000, %bl

    add %bl, %al

    mov $0b11111111, %al
    mov $0b00000001, %bl

    add %bl, %al

    mov $0b11111111, %al
    mov $0b10000000, %bl

    add %bl, %al

    mov $0b11111111, %al
    mov $0b10000001, %bl

    add %bl, %al

    mov $0b11111111, %al
    mov $0b11000001, %bl

    add %bl, %al

    mov $0b11111111, %al
    mov $0b01000001, %bl

    add %bl, %al

    mov $0b01000000, %al
    mov $0b01000000, %bl

    add %bl, %al

    mov $0b01100000, %al
    mov $0b01100000, %bl

    add %bl, %al

    mov $0b01111111, %al
    mov $0b00000001, %bl

    add %bl, %al

    mov $0b10000000, %al
    mov $0b10000000, %bl

    add %bl, %al

    mov $100, %al
    mov $200, %bl
    sub %bl, %al

    xor %rax, %rax    # обнуление регистров
    xor %rbx, %rbx

    mov $5, %al
    mov $-7, %bl
    and %al, %bl
    and $0x01, %al
    or %al, %bl
    xor %al, %bl
    test %al, %bl
    not %bl
    mul %bl

    xor %rax, %rax
    xor %rbx, %rbx

    mov $5, %al      # обнуление регистров
    mov $-7, %bl
    imul %bl

    xor %rax, %rax    # обнуление регистров
    xor %rbx, %rbx

    mov $10, %al
    mov $-2, %bl
    mul %bl
    mov $0xFF, %ah

    xor %rax, %rax    # обнуления кода возврата

    mov $60, %rax
    xor %rdi, %rdi
    syscall
