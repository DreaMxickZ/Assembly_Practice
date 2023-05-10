        .global _start

_start:
		mov r7 ,#3 @เรียก Read มา
        mov r0 ,#1 @รับค่า จาก keyboard
        mov r2 ,#2 @ขนานของค่าได้ 2 ตัว
        ldr r1 , = input_dec @เอาตัวแปร เก็บไว้ในตัวแปร r1
        swi 0

        ldrd r0 , [r1, #0]
        ldrd r2 , [r1, #1]

        mov  r10, #10 

        mul r3, r0 ,r10

        strb r3,r6

        

       
_write: 
        
        mov	r7, #4
	    mov	r0, #1
	    mov	r2, #10
	    ldr r1, r6
	    swi 0
        
    
_exit:
        mov r7, #1
        swi 0


    .data
input_dec:.space 2
