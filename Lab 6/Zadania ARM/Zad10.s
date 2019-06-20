            .data
    prompt: .asciz  "Enter a number: "  @Scanf text
            .align  2
    sformat:.asciz  "%d"                @Scanf format
            .align  2
    pformat:.asciz  "GCD is: %d\n"  	@Printf format
            .align  2
    n:      .word   0                   @int n = 0
    m:      .word   0                   @int m = 0
            .text
            .global main
    main:   stmfd   sp!, {lr}       	@push lr onto stack

            @ printf("Enter a number: ")
            ldr     r0, =prompt
            bl      printf

            @ scanf("%d\0", &n)
            ldr     r0, =sformat
            ldr     r1, =n          	@read to n
            bl      scanf

            @ printf("Enter a number: ")
            ldr     r0, =prompt
            bl      printf

            @ scanf("%d\0" &m)
            ldr     r0, =sformat
            ldr     r1, =m          	@read to m
            bl      scanf

            @ printf("You entered %d\n", n)
            ldr     r0, =pformat    @ load address of format string
            ldr     r2, =m
            ldr     r2, [r2]
            ldr     r1, =n
            ldr     r1, [r1]
	gcd:
	    cmp      r1, r2
	    subgt    r1, r1, r2
	    suble    r2, r2, r1
	    bne      gcd

            bl      printf          @ call printf("Your GCD: %d\n", n)
            ldmfd   sp!, {lr}       @ pop lr from stack
            mov     r0, #0          @ load return value
            mov     pc, lr          @ return from main
            .end
