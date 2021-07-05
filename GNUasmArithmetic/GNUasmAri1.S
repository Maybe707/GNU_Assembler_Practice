.equ SYS_READ,  0
.equ SYS_EXIT,  60
.equ SYS_WRITE, 1
.equ STDIN,     0
.equ STDOUT,    1

.data
msg1: .asciz "Enter a digit "
.byte 0xA,0xD
len1 = . - msg1

msg2: .asciz "Please enter a second digit"
.byte 0xA,0xD
len2 = . - msg2

msg3: .asciz "The sum is: "
len3 = . - msg3

array1: .long 0, 0
array2: .long 0, 0
array3: .long 0, 0
array4: .ascii "0"

.bss
.comm num1, 4
.comm num2, 4
.comm res, 1

.text
    .global _start

_start:

    mov $SYS_WRITE, %rax
    mov $STDOUT, %rdi
    mov $msg1, %rsi
    mov $len1, %rdx
    syscall

    mov $SYS_READ, %rax
    mov $STDIN, %rdi
    mov $array1, %rsi
    mov $20, %rdx
    syscall

    mov $SYS_WRITE, %rax
    mov $STDOUT, %rdi
    mov $msg2, %rsi
    mov $len2, %rdx
    syscall

    mov $SYS_READ, %rax
    mov $STDIN, %rdi
    mov $array2, %rsi
    mov $20, %rdx
    syscall

    mov $SYS_WRITE, %rax
    mov $STDOUT, %rdi
    mov $msg3, %rsi
    mov $len3, %rdx
    syscall
/*
    mov $3, %rdi
    mov $1, %rdx
    mov $1, %r8b
.loop1:
    mov array1(%rdx), %al
    sub $'0', %al
    mul %r8b
    mov %al, array3(%rdi)
    mov %r8b, %al
    mov $10, %r9b
    mul %r9b
    mov %al, %r8b
    dec %rdx
    dec %rdi
    cmp $-1, %rdx
    jnz .loop1

    mov $1, %rdx
    mov $1, %r8b
.loop2:
    mov array2(%rdx), %al
    sub $'0', %al
    mul %r8b
    mov %al, array3(%rdi)
    mov %r8b, %al
    mov $10, %r9b
    mul %r9b
    mov %al, %r8b
    dec %rdx
    dec %rdi
    cmp $-1, %rdx
    jnz .loop2
*/

    mov $1, %rdx
    movl $0, array3(%rdx)
    dec %rdx
    movl $0, array3(%rdx)

    mov $1, %rdx
.loop5:
    cmp $-1, %rdx
    jz .loop7
    mov array1(%rdx), %r8b
    mov array2(%rdx), %r9b
    sub $'0', %r8b
    sub $'0', %r9b
    add %r8b, %r9b
    cmp $9, %r9b
    jl .loop6

.loop6:
    mov %r9w, %ax
    mov $10, %r10b
    div %r10b
    add %ah, array3(%rdx)
    dec %rdx
    add %al, array3(%rdx)
    jmp .loop5

.loop7:
    mov $0, %r9
    mov $0, %r8b
.loop8:
    cmp $2, %r9
    jz .loop9
    add $'0', array3(%r9)
    movb array3(%r9), %r8b
    mov %r8b, (array4)
    inc %r9
    mov $SYS_WRITE, %rax
    mov $STDOUT, %rdi
    mov $array4, %rsi
    mov $2, %rdx
    syscall
    jmp .loop8

/*
    mov $3, %rdi
.loop3:
    mov array3(%rdi), %al
    sub $0, %al
    add %al, (num1)
    dec %rdi
    cmp $-1, %rdi
    jnz .loop3

    mov $SYS_WRITE, %rax
    mov $STDOUT, %rdi
    mov $num1, %rsi
    mov $1, %rdx
    syscall
*/
/*    mov (array1), %rax
    sub $'0', %rax

    mov (array2), %rdi
    sub $'0', %rdi

    add %rdi, %rax

    add $'0', %rax

    mov %rax, (res)

    mov $SYS_WRITE, %rax
    mov $STDOUT, %rdi
    mov $res, %rsi
    mov $1, %rdx
    syscall    */

.loop9:
exit:

    mov $SYS_EXIT, %rax
    xor %rdi, %rdi
    syscall
