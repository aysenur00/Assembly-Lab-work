.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Toplama   ='t'  $'
MSG2 DB 'Cikarma   ='c'$'
MSG3 DB 10,13,'Carpma    ='p'  $'
MSG4 DB 'Bolme     ='b'$'
MSG5 DB 10,13,10,13,'Yapacaginiz islemi seciniz: $'
MSG6 DB 10,13,'Ilk sayiyi giriniz: $'
MSG7 DB 10,13,'Ikinci sayiyi giriniz: $'
MSG8 DB 10,13,10,13,'Sonuc:$' 
MSG9 DB 10,13,'Devam etmek icin d cikmak icin q ya basiniz: $'
                           
SAYI1 DB ?
SAYI2 DB ?
SONUC DB ?

.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX 
 
START:

CALL REFERANS 

MOV AH,1H
INT 21H 

CMP AL,74H
JE TOPLA

CMP AL,63H
JE CIKAR
 
CMP AL,70H
JE CARP

CMP AL,62H
JE BOL 

CHECK_TO_RESUME:

CALL CIKIS_YAZISI 

MOV AH,1H
INT 21H

CMP AL,64H          ;d'ye mi basildi kontrolu   
 
PUSH AX             ; AX i push ettik cunku newline prosedurunde degeri degisiyor

CALL NEWLINE        ; bu iki satir devam etmek istendiginde iki kez newline yapilmasini sagliyor
CALL NEWLINE 

POP AX 

JE START

CMP AL,71H          ;q'ya mi basildi kontrolu  
JE EXIT

CALL NEWLINE
CALL NEWLINE
 
JNE CHECK_TO_RESUME

 
TOPLA:
    
    CALL ILKSAYI_YAZISI
    
    MOV BL,AL
    
    CALL IKINCISAYI_YAZISI
    
    ADD AL,BL
    MOV AH,00H
    
    sub ax, 60h
             
    ADD AH,30H
    ADD AL,30H
    
    MOV BX,AX 
    
    LEA DX,MSG8
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    CALL NEWLINE
    CALL NEWLINE
    
    JMP CHECK_TO_RESUME 
    
    
CIKAR:

CALL ILKSAYI_YAZISI

MOV BL,AL

CALL IKINCISAYI_YAZISI

SUB BL,AL
ADD BL,30H

LEA DX,MSG8
MOV AH,9
INT 21H

MOV AH,2
MOV DL,BL
INT 21H


CALL NEWLINE
CALL NEWLINE


JMP CHECK_TO_RESUME
    
    
   CARP:
 
    CALL ILKSAYI_YAZISI
    
    SUB AL,30H
    MOV SAYI1,AL
    
    
    CALL IKINCISAYI_YAZISI
    
    SUB AL,30H
    MOV SAYI2,AL
    
    MUL SAYI1
    MOV SONUC,AL 
    
    MOV BX,AX  
    
    ADD BH,30H
    ADD BL,30H
     
    LEA DX,MSG8
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    CALL NEWLINE
    CALL NEWLINE
   
    
    JMP CHECK_TO_RESUME 
    
   
   
BOL:
   
CALL ILKSAYI_YAZISI

SUB AL,30H
MOV SAYI1,AL


CALL IKINCISAYI_YAZISI

SUB AL,30H
MOV SAYI2,AL

MOV CL,SAYI1
MOV CH,00
MOV AX,CX  

DIV SAYI2
MOV SONUC,AL 

MOV AH, 00

MOV BX,AX

ADD BH,30H
ADD BL,30H

LEA DX,MSG8
MOV AH,9
INT 21H 

MOV AH,2
MOV DL,BH
INT 21H

MOV AH,2
MOV DL,BL
INT 21H


CALL NEWLINE
CALL NEWLINE


JMP CHECK_TO_RESUME

    
EXIT:

MOV AH,4CH
INT 21H

MAIN ENDP

    
;    PROCEDURES
;-------------------
    
    NEWLINE PROC
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h
    
    ret ;return to caller  
    NEWLINE ENDP 
    
;-------------------
    
    REFERANS PROC
        
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H 
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H
         
    ret ;return to caller    
    REFERANS ENDP 
    
;-------------------
    
    CIKIS_YAZISI PROC
        
    LEA DX,MSG9
    MOV AH,9
    INT 21H
    
    ret ;return to caller     
    CIKIS_YAZISI ENDP 
    
;-------------------  

    ILKSAYI_YAZISI PROC
        
    LEA DX,MSG6     ;ilk sayiyi giriniz
    MOV AH,9
    INT 21H 
    
    MOV AH,1        ;ilk sayiyi oku
    INT 21H
    
    ret ;return to caller     
    ILKSAYI_YAZISI ENDP 
    
;-------------------  

    IKINCISAYI_YAZISI PROC
        
    LEA DX,MSG7     ;ikinci sayiyi giriniz
    MOV AH,9
    INT 21H 
    
    MOV AH,1        ;ikinci sayiyi oku
    INT 21H
    
    ret ;return to caller     
    IKINCISAYI_YAZISI ENDP 
    
;------------------- 


END MAIN