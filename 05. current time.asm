.model small           
.stack                
.data 
    msg db 10,13,"current time is $"   
.code 
start: 
    mov ax, @data      
    mov ds, ax         
   
    lea dx, msg       
    mov ah, 9         
    int 21h             
   
    mov ah, 2Ch       
    int 21h            
   
    mov al, ch         
    call disp         
   
    mov dl, ':'       
    mov ah, 2          
    int 21h            
   
    mov al, cl         
    call disp          
    
    mov dl, ':'        
    mov ah, 2 
    int 21h 
    
    mov al, dh        
    call disp         
   
    mov dl, '.'       
    mov ah, 2 
    int 21h 
   
    mov ah, 4Ch        
    int 21h 

disp proc near 
    aam                 
    add ax, 3030h     
    mov bx, ax        
    mov dl, bh        
    mov ah, 2         
    int 21h           
 
    mov dl, bl        
    int 21h             
    ret                
disp endp 
end start             
