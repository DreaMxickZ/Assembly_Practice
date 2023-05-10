        .global _start

_start:
		mov r7 ,#3 
        mov r0 ,#1 
        mov r2 ,#2 
        ldr r1 , = input_dec 
        swi 0


        ldrb r0 , [r1, #0] 
		ldrb r2 , [r1, #1] 
		
		
		
		sub r0 , r0, #48
		sub r2 , r2, #48
		
		
		mov r10 ,#10 
		
		mul r11 ,r10 ,r0 
	
		adds r9 ,r11 ,r2  	
		
		
		mov r11 , #0 
		
		ldr r6 ,=Set  
		
loop_bir: 

		mov  r10, #2 
		
		udiv r12, r9 ,r10 
		
		mul r8 , r12,r10 
		
		sub r0 ,r9, r8 
		
		add r8 , r0 ,#0
		
		str r8 ,[r6 ,r11]  
		
		mov r9 , r12  
		
		add r11,r11 ,#1 
		
		
		@compare check
		cmp r9,#0 
		
		bne loop_bir 
		
		
		
		mov r3, r11 
		
		B Set_bir 

Set_bir:
		ldr r0 , =Show 
		
		ldr r1 , =Set
		
		ldrb r5, [r1 , r3 ]
		
		str r5 , [r0 , r4] 
		
		cmp r3 , #0 
		
		bne Set_bir 
		
		add r4 ,r4 ,#1 
		
		sub r3 ,r3 ,#1 
		
		B Exit 
		
Exit:

_show:  
		mov r7 ,#4 
		mov r0 ,#2 
		mov r2 ,#9 
		ldr r1 ,=Show 
		swi 0
		
_exit: 
		mov r7, #1 
		swi 0 
		
		.data

input_dec:.ascii " "
Set: .ascii "0000000" 
Show: .ascii "0000000 \n" 

		