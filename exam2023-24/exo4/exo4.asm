section .data
msg: db '@',10        ; Définir le caractère '@'

section .text

global _start

_start:
mov ecx, 5          ; Nombre de lignes de la demi-pyramide
and edi, edi        ; Initialiser EDI à 0

boucle_1:
push ecx            ; Sauvegarder le compteur de ligne
inc edi             ; Incrémenter EDI pour déterminer le nombre de '@' à afficher
mov ecx, edi        ; Charger le compteur de caractères dans ECX

boucle_2:
; Afficher un caractère '@'
push ecx
mov eax, 4          ; Syscall numéro pour sys_write
mov ebx, 1          ; Descripteur de fichier 1 (stdout)
mov ecx, msg        ; Charger l'adresse du message
mov edx, 1          ; Longueur du message (1 caractère)
int 0x80            ; Appel système
pop ecx

loop boucle_2       ; Décrémenter ECX et sauter à boucle_2 si ECX != 0
; Afficher une nouvelle ligne
mov eax, 4          ; Syscall numéro pour sys_write
mov ebx, 1          ; Descripteur de fichier 1 (stdout)
mov ecx, msg + 1    ; Charger l'adresse de la nouvelle ligne contenu dans msg + 1
mov edx, 1          ; Longueur de la nouvelle ligne (1 caractère)
int 0x80            ; Appel système
pop ecx             ; Restaurer le compteur de ligne

loop boucle_1       ; Décrémenter ECX et sauter à boucle_1 si ECX != 0

; Sortie propre du programme
mov eax, 1          ; Code de système pour sys_exit
xor ebx, ebx        ; Code de retour 0
int 0x80            ; Appel système pour quitter
