section .data
s1 db 'Yash',0
s2 db 'Cool',0
len1: equ $-s1
len2: equ $-s2
msg_eq db 'Strings are equal',10
len_eq: equ $-msg_eq
msg_neq db 'Strings are not equal',10
len_neq: equ $-msg_neq

section .text
global _start
_start:
	mov esi, s1
	mov edi, s2
	mov ecx, len2;(length dekhega)
	
	cld; clear direction-flag(DF) donoka dir same kardega(T2B or B2T), will see addresses of both the string
	repe cmpsb; repeat if equal and compare string byte
	
	jecxz equal; jump when ecx is zero(line 31 jaega)
	;if not then following code
	
	mov eax,4
	mov ebx,1
	mov ecx,msg_neq
	mov edx,len_neq
	int 80h
	jmp exit; line 37 jaega
	
	equal:
		mov eax,4
		mov ebx,1
		mov ecx,msg_eq
		mov edx,len_eq
		int 80h
	exit:
		mov eax,1
		mov ebx,0
		int 80h

