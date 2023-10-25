section .data
s1 db 'hello Yash',10
len: equ $-s1

msg1 db 'Character Found!!',10
len1: equ $- msg1

msg2 db 'String not Found!!',10
len2: equ $- msg2

section .bss

section .text
global _start
_start:
	mov ecx,len
	mov edi,s1
	mov al, 'Y'	;mov char to be searched inside of al
	cld
	repne scasb	;scans the string byte if not equal then loop repeats decreasing ecx counter
	je found	;if the character matches then jump to found label
	
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 80h
	
found:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
