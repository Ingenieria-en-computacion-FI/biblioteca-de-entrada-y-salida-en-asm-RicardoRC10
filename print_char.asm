SECTION .bss
    char_resb resb 1 ;reservamosla memoria
SECTION .text
global print_char

print_char:

    push ebp
    mov ebp, esp ; hace que el ebp y esp apunten a la misma direccion de memoria (donde estaria el char)

    mov [char_resb], al ; mueve el valor del registro "al" al espacio reservado
    
    mov eax, 4 ;Esto es el codigo que vimos en clase, en el cual se mueve al registro y luego se imprime
    mov ebx, 1
    mov ecx, char_resb
    mov edx, 1
    mov edx, 1
    int 0x80

    mov esp, ebp
    pop ebp
    ret