.data
even_msg:  .asciz  "Even Number!"
len1 =     . - even_msg

odd_msg:   .asciz  "Odd Number!"
len2 =     . - odd_msg

.text
    .global _start

_start:

    mov    $0x9, %ax
    test    $1,  %ax
    jz     .evnn 
    mov    $1,  %rax
    mov    $1,  %rdi
    mov    $odd_msg, %rsi
    mov    $len2, %rdx
    syscall
    jmp    outprog

.evnn:

    mov    $0x09, %ah
    mov    $1,   %rax
    mov    $1,   %rdi
    mov    $even_msg, %rsi
    mov    $len1, %rdx
    syscall
    
outprog:

    mov    $60, %rax
    xor    %rdi, %rdi
    syscall
    
    
    
    

