INCLUDE Irvine32.inc
.386 
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    multiplicand DWORD ?
    multiplier DWORD ?
    product DWORD ?

.code

BitwiseMultiply PROC
    xor edx, edx
    mov ecx, 32

shift_loop:
    shl ebx, 1        ; Shift left the multiplier
    jnc no_addition   ; If the last bit shifted out is 0, skip addition
    add eax, eax      ; Otherwise, add multiplicand to the product
    add eax, edi      ; Also add the shifted multiplier to the product
no_addition:
    rcl edi, 1        ; Rotate carry flag into the shifted multiplier
    loop shift_loop   ; Repeat for all 32 bits

    ret
BitwiseMultiply ENDP

main PROC

    ; Test case 1
    mov edi, 65531      ; Multiplicand
    mov ebx, 102910     ; Multiplier
    call BitwiseMultiply
    mov product, eax    ; Store the product
    mov eax, product    ; Move the product to eax for output
    call WriteDec
    call Crlf

    ; Test case 2
    mov edi, 6990501    ; Multiplicand
    mov ebx, 54611      ; Multiplier
    call BitwiseMultiply
    mov product, eax    ; Store the product
    mov eax, product    ; Move the product to eax for output
    call WriteDec
    call Crlf

    ; Test case 3
    mov edi, 21          ; Multiplicand
    mov ebx, 178956970   ; Multiplier
    call BitwiseMultiply
    mov product, eax     ; Store the product
    mov eax, product     ; Move the product to eax for output
    call WriteDec
    call Crlf

    call DumpRegs        ; Display register contents for debugging
    call ExitProcess     ; Exit the program

main ENDP
END main
