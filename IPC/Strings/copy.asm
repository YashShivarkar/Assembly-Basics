	;Program to Copy the string from Source to Destination
	
section .data
s1 db 'Hello Yash!',10
len: equ $- s1

section .bss
s2 resb 20

section .text
global _start
_start:
	
	mov ecx, len	;setting counter to the length of string
	mov esi, s1	;s1 to source index
	mov edi, s2	;s2 to destination index
	cld		;clearing directional flag to store in same direction
	rep movsb	;repeat untilthe pointer is pointing on string byte inside esi
	
	mov eax,4
	mov ebx,1
	mov ecx,s2	;printing s2
	mov edx,20
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
