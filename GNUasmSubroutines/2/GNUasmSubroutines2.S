.data
    achar: .byte '0'

.text
    .global _start

_start:
    call display
    mov  $60, %rax
    xor  %rdi, %rdi
    syscall

display:
    mov  $80, %ecx

.next:
    push  %rsi
    mov   $1, %rax
    mov   $1, %rdi
    mov   $achar, %rsi
    mov   $1, %rdx
    syscall

    pop   %rsi
    mov   (achar), %dx
    //cmpb  $0xd, (achar)
    incb  (achar)
    loop  .next
    ret
