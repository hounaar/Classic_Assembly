
.model small
.data
str1 db "hello"
str2 db "world$"
str db ?
.code
start:
mov ax,@data
mov ds,ax
lea bx,str1
lea si,str2
mov dx,5
mov cx,5
lea ax,str
push ax
push bx
push si
push cx
push dx
call myproc
mov ah,8
int 21h
mov ax,4c00h
int 21h
myproc proc
    pop dx
    pop dx
    pop cx
    pop si
    pop bx
    pop ax
   push si
   push dx
   mov si,ax
   for:
   mov dl,[bx]
   mov [si],dl
   inc si
   inc bx
   inc ax
    loop for
    pop dx
    pop si
    mov cx,dx 
    mov bx,ax
    for2:
   mov dl,[si]
   mov [bx],dl
   inc si
   inc bx
   inc ax
    loop for2
   
 ret 
 endp