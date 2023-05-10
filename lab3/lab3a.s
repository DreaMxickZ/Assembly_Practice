.data
string1: .asciz "mabcidefkmitl"
string2: .asciz "kmitl"
yes_message: .asciz "Yes\n"
no_message: .asciz "No\n"

.text
.global _start
_start:
    ldr     r1, =string1      ; load address of string1 into r1
    ldr     r2, =string2      ; load address of string2 into r2

    mov     r3, #0            ; initialize loop counter to 0
    mov     r4, #0            ; initialize match flag to 0

compare_loop:
    ldrb    r5, [r1, r3]      ; load current char from string1 into r5
    ldrb    r6, [r2, r3]      ; load current char from string2 into r6

    cmp     r5, #0            ; compare char from string1 to null terminator
    beq     end_compare       ; if char from string1 is null terminator, end comparison

    cmp     r5, r6            ; compare chars from string1 and string2
    bne     end_compare       ; if chars are different, end comparison

    add     r3, r3, #1        ; increment loop counter
    b       compare_loop      ; continue looping

end_compare:
    cmp     r5, r6            ; final comparison after loop
    bne     print_no          ; if chars are different, print "No"

    mov     r4, #1            ; set match flag to 1
    b       print_result

print_no:
    ldr     r0, =no_message   ; load address of "No" message into r0
    bl      printf           ; print "No" message
    b       end

print_yes:
    ldr     r0, =yes_message  ; load address of "Yes" message into r0
    bl      printf           ; print "Yes" message

print_result:
    cmp     r4, #0            ; compare match flag to 0
    bne     print_yes         ; if match flag is not 0, print "Yes"

end:
    mov     r7, #1            ; set exit syscall number
    svc     0                 ; trigger syscall
