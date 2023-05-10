.data
  .balign 4

char:    .asciz  "%c"
string:  .asciz  "%s"
integer: .asciz  "%d"
longint: .asciz  "%ld"
float:   .asciz  "%f"
double:  .asciz  "%lf"
newline: .asciz  "\n"
return:  .word 0

msg_input1: .asciz "Enter input 1: "
msg_input2: .asciz "Enter input 2: "
msg_output1: .asciz "Subtraction : %d \n"
msg_output2: .asciz "Ans Mul : %d \n"

data1: .word 0
data2: .word 0
data3: .word 0
data4: .word 0

  .text
  .global main
  .global printf
  .global scanf

main:
  ldr r1, =return   @ r1 = return
  str lr, [r1] 
  ldr r0, =msg_input1  @ r0 = msg_input1
  bl printf  @ printf(r0)

  ldr r0, =integer  @ r0 = %d
  ldr r1, =data1  @ r1 = &data1
  bl scanf  @ scanf("%d", &data1)

  ldr r1, =return
  str lr, [r1]
  ldr r0, =msg_input2  @ r0 = msg_input2
  bl printf  @ printf(r0) 

  ldr r0, =integer  @ r0 = %d
  ldr r1, =data2  @ r1 = &data2
  bl scanf  @ scanf("%d", &data2)

  @---------- sum --------------------
  ldr r1, =data1  @ r1 = &data1
  ldr r1, [r1]   @ load value of data1 into r1
  ldr r2, =data2  @ r2 = &data2
  ldr r2, [r2]   @ load value of data2 into r2
  sub r3, r1, r2  @ r3 = r1 + r2

  @---------- print ------------------  
  ldr r4, =data3  @ r4 = &data3
  str r3, [r4]   @ store r3 into data1
  ldr r0, =msg_output1  @ r0 = msg_output
  ldr r1, =data3  @ r1 = &data1
  ldr r1, [r1]   @ load value of data1 into r1
  bl printf  @ printf(msg_output, data1)


exit:
  mov r0, #0 @ --- good return code
  mov r7, #1
  swi 0