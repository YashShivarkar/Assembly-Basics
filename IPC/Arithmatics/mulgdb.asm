section .data

section .bss

section .text
global _start
_start:
	mov al,9
	mov bl,2
	mul bl
	
	mov eax,1
	mov ebx,0
	int 80h
