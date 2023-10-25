section .data
st db 'Yash',0Ah

section .bss
count resb 1

section .text
global _start
_start:
	mov ebx, st
	mov eax,ebx
	mov [count],0
	
	nextchar:
		cmp byte [eax],0;
		jz finished
		inc eax
		inc count
		jmp nextchar
	finished:
		sub eax,ebx
		
	mov eax,4
	mov ebx,1
	mov ecx,count
	mov edx,eax
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
