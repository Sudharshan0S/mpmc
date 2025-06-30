.model small             
.stack 100              
.data                    

    a db 10,6,8,0,4,2     
    len dw ($ - a)       
.code                    
start: 
    mov ax, @data       
    mov ds, ax           
    mov bx, len          
    dec bx                
outloop:                  
    mov cx, bx           
    mov si, 0             
inloop:                  
    mov al, a[si]        
    cmp al, a[si+1]       
    jb next                
   
    xchg al, a[si+1]     
    mov a[si], al        
next: 
    inc si                
    loop inloop            
    dec bx                
    jnz outloop          
    ; End of program 
    mov ah, 4Ch           
    int 21h 
end start                
