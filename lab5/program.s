/* printf.s */
.data
.balign 4
.balign 4
message1: .asciz "Enter a Number :"
.balign 4
message2: .asciz "%d This is Leap Year\n"
.balign 4
message3: .asciz "%d This is Not Leap Year\n"
.balign 4
scan: .asciz "%d"
.balign 4
number: .word 0
.balign 4
return: .word 0

.text
.global main
.global printf
.global scanf

main:
  LDR r1, =return
  STR lr, [r1]
  LDR r0, =message1
  BL printf

  LDR r0, =scan
  LDR r1, =number
  BL scanf
  LDR r2,=number
  LDR r2,[r2]

  MOV r3,#100

  MOV r5, #400
  MOV r8,#4

 
mod_400:
  SDIV r4,r2,r5
  MUL  r6,r4,r5
  CMP  r2,r6
  BEQ printleap
  BNE mod_100
mod_100:
  SDIV r4,r2,r3
  MUL  r6,r4,r5
  CMP  r2,r6
  BEQ printnotleap
  BNE mod_4
mod_4:
  SDIV r4,r2,r8
  MUL  r6,r4,r8
  CMP  r2,r6
  BEQ  printleap
  BNE printnotleap

printnotleap:
  LDR r0, =message3
  LDR r1, =number
  LDR r1, [r1]
  BL printf

  LDR r0, =number
  LDR r0,[r0]

  LDR lr,=return
  LDR lr, [lr]
  BX lr
  B exit
printleap:
  LDR r0, =message2
  LDR r1, =number
  LDR r1, [r1]
  BL printf

  LDR r0, =number
  LDR r0, [r0]

  LDR lr, =return
  LDR lr, [lr]
  BX lr
  B exit


exit:
  MOV r7,#1
  SWI 0