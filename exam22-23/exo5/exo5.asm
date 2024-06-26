section .data
;          12345678910
char1: db "valeuresin", 10
char2: db "valeuresib", 10
res: db 0
section .text

global _start

_start:

push char1
push char2
call SontIdentiques

mov [res], al
add byte [res], '0'

mov eax, 4
mov ebx, 1
mov ecx, res
mov edx, 1
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80

SontIdentiques:
    push ebp
    mov ebp, esp

    mov edi, [ebp + 8] ; argument 2
    mov esi, [ebp + 12] ; argument 1

    mov ecx, 10

    comp:
    mov al, [edi]
    mov bl, [esi]
    cmp al, bl 
    jne not_ident 
    inc edi
    inc esi
    loop comp

    mov eax, 1
    jmp fin
    not_ident:
    mov eax, 0
    jmp fin
    fin:
    mov esp, ebp
    pop ebp
    ret