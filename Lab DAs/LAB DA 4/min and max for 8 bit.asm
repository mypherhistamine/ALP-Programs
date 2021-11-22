data segment
    num_arr db 19h , 0BCh , 0E2h  , 08h , 08h
    max db ? 
    min db ?
data ends
code segment
    assume cs:code , ds:data
    start:
		mov ax , data 
		mov ds , ax   
		mov ah , num_arr 
		mov cl , 05h   
		lea si , num_arr
		mov dh , num_arr 
    loop_elements_min:
		mov bh , [si] 
		mov ah , dh
		sub ah , bh 
		jc not_carry  
		mov dh , bh
		not_carry: 
			inc si
	loop loop_elements_min


		mov min, dh   ; store result of minimum value in min variable 
		mov ah , num_arr 		
		mov cl , 05h   
		lea si , num_arr 
		mov dh , num_arr 
		
    loop_elements_max:
		mov bh , [si] 
		mov ah , dh
		sub ah , bh
		jnc not_carry_max  
		mov dh , bh
		not_carry_max: 
			inc si
    loop loop_elements_max 
    mov max, dh ; store result of maximum value in min variable 

	mov ah , 04ch 
	int 21h

ends 
end start


