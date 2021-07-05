.data
    
    msg: .ascii "The sum is:\n"
    len = . - msg

.bss

    .comm res, 1

.text
    .global _start

_start:

    mov $'4', %ecx
    sub $'0', %ecx

    mov $'5', %edx
    sub $'0', %edx

    call sum
    mov %eax, (res)
    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $len, %rdx
    syscall

    mov $1, %rax
    mov $1, %rdi
    mov $1, %rdx
    mov $res, %rsi
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall 
sum:
    mov %ecx, %eax
    add %edx, %eax
    add $'0', %eax
    ret

    
