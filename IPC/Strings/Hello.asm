segment .data
msg db 'Hi! My name is Yash. Nice to meet you all',10 ; 10 is ASCII for new line
roll db '2223567',10
msglen: equ $-msg
rolllen: equ $-roll

segment .text
global _start
_start:
mov eax,4
mov ebx,1
mov ecx,msg
mov edx,msglen
int 80h


mov eax,4
mov ebx,1
mov ecx,roll
mov edx,rolllen
int 80h

mov eax,1
mov ebx,0
int 80h
