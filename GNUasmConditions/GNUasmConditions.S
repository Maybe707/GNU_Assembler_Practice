.text
    .global _start

_start:

    mov $0, %edx
    
.l1:

    inc %edx
    cmp $5, %edx
    jle .l1 

    mov $60, %rax
    xor %rdi, %rdi
    syscall
