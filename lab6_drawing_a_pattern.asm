screen macro ;grafik modu. 40x25. 256 colors. 320x200 pixels. 
    mov ah,00 
    mov al,13h 
    int 10h 
endm 

;yatay cizgi icin makro

draw_hrz macro x,y       
    local myloop        ;Duplicate declaration hatasi almamak icin 
                        ;baslangic koordinatlari macro parametresinden aliniyor 
    mov cx,x            ;CX = sutun 
    mov dx,y            ;DX = satir. 
    mov bh,0h           ;sayfa sayisi 
    myloop: 
    mov ah,0ch          ;INT 10h / AH = 0Ch - change color for a single pixel 
    mov al,04           ;AL = red
    int 10h 
    inc cx 
    cmp cx,90 
    jnz myloop 
endm 

;dikey cizgi icin makro 

draw_vrt macro x,y      
    local myloop        ;Duplicate declaration hatasi almamak icin 
                        ;baslangic koordinatlari macro parametresinden aliniyor 
    mov cx,x            ;CX = sutun 
    mov dx,y            ;DX = satir. 
    mov bh, 0h            
    myloop: 
    mov ah,0ch          ;INT 10h / AH = 0Ch - change color for a single pixel 
    mov al,01           ;AL = blue 
    int 10h 
    inc dx 
    cmp dx,90 
    jnz myloop 
endm  

capraz_ciz macro x,y,z
    local lbl
    mov cx,x
    mov dx,y
    mov bh, 0h
    mov bx, z
    lbl:
    mov ah,0ch
    mov al,02       ;green
    int 10h
    inc dx
    dec cx
    dec bx
    jnz lbl 
endm 

capraz_ciz_2 macro x,y,z
    local lbl
    mov cx,x
    mov dx,y
    mov bh, 0h
    mov bx, z
    lbl:
    mov ah,0ch
    mov al,02
    int 10h
    dec dx
    inc cx
    dec bx
    jnz lbl 
endm  

capraz_ciz_3 macro x,y,z
    local lbl
    mov cx,x
    mov dx,y
    mov bh, 0h
    mov bx, z
    lbl:
    mov ah,0ch
    mov al,02
    int 10h
    inc dx
    inc cx
    dec bx
    jnz lbl 
endm


capraz_ciz_renk1 macro x,y,z
    local lbl
    mov cx,x
    mov dx,y
    mov bh, 0h
    mov bx, 35
    lbl:
    mov ah,0ch
    mov al,z  ;renk
    int 10h
    inc dx
    dec cx
    dec bx
    jnz lbl 
endm  

capraz_ciz_renk2 macro x,y,z
    local lbl
    mov cx,x
    mov dx,y
    mov bh, 0h
    mov bx, 35
    lbl:
    mov ah,0ch
    mov al,z   ;renk
    int 10h
    inc dx
    inc cx
    dec bx
    jnz lbl 
endm 

c_ciz macro x,y,z
    local start
    mov cx,x
    mov dx,y
    mov bl,z
    start:
    mov ah,0ch
    mov al,0fh
    int 10h
    inc cx
    dec bl
    jnz start
endm

fonk1 macro x ;c'nin duz kismini cizer
    local lbl 
    mov si,x
    lbl:
        c_ciz 43,si,7  
    inc si
    cmp si,46
    jne lbl
    
    endm

screen 

draw_hrz 20,20
draw_hrz 20,55
draw_hrz 20,90
;
draw_vrt 20,20
draw_vrt 55,20
draw_vrt 90,20
;
capraz_ciz 30,20,10 
capraz_ciz 40,20,20
capraz_ciz 50,20,30
capraz_ciz 60,20,40
capraz_ciz 70,20,50
capraz_ciz 80,20,60 
;
capraz_ciz_renk1 90,20,06
capraz_ciz_renk1 55,55,0dh
;
capraz_ciz_2 30,90,60
capraz_ciz_2 40,90,50
capraz_ciz_2 50,90,40
capraz_ciz_2 60,90,30
capraz_ciz_2 70,90,20
capraz_ciz_2 80,90,10 

capraz_ciz_3 80,20,10
capraz_ciz_3 70,20,20
capraz_ciz_3 60,20,30
capraz_ciz_3 50,20,40
capraz_ciz_3 40,20,50
capraz_ciz_3 30,20,60 
;
capraz_ciz_renk2 20,20,06
capraz_ciz_renk2 55,55,0dh
;
capraz_ciz_3 20,30,60
capraz_ciz_3 20,40,50
capraz_ciz_3 20,50,40
capraz_ciz_3 20,60,30
capraz_ciz_3 20,70,20
capraz_ciz_3 20,80,10


; C ç4 cizgi ile 

;mov cx, 55
;mov dx,  20
;lbl1:
;mov ah, 0ch
;mov al, 5
;int 10h
;inc dx
;dec cx
;cmp cx, 20
;jnz lbl1
;
;mov cx, 20
;mov dx, 55 
;
;lbl2:
;mov ah, 0ch
;mov al, 5
;int 10h
;inc dx
;inc cx
;cmp cx, 55
;jnz lbl2
;
;mov cx, 55
;mov dx, 20
;
;lbl3:
;mov ah, 0ch
;mov al, 5
;int 10h
;inc cx
;inc dx
;cmp dx, 37
;jnz lbl3   
;
;mov cx, 55
;mov dx, 90
;
;lbl4:
;mov ah, 0ch
;mov al, 5
;int 10h
;inc cx
;dec dx
;cmp dx, 72
;jnz lbl4 
            
c_ciz 51,20,8
c_ciz 48,21,8+6
c_ciz 47,22,16
c_ciz 46,23,18
c_ciz 45,24,20
c_ciz 44,25,22
c_ciz 44,26,9
c_ciz 59,26,8
c_ciz 44,27,7
c_ciz 60,27,8
c_ciz 43,28,8
c_ciz 61,28,7 
c_ciz 43,29,7 
c_ciz 61,29,7 

fonk1 30

c_ciz 51,55,8
c_ciz 48,54,8+6
c_ciz 47,53,16
c_ciz 46,52,18
c_ciz 45,51,20
c_ciz 44,50,22
c_ciz 44,49,9
c_ciz 59,49,8
c_ciz 44,48,7
c_ciz 60,48,8
c_ciz 43,47,8
c_ciz 61,47,7 
c_ciz 43,46,7 
c_ciz 61,46,7   


  

ret



