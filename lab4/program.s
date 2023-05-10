        .global _start

_start:
	mov r7 ,#3 @เรียก Read มา
        mov r0 ,#1 @รับค่า จาก keyboard
        mov r2 ,#2 @ขนานของค่าได้ 2 ตัว
        ldr r1 , = input_dec @เอาตัวแปร เก็บไว้ในตัวแปร r1
        swi 0

        ldrb r0 , [r1, #0]
        ldrb r2 , [r1, #1]

        sub r0 ,r0 ,#48
        sub r2 ,r2 ,#48

        mov  r10, #10 

        mul r11, r0 ,r10

        adds r9 ,r11 ,r3
        
        mov r11 ,#0 
        ldr r6 ,=Set 
        
loop_div :
        mov r10 ,#2

        udiv r12, r9,r10

        mul r8 , r12 ,r10

        sub r0 ,r9 ,r8

        add r8 ,r0 ,#'0'

        str r8 , [r6,r11]

        mov r9 , r12
        
        add r11,r11,#1

        cmp r9,#0

        bne loop_div

        mov r3 , r11
        

        b anw_bir


anw_bir:
        ldr r0 , =Show @โหลด ค่าของ show ไปเก็บไว้ใน r0
		
	ldr r1 , =Set @โหลด ค่าของ Set ไปเก็บไว้ใน r1
		
	ldrb r5, [r1 , r3 ] @โหลดbyte ค่า r1 ตำแหน่ง r3 ไปเก็บไว้ใน r5
		
	str r5 , [r0 , r4] @ stor เอาค่า r5 ไปเก็บไว้ใน r0 ตำแหน่ง ที่ ofset r4
		
	cmp r3 , #0 @เช็ค เปรียบเทียบ ไว้ r0 เท่า 0 หรือไม่
		
        
		
	add r4 ,r4 ,#1 @เอา r4 มาบวกกับ 1 ไปเก็บไว้ใน r4
		
	sub r3 ,r3 ,#1 @เอา r3 มาลบกับ 1 ไปเก็บไว้ใน r3

        bne anw_bir @ Branch Not equal หรือ ถ้าไม่ใช่ จะทำการเรียก func loop_bir กลับไปทำใหม่
		
	b Exit @ไป func exit



 Exit:     
 _show :

        mov r7,#4
        mov r0,#2
        mov r2 ,#9
        ldr r1,=Show
        swi 0
        
    
_exit:
        mov r7, #1
        swi 0


    .data
input_dec:.space 2
Set: .ascii "0000000" 
Show: .ascii "0000000 \n" 

