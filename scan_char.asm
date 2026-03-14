SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

scan_char:

    push ebp ; guarda el valor del ebp para que no se pierda
    mov ebp, esp

    mov eax, 3 
    mov ebx, 0 ; se usa la entrada estandar
    mov ecx, char_buffer ;guarda el caracter leido en el buffer
    mov edx, 1 ; esto es el tamaño del buffer, es decir, solo se lee un caracter
    int 0x80

    mov al, [char_buffer]

    mov esp, ebp
    pop ebp
    ret