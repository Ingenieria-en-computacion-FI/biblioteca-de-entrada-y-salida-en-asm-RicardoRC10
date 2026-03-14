extern print_char ;se llama a esta funcion para imprimir el salto de linea
global newline

SECTION .text

newline:

    push ebp; guardamos el valor del ebp para que no se pierda
    mov ebp, esp

    mov al, 10; el salto de linea es el caracter con codigo ascii 10, por eso se mueve al registro "al"
    call print_char

    mov esp, ebp; restauramos el valor del esp para que no se pierda
    pop ebp
    ret