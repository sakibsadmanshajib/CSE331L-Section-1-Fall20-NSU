
.MODEL SMALL
.STACK 100

.DATA
MAXCHAR DB 60;
ACTCHAR DB ?;
STR DB 60 DUP (?);
VOWEL_NO DB 0;
NEWLN DB 0DH,0AH,”$”;
CHECK STR DB 65, 69, 73, 79, 85, 97, 101, 105, 111, 117; {A, B, …. Z = 65, 66 …. 90 : a, b, … z = 97, 98, …122}

.CODE
MAIN PROC
MOV AX, @DATA;                            ;initialize data segment
MOV DS, AX;                               ;register
LEA DX, MAXCHAR;                          ;compute address of value
MOV AH, 0AH;                                   ;Getline function
INT 21H;                                              ;Get input
CALL NEXT LINE;                                ;New Line
MOV CL, ACTCHAR;
MOV CH, 0;
MOV, 0;
L1:          
PUSH CX;                                             ;Save Register
MOV DL, STR[BX];
MOV CX, 10;
MOV SI, 0;
L3:          
CMP DL, CHECK STR[SI];      ;compare DL and str[si]
JZ L2;                                                     ; jump to label L2 if CF = 1
INC SI;                                                   ; Add 1 to contents of SI register
LOOP L3;                                              ; Repeat until all elements adjusted
JMP L4;                                                 ; Jump to L4 without any condition
L2:          
INC VOWEL_NO;                  ; Add 1 to content of Vowel no
MOV AH, 02H;                                    ; Put the immediate number
INT 21H;                                               ; Get input
L4:          
INC BX;                                  ; Add 1 to contents of BX register
POP CX;                                                ; Copy a word from the top of stack to CX
 ; Increment SP by 2
LOOP L1;                                              ;Repeat until all elements adjusted
CALL VOWEL COUNT DISP
MOV AX, 4000H;                                ; Put the immediate number
INT 21H;                                               ;Get input
MAIN ENDP
NEXT LINE PROC NEAR;
LEA DX, NEWLN;                                 ;compute address of value
MOV AH, 09H;                                   ;Put the immediate number
INT 21H;
RET;                                                      ; Return to main line
NEXTLINE ENDP
VOWEL COUNT DISP PROC NEW
MOV CX, 10;                                       ;Put the immediate number
MOV AL, VOWEL_NO;                      ;Copy word from Vowel no to AL Register
MOV AH, 0;                                         ;Put the immediate number
MOV BX, 0;                                         ;Put the immediate number
LABEL1: MOV DX, 0;                           ;Put the immediate number
DIV CX;                                                 ;Divide doubleword in DX and AX by word in CX.
; Quotient in AX, reminder in DX
ADD DX, 30H;                                     ;Add immediate number 30H to content of DX.
;Result in AL
PUSH DX;                                             ;Decrement SP by 2, copy DX to stack
INC BX;                                                 ;Add 1 to contents of BX register
CMP AX, 0;                                          ;Compare by subtracting 0 from AX
JA LABEL1;                                           ;Jump to level LABEL1 if AX above 0
MOV AH, A2H;                                   ;Put the immediate number
MOV CX, BX;                                       ;Copy word from BX to CX Register
DISP:     
POP DX;                                 ;Copy a word from the top of stack to DX
; Increment SP by 2
INT 21H;                                               ;Get Input
LOOP DISP;                                         ;Repeat until all elements adjusted
RET;                                                      ;return to main program
VOWEL COUNT DISP ENDP
    MAIN ENDP END MAIN
