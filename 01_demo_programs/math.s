/* 
1. In the code there are comments for ADDITION, SUBTRACTION, and MULTIPLICATION. Those are my demos of arithmetic instructions. (Lines 41, 49, 57)

2. For a demo of outputting r1-r3 can be see at the end of each arithmetic instruction section in the main code. (Lines 46-47, 54-55, 62-63)

3. Section 5 of the AAPCS describes how we, the programmers, are supposed to use the 16 registers. 

For instance how the first 4 registers, r0-r3, are supposed to be used as where parameters go for function calls. This is demonstrated with the printf calls in this program.

*/

// math source file
// assemble: g++ math.s -g -o math
// ( -g is optional for generating debug info )

.global main

.align 4
.section .rodata
// all constant data goes here
add_output: .asciz "%d + %d = %d\n"
sub_output: .asciz "%d - %d = %d\n"
mul_output: .asciz "%d * %d = %d\n"

.align 4
.section .bss
// All uninitialized data here

.align 4
.section .data
// Non constant and initialized data goes here


.align 4
.text
main:	
	push {lr}

	// assembly program here

	// ADDITION
    mov r1, #2
	mov r2, #3
	add r3, r2, r1

	ldr r0, =add_output
	bl printf

	// SUBTRACTION
    mov r1, #5
	mov r2, #2
	sub r3, r1, r2

	ldr r0, =sub_output
	bl printf

	// MULTIPLICATION
    ldr r1, =#5
	mov r2, #3
	mul r3, r1, r2

	ldr r0, =mul_output
	bl printf

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}
