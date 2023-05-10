        .global _start

_start:
		mov r7 ,#3 @เรียก Read มา
        mov r0 ,#1 @รับค่า จาก keyboard
        mov r2 ,#2 @ขนานของค่าได้ 2 ตัว
        ldr r1 , = input_dec @เอาตัวแปร เก็บไว้ในตัวแปร r1
        swi 0


        ldrb r0 , [r1, #0] @เอาค่าที่อยู่ใน R1 ตำแหน่ง index ที่ 0 แปลงเป็น Byte ไปเก็บใน r0
		ldrb r2 , [r1, #1] @เอาค่าที่อยู่ใน R1 ตำแหน่ง index ที่ 1 แปลงเป็น Byte ไปเก็บใน r2
		
		@เอาทั้งคู่มาลบกับ 48 แล้วเก็บไว้ใน Register เดิม ได้เลข int 
		
		sub r0 , r0, #48
		sub r2 , r2, #48
		
		
		mov r10 ,#10 @เก็บค่า 10 ไว้ใน Register 10
		
		mul r11 ,r10 ,r0  @นำ r0 มา คูณ 10 แล้ว เก็บไว้ใน Register ตัวใหม่
	
		adds r9 ,r11 ,r2  	@เอา r11 มาบวกกับ r2 เมื่อบวกเส็รจจะกระโดดไปทำอันใหม่อื่น เก็บไว้ใน r9
		
		
		mov r11 , #0 @เอาค่า 0 เก็บใน Register11
		
		ldr r6 ,=Set  @ โหลดค่าจะตัวแปร Set ไปเก็บไว้ใน Register6 เพื่อ set string
		
loop_bir: 

		mov  r10, #2 @ เก็บ 2 ไว้ใน R10 เนื้องจากใช้ไปแล้ว ใช้ซ้ำได้
		
		udiv r12, r9 ,r10 @รวมค่าใน r9ก่อน มาหาร 2 ของตัวแปรร r10 แล้วไปเก็บไว้ ใน r12
		
		mul r8 , r12,r10 @เอา r12  มาคูณ กับ r10 ที่มี 2 อยู่ แล้วเก็บไว้ใน r8
		
		sub r0 ,r9, r8  @ เอา r9  มาลบกับ r8  แล้วเก็บไว้ใน r0
		
		add r8 , r0 ,#'0' @ เอา r0 ไปบวกกับ 0 แบบ string เก็บไว้ใน r8 int เป็น ascii
		
		str r8 ,[r6 ,r11]  @นำ r8 ไปเก็บไว้ใน r6 ตำแหน่ง index ที่ r11
		
		mov r9 , r12  @นำค่าใน  r12 ไปเก็บไว้ใน r9
		
		add r11,r11 ,#1 @เอา r11 บวก 1 ไปเก็บไว้ r11
		
		
		@compare check
		cmp r9,#0 @เช็ค เปรียบเทียบ ไว้ r0 เท่า 0 หรือไม่
		
		bne loop_bir @ Branch Not equal หรือ ถ้าไม่ใช่ จะทำการเรียก func loop_bir กลับไปทำใหม่
		
		@ถ้าตรงตามเงื่อนไข จะลงมาทำข้างล่าง
		
		mov r3, r11 @นำค่า r11 ไปเก็บไว้ใน r3
		
		B Set_bir  @กระโดด ไปทำ Set_bir

Set_bir:
		ldr r0 , =Show @โหลด ค่าของ show ไปเก็บไว้ใน r0
		
		ldr r1 , =Set @โหลด ค่าของ Set ไปเก็บไว้ใน r1
		
		ldrb r5, [r1 , r3 ] @โหลดbyte ค่า r1 ตำแหน่ง r3 ไปเก็บไว้ใน r5
		
		str r5 , [r0 , r4] @ stor เอาค่า r5 ไปเก็บไว้ใน r0 ตำแหน่ง ที่ ofset r4
		
		cmp r3 , #0 @เช็ค เปรียบเทียบ ไว้ r0 เท่า 0 หรือไม่
		
		
		
		add r4 ,r4 ,#1 @เอา r4 มาบวกกับ 1 ไปเก็บไว้ใน r4
		
		sub r3 ,r3 ,#1 @เอา r3 มาลบกับ 1 ไปเก็บไว้ใน r3

		bne Set_bir @ Branch Not equal หรือ ถ้าไม่ใช่ จะทำการเรียก func loop_bir กลับไปทำใหม่
		
		B Exit @ไป func exit
		
Exit:

_show:  
		mov r7 ,#4 @ เรืยก systemcall  func ที่ 4 คือเขียน
		mov r0 ,#2 @ เรียกใช้ func out monitor
		mov r2 ,#9 @ กำหนดความยาวของการออกหน้าจอ ที่ 9 ตัว
		ldr r1 ,=Show @โหลด ค่าผลลัพ จากShow ไปเก็บไว้ใน R1
		swi 0
		
_exit: 
		mov r7, #1 @เรียกใช้ func ปิด
		swi 0 
		
		.data

input_dec:.ascii " "
Set: .ascii "0000000 \n" 
Show: .ascii "0000000 \n\n" 

		