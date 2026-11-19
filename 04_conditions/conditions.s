// ____ source file
// assemble: g++ ____.s -g -o ____
// ( -g is optional for generating debug info )

.global main

.align 4
.section .rodata
// all constant data goes here

output: .asciz "r1: %d\nr2: %d\n"

problem_one_output: .asciz "r0 (%d) found greater than r1 (%d)\n\tr4: %d\n\tr5: %d\n\tr6: %d\n"

problem_two_true_output: .asciz "r0 (%d) found greater than r1 (%d)\n\tr4: %d\n\tr5: %d\n"

problem_two_false_output: .asciz "r0 (%d) found less than or equal to r1 (%d)\n\tr4: %d\n"

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
    mov r5, #2

    /*      PROBLEM ONE      */
    mov r0, r4
    mov r1, r5
    
    cmp r0, r1

    blgt problem_one

    /*      PROBLEM TWO      */

    mov r0, r4
    mov r1, r5

    cmp r0, r1
    blgt problem_two_true

    // Have to do another reset then compare 
    mov r0, r4
    mov r1, r5

    cmp r0, r1
    blle problem_two_false


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


problem_two_true:
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

    ldr r0, =problem_two_true_output
    bl printf
    add sp, sp, #4      // discard the stack variables

    pop { r4, r5, pc}

problem_two_false:
    push { r4, lr}

    mov r4, r0
    add r4, r1

    // Move around all the variables for the printf call
    mov r2, r1
    mov r1, r0
    
    mov r3, r4

    push { r4 } // Because only r0-r3 are sent as parameters, we need to push the rest onto the stack to be used.

    ldr r0, =problem_two_false_output
    bl printf
    add sp, sp, #4      // discard the stack variables

    pop { r4, pc}
