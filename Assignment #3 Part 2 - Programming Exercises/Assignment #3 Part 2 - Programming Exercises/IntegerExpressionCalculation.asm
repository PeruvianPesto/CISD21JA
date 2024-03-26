INCLUDE Irvine32.inc
.386 
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    fPrompt BYTE "The result of the integer expression (A + B) - (C + D) is : ",0 ;Null terminated string containing a prompt message
    aPrompt BYTE "For A = ",0 ;Null terminated strings for containing messages for A, B, C, and D
    bPrompt BYTE ", B = ",0
    cPrompt BYTE ", C = ",0
    dPrompt BYTE ", D = ",0

.code
main PROC
    mov eax, 55 ;Assigns 55 to the EAX register
    mov ebx, 32 ;Assigns 32 to the EBX register
    mov ecx, 15 ;Assigns 15 to the ECX register
    mov edx, 13 ;Assigns 13 to the EDX register
    
    add eax, ebx ;Adds the values of A and B and stores it in the EAX register
    mov ebx, eax ;Moves the stored result into EBX, in order to use later
    
    add ecx, edx ;Adds the values of C and D and stroes it in the ECX register
    
    sub ebx, ecx ;Subtracts the value of (C + D) with the (A + B) value that was stored earlier, storing it into EBX
    
    mov edx, OFFSET aPrompt ;Moves the memory address of the string aPrompt into the EDX register
    call WriteString ;Prints string from the memory location specified by the EDX register
    mov eax, 55 ;Moves value 55 into EAX
    call WriteInt ;Converts int value stored in EAX into a string

    mov edx, OFFSET bPrompt ;Moves the memory address of the string bPrompt into the EDX register
    call WriteString ;Prints string from the memory location specified by the EDX register
    mov eax, 32 ;Moves value 32 into EAX
    call WriteInt ;Converts int value stored in EAX into a string

    mov edx, OFFSET cPrompt ;Moves the memory address of the string cPrompt into the EDX register
    call WriteString ;Prints string from the memory location specified by the EDX register
    mov eax, 15 ;Moves value 15 into EAX
    call WriteInt ;Converts int value stored in EAX into a string

    mov edx, OFFSET dPrompt ;Moves the memory address of the string dPrompt into the EDX register
    call WriteString ;Prints string from the memory location specified by the EDX register
    mov eax, 13 ;Moves value 13 into EAX
    call WriteInt ;Converts int value stored in EAX into a string

    call Crlf ;Call Crlf and outputs a newline character

    mov edx, OFFSET fPrompt ;Moves the memory address of the string fPrompt into the EDX register
    call WriteString ;Prints string from the memory location specified by the EDX register
    mov eax, ebx ;Moves the stored value in the EBX register into the EAX register
    call WriteInt ;Converts int value stored in EAX into a string

    call Crlf ;Call Crlf and outputs a newline character

    INVOKE ExitProcess, 0
main ENDP
END main
