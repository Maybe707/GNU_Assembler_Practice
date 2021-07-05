.text
    .global _start

_start:

    mov    $4, %esi
    mov    $5, %ecx
    clc

.add_loop:

    mov    num1(,%esi,1), %al
    adc    num2(,%esi,1), %al
    aaa
    pushf
    or     $0x30, %al
    popf

    mov    %al, sum(, %esi, 1)
    dec    %esi
    loop   .add_loop

    mov    $len, %edx
    mov    $msg, %ecx
    mov    $1,   %ebx
    mov    $4,   %eax
    int    $0x80

    mov    $5,   %edx
    mov    $sum, %ecx
    mov    $1,   %ebx
    mov    $4,   %eax
    int    $0x80

    mov    $1,   %eax
    int    $0x80

    msg:   .asciz "The Sum is:\n"
    len=   . - msg
    num1:  .ascii "12345"
    num2:  .ascii "23456"
    sum:   .ascii "     "  
