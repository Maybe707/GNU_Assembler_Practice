.data
    msg: .ascii "Allocated 16 kb of memory!\n"
    len = . - msg

.text
    .global _start

_start:

    mov $12, %rax
    xor %rdi, %rdi
    syscall

    add $64, %rax
    mov %rax, %rdi
    mov $12, %rax
    syscall

    cmp $0, %eax
    jl  .exit
    mov %eax, %edi
    sub $4, %edi
    mov $16, %ecx
    mov $77, %eax
    // xor %eax, %eax
    std
    rep stosl
    cld

    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $len, %rdx
    syscall

.exit:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
