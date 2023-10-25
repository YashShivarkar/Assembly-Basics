section .data
msg1: db 'Enter the first name: ',10
len1: equ $- msg1

msg3: db 'Enter the last name: ',10
len3: equ $- msg3

msg4: db 'The full name is: ',10
len4: equ $- msg4

section .bss
first resb 10
last resb 10 
full resb 20

section .text
global _start
_start:
	%macro rw 4
	mov eax,%1
	mov ebx,%2
	mov ecx,%3
	mov edx,%4
	int 80h
	%endmacro
	
	rw 4,1,msg1,len1
	rw 3,0,first,10
	
	rw 4,1,msg3,len3
	rw 3,0,last,10
	
	mov edi,full     ;assigning di to fullname
	
	mov esi,first
	up:
	mov al,[esi]
	cmp al,10
	je dn
	mov [edi],al   ;inserting each char of first name in si register
	inc esi
	inc edi
	jmp up
	   
	dn:
	mov [edi],byte ' ' ;for inserting space
	inc edi
	
	mov esi,last
	up1:
	mov al,[esi]
	cmp al,10
	je dn1
	mov[edi],al   ;inserting each char of last name in si register
	inc esi
	inc edi
	jmp up1
	
	dn1:       
	rw 4,1,full,20  ;printing fullname stored in di register
	
	mov eax,1
	mov ebx,0
	int 80h
