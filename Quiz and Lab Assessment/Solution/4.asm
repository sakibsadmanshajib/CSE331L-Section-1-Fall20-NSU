OUTDEC PROC

   PUSH BX                       
   PUSH CX                      
   PUSH DX                     

   CMP AX, 0                    
   JGE @START             

   PUSH AX                     

   MOV AH, 2                 
   MOV DL, "-"              
   INT 21H                       

   POP AX                    

   NEG AX                    

   @START:                   

   XOR CX, CX              
   MOV BX, 10                 

   @OUTPUT:                  
     XOR DX, DX               
     DIV BX                     
     PUSH DX                  
     INC CX                   
     OR AX, AX               
   JNE @OUTPUT            

   MOV AH, 2                 

   @DISPLAY:              
     POP DX              
     OR DL, 30H            
     INT 21H             
   LOOP @DISPLAY              

   POP DX                        
   POP CX                      
   POP BX                      

   RET                        
 OUTDEC ENDP