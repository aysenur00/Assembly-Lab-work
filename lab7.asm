;program to reverse an 8-bit input from user

.model small
.data
	mes1 db ' input: ','$'
	mes2 db 13, 10,'output: ','$'	
	buffer  db 10
	        db 9 dup(?)        
	bosluk db 0fh 
	arr db 8 (?)

	    
.code 
    MOV AX, @DATA		
	MOV DS, AX  
	
	MOV DX, OFFSET mes1	    ; Display message mes1
	MOV AH, 09H
	INT 21H 
	
	MOV AH, 0AH             ; Read from keyboard the input
	MOV DX, offset buffer	
	INT 21H
	
	mov si, 2h 
	mov cl, 8 
	
	again: 
    mov al, buffer + si
    sub al, 30h
    mov arr[si-2], al
    inc si 
    dec cl
    jnz again
              
    ;------------
	mov bl, 0
	 
    mov al, arr  
    cmp al, 1
    jnz add1
    add bl, 128
    add1: 
    
    mov al, arr + 1 
    cmp al, 1 
    jnz add2
    
    add bl, 64 
    add2: 
    
    mov al, arr + 2 
    cmp al, 1 
    jnz add3
    
    add bl, 32  
    add3:
    
    mov al, arr + 3 
    cmp al, 1 
    jnz add4
    
    add bl, 16
    add4:
    
    mov al, arr + 4 
    cmp al, 1 
    jnz add5
    
    add bl, 8
    add5:
    
    mov al, arr + 5 
    cmp al, 1 
    jnz add6
    
    add bl, 4
    add6:
    
    mov al, arr + 6 
    cmp al, 1 
    jnz add7
    
    add bl, 2
    add7:
    
    mov al, arr + 7 
    cmp al, 1 
    jnz add8
    
    add bl, 1
    add8:    
    
    ;---------------- 
    lea DX, mes2	    ; Display message mes2
	MOV AH, 09H
	INT 21H 
	
    mov cl, 8
    rot:
    shr bl, 1
    jnc zero
    jmp one
    zero:
    
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp next
    
    one:
    
    mov dl, '1'
    mov ah, 02h
    int 21h
    
    next:
    dec cl
    jnz rot
    
    MOV AH, 4CH		     
	INT 21H			    
			
end