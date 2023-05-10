    .global _start
_start:
_read:
    mov R7, #4
    mov R0, #0
    mov R2, #5
    ldr r1,=string

_if:
    ldrb r2, [r1]
    cmp r2 ,#'1'
    bne _Else1
    mov r7, #4
    mov r0, #1
    mov r2, #10
    ldr r1, =one
    swi 0
    B _exit
_Else1:
    mov r7, #4
    mov r0, #1
    mov r2, #10
    ldr r1, =two
    swi 0
_exit:
    mov r7, #1
    swi 0

    .data
string:.ascii	" \n "
one:.ascii "ONE \n"
two:.ascii "two \n"