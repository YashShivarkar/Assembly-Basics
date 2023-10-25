section .data
x db 1,2,2,3;			remember the sum of elements in array should be less than 9
sum dw 1 ;			dw cuz result is stored in 16 bits or we can use db and assign 2 byte to it
msg db 'The sum is:',10,3	
msg2 db ' '
len: equ $-msg	
len2: equ $-msg2	
section .text
global _start
 _start:
 	mov al,4;		length of an array
 	mov bx,0;		used to store our sum
 	mov ecx,x; 		defining the starting address of the array(index 0)
 t:; 				defining loop with the random label(can be anything)
 
 	add bx,[ecx]; 		add ebx with the content inside the index of ecx
 	add ecx,1; 		increament
 	dec al; 		decreament
 	jnz t; 		jnz= jump if not zero(till the value of eax is 0) (back to label t)
 	
 	add bx,'0';	 	here 0 is in Hex code thats why single quotes
 	mov [sum],bx
 	
 	mov eax,4
 	mov ebx,1
 	mov ecx,msg
 	mov edx,len
 	int 80h 
 	 	
 	mov eax,4
 	mov ebx,1
 	mov ecx,sum; 		for printing sum of array
 	mov edx,1
 	int 80h
 	
 	mov eax,4
 	mov ebx,1
 	mov ecx,msg2
 	mov edx,len2
 	int 80h 
 	
 	mov eax,1
 	mov ebx,0;		ending program
 	int 80h
 	
