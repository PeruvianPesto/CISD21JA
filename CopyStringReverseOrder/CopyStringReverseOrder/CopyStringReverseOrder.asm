INCLUDE Irvine32.inc                             ; Include Irvine32 library for I/O operations.
.386                                             ; Declare the processor mode as 386.
.model flat, stdcall                            ; Set memory model and calling convention.
.stack 4096                                     ; Allocate 4096 bytes for the stack.
ExitProcess PROTO, dwExitCode:DWORD             ; Declare the ExitProcess function prototype.

.data                                           ; Start of the data section.
    BYTE 4 DUP('$')                             ; Reserve 4 bytes initialized to '$'.
    source BYTE "This is the source string",0   ; Define a null-terminated source string.
    BYTE 4 DUP('%')                             ; Reserve 4 bytes initialized to '%'.
    target BYTE SIZEOF source DUP('#')          ; Define a target buffer of the same size as source, filled with '#'.
    BYTE 4 DUP('^')                             ; Reserve 4 bytes initialized to '^'.

.code                                           ; Start of the code section.
    main PROC                                   ; Beginning of the main procedure.
        mov esi,0                                ; Initialize source index to 0.
        mov edi,LENGTHOF source - 2              ; Initialize target index to length of source - 2.
        mov ecx,SIZEOF source                    ; Initialize loop counter to size of source.
    L1:                                         ; Label for loop start.
        mov al,source[esi]                       ; Move byte from source to AL register.
        mov target[edi],al                       ; Move byte from AL to target.
        inc esi                                 ; Increment source index.
        dec edi                                 ; Decrement target index.
        loop L1                                 ; Loop until ECX becomes zero.
        mov edx, OFFSET target                   ; Move the offset of target into EDX.
        call WriteString                        ; Call WriteString to display target string.
        exit                                    ; Exit the program.
    main ENDP                                  ; End of the main procedure.
END main                                       ; End of the program.
