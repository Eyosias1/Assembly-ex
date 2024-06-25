section .data
test: db 'inutile!', 10
N: db 10 ; modif 1
buff: db 0

section .text

global _start

_start:

mov eax, 0
xor esi, esi
push eax 
mov edi, 2

input:

mov eax, 3
mov ebx, 0
mov ecx, buff
mov edx, 1
int 0x80

sub byte [buff], '0' ; modif 3 
cmp byte [buff], 0
;jl fin_input
cmp  byte [buff], 9
jg fin_input

;call print_buffer

mov edx, 0
mov eax, [buff]
idiv edi
cmp edx, 0
jne input

mov eax, [buff] ; modife 4
pop esi ; modif 5
add eax, esi 
cmp al, [N]
jg fin_input
push eax
jmp input

fin_input:
; Sortie propre du programme
mov eax, 1          ; Code de système pour sys_exit
int 0x80            ; Appel système pour quitter

print_buffer:
    ; Print the content of Buffer
    mov eax, 4              ; System call number for sys_write (4)
    mov ebx, 1              ; File descriptor 1 (stdout)
    mov ecx, buff           ; Pointer to the buffer where data is stored
    mov edx, 1              ; Number of bytes to write (1 byte)
    int 0x80                ; Call kernel
    ret     