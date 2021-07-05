.data

    my_string: .ascii "hello world"
    len = . - my_string

    msg_found: .ascii "found!"
    len_found = . - msg_found

    msg_notfound: .ascii "not found!"
    len_notfound = . - msg_notfound

.text
    .global _start

_start:

    mov $len, %ecx
    mov $my_string, %edi
    mov $'e', %al
    cld
    repne scasb
    je .found

    mov $1, %rax
    mov $1, %rdi
    mov $msg_notfound, %rsi
    mov $len_notfound, %rdx
    syscall
    jmp .exit

.found:

    mov $1, %rax
    mov $1, %rdi
    mov $msg_found, %rsi
    mov $len_found, %rdx
    syscall

.exit:

    mov $60, %rax
    xor %rdi, %rdi
    syscall
