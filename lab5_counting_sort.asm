; 15,14,13,9,8,7,6,4,2,0 (sayilar decimaldir) dizisindeki sayilari 
;herhangi bir siralama algoritmasini kullanarak siralayiniz. 


; COUNTING SORT
; every number in the range( 0-15 here) is counted and the number of occurrences is pushed into stack
; then the array is overwritten on the same address due to the number of occurrences starting from the lower range to higher



;---------------------------------------------
; find the highest element in the array

mov cx, 9 ; loop counter 
mov bx, offset arr + 1
mov dl, arr[0] ;initializing max 
find_max:
    mov al, [bx]
    cmp al, dl
    jg chng
    jmp cont
    
    chng:
    mov dl, al
    
    cont:
    inc bx
    dec cx
    jnz find_max
; max value is in the DL register
 
;--------------------------------------------- 
;the number of occ. is pushed into stack


mov cl, dl    ; loop counter 15

outer_loop:

mov dx, 00     ; initializing count variable
mov bx, offset arr
mov ah, 10

count:

mov al, [bx]
cmp cl, al
je increment_var
jne cont2 


increment_var:
inc dl

cont2:
inc bx
dec ah
jnz count

push dx
dec cl
cmp cl, -1
jne outer_loop 

;--------------------------------------------- 
;sorted array

mov cx, 0            ; number to be written
mov bx, offset arr

overwrite_the_array:
    pop ax
    inner_loop:
    cmp ax, 0
    je no_occurrence_or_continue
    jne write
    
    write:
        mov [bx], cl
        inc bx
        dec ax
        jnz write
    
    no_occurrence_or_continue:
    inc cx
    
    cmp cx, 16
    jne overwrite_the_array




     
ret
                                                         
arr db 15,14,13,9,8,7,6,4,2,0
;       f  e  d


end 