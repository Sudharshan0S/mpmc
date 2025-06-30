.model small               
.stack                     
.data                       

msg db "press any key to exit$" 
.code                      

start: 
    mov ax, @data         
    mov ds, ax            
    call clear           
    lea dx, msg          
    mov ah, 9            
    int 21h              
    mov ax, 00h          
nxtnum: 
    push ax              
    call setcursor       
    call disp            
    call delay           
    mov ah, 01h          
    int 16h              
    jnz exit             
    pop ax               
    add ax, 1            
    daa                   
    cmp ax, 0             
    jnz nxtnum           
exit: 
    mov ah, 4Ch          
    int 21h              

setcursor proc 
    mov ah, 2             
    mov dh, 12           
    mov dl, 40           
    int 10h              
    ret 
setcursor endp 

disp proc 
    mov bl, al            
    mov dl, al            
    mov cl, 4             
    shr dl, cl             
    add dl, 30h           
    mov ah, 2           
    int 21h              
    mov dl, bl           
    and dl, 0Fh          
    add dl, 30h         
    int 21h               
    ret 
disp endp 

delay proc 
    mov bx, 00FFh          
b2: 
    mov cx, 0FFFFh       
b1: 
    loop b1               
    dec bx               
    jnz b2                  
    ret 
delay endp 

clear proc 
    mov al, 0             
    mov ah, 6           
    mov ch, 0            
    mov cl, 0            
    mov dh, 24          
    mov dl, 79           
    mov bh, 7            
    int 10h               
    ret 
clear endp 
end start               
