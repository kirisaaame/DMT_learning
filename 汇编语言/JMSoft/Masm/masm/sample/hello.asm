;********************************************
;  *������:��ʾHello World!                    *
;  *��������Masm 5.0,ML6.11������          *
;  ********************************************
DATAS  SEGMENT
     STRING  DB  'Hello World!',13,10,'$'
DATAS  ENDS

CODES  SEGMENT
     ASSUME    CS:CODES,DS:DATAS
     
START:
     MOV  AX,DATAS
     MOV  DS,AX
     LEA  DX,STRING
     MOV  AH,9
     INT  21H
   
     MOV  AH,4CH
     INT  21H
CODES  ENDS
    END   START
