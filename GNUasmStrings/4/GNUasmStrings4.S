.data

    s1: .ascii "hello, there!"
    lens1 = . - s1

    s2: .ascii "hello, there!"
    lens2 = . - s2

    msg_eq: .ascii "Strings are equal!"
    len_eq = . - msg_eq

    msg_neq: .ascii "Strings are not equal!"
    len_neq = . - msg_neq

.text
    .global _start

_start:
    
    mov   $s1, %esi
    mov   $s2, %edi
    mov   $lens2, %ecx
    cld
    repe   cmpsb
    jecxz  .equal

    mov   $1, %rax
    mov   $1, %rdi
    mov   $msg_neq, %rsi
    mov   $len_neq, %rdx
    syscall
    jmp   .exit

.equal:

    mov   $1, %rax
    mov   $1, %rdi
    mov   $msg_eq, %rsi
    mov   $len_eq, %rdx
    syscall

.exit:

    mov   $60, %rax
    xor   %rdi, %rdi
    syscall
