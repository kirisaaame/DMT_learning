; ******************************************************************************
;  * ������:����˷��ھ���                 
;  1*1=1
;  1*2=2 2*2=4
;  1*3=3 2*3=6 3*3=9
;  1*4=4 2*4=8 3*4=12 4*4=16
;  1*5=5 2*5=10 3*5=15 4*5=20 5*5=25
;  1*6=6 2*6=12 3*6=18 4*6=24 5*6=30 6*6=36
;  1*7=7 2*7=14 3*7=21 4*7=28 5*7=35 6*7=42 7*7=49
;  1*8=8 2*8=16 3*8=24 4*8=32 5*8=40 6*8=48 7*8=56 8*8=64
;  1*9=9 2*9=18 3*9=27 4*9=36 5*9=45 6*9=54 7*9=63 8*9=72 9*9=81
;  *��������Masm 5.0,ML6.11������          
;  ******************************************************************************
data segment
  a db ?
  b db ?
  c1 db ?              ;C�ǹؽ��ֲ���������������
data ends
code segment
   assume cs:code,ds:data
start:
   mov ax,data
   mov ds,ax
   mov a,1
lp2:mov b,1
lp1:mov al,a   
    mul b        ;1X1���������AL��
    mov c1,al    ;����C1�����һ�����
    call disp    ;
    add b,1
    mov al,b
    cmp al,a
    jbe lp1      ;�Ƿ����
    call dad     ;������
    add a,1      ;a+1
    cmp a,9      ;�Ƿ����9
    jbe lp2      
    mov ah,4ch   ;���ھ������
    int 21h
disp proc
     mov dl,b   
     or dl,30h   ;��DL������ת��ʮ����
     mov ah,2    
     int 21h      ;���DL����
     mov dl, '*'   
     int 21h      ;���һ��*��
     mov dl,a     
     or dl,30h    ;�ѱ���Aת��ʮ����
     int 21h       ;���
     mov dl,'='   ;���=��
     int 21h
     mov dl,c1    ;�ѳ˻��Ľ������DL
     cmp dl,9     ; CF��ZF = 0 ��
     ja aa1       
     or dl,30h     ;DL����ת��ʮ����
     mov ah,2        
     int 21h        ;���
     mov dl, ' '    ;���һ�����ַ�
     int 21h
     jmp over       ;��ת������
aa1:mov bl,dl      ;  
     mov dl,0       
aa3:cmp bl,10      ;С��10��?
     jb aa2         ;����10����
     sub bl,10       ;��Ҫ��Ϊ�˵�������9��ʮ���������(����25-10 DL=2 BL=5�����Ϳ���������)
     inc dl          ;��dl�������λ
     jmp aa3         ;�ٴαȽ��Ƿ����ʮ
aa2:or dl,30h       ;�������λ����
     mov ah,2        ;
     int 21h         ;
     mov dl,bl       ;������Ĳ�
     or dl,30h       ;����Ϊʮ����
     mov ah,2        ;
     int 21h         ;
     mov dl,' '      ;
     int 21h         ;
over:ret
disp endp
dad proc
     mov dl,0ah   ;����
     mov ah,2
     int 21h
     mov dl,0dh
     int 21h     
     ret
dad endp
code ends
    end start
