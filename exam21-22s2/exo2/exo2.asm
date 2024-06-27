section .data
msg: db  '@', 10

section .text

global _start

_start:

mov ecx, 5
xor edi, edi

boucle1:

push ecx ; modif
inc edi

mov ecx, edi

boucle_2:

push ecx

mov eax, 4 ; modife
mov ebx, 1
mov ecx, msg
mov edx, 1
int 0x80

pop ecx

loop boucle_2

mov eax, 4
mov ebx, 1
mov ecx, msg + 1 ; modif
mov edx, 1
int 0x80

pop ecx

loop boucle1 ; modif


mov eax, 1
xor ebx, ebx ; modif
int 0x80
