// ____ source file
// assemble: g++ ____.s -g -o ____
// ( -g is optional for generating debug info )

.global main

.align 4
.section .rodata
// all constant data goes here

output: .asciz "r1: %d\nr2: %d\n"

problem_one_output: .asciz "r0 (%d) found greater than r1 (%d)\n\tr4: %d\n\tr5: %d\n\tr6: %d\n"

problem_two_output: .asciz "r0 (%d) found greater than r1 (%d)\n\tr4: %d\n\tr5: %d\n"

.align 4
.section .bss
// All uninitialized data here

.align 4
.section .data
// Non constant and initialized data goes here

.align 4
.text
main:
    push { r4, r5, r6, lr}

	// assembly program here
	mov r4, #1
    mov r5, #0

    mov r0, r4
    mov r1, r5
    
    cmp r0, r1

    blgt problem_one

    ldr r0, =output
    mov r1, r4
    mov r2, r5
    bl printf

    mov r0, r4
    mov r1, r5

    cmp r0, r1
    blgt problem_two

	mov r0, #0 // return code for your program (must be 8 bits)
	pop { r4, r5, r6, pc }

problem_one:
    push { r4, r5, r6, lr}

    mov r4, #123
    mov r5, r4, lsl#1
    mov r6, r5
    add r6, r0
    add r6, r1

    // Move around all the variables for the printf call
    mov r2, r1
    mov r1, r0

    mov r3, r4
    mov r4, r5
    mov r5, r6

    push { r4, r5 } // Because only r0-r3 are sent as parameters, we need to push the rest onto the stack to be used.

    ldr r0, =problem_one_output
    bl printf
    add sp, sp, #8      // discard the stack variables

    pop { r4, r5, r6, pc}

problem_two:
    push { r4, r5, lr}

    mov r4, #123
    mov r5, r4, lsl#1
    add r5, r4

    // Move around all the variables for the printf call
    mov r2, r1
    mov r1, r0
    
    mov r3, r4
    mov r4, r5

    push { r4 } // Because only r0-r3 are sent as parameters, we need to push the rest onto the stack to be used.

    ldr r0, =problem_two_output
    bl printf
    add sp, sp, #4      // discard the stack variables

    pop { r4, r5, pc}
