SECTION .text
global print_string

; Esta función imprime una cadena de caracteres en la consola. La dirección de la cadena se pasa a través del registro "eax". La función recorre la cadena hasta encontrar el carácter nulo (0) que indica el final de la cadena, y luego utiliza la llamada al sistema para escribir la cadena en la salida estándar.
print_string:
; Guardar el valor del ebp para no perderlo
    push ebp
    mov ebp, esp

    push ebx
    push edi
; La dirección de la cadena a imprimir se encuentra en "eax", por lo que se mueve a "edi" para usarlo como puntero durante el recorrido de la cadena.
    mov edi, eax
    xor ecx, ecx
; El ciclo recorre la cadena de caracteres byte por byte, incrementando el contador "ecx" hasta que encuentra el carácter nulo (0) que indica el final de la cadena. Cuando se encuentra el carácter nulo, se salta al bloque de código que se encarga de escribir la cadena en la salida estándar.
.ciclo: 
    cmp byte [edi + ecx], 0 
    je .escribir
    inc ecx 
    jmp .ciclo 

.escribir:
    mov edx, ecx
    mov ecx, eax 
    mov eax, 4 
    mov ebx, 1 
    int 0x80

    pop edi
    pop ebx 

    mov esp, ebp
    pop ebp
    ret 