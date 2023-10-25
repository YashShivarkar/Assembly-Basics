section .data
msg1 db 'Enter the Dividend: ',10
len1: equ $-msg1
msg2 db 'Enter the Divisor: ',10
len2: equ $-msg2
msg3 db 'Quotient is: '
len3: equ $-msg3
msg4 db 'Remainder is: '
len4: equ $-msg4


section .bss
num1 resw 1
num2 resw 1
rem resw 2
quo resw 2

section .text
global _start
_start:
	%macro rw 4
	mov eax, %1
	mov ebx, %2
	mov ecx, %3      
	mov edx, %4
	int 80h
	%endmacro
	
	rw 4,1,msg1,len1
	rw 3,0,num1,2
	
	rw 4,1,msg2,len2
	rw 3,0,num2,2
	
	mov ax,[num1]
	sub ax,'0'
	mov bx,[num2]
	sub bx,'0'
	
	div bx
	add ax,'0'
	mov [quo],ax
	
	add dx,'0'
	mov [rem],dx
	
	rw 4,1,msg3,len3
	rw 4,1,quo,2
	
	rw 4,1,msg4,len4
	rw 4,1,rem,2
	
	mov eax,1
	mov ebx,0
	int 80h
