	#include p18f87k22.inc
	
	code
	org 0x0
	goto	start
	
	org 0x100		    ; Main code starts here at address 0x100

start
	movlw 	0xff
	movwf	TRISD, ACCESS	    
	movlw 	0x0
	movwf	TRISC, ACCESS	    ; Port C all outputs
	movwf	0x06, ACCESS
	bra 	test
loop	movff 	0x06, PORTC
	incf 	0x06, F, ACCESS
	movlw   0xff
        movwf   0x20, ACCESS
	call    subrout, 0
	nop

test	movf    PORTD, W
	cpfsgt 	0x06, ACCESS
	bra 	loop		    ; Not yet finished goto start of loop again
	goto 	0x0		    ; Re-run program from start

	
	
				    ; a delay subroutine
subrout movwf   0x30, ACCESS
	call    subrou2, 0
	nop
	decfsz  0x20, F, ACCESS
        bra     subrout
        return  0
	
subrou2 decfsz  0x30, F, ACCESS
        bra     subrou2
        return  0

	end
