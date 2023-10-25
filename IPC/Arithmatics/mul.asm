
;Write ALP to give the multiplication of two 8 bit numbers


section .data
msg1 db 'Enter the 1st number: ',10
len1: equ $-msg1
msg2 db 'Enter the 2nd number: ',10
len2: equ $-msg2
msg3 db 'Multiplication is: '
len3: equ $-msg3

section .bss
num1 resb 1
num2 resb 1
res resb 1

section .text
global _start
_start:
	%macro rw 4
	mov eax, %1
	mov ebx, %2
	mov ecx, %3      ;Used macro(templet)
	mov edx, %4
	int 80h
	%endmacro
	
	rw 4,1,msg1,len1
	rw 3,0,num1,2
	
	rw 4,1,msg2,len2
	rw 3,0,num2,2
	
	mov al,[num1]
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	mul bl
	add al,'0'
	mov [res],al
	
	rw 4,1,msg3,len3
	rw 4,1,res,1
	
	mov eax,1
	mov ebx,0
	int 80h
	
