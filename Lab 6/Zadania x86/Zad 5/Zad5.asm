global main

extern printf

section .text
main:
    mov ebp, 8
    mov ecx, 10000
matrix_fill_loop:
	mov [array+ecx*4], ecx
	loop matrix_fill_loop
	mov ecx, 5000
	mov edx, 2
outer_loop:
	cmp edx, 5000
	jge outer_end
	mov eax, edx
	mov ebx, edx
inner_loop:
	add eax,ebx
	cmp eax, 10000
	jge inner_end
	mov word [array+eax*4], 0x0
	jmp inner_loop
inner_end:
	inc edx
	jmp outer_loop
outer_end:
	mov eax, 2
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
print_loop:
	cmp eax, 9998
	jge end

	mov ebx, [array+eax*4]
	cmp ebx, 0
	je increase

	mov ecx, [array+eax*4+8]
	cmp ecx, 0
	je increase

	push eax
	push dword ecx
	push dword ebx
    	push message
    	call printf
    	add esp, 12
        pop eax

increase:
	inc eax
	jmp print_loop
end:
    	ret

section .data
message db '%d, %d', 10, 0
array resd 10000
