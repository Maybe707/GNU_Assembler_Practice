    .text
    .global main

main:

    mov $10, %rax
    mov $20, %rbx

    add %rax, %rbx
    daa
