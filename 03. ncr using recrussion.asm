.model small          
.stack                
.data                   
n dw 4                
r dw 2                
ncr dw 0               
msg db "ncr= $"        
.code                   
start: 
    mov ax, @data        
    mov ds, ax           
    mov ax, n            
mov bx, r             

call ncrpro          
mov ax, ncr           
mov bx, ax                          
lea dx, msg           
mov ah, 9            
int 21h               
mov ax, bx            
aam                   
mov bx, ax            
add bx, 3030h         
mov dl, bh            
mov ah, 2             
int 21h 
mov dl, bl            
int 21h               
mov ah, 4Ch           
int 21h 
 
ncrpro proc near 
cmp bx, ax            
je res1               
cmp bx, 0            
je res1               
cmp bx, 1             
je resn               
dec ax                
cmp bx, ax           

push ax              
push bx 
call ncrpro          
pop bx               
pop ax 

dec bx               
push ax 
push bx 
call ncrpro 
pop bx               
pop ax 
ret 

res1: 
inc ncr              
ret 
incr: 
inc ncr              
resn: 
add ncr, ax          
ret 
ncrpro endp 
end                      
