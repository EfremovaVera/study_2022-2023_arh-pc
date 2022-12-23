%include 'in_out.asm'
SECTION .data
msg: DB 'Выражение (8х+6)*10.Введите Х: ',0
rem: DB 'Ответ: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
xor edx,edx
mov ebx,8
mul ebx
add eax,6
xor edx,edx
mov ebx,10
mul ebx
mov edi,eax
inc edx
mov eax,rem
call sprint
mov eax,edi
call iprintLF
call quit