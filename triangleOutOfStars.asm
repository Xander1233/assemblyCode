global _start

section .text

_start:
        mov     rdx, output             ; next byte to write
        mov     r8, 1                   ; max length of stars in the current line
        mov     r9, 0                   ; Current length of stars

line:
        mov     byte [rdx], '*'         ; Write 1 star
        inc     rdx                     ; rdx + 1 (increment pointer to the next cell)
        inc     r9                      ; r9 + 1 (increment current amount of stars)
        cmp     r9, r8                  ; reached max amount of star for this line
        jne     line                    ; loop until reached (jne =^ cmp == false => jump back to this label)

nextLine:
        mov     byte [rdx], 10          ; Write a new line (\n)
        inc     rdx                     ; mov pointer
        inc     r8                      ; next line amount of stars = oldLine++
        mov     r9, 0                   ; reset current count
        cmp     r8, maxAmountOfLines    ; reached max amount of lines
        jng     line                    ; loop until reached (jne =^ cmp == false => jump to label)

cleanExit:
        mov     rax, 1                  ; Write {1}
        mov     rdi, 1                  ; Output
        mov     rsi, output             ; address of string to output it
        mov     rdx, sizeOfData         ; output number of bytes
        syscall                         ; syscall -> write | ref: {1}
        mov     rax, 60                 ; Exit {2}
        xor     rdi, rdi                ; code 0
        syscall                         ; syscall -> exit | ref: {2}

section .bss
maxAmountOfLines equ    8
sizeOfData equ    44
output:  resb   dataSize
