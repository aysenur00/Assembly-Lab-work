;Assign 10 random numbers between 0-255 to the memory. (eg: 6,4,15,23,54,32,12,34,5,7).
;Write the program that writes the factorial of the remainder from the smallest part of the 
;largest of these numbers to the ax register. 
;Bu sayilarin arasindan en buyugunun en kucugune bolumunden kalaninin faktoriyelini 
;ax registerina yazan programi yaziniz.
;Note:
;The submitted assignment must work for random numbers between 0-255.
;If you write a program that works only for the numbers above, your homework will be evaluated as 30.
;It is mandatory to use memory addressing and loops.
;

org 100h

mov bx, offset arr + 1 
mov ah, 0
mov ch, 9 ; loop counter
mov cl, arr[0] ;initializing min
mov dl, arr[0] ;initializing max

lbl: ;max ve mini bulan dongu
    mov al, [bx]
    cmp cl, al
    jg chng_min
    jng check_max
    chng_min:
    mov cl, al ; min cl'de
    jmp cont
    check_max:
    cmp dl, al
    jng chng_max
    jg cont
    chng_max:
    mov dl, al ; max dl'de
    cont: 
    inc bx
    dec ch
    cmp ch, 0  

 
jne lbl
        

mov al, dl
div cl   ;kalan ah'ta 

;kalanin faktoriyeli

mov cl, ah ; faktoriyeli bulunacak sayi counter oldu
mov ax, 1 

fact:
    mul cx
    loop fact ; faktoriyel ax registerindedir. bu array icin max 55 min 4, 
              ; en buyugunun en kucugune bolumunden kalan 3, 3! = 6
    
ret     




arr db 6,24,20,32,5,4,12,55,13,7 

end  