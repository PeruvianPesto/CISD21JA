INCLUDE Irvine32.inc               ; Include Irvine32 library for input/output functions
.386                               ; Use 80386 instruction set
.model flat, stdcall               ; Define memory model and calling convention
.stack 4096                        ; Set stack size

ExitProcess PROTO, dwExitCode:DWORD ; Prototype declaration for ExitProcess API function

.data                              ; Data section
    array DWORD 10h, 20h, 30h, 40h ; Define an array of DWORDs
    arraySize = ($ - array) / 4    ; Calculate the size of the array in DWORDs

.code                              ; Code section
main PROC                          ; Main procedure
    mov ecx, arraySize             ; Move the size of the array into ECX register
    mov esi, OFFSET array          ; Move the offset of array into ESI register
    call PrintArray                ; Call PrintArray subroutine to print the array
    mov ecx, 1                     ; Move the value 1 into ECX register
    mov esi, OFFSET array          ; Move the offset of array into ESI register
    call RotateArray               ; Call RotateArray subroutine to rotate the array
    mov ecx, arraySize             ; Move the size of the array into ECX register
    mov esi, OFFSET array          ; Move the offset of array into ESI register
    call PrintArray                ; Call PrintArray subroutine to print the rotated array

    invoke ExitProcess, 0          ; Invoke ExitProcess API to exit the program with exit code 0
main ENDP                          ; End of main procedure

PrintArray PROC                    ; PrintArray subroutine
    pushad                         ; Push all general-purpose registers onto the stack
    mov esi, OFFSET array          ; Move the offset of array into ESI register
    mov ecx, arraySize             ; Move the size of the array into ECX register
L1:                                ; Start of loop
    mov eax, [esi]                 ; Move the value at address pointed by ESI into EAX
    call WriteHex                  ; Call WriteHex subroutine to print the value in hexadecimal
    call Crlf                      ; Call Crlf subroutine to print a new line
    add esi, 4                     ; Move to the next DWORD in the array
    loop L1                        ; Continue looping until ECX becomes zero
    popad                          ; Restore all general-purpose registers
    ret                            ; Return from subroutine
PrintArray ENDP                    ; End of PrintArray subroutine

RotateArray PROC                   ; RotateArray subroutine
    pushad                         ; Push all general-purpose registers onto the stack
    mov ecx, arraySize             ; Move the size of the array into ECX register
    mov edi, OFFSET array          ; Move the offset of array into EDI register
    mov eax, [edi]                 ; Move the first DWORD of the array into EAX
    add edi, 4                     ; Move to the second DWORD in the array
L1:                                ; Start of loop
    mov ebx, [edi]                 ; Move the value at address pointed by EDI into EBX
    mov [edi - 4], ebx             ; Move the value in EBX to the previous DWORD position
    add edi, 4                     ; Move to the next DWORD in the array
    loop L1                        ; Continue looping until ECX becomes zero
    mov [edi - 4], eax            ; Move the initial value stored in EAX to the last DWORD position
    popad                          ; Restore all general-purpose registers
    ret                            ; Return from subroutine
RotateArray ENDP                   ; End of RotateArray subroutine

END main                          ; End of program, specifying the entry point
