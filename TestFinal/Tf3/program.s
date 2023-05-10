 .data
.balign

int: .asciz "%c"

msg1: .asciz "Enter first number: "
msg2: .asciz "Enter second number: "
msg3: .asciz "Additon : %d \n"


tzero: .ascii ""
oone: .ascii "*\n"
otwo: .ascii "**\n"



data1: .word 0

return: .word 0



    .text
    .global main
    .global printf
    .global scanf

main:

    ldr r1 , =return
    ldr r1 , [r1]
    ldr r0 , =msg1
    bl printf

    ldr r0, =int
    ldr r1, =data1  
    bl scanf  

    
    


    b compare

compare:
    ldr r1, =data1
    ldr r1, [r1]
    
	cmp r1, #'1'
    beq one

    cmp r1, #'2'
    beq two

    b exit
    


    
one:
    ldr r0 , =oone
    
    bl printf

two:
    ldr r0 , =oone
    
    bl printf

    ldr r1 , =otwo
    
    bl printf

    ldr r1 , oone
    bl printf



exit:
  mov r0, #0 
  mov r7, #1
  swi 0