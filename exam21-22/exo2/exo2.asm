section .data

nombre: dd 0
res: db 4

section .text

global _start

_start:

mov eax, 3
mov ebx, 0
mov ecx, nombre
mov edx, 1
int 0x80

call facto
mov [res], al 
add byte [res], '0'

mov eax, 4
mov ebx, 1
mov ecx, res
mov edx, 1
int 0x80

fin:
mov eax, 1
int 0x80


facto:
xor edx, edx
mov eax, 0
mov eax, [nombre]
mov edx, eax

next:
dec edx
cmp edx, 0
je quit
imul eax, edx
jmp next

quit:
ret