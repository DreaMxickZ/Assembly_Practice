.global _start

_start:

_read:


        mov R7 , #3 
        mov r0 , #0
        mov r2 , #20  @ขนาด ของตัวอักษร
        ldr r1, =instr1
        swi 0


        mov R7 , #3 
        mov r0 , #0
        mov r2 , #20  @ขนาด ของตัวอักษร
        ldr r1, =instr2
        swi 0

        ldr r1,=instr1
        ldr r2,=instr2

        mov r3,#0


for_one:
        ldrb r4, [r1, r3]
        cmp r4 ,#10
        add r3 ,r3,#1
        bne for_one

        mov r5, #0


for_two: 
        ldrb r4 , [r2,r5]
        cmp r4 ,#10
        add  r5,r5 ,#1
        bne for_two
        


        mov r4 , #0
        mov r6 , #0

        sub r3 ,r3 ,#1
        sub r5 ,r5 ,#1

range: 
        cmp r4 ,r3
        add r4,r4 ,#1
        mov r6 ,#0
        mov r7 ,#0 
        
        blt _loop 
       
        b ans_no
        

_loop:
        cmp r7 ,r3
        blt compare_check
        b range

compare_check:

        ldrb r8, [r1 , r7]
        ldrb r9 ,[r2 , r6]

        add r7 ,r7 , #1

        cmp r8 ,r9
        bne set_s
        add r6 ,r6, #1

        cmp  r6,r5
        bne _loop
        b ans_yes

set_s:
        mov r6,#0
        b _loop


ans_yes:
        mov r7 ,#4
        mov r0 ,#1
        mov r2 ,#4
        ldr r1,=res_yes
        swi 0
        b _exit

ans_no:
        mov r7 ,#4
        mov r0 ,#1
        mov r2 ,#4
        ldr r1,=res_no
        swi 0
        b _exit

_exit: 
        mov r0 , r10
        mov r7 , #1
        swi 0 




        .data

instr1: .asciz "              "
instr2: .asciz "              "

res_yes : .ascii "Yes\n"
res_no : .ascii "No\n"
