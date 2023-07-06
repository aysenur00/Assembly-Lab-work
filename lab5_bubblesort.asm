org 100h
.data 
vector DB 15,14,13,9,8,7,6,4,2,0 ; array 
array_size dw 9 ;array boyutunu sabit tanimladik
.code 
start:
mov cx, array_size 
mov dx, array_size 
mov bp, offset vector; arrayin baslangicç adresini aldýk 
mov di,0 
mov si,0 

outerloop:
mov cx,dx 
mov di,0 
mov si,0 
innerloop:

    mov al,[bp][si] 
    mov ah,[bp][si+1] 
    cmp al,ah 
    jna jump ;al,ah tan büyükse swap yap 
    jmp swap 
jump: 
    inc di 
    inc si 
    loop innerloop 
    dec dx 
    jnz outerloop 
ret 
swap: 
    mov al,[bp][si] 
    mov ah,[bp][si+1] 
    mov bl,al 
    mov al,ah 
    mov ah,bl 
    mov [bp][di],al 
    mov [bp][di+1],ah 
jmp jump