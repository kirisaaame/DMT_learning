;********************************************
;  *�����ܣ��򻯶ε�Hello World����      *
;  *��������ML6.11                                   *
;  ********************************************
;
.MODEL SMALL
.DATA
     STRING  DB  'Hello World!',13,10,'$'
.STACK
.CODE
.STARTUP
     LEA  DX,STRING
     MOV  AH,9
     INT  21H
.EXIT
     END
