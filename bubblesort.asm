.bubblesort:
	@ ADD YOUR CODE HERE
	cmp r9,r10              @check 1st loop counter
	bgt .return
	sub r11,r3,r9         @second loop end element in r11=n-i-2
	sub r11,r11,2
	mov r8,0             @initialize second loop counter r8 as 0
	mov r4,r2	     @store starting address in r4
	add r5,r2,4          @store next address in r5
	add r9,r9,1          @increase first counter
.loop:	cmp r8,r11                @check counter for second loop
	bgt .bubblesort          @if equal go back 
	ld r6,[r4]               @load first value in r6
	ld r7,[r5]		 @load second value in r7
	cmp r6,r7		  @compare values
	bgt .swap
.midloop:	
	add r4,r4,4	   @increase first memory register r4
	add r5,r5,4	   @increase second memory register r5
	add r8,r8,1	   @increase second counter
	b .loop

.swap:                           @swap values
	ld r6,[r4]              @ load first value in r6
	ld r7,[r5]              @ load first value in r7
	st r7,[r4]              @ store r7 in first register
	st r6,[r5]              @ store r6 in second register
	b .midloop               @return to midloop

.return:
	ret                    @return to main
		

.main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11      @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9   	@ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3   	@ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15  	@ replace 15 with the number to be sorted
	st r1, 20[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0       @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 6	@ REPLACE 6 WITH N, where, N is the number of numbers being sorted

	@ ADD YOUR CODE HERE

	mov r9,0        @ set 1st loop counter=0
	sub r10,r3,2    @first loop end element in r10=n-2

	call .bubblesort
	
	@ ADD YOUR CODE HERE

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

