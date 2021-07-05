    .text
    .global main

main:
        pushq   %rbp
        movq    %rsp, %rbp
        movss   .LC0(%rip), %xmm0
        movss   %xmm0, -4(%rbp)
        movl    $0, %eax
        popq    %rbp
        ret
.LC0:
        .long   1075042058
