section .data
str: db "012345", 10 ; 6 bytes defined and followed by a newline char always add str: coloumn
leng: db 5 ; defines a a single byte with value 5

section .text

global _start

_start:

mov eax, 3              ; call read system call
mov ebx, 0              ; tells from which to read in this case 0 stdin
mov ecx, leng           ; this is the correction ecx should not have leng as addres because it is a variable not a real buffer 
mov edx, [leng]         ; sets edx to stored value of leng which is 5 bytes to read per entry.
and edx, 000000FEh
int 0x80

;call print_buffer

mov eax, 1              ; syscall pour quitter
int 0x80                ; interrompre pour quitter

print_buffer:
    ; Print the content of Buffer
    mov eax, 4              ; System call number for sys_write (4)
    mov ebx, 1              ; File descriptor 1 (stdout)
    mov ecx, leng           ; Pointer to the buffer where data is stored
    mov edx, 5              ; Number of bytes to write (1 byte)
    int 0x80                ; Call kernel
    ret                     ; Return from function
