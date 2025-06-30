disp macro msg 
lea dx, msg        
mov ah, 9          
int 21h            
endm 
.model small          
.stack                
.data                 

m1 db 10,13,"enter string 1:$" 
m2 db 10,13,"enter string 2:$" 
m3 db 10,13,"length of string 1 is:$" 
m4 db 10,13,"length of string 2 is:$" 
m5 db 10,13,"string1 equal to string2$" 
m6 db 10,13,"string1 not equal to string2$" 

str1 db 80 dup(40) 
str2 db 80 dup(40) 

l1 db ? 
l2 db ? 
.code               

mov ax, @data 
mov ds, ax 
mov es, ax 

disp m1 
lea dx, str1       
call read         

disp m2 
    lea dx, str2      
    call read

    mov al, [str1+1] 
    mov l1, al 
    
    mov al, [str2+1] 
    mov l2, al 
     
    cmp al, l1 
    jne strnote         
 
    
    mov ch, 0 
    mov cl, l1         
    lea si, str1+2     
    lea di, str2+2     
    cld                 
 
    repe cmpsb         
    jne strnote         
 
    
    disp m5            
    jmp next           
 
strnote:              
    disp m6           
next: 
   
    disp m3 
    mov al, l1 
    call displ        
    
    disp m4 
    mov al, l2 
    call displ         
    
    mov ah, 4ch 
int 21h 

read proc 
mov ah, 0ah        
int 21h 
ret 
read endp 

displ proc 
aam                
mov bx, ax 
add bx, 3030h      
mov ah, 2  
mov dl, bh         
int 21h 
mov dl, bl         
int 21h 
ret 
displ endp 
end
