.data
.balign

int: .asciz "%d"

msg1: .asciz "Enter first number: "
msg2: .asciz "Enter second number: "
msg3: .asciz "Additon : %d \n"


data1: .word 0
data2: .word 0
data3: .word 0
data4: .word 0
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

    
    ldr r0 , =msg2
    bl printf

    ldr r0, =int
    ldr r1, =data2 
    bl scanf  



    b calcurate
calcurate:
    ldr r1 , =data1
    ldr r2 , =data2
    ldr r1 , [r1]
    ldr r2 , [r2]

    add r3 , r1 ,r2

    b print

    
print:
    ldr r4 ,=data3
    str r3 , [r4]

    ldr r0 , =msg3
    ldr r1 , =data3
    ldr r1,[r1]
    bl printf


exit:
  mov r0, #0 
  mov r7, #1
  swi 0