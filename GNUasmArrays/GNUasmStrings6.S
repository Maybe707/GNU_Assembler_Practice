.data
.global x
x:
    .byte 2
    .byte 4
    .byte 3

sum: 
    .byte 0

.text
    .global _start

_start:

    mov $3, %eax
    mov $0, %ebx
    mov $x, %ecx

.top:   add (%ecx), %ebx

    add $1, %ecx
    dec %eax
    jnz .top

.done:
    
    add $'0', %ebx
    mov %ebx, (sum)

.display:

    mov $1, %rax
    mov $1, %rdi
    mov $sum, %rsi
    mov $1, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall
