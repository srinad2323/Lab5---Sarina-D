.section .data
Numbers:
 .long 1
 .long 15
 .long 4
 .long 2
 .long 7
 .long 9
 .long 23
 .long 7
 .long 3
 .long 11
Array_length:
 .long 10

.section .text
.globl search

search:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movl $1, -8(%rbp)
    movl Numbers(%rip), %eax
    movl %eax, -4(%rbp)
    jmp search_check

search_loop:
    movl -8(%rbp), %eax
    leaq Numbers(%rip), %rdx
    movl (%rdx,%rax,4), %eax
    cmpl -4(%rbp), %eax
    jle search_skip
    movl %eax, -4(%rbp)

search_skip:
    addl $1, -8(%rbp)

search_check:
    movl Array_length(%rip), %ecx
    cmpl %ecx, -8(%rbp)
    jle search_loop
    
    movl -4(%rbp), %eax
    leave
    ret

.section .note.GNU-stack,"",@progbits