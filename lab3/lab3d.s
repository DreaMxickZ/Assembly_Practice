	.global _start
_start:
_read:
	mov	R7, #3
	mov	R0, #0
	mov	R2, #5
	ldr	r1,=string
	swi 0

_write:
	mov	R7, #4
	mov	R0, #1
	mov	R2, #20
	ldr	R1,=string
	swi 0
_exit:
	mov R7, #1
	swi 0

	.data
string:	.ascii	"Hello World String\n"



