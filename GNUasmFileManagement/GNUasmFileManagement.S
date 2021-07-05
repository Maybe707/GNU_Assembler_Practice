.data
    file_name: .asciz "myfile.txt"
    msg: .ascii "Welcome to Ravesli!"
    len = . - msg

    msg_done: .ascii "Written to file\n"
    len_done = . - msg_done

.bss
    .comm fd_out, 1
    .comm fd_in, 1
    .comm info, 26

.text
    .global _start

_start:
    mov $85, %rax
    mov $file_name, %rdi
    mov $0777, %rsi
    syscall

    mov %eax, (fd_out)

    mov $1, %rax
    mov (fd_out), %rdi
    mov $msg, %rsi
    mov $len, %rdx
    syscall

    mov $3, %rax
    mov (fd_out), %rdi
    syscall

    mov $1, %rax
    mov $1, %rdi
    mov $msg_done, %rsi
    mov $len_done, %rdx
    syscall

    mov $2, %rax
    mov $file_name, %rdi
    mov $0, %rsi
    mov $0777, %rdx
    syscall

    mov %eax, (fd_in)

    mov $0, %rax
    mov (fd_in), %rdi
    mov $info, %rsi
    mov $26, %rdx
    syscall

    mov $3, %rax
    mov (fd_in), %rdi
    syscall

    mov $1, %rax
    mov $1, %rdi
    mov $info, %rsi
    mov $26, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall
