section .data
val: db 1
vah: db 1

section .dss

section .text
global _start
_start:
	mov al, 5; no need to sub 0 from it cuz its already given as input(processor does not need to read it)
	mov bl, 9; user se input loge toh sub by 0 karna padega
	add al, bl
	aam
	add al,'0'
	mov [val], al
	add ah,'0'
	mov [vah], ah
	
	mov eax,4
	mov ebx,1
	mov ecx,vah
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,val
	mov edx,1
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
	
	
	
	
