section .data
msg db 'The sub is:'
len: equ $-msg

section .bss
sub1 resb 1 

section .text
	global _start
	
      _start:
	mov ax, '4'
	sub ax, '0'
	mov bx,'5'
	sub bx,'0'
	sub eax,ebx
	add ax,'0' ; to convert it into hex to ASCII
	mov [sub1],ax ; [] denote the address where to store(move the content of eax gets stored in sub1 var)
	
	mov eax,4 ; sys_call
	mov ebx,1; sys_call to end
	mov ecx,msg                  ; only to print the msg
	mov edx,len
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,sub1                                  ; only to print sub
	mov edx,1 ; as we gave 1 byte of storage
	int 80h
	
	mov eax,1
	mov ebx,0 ; to exit the program
	int 80h ; int = interupt

