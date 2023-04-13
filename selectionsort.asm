org 100h

mov di, 0
mov si, 0
mov bx, offset arr       ; bx is set to array's starting address
mov cx, 0

outer_loop:
mov di, cx               ;di is set to the offset of first element in the unsorted part of the array
mov dh, [bx+di]
mov si, di
inc si
    inner_loop:
    
    mov al, [bx+si]
    cmp al, dh           ;comparing elements of the unsorted portion of array to find the minimum
    jg cont
    jng chng_min         ;if al is less than the current minimum jump chng_min
    chng_min:
    mov di, si           ;changing the index of current minimum value
    mov dh, [bx+di]      ;changing the current minimum value which is held by dh 
    cont:
    inc si
    cmp si, 10
    jnz inner_loop
    
    ;swap
    mov si, cx
    mov dl, [bx+si]
    mov dh,[bx+di]
    mov [bx+si], dh
    mov [bx+di], dl
    
    inc cx   
    cmp cx, 9
jne outer_loop                
    

ret

arr db 15,8,13,7,6,14,4,2,0,9 

end
