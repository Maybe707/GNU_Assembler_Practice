.bss

    .comm num, 1

.text
    .global _start

_start:
    mov $10, %ecx
    mov $'1', %eax

.l1:

    mov %eax, num
    mov $1, %rax
    mov $1, %rdi
    push %rcx

    mov $num, %rsi
    mov $1, %rdx
    syscall

    mov num, %eax
    sub $'0', %eax
    inc %eax
    add $'0', %eax
    pop %rcx
    loop .l1

    mov $60, %rax
    xor %rdi, %rdi
    syscall
