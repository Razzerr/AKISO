;./xasm 3.asm
;./emu6502 3.obx

        opt f-g-h+l+o+
        org $1000

start   equ *
       
        lda #$ee ;Starsze 8 bitow NUM1
        sta NUM1
        lda #$ef ;Młodsze 8 bitow NUM1
        sta NUM1+1   
		lda #$ee ;NUM2 (dzielimy przez)
        sta NUM2     
        LDA #0      ;REM = 0
        STA REM
        LDX #16     ;NUM1: 16 bitow
L1      ASL NUM1 
        ROL NUM1+1
        ROL REM
        LDA REM
        SEC 
        SBC NUM2
        TAY
        LDA REM+1
        BCC L2 
        STY REM
        INC NUM1 
L2      DEX
        BNE L1
        
        lda <text
        sta $80
        lda >text
        sta $81
        
        lda NUM1+1 
        jsr printnumber
        
        lda NUM1 
        jsr printnumber
        
        jsr printnl
        
        lda REM+1  
        jsr printnumber
        
        lda REM
        jsr printnumber
        
        jsr printnl
        brk
        
printnumber ldy #1
            jsr phex
            lda <text
            ldx >text
            jsr $ff80   
            rts
            
phex    pha
        jsr prhex
        pla
        lsr @
        lsr @
        lsr @
        lsr @

prhex   and #%00001111 
        ora #'0'
        cmp #'9'+1
        bcc pr
        adc #6

pr      sta ($80),y
        dey
        rts
                
printnl         lda #$A
                sta char
                lda <char
                ldx >char
                jsr $ff80
                rts
                
				org $2000
char            dta b(0)   
                dta b(0)
REM             dta b(0)
				dta b(0)
NUM1            dta b(0)
				dta b(0)
NUM2            dta b(0)
				dta b(0)
text            equ *
                dta b(0),b(0)

                org $2E0
                dta a(start)

                end of file

