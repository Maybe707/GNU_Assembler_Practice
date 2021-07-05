.data
    msg1: .ascii "Hello, programmers!\n"
    len1 = . - msg1

    msg2: .ascii "Welcome to the world of,\n"
    len2 = . - msg2
    
    msg3: .ascii "Linux assembly programming!\n"
    len3 = . - msg3

.macro write_string msg, len
    mov $1, %rax
    mov $1, %rdi
    mov $\msg, %rsi
    mov $\len, %rdx
    syscall
.endm

.text
    .global _start
    
_start:
    write_string msg1, len1
    write_string msg2, len2
    write_string msg3, len3

    mov $60, %rax
    xor %rdi, %rdi
    syscall
