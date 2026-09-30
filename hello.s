.global _start

.section .data
msg:
    .ascii "Hello, ARM64\n"


.section .text
_main:
    mov x0, #1          // stdout
    ldr x1, =msg
    mov x2, #14
    mov x8, #64         // syscall: write
    svc #0

    mov x0, #0
    mov x8, #93         // syscall: exit
    svc #0
