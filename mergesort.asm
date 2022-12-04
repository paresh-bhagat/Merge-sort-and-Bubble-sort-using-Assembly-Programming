.mergesort:
		@ ADD YOUR CODE HERE
	cmp r10,r11             @compare low and high counter(address)
	beq .return             @if low value register address equal to high value register address return
	bgt .return		@if low value register address greater than high value register address return
	sub r9,r11,r10          @compute number in elments from low value register to high value register
	div r9,r9,4             @ divide by 4 to get number of elements
	div r0,r9,2		@ find value of index of mid
	mul r0,r0,4		@ multiply 4 to convert it into address form
	add r9,r10,r0          @ add it to lower value register and store it in r9
	sub sp, sp, 16           @create space on the stack 
	st r15, [sp]            @push the return address register 
	st r10, 4[sp]           @push low value address to stack
	st r9, 8[sp]             @push mid value address to stack
	st r11, 12[sp]           @push high value address to stack
	mov r11,r9               @make mid value address to high value address for next function call
	call .mergesort         @call mergesort for lower half of array
	ld r15, [sp]            @pop ret address from the stack 
	ld r10, 8[sp]           @pop mid value address
	add r10,r10,4           @add 4 to mid value address to get next value adrress
	ld r11 ,12[sp]           @pop high value address
	call .mergesort         @call mergesort for upper half of array
	ld r10,4[sp]             @load low value address from stack
	ld r9,8[sp]              @load mid value address from stack
	ld r11,12[sp]            @load high value address from stack
	call .merge                 @branch to merge for merging lower and upper half
	ld r15,[sp]             @load return address from stack
	add sp,sp,16             @increment stack pointer
	ret
                        
	
	
.merge:                          	
	@ ADD YOUR CODE HERE
	mov r3,7000          @auxiliary array B starting adress 7000
	mov r0,7000          @counter used for copying elements from B to original array(A)
	mov r4,r10           @low value in r4 or lower array counter of A
	mov r1,r10           @copy lower in r1 used for copying elements from B to A
	add r5,r9,4           @med+1 in r5 or higher array counter of A
.loop:  cmp r4,r9            @check if all lower array elememts of B are merged into B
	bgt .copylower         @if true branch to copy lower
	cmp r5,r11           @check if all higher array elememts of A are merged into B
	bgt .copylower         @if true branch to copy lower
	ld r7,[r4]              @load lower array element in r7
	ld r8,[r5]              @load higher array element in in r8
	cmp r8,r7               @compare r7,r8
	bgt .copylowvalue       @if r8 is greater copy lower array value in B
	st r8,[r3]            @copy higher array value in B
	add r5,r5,4           @increment higher array A counter
	add r3,r3,4           @increment auxiliary array B counter
	b .loop
.copylower:cmp r4,r9            @copy values in B if left in lower array
	bgt .copyupper         @branch to copy upper values in Bafter copying all lower values
	ld r7,[r4]            @copy values from lower array to B using load and store in r7
	st r7,[r3]
	add r4,r4,4             @increment lower array counter
	add r3,r3,4             @increment B array counter
	b .copylower
.copyupper:cmp r5,r11           @copy values in B if left in higher array
	bgt .copyinA    
	ld r7,[r5]              @copy values from higher array to B using load and store in r7
	st r7,[r3]
	add r5,r5,4             @increment higher array counter
	add r3,r3,4             @increment B array counter
	b .copyupper
.copyinA: cmp r0,r3            @copy all sorted elements from B to A
	beq .return
	ld r7,[r0]             @load B array value in r7
	st r7,[r1]             @store B array values in A
	add r1,r1,4
	add r0,r0,4
	b .copyinA

.copylowvalue:                   @copy lower array value in B
	st r7,[r3]           
	add r4,r4,4              @increment lower array counter of A
	add r3,r3,4           @increment auxiliary array B counter
	b .loop                @branch back to loop

.return: 
	ret                      @return



.main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11      @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9       @ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3       @ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15      @ replace 15 with the number to be sorted
	st r1, 20[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0       @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 5	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3
	
	
	@ ADD YOUR CODE HERE 
	mov r10,r2              @address of low or starting address in r10
	mov r11,r4	        @address of high or ending address in r11

	call .mergesort

	@ ADD YOUR CODE HERE 
	mov r0,0

	@ Print statements for the result
        mov r3, 5      @ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted 
        mov r2, 0      @ Starting address of the array
        .printLoop:
           ld r1, 0[r2]
           .print r1
           add r2,r2,4  @ Incrementing address value
           cmp r3, 0    @ r3 contains number of elements in array
           sub r3,r3,1  
           
           
	   bgt .printLoop


