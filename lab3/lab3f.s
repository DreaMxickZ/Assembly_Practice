    .global _start
_start:
_read:
	mov	R7, #3
	mov	R0, #0
	mov	R2, #10
	ldr	r1,= input_string
	swi 0

_load:
	ldr r1,=input_string
	ldr r6,=new_str
	mov r10,#0

_loop:
	ldrb r3,[r1,r10]
	add r3,r3,#5
	strb r3,[r6,r10]

	add r10,r10,#1
	ldr r7,=10
	strb r7,[r6,r10]
	add r6,r6,#1

	cmp r10,#5
	beq _write 
	B _loop

_write:
	mov	r7, #4
	mov	r0, #1
	mov	r2, #10
	ldr r1,=new_str
	swi 0


_exit:
    mov r7, #1
    swi 0

    .data
input_string:.space 5
new_str:.space 10
