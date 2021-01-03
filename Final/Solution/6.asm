.MODEL SMALL
 
  .STACK 100H 
          
  .DATA
  PROMPT_1 DB "Please Enter a String: $"
  PROMPT_2 DB 0DH,0AH,"Total Number of Vowels in the String: $"
  STRING DB 32
  VOWEL DB ?
 
  .CODE
  MAIN PROC
  MOV AX, @DATA
  MOV DS, AX
  
  MOV AH, 9
  MOV DX, OFFSET PROMPT_1
  INT 21H

    MOV AH, 0AH
    MOV DX, OFFSET STRING
    INT 21H
    
    MOV SI, OFFSET STRING + 1
    MOV CL, [ SI ]
    MOV CH, 0 
    INC CX
    ADD SI, CX
    MOV AL, "$"
    MOV [SI], AL  

  MOV SI, OFFSET STRING  
  MOV BL, 00     
 
  BACK: MOV AL, [SI]
  CMP AL,'$'
  JZ FINAL
  CMP AL,'A'
  JZ COUNT   
  CMP AL,'E'
  JZ COUNT   
  CMP AL,'I'
  JZ COUNT   
  CMP AL,'O'
  JZ COUNT   
  CMP AL,'U'
  JZ COUNT
  CMP AL,'a'
  JZ COUNT   
  CMP AL,'e'
  JZ COUNT   
  CMP AL,'i'
  JZ COUNT   
  CMP AL,'o'
  JZ COUNT   
  CMP AL,'u'
  JZ COUNT   
  INC SI
  JMP BACK 
  COUNT: 
  INC BL
  MOV VOWEL, BL
  INC SI
  JMP BACK
  FINAL:
  MOV AH, 9
  MOV DX, OFFSET PROMPT_2
  INT 21H
  
  OR VOWEL, 30H
  
  MOV AH, 2
  MOV DL, VOWEL
  INT 21H
   
  MOV AH, 4CH
  INT 21H
  MAIN ENDP

  END