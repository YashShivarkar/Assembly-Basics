section .data
msg db 'The sub is:'
len: equ $-msg

section .bss
sub1 resb 1 

section .text
	global _start
	
      _start:
	mov eax, '6'
	sub eax, '0'
	mov ebx,'3'
	sub ebx,'0'
	sub eax,ebx
	add eax,'0' ; to convert it into hex to ASCII
	mov [sub1],eax ; [] denote the address where to store(move the content of eax gets stored in sum var)
	
	mov eax,4 ; sys_call
	mov ebx,1; sys_call to end
	mov ecx,msg                  ; only to print the msg
	mov edx,len
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,sub1                                  ; only to print sum
	mov edx,1 ; as we gave 1 byte of storage
	int 80h
	
	mov eax,1
	mov ebx,0 ; to exit the program
	int 80h

