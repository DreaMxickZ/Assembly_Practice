	.global _start
_start:
_read:
	mov	R7, #3
	mov	R0, #0
	mov	R2, #1
	ldr	r1,= number
	swi 0
_Cmp:
    ldrb r1, [r1]
    cmp r1, #'0'
    beq _zero
	cmp r1, #'1'
    beq _One
    cmp r1, #'2'
    beq _two
    cmp r1, #'3'
    beq _three
    cmp r1, #'4'
    beq _four
    cmp r1, #'5'
    beq _five
    cmp r1, #'6'
    beq _six
    cmp r1, #'7'
    beq _seven
    cmp r1, #'8'
    beq _eight
    cmp r1, #'9'
    beq _nine

_zero:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, = zero
    swi 0
    B _exit

_One:
    mov r7, #4
    mov r0, #1
    mov r2, #2
    ldr r1, = one
    swi 0
    B _exit

_two:
    mov r7, #4
    mov r0, #1
    mov r2, #4
    mov r1, =one
    ldr r1, = two
    swi 0
    B _exit

_three:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, = three
    swi 0
    B _exit

_four:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, = four
    swi 0
    B _exit

_five:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, = five
    swi 0
    B _exit

_six:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, = six
    swi 0
    B _exit

_seven:
    mov r7, #4
    mov r0, #1
    mov r2, #1000
    ldr r1, = seven
    swi 0
    B _exit

_eight:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, = eight
    swi 0
    B _exit

_nine:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, = nine
    swi 0
    
_exit:
    mov r7, #1
    swi 0

    .data
number:.space 1
zero: .ascii ""
one: .ascii "*\n"
two: .ascii "**\n"
three: .ascii "***\n"
four: .ascii "****\n"
five: .ascii "*****\n"
six: .ascii "******\n"
seven: .ascii "*******\n"
eight: .ascii "********\n"
nine: .ascii "*********\n"