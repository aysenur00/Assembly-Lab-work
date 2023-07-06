;6,2,15,23,54,32,12,34,5,7 dizisindeki sayilari bellege atiniz. 
;Bu sayilarin arasindan en buyugun ve en kucugun ortalamasini bulan 
;bu ortalamayi ax registerina yazan programi yaziniz.
;Bellek adresleme ve dongu kullanmaniz zorunludur. 

;6,2,15,23,54,32,12,34,5,7 

;(2+54)/2=28 = 1ch 


org 100h 

mov bx, offset arr + 1 
mov ah, 0
mov ch, ARR_SIZE - 1
mov cl, arr[0] ;initializing min
mov dl, arr[0] ;initializing max

lbl:
    mov al, [bx]
    cmp cl, al
    jg chng_min
    jng check_max
    chng_min:
    mov cl, al
    jmp cont
    check_max:
    cmp dl, al
    jng chng_max
    jg cont
    chng_max:
    mov dl, al
    cont: 
    inc bx
    dec ch
    cmp ch, 0  

 
jne lbl

add cl, dl
mov al, cl
mov bl, 2
div bl ; sonuc al registerindedir, kalan olmadigi icin ah 0 

ret

arr db 6,2,15,23,54,32,12,34,5,7 
ARR_SIZE equ $ - arr 

end
