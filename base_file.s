// ____ source file
// assemble: g++ ____.s -g -o ____
// ( -g is optional for generating debug info )

.global main

.align 4
.section .rodata
// all constant data goes here

.align 4
.section .bss
// All uninitialized data here

.align 4
.section .data
// Non constant and initialized data goes here

.align 4
.text
main:	push {lr}

	// assembly program here

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}
