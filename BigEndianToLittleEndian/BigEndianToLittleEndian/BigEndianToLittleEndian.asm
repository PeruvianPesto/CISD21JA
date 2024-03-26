.386                                                ; Declare the processor mode as 386.
.model flat, stdcall                               ; Set memory model and calling convention.
.stack 4096                                        ; Allocate 4096 bytes for the stack.
ExitProcess PROTO, dwExitCode:DWORD                ; Declare the ExitProcess function prototype.
include Irvine32.inc                               ; Include Irvine32 library for I/O operations.

.data                                               ; Start of the data section.
 bigEndian BYTE 12h, 34h, 56h, 78h                 ; Define an array storing big-endian bytes.
 littleEndian DWORD ?                              ; Declare a variable to store little-endian DWORD.

.code                                               ; Start of the code section.
main PROC                                           ; Beginning of the main procedure.
    mov ah, byte ptr bigEndian                     ; Move the first byte of bigEndian to AH register.
    mov al, byte ptr bigEndian + 1                 ; Move the second byte of bigEndian to AL register.
    mov word ptr littleEndian + 2, ax              ; Store the first two bytes in littleEndian.
    mov ah, byte ptr bigEndian + 2                 ; Move the third byte of bigEndian to AH register.
    mov al, byte ptr bigEndian + 3                 ; Move the fourth byte of bigEndian to AL register.
    mov word ptr littleEndian, ax                  ; Store the last two bytes in littleEndian.

    lea esi, bigEndian                             ; Load effective address of bigEndian into ESI.
    mov ecx, LENGTHOF bigEndian                    ; Move the length of bigEndian array into ECX.
    call DumpMem                                   ; Call DumpMem to display the content of bigEndian.

    lea esi, littleEndian                          ; Load effective address of littleEndian into ESI.
    mov ecx, LENGTHOF littleEndian                 ; Move the length of littleEndian into ECX.
    call DumpMem                                   ; Call DumpMem to display the content of littleEndian.

    INVOKE ExitProcess, 0                          ; Invoke the ExitProcess function with exit code 0.
main ENDP                                          ; End of the main procedure.
END main                                           ; End of the program.
