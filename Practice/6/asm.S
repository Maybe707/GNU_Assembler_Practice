.text
    .globl _start
_start:

    movl  var, %eax
    mov  $var, %rax
    mov  (%rax), %rbx
    mov   %rax, %rsi
    lea  (%rax), %rbx
    movl  $0x20, var
    mov  var, %rax
    lea   var, %eax
    mov  (%eax), %rbx
    lea  0x200, %rsi
    mov  $var, %rax

    mov $60, %rax
    xor %rdi, %rdi
    syscall

    .data
var:   .long 0x00000072
