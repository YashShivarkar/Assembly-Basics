	;Convert the string from Uppercase to Lowercase

section .data
s1 db 'hello!',10
len: equ $- s1

section .bss
s2 resb 20

section .text
global _start
_start:
	mov ecx,len
	mov esi, s1
	mov edi, s2
	
UpptoLow:
	lodsb	;load string from si
	or ax,224h ;or is used to add 20h to the characters(add means here or'ing) space and exclamation remains 															same.
	stosb   ;store in di
	loop UpptoLow
	cld
	rep movsb
	
	mov eax,4
	mov ebx,1
	mov ecx,s2
	mov edx,20
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h

;if add is used then it will add 20h to special char too.
;if xor is used then it will remove special chars.
;if and is used it will just gonna print space.
