section .data

nombre: db '7','9','1','2','7'
l: equ $-nombre
shift: db 0
section .text

global _start

_start:

mov edx, 0
mov al, [nombre]

next:
inc edx
cmp al, [nombre + edx]
jge test1
mov al, [nombre + edx]
mov [shift], dl

test1:
cmp dl, l 
jl next

mov eax, 4
mov ebx, 1
mov edx, [shift]
mov ecx, nombre
add ecx, edx
mov edx, 1 
int 0x80

mov eax, 1
mov ebx, 0
int 0x80
