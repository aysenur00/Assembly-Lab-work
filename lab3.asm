;21'e (21 dahil) kadar olan fibonacci sayilarindan tek sayilarin 
;toplamini dx registerina yazdiran programi yaziniz.

;Fibonacci sayilarinin program tarafindan hesaplanmasi gerekmektedir.  


; 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ... 

; cevap: 1+1+3+5+13+21 = 44 = 2c h

; kural xn = xn-1 + xn-2

org 100h

mov bl, 0
mov cl, 1

add dl, cl ; ikinci terim olan 1 eklendi

add:
    push cx
    add cl, bl
    mov al, cl
    mov ch, 2
    mov ah, 00
    div ch
    cmp ah, 0
    jne topla
    jmp i_done
    topla:
        add dl, cl
        
    i_done:
        pop ax
        mov bl, al ; pop ettigimiz deger formuldeki xn-2'i ifade ediyor 
        cmp cl, 21
        je done 
        jmp add    
    

done:



ret

end