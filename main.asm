ORG 0000h  ; Origin directive sets the starting address of the program

IR1  EQU P0.0  ; Define IR sensor pins
IR2  EQU P0.1
IR3  EQU P0.2
IR4  EQU P0.3
IR5  EQU P0.4
IR6  EQU P0.5
IR7  EQU P0.6
IR8  EQU P0.7

LED1 EQU P2.0  ; Define LED pins
LED2 EQU P2.1
LED3 EQU P2.2
LED4 EQU P2.3
LED5 EQU P2.4
LED6 EQU P2.5
LED7 EQU P2.6
LED8 EQU P2.7

counter1 EQU 30h  ; Define counter variables
counter2 EQU 31h
counter3 EQU 32h
counter4 EQU 33h
counter5 EQU 34h
counter6 EQU 35h
counter7 EQU 36h
counter8 EQU 37h

SET_INPUT:
MOV P0, #0xFF  ; Set PORT 0 as input
MOV P2, #0x00  ; Set PORT 2 as output
MOV counter1, #0  ; Initialize counters
MOV counter2, #0
MOV counter3, #0
MOV counter4, #0


MOV counter5, #0
MOV counter6, #0
MOV counter7, #0
MOV counter8, #0

START:
; Check IR sensors status
JNB IR1, IR1_PASSED  ; Jump if IR1 is not active
JNB IR2, IR2_PASSED  ; Jump if IR2 is not active
JNB IR3, IR3_PASSED  ; Jump if IR3 is not active
JNB IR4, IR4_PASSED  ; Jump if IR4 is not active
JNB IR5, IR5_PASSED  ; Jump if IR5 is not active
JNB IR6, IR6_PASSED  ; Jump if IR6 is not active
JNB IR7, IR7_PASSED  ; Jump if IR7 is not active
JNB IR8, IR8_PASSED  ; Jump if IR8 is not active

JMP START  ; Loop back to START if no IR sensor is active

IR1_PASSED:
INC counter1  ; Increment counter1
SJMP IR_DONE  ; Jump to IR_DONE

IR2_PASSED:
INC counter2  ; Increment counter2
SJMP IR_DONE  ; Jump to IR_DONE

; Repeat similar code for IR3 to IR8
IR3_PASSED:
    INC counter3
    SJMP IR_DONE

IR4_PASSED:
    INC counter4
    SJMP IR_DONE

IR5_PASSED:
    INC counter5
    SJMP IR_DONE





IR6_PASSED:
    INC counter6
    SJMP IR_DONE

IR7_PASSED:
    INC counter7
    SJMP IR_DONE

IR8_PASSED:
    INC counter8

IR_DONE:
SJMP CONTINUE_1_2  ; Jump to CONTINUE_1_2

; Repeat similar code for other IR_PASSED labels

CONTINUE_1_2:
MOV B, counter1  ; Move counter1 to B register
MOV A, counter2  ; Move counter2 to A register
CJNE A, B, L1  ; Compare A and B, jump if not equal
SJMP NO_VEHICLE_BETWEEN_1_2  ; Jump if no vehicle between 1 and 2

L1:
SJMP VEHICLE_BETWEEN_1_2  ; Jump if vehicle between 1 and 2

; Repeat similar code for other CONTINUE_X_Y sections

NO_VEHICLE_BETWEEN_1_2:
CLR LED1  ; Turn off LED1
JMP CONTINUE_2_3  ; Jump to CONTINUE_2_3

; Repeat similar code for other NO_VEHICLE_BETWEEN_X_Y sections

CONTINUE_2_3:
    MOV B, counter2
	MOV A,counter3
    CJNE A,B,L2
	SJMP NO_VEHICLE_BETWEEN_2_3
    L2:SJMP VEHICLE_BETWEEN_2_3
	



VEHICLE_BETWEEN_2_3:
    SETB LED2
    SETB LED3
    SJMP CONTINUE_3_4


NO_VEHICLE_BETWEEN_2_3:
	MOV B, counter1
	MOV A,counter2
    CJNE A,B,CB12
	CLR LED1
	
	CB12:
	CLR LED2
	SJMP CONTINUE_3_4

CONTINUE_3_4:
    MOV B,counter3
	MOV A,counter4
    CJNE A,B,L3
	SJMP NO_VEHICLE_BETWEEN_3_4
    L3:SJMP VEHICLE_BETWEEN_3_4

VEHICLE_BETWEEN_3_4:
    SETB LED3
    SETB LED4
    SJMP CONTINUE_4_5

NO_VEHICLE_BETWEEN_3_4:
    MOV B, counter1
	MOV A,counter2
    CJNE A,B,CB23
	CLR LED2
	CB23: 
	CLR LED3

CONTINUE_4_5:
    MOV B,counter4
	MOV A,counter5
    CJNE A,B,L4



	SJMP NO_VEHICLE_BETWEEN_4_5
    L4:SJMP VEHICLE_BETWEEN_4_5
	
VEHICLE_BETWEEN_4_5:
    SETB LED4
    SETB LED5
    SJMP CONTINUE_5_6



NO_VEHICLE_BETWEEN_4_5:
    MOV B,counter3
	MOV A,counter4
    CJNE A,B,CB34
	CLR LED3
	CB34:
	CLR LED4

CONTINUE_5_6:
    MOV B,counter5
	MOV A,counter6
    CJNE A,B,L5
	SJMP NO_VEHICLE_BETWEEN_5_6
    L5:SJMP VEHICLE_BETWEEN_5_6

VEHICLE_BETWEEN_5_6:
    SETB LED5
    SETB LED6
    SJMP CONTINUE_6_7

NO_VEHICLE_BETWEEN_5_6:
    MOV B,counter3
	MOV A,counter4
    CJNE A,B,CB45
	CLR LED4
	CB45:
	CLR LED5

CONTINUE_6_7:
    MOV B,counter6



	MOV A,counter7
    CJNE A,B,L6
	SJMP NO_VEHICLE_BETWEEN_6_7
    L6:sjmp VEHICLE_BETWEEN_6_7
	
VEHICLE_BETWEEN_6_7:
    SETB LED6
    SETB LED7
    SJMP CONTINUE_7_8

NO_VEHICLE_BETWEEN_6_7:
    MOV B,counter4
	MOV A,counter5
    CJNE A,B,CB56
	CLR LED5
	CB56:
	CLR LED6

CONTINUE_7_8:
    MOV B,counter7
	MOV A,counter8
    CJNE A,B,L7
	SJMP NO_VEHICLE_BETWEEN_7_8
    L7:SJMP VEHICLE_BETWEEN_7_8
	
VEHICLE_BETWEEN_7_8:
    SETB LED7
    SETB LED8
    SJMP CONTINUE_8

NO_VEHICLE_BETWEEN_7_8:
    MOV B,counter5
	MOV A,counter6
    CJNE A,B,CB67
	CLR LED6
	CB67:
	CLR LED7	
CONTINUE_8:
    ljmp start




delay:  
    MOV R2, #50      ; Load R2 with an initial value for 5 seconds delay
DELAY_5S:
    MOV R1, #250     ; Load R1 with a value for 1 second delay
DELAY_1S:
    DJNZ R1, DELAY_1S  ; Decrement R1 and loop if not zero
    DJNZ R2, DELAY_5S  ; Decrement R2 and loop if not zero
    RET               ; Return from the delay subroutine

END  ; End of program
