section .data
val: db 1
vah: db 1

section .dss

section .text
global _start
_start:
	mov al, 5
	mov bl, 9
	mul bl
	aam; 	ASCII adjust after multiplication(divides the result by 10 and store one part in ah and other in al
	add al,'0'
	mov [val],al
	add ah,'0'
	mov [vah],ah
	
	mov eax,4
	mov ebx,1
	mov ecx, vah
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, val
	mov edx, 1
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h
