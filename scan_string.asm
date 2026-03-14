SECTION .text
global scan_string
scan_string:

    push ebp
    mov ebp, esp

    push ebx ;esto es para guardar el valor de ebx que se usa para la entrada estandar
    push ecx
    push edx

    mov ecx, eax ;esto almacena el texto
    mov edx, ebx
    mov eax, 3 ;esto llama al sistema para que lea la informacion 
    mov ebx, 0 ; se usa la entrada estandar
    int 0x80

    mov byte [ecx + eax - 1], 0 ;Para esta parte le pregunte a Daniel y me dijo que era para lo que vimos en clase y que no se coma de paso un enter
    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret