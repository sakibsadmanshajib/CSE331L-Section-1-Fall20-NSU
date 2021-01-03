.MODEL SMALL
 
  .STACK 100H 
          
  .DATA
  STRING DB "The quick brown fox jumped over lazy sleeping dog$"
  VOWEL DB ?
 
  .CODE
  MAIN PROC
  MOV AX, @DATA
  MOV DS, AX
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
  COUNT: INC BL
  MOV VOWEL, BL
  INC SI
  JMP BACK
  FINAL: MOV AH, 4CH
  INT 21H
  MAIN ENDP

  END