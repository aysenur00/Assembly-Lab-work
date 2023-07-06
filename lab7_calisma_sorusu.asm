;700:102 bellek adresinde bulanan 0,1,2,3,4,5,6,7,8,9 (decimal) sayilarini 
;ikilik tabanada yazildiklarinda olusturduklari 0-1 dizisindeki 1 leri 
;bularak bu birlerin sayisini 700:112 bellek adresinden itibaren yazdiran 
;programý yaziniz.(FOY3)

;Memory
;0700:0102 00,01,02,03,04,05,06,07,08,09
;0700:0112 00,01,01,02,01,02,02,03,01,02     

; storing the elements of array at memory location 700:102

mov ax, 700h
mov ds, ax
sub ax, ax

mov cx, 10
mov dx, 0
mov si, 0
lbl:
mov [102h] + si, dl
inc dx
inc si
loop lbl

; finding the number of 1s in each element
 

sub ax, ax 
mov si, 0
mov cx, 10

next_element:

sub bl, bl 
mov dx, 8
mov al, [102h]+si

rotate:
    rol al,1
    jnc next
    inc bl
    next:
    dec dx
    jnz rotate
    mov [112h]+si,bl

inc si
dec cx
jnz next_element 

ret

end
