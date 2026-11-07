// ____ source file
// assemble: g++ ____.s -g -o ____
// ( -g is optional for generating debug info )

.global main

.align 4
.section .rodata
// all constant data goes here
prompt: .asciz "Please input three integer values separated by a space: "

response: .asciz "Operations done with:\n\tx: %d\n\ty: %d\n\tz: %d\n"

input_pattern: .asciz "%d %d %d"

four_x_plus_eight_y_output: .asciz "four_x_plus_eight_y: %d\n"

x_left_shift_y_output: .asciz "x_left_shift_y: %d\n"

minimum_output: .asciz "minimum: %d\n"

maximum_output: .asciz "maximum: %d\n"

.align 4
.section .bss
// All uninitialized data here

.align 4
.section .data
// Non constant and initialized data goes here

value_1: .word 0
value_2: .word 0
value_3: .word 0

.align 4
.text
main:	push {lr}

	// assembly program here
	ldr r4, =value_1
	ldr r5, =value_2
    ldr r6, =value_3

	ldr r0, =prompt
	bl printf

	ldr r0, =input_pattern
	mov r1, r4
	mov r2, r5
    mov r3, r6
	bl scanf

	ldr r0, =response
	ldr r1, [r4]
	ldr r2, [r5]
    ldr r3, [r6]
	bl printf

    // Four x + Eight y
    ldr r0, [r4]
    ldr r1, [r5]
    bl four_x_plus_eight_y

    mov r1, r0
    ldr r0, =four_x_plus_eight_y_output
    bl printf

    // Left Shift By Another Register's Amount
    ldr r0, [r4]
    ldr r1, [r5]
    bl x_left_shift_y

    mov r1, r0
    ldr r0, =x_left_shift_y_output
    bl printf

    // Minimum Value
    ldr r0, [r4]
    ldr r1, [r5]
    ldr r2, [r6]
    bl minimum

    mov r1, r0
    ldr r0, =minimum_output
    bl printf

    // Maximum Value
    ldr r0, [r4]
    ldr r1, [r5]
    ldr r2, [r6]
    bl maximum

    mov r1, r0
    ldr r0, =maximum_output
    bl printf

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

four_x_plus_eight_y:
    mov r0, r0, lsl#2 // Store r0 shifted left 2 times (r0 = r0 * 2)
    add r0, r1, lsl#3 // Add r1 shifted 3 times to r0 (r0 = r0 + r1 * 8)
    mov pc, lr

x_left_shift_y:
    lsl r0, r0, r1 // Left shift r0 by r1's amount
    mov pc, lr

minimum:
    cmp r0, r1      // Compare r0 and r1
    movgt r0, r1    // If greater than flag is marked, then put r1 in r0 because it's smaller
    cmp r0, r2      // Compare r0 and r2 (r0 would have r1's value if it was replaced on the previous line)
    movgt r0, r2    // If greater than flag is marked, then put r2 in r0 because it's smaller
    mov pc, lr

maximum:
    cmp r0, r1      // Compare r0 and r1
    movlt r0, r1    // If less than flag is marked, then put r1 in r0 because it's bigger
    cmp r0, r2      // Compare r0 and r2 (r0 would have r1's value if it was replaced on the previous line)
    movlt r0, r2    // If less than flag is marked, then put r2 in r0 because it's bigger
    mov pc, lr
