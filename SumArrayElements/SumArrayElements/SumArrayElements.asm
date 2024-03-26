INCLUDE Irvine32.inc                ; Include Irvine32 library for assembly functions
.386                                ; Set processor mode to 386
.model flat, stdcall                ; Set memory model and calling convention
.stack 4096                         ; Set stack size

.data                               ; Start data section
lowerLimit DWORD 20                 ; Define lower limit variable
upperLimit DWORD 40                 ; Define upper limit variable
array_1 SDWORD 10,30,25,15,17,19,40,41,43   ; Define array_1 with integers
array_2 SDWORD 10,-30,25,15,-17,55,40,41,43 ; Define array_2 with integers

.code                               ; Start code section
main PROC                           ; Start main procedure
    mov esi, OFFSET array_1         ; Point ESI to the beginning of array_1
    mov eax, LENGTHOF array_1       ; Get the length of array_1
    call CalculateSumInRange        ; Call procedure to calculate sum
    call DisplayResult              ; Call procedure to display result
    call Crlf                       ; Call procedure to move to next line

    mov esi, OFFSET array_2         ; Point ESI to the beginning of array_2
    mov eax, LENGTHOF array_2       ; Get the length of array_2
    call CalculateSumInRange        ; Call procedure to calculate sum
    call DisplayResult              ; Call procedure to display result

    exit                            ; Exit program
main ENDP                           ; End main procedure

CalculateSumInRange PROC           ; Start procedure to calculate sum within range
    xor ebx, ebx                    ; Initialize index to 0
    mov ecx, eax                    ; Set loop counter to array size

calculate_loop:                   ; Start loop label
    mov edx, [esi + ebx*4]         ; Load current array element into edx
    cmp edx, lowerLimit            ; Compare with lower limit
    jl not_within_range            ; If less than lower limit, skip
    cmp edx, upperLimit            ; Compare with upper limit
    jg not_within_range            ; If greater than upper limit, skip
    add eax, edx                   ; Add current element to sum

not_within_range:                ; Label for skipping elements outside range
    inc ebx                        ; Increment index
    loop calculate_loop            ; Loop until all elements are processed

    ret                            ; Return from procedure
CalculateSumInRange ENDP         ; End procedure

DisplayResult PROC               ; Start procedure to display result
    mov edx, OFFSET array_1       ; Load address of array_1 to edx
    cmp edx, OFFSET array_2       ; Compare with address of array_2
    je display_array_2            ; If equal, display "array_2" label
    mov edx, OFFSET array_1       ; Otherwise, display "array_1" label
display_array_2:                ; Label for displaying array_2
    mov edx, OFFSET array_2       ; Load address of array_2 to edx

    mov ebx, eax                  ; Move sum to ebx for display
    mov eax, edx                  ; Move address of array to eax for display
    call WriteString              ; Display array label
    mov eax, ebx                  ; Move sum back to eax
    call WriteDec                 ; Display sum
    ret                            ; Return from procedure
DisplayResult ENDP               ; End procedure

END main                          ; End of program
