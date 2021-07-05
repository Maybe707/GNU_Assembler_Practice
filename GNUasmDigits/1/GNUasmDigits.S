.data

    msg: .asciz "The Result is:\n"
    len = . - msg

.bss

    .comm res, 1

.text
    .global _start

_start:

    sub   %ah, %ah
    mov   $'1', %al
    sub   $'5', %al
    aas
    or    $0x30, %al
    mov   %ax, (res)

    mov   $4, %eax
    mov   $1, %ebx
    mov   $msg, %ecx
    mov   $len, %edx
    int   $0x80

    mov   $4, %eax
    mov   $1, %ebx
    mov   $res, %ecx
    mov   $1, %edx
    int   $0x80

    mov   $1, %eax
    xor   %edi, %edi
    int   $0x80    












