.data
    msg: .ascii "Factorial 3 is:\n"
    len = . - msg

.bss
    .comm fact, 1

.text
    .global _start

_start:
    mov $3, %bx
    call proc_fact
    add $0x30, %ax
    mov %ax, (fact)

    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $len, %rdx
    syscall

    mov $1, %rax
    mov $1, %rdi
    mov $fact, %rsi
    mov $1, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall

proc_fact:
    cmp $1, %bl
    jg  do_calculation
    mov $1, %ax
    ret

do_calculation:
    dec %bl
    call proc_fact
    inc %bl
    mul %bl
    ret
