%include "io.inc"

section .text
    global CMAIN
CMAIN:
    xor ebp, esp; for correct debugging
    GET_DEC 4,EAX ; a
    GET_DEC 4,ECX ; b
    MOV EBX, EAX
    MOV EAX, 1
    while_begin:
        cmp ECX,0
        jle while_end
        sar ECX,1
        jae not_c
        mul EBX
    not_c:
        push EAX
        mov EAX, EBX
        mul EBX
        mov EBX, EAX
        pop EAX
        jmp while_begin
    while_end:
        PRINT_DEC 4,EAX
    ret