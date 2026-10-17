// input_output source file
// assemble: g++ input_output.s -g -o input_output
// ( -g is optional for generating debug info )

.global main

.align 4
.section .rodata
// all constant data goes here
prompt: .asciz "Please input two integer values separated by a space: "

response: .asciz "Operations being done on: %d and %d\n"

input_pattern: .asciz "%d %d"

// Outputs for mathematical operations
sum_output: .asciz "Sum of %d and %d is %d\n"
mul_output: .asciz "Product of %d and %d is %d\n"
and_output: .asciz "Logical AND of %d and %d is %d\n"
or_output: .asciz "Logical OR of %d and %d is %d\n"

.align 4
.section .bss
// All uninitialized data here

.align 4
.section .data
// Non constant and initialized data goes here

value_1: .word 0
value_2: .word 0

.align 4
.text
main:	push {lr}

	// assembly program here
	ldr r4, =value_1
	ldr r5, =value_2

	ldr r0, =prompt
	bl printf

	ldr r0, =input_pattern
	mov r1, r4
	mov r2, r5
	bl scanf

	ldr r0, =response
	ldr r1, [r4]
	ldr r2, [r5]
	bl printf

	// Summing
	ldr r1, [r4]
	ldr r2, [r5]
	add r3, r1, r2
	ldr r0, =sum_output
	bl printf

	// Product
	ldr r1, [r4]
	ldr r2, [r5]
	mul r3, r1, r2
	ldr r0, =mul_output
	bl printf

	// AND
	ldr r1, [r4]
	ldr r2, [r5]
	and r3, r1, r2
	ldr r0, =and_output
	bl printf

	// OR
	ldr r1, [r4]
	ldr r2, [r5]
	orr r3, r1, r2
	ldr r0, =or_output
	bl printf

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}
