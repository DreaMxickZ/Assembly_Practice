        .global _start      // Declare _start label
_start:
        MOV     R0, #0       // Move 0 into R0 for read syscall
        MOV     R1, SP       // Move SP (stack pointer) into R1 for buffer address
        MOV     R2, #1       // Move 1 into R2 for buffer size
        MOV     R7, #3       // Move 3 into R7 register for read syscall
        SWI     0            // Call software interrupt to perform syscall
        CMP     R1, #'1'     // Compare input character to '1'
        BEQ     output_one   // Branch to output_one if input is '1'
        CMP     R1, #'2'     // Compare input character to '2'
        BNE     end          // Branch to end if input is neither '1' nor '2'
output_one:
        LDR     R1, message_one  // Load address of "one" message into R0
        MOV     R7, #4       // Move 4 into R7 register for write syscall
        MOV     R1, SP       // Move SP (stack pointer) into R1 for buffer address
        MOV     R2, #3       // Move 3 into R2 for buffer size
        //LDR     R1, =message_one
        SWI     0            // Call software interrupt to perform syscall
        B       end          // Branch to end of program
output_two:
        LDR     R1, message_two  // Load address of "two" message into R0
        MOV     R7, #4       // Move 4 into R7 register for write syscall
        MOV     R1, SP       // Move SP (stack pointer) into R1 for buffer address
        MOV     R2, #3       // Move 3 into R2 for buffer size
        //LDR     R1, =message_two
        SWI     0            // Call software interrupt to perform syscall
        B       end    
end:
        MOV     R7, #1       // Move 1 into R7 register for exit syscall
        SWI     0            // Call software interrupt to perform syscall
        
message_one:.ascii  "one\n"      // Define string "one" with newline character
message_two:.ascii  "two\n"      // Define string "two" with newline character