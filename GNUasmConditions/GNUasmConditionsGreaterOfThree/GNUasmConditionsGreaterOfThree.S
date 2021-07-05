.data

    msg: .asciz "The largest digit is: "
    len = . - msg
    num1: .ascii   "1200"
    num2: .ascii   "7700"
    num3: .ascii   "4500"

.bss

    .comm largest, 2


.text
    .global _start

_start:

    mov   num1, %ecx
    cmp   num2, %ecx
    jg    .check_third_num
    mov   num2, %ecx

.check_third_num:

    cmp   num3, %ecx
    jg    ._exit 
    mov   num3, %ecx

    ._exit:

    mov   %ecx, (largest)
    mov   $1,   %rax
    mov   $1,   %rdi
    mov   $msg, %rsi
    mov   $len, %rdx
    syscall

    mov   $1,   %rax
    mov   $1,   %rdi
    mov   $largest, %rsi
    mov   $2,   %rdx
    syscall

    mov   $60,  %rax
    xor   %rdi, %rdi
    syscall

