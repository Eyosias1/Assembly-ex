section .data

tmp: db '12345' , 10
N: equ 5 ; or equ $-tmp

section .text

global _start

_start:

    call boucle
    call quitter

boucle:
    xor edi, edi
    mov edi, tmp
    afficher_un_par_un:
        mov eax, 4
        mov ebx, 1
        mov ecx, edi 
        mov edx, 1
        int 0x80
        mov eax, 4
        mov ebx, 1
        mov ecx, tmp + N 
        mov edx, 1
        int 0x80
        inc edi
        mov ecx, [edi]
        cmp ecx, 10
        jne afficher_un_par_un
    ret

quitter:
    mov eax, 1
    xor ebx, ebx
    int 0x80
    ret