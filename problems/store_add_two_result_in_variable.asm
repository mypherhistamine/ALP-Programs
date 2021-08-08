;Write a program to add two numbers using registers and store the final 
;result in res variable
;let ax = 44 and bx = 12

data segment
    ;we have used a word instead of a byte as we are doing 16-bit operations and not 8-bit operations
    ;for variables declarations consult the README.md file in root of repo
    res dw ? 
ends

code segment
    start: 
    mov ax,44 
    mov bx, 12
    add ax,bx
    mov res,ax
    
ends