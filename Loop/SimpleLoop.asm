; loop for x32
global main
extern printf, scanf

main:
        push rbp
        mov rbp, rsp
        sub rsp, 16

        xor eax, eax
        lea rdi, [msg1]
        call printf

        mov eax, 0
        lea rdi, [format]
        lea rsi, [number]
        call scanf

        mov DWORD [rbp-4 ],0

loop:
        mov edx, [number]
        mov rsi, [rbp -4]
        lea rdi, [msg2]
        xor eax, eax
        call printf

        mov exc, DWORD [number]
        add DWORD [rbp - 4], 1

        cmp [rbp - 4] , ecx
        jle loop

        add rsp, 16
        leave
        ret


section .data
    msg1: db "Entrer un nombre: ",0
    msg2: db "Loop de %d à %d: ",10,0
    format:db "%d",0

section .bss
    number resb 4
