section .data

section .bss


section .text
global _start
_start:
	mov eax, 225
	mov ebx, 14
	add al,bl
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
