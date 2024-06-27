section .data

chiffre: dw 0

section .text

global _start

_start:


mov eax, 1234

call LasNumber

add byte [chiffre], '0'
mov eax, 4
mov ebx, 1
mov ecx, chiffre
mov edx, 1
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80

LasNumber:
    xor edx, edx
    mov ecx, 10
    div ecx

    mov [chiffre], dl
    ret