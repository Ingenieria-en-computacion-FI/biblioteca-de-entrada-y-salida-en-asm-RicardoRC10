%include "include/io.inc"

global _start
SECTION .bss
buffer resb 64; reservamos un espacio de memoria para la cadena que se va a leer, el tamaño es de 64 bytes, lo cual es suficiente para la prueba que se va a hacer

SECTION .data
; mensajes para pedir los datos al usuario
msg_int db "Ingrese un numero:",10,0
msg_char db "Ingrese un caracter:",10,0
msg_str db "Ingrese una cadena:",10,0

msg_result db "Resultados:",10,0


SECTION .text

_start:
    ; pedir entero
    mov eax, msg_int
    call print_string

    call scan_int
    call print_int
    call newline

    ;ahora con el caracter 
    mov eax, msg_char
    call print_string

    call scan_char
    call print_char
    call scan_char; este scan es para atrapar el enter, porque si no se salta el leer la cadena siguiente
    call newline

    ;pedimos la cadena

    mov eax, msg_str
    call print_string

    mov eax, buffer
    mov ebx, 64
    call scan_string

    mov eax, msg_result
    call print_string

    mov eax, buffer
    call print_string
    call newline
; salir del programa
    mov eax,1
    xor ebx,ebx
    int 0x80