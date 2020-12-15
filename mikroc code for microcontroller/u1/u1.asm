
_servoRotate0:

;u1.c,3 :: 		void servoRotate0() {       //functon for servo to start
;u1.c,5 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_servoRotate00:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__servoRotate044
	MOVLW      50
	SUBWF      R1+0, 0
L__servoRotate044:
	BTFSC      STATUS+0, 0
	GOTO       L_servoRotate01
;u1.c,7 :: 		PORTB.f6 = 1;
	BSF        PORTB+0, 6
;u1.c,8 :: 		Delay_us(800);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_servoRotate03:
	DECFSZ     R13+0, 1
	GOTO       L_servoRotate03
	DECFSZ     R12+0, 1
	GOTO       L_servoRotate03
	NOP
;u1.c,9 :: 		PORTB.f6 = 0;
	BCF        PORTB+0, 6
;u1.c,10 :: 		Delay_us(19200);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_servoRotate04:
	DECFSZ     R13+0, 1
	GOTO       L_servoRotate04
	DECFSZ     R12+0, 1
	GOTO       L_servoRotate04
	NOP
	NOP
;u1.c,5 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;u1.c,11 :: 		}
	GOTO       L_servoRotate00
L_servoRotate01:
;u1.c,12 :: 		}
L_end_servoRotate0:
	RETURN
; end of _servoRotate0

_servoRotate90:

;u1.c,13 :: 		void servoRotate90() {      //function to servo to rotate
;u1.c,15 :: 		for(j=0;j<50;j++)
	CLRF       R1+0
	CLRF       R1+1
L_servoRotate905:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__servoRotate9046
	MOVLW      50
	SUBWF      R1+0, 0
L__servoRotate9046:
	BTFSC      STATUS+0, 0
	GOTO       L_servoRotate906
;u1.c,17 :: 		PORTB.f6 = 1;
	BSF        PORTB+0, 6
;u1.c,18 :: 		Delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_servoRotate908:
	DECFSZ     R13+0, 1
	GOTO       L_servoRotate908
	DECFSZ     R12+0, 1
	GOTO       L_servoRotate908
	NOP
;u1.c,19 :: 		PORTB.f6 = 0;
	BCF        PORTB+0, 6
;u1.c,20 :: 		Delay_us(18500);
	MOVLW      49
	MOVWF      R12+0
	MOVLW      11
	MOVWF      R13+0
L_servoRotate909:
	DECFSZ     R13+0, 1
	GOTO       L_servoRotate909
	DECFSZ     R12+0, 1
	GOTO       L_servoRotate909
	NOP
	NOP
;u1.c,15 :: 		for(j=0;j<50;j++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;u1.c,21 :: 		}
	GOTO       L_servoRotate905
L_servoRotate906:
;u1.c,22 :: 		}
L_end_servoRotate90:
	RETURN
; end of _servoRotate90

_buzzerOn:

;u1.c,23 :: 		void buzzerOn()
;u1.c,26 :: 		PORTC.f0 = 1;
	BSF        PORTC+0, 0
;u1.c,28 :: 		}
L_end_buzzerOn:
	RETURN
; end of _buzzerOn

_buzzerOff:

;u1.c,30 :: 		void buzzerOff()
;u1.c,32 :: 		PORTC.f0 = 0;
	BCF        PORTC+0, 0
;u1.c,33 :: 		}
L_end_buzzerOff:
	RETURN
; end of _buzzerOff

_ledstop:

;u1.c,36 :: 		void ledstop()
;u1.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;u1.c,39 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_ledstop10:
	DECFSZ     R13+0, 1
	GOTO       L_ledstop10
	DECFSZ     R12+0, 1
	GOTO       L_ledstop10
	DECFSZ     R11+0, 1
	GOTO       L_ledstop10
	NOP
;u1.c,40 :: 		Lcd_Out(1,5,"STOP!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,41 :: 		Lcd_Out(2,2,"train alert");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,42 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_ledstop11:
	DECFSZ     R13+0, 1
	GOTO       L_ledstop11
	DECFSZ     R12+0, 1
	GOTO       L_ledstop11
	DECFSZ     R11+0, 1
	GOTO       L_ledstop11
	NOP
	NOP
;u1.c,44 :: 		Lcd_Out(1,5,"     ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,45 :: 		Lcd_Out(2,2,"           ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,46 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_ledstop12:
	DECFSZ     R13+0, 1
	GOTO       L_ledstop12
	DECFSZ     R12+0, 1
	GOTO       L_ledstop12
	DECFSZ     R11+0, 1
	GOTO       L_ledstop12
	NOP
	NOP
;u1.c,47 :: 		}
L_end_ledstop:
	RETURN
; end of _ledstop

_main:

;u1.c,66 :: 		void main() {
;u1.c,67 :: 		TRISB=0X00;              //select port b as output
	CLRF       TRISB+0
;u1.c,68 :: 		TRISC=0X00;             //select port c as output
	CLRF       TRISC+0
;u1.c,69 :: 		TRISD=0XFF;            //select port d as input
	MOVLW      255
	MOVWF      TRISD+0
;u1.c,71 :: 		PORTB=0X00;            //initial value of port b is zero
	CLRF       PORTB+0
;u1.c,72 :: 		PORTD=0X00;           //initial value of port d is zero
	CLRF       PORTD+0
;u1.c,73 :: 		PORTC=0X00;           //initial vlaue of port c is zero
	CLRF       PORTC+0
;u1.c,78 :: 		inp1=0;
	CLRF       _inp1+0
	CLRF       _inp1+1
;u1.c,79 :: 		inp2=0;
	CLRF       _inp2+0
	CLRF       _inp2+1
;u1.c,80 :: 		inp3=0;
	CLRF       _inp3+0
	CLRF       _inp3+1
;u1.c,81 :: 		inp4=0;              //initiate variables values as zero
	CLRF       _inp4+0
	CLRF       _inp4+1
;u1.c,82 :: 		inp5=0;
	CLRF       _inp5+0
	CLRF       _inp5+1
;u1.c,83 :: 		inp6=0;
	CLRF       _inp6+0
	CLRF       _inp6+1
;u1.c,84 :: 		servoRotate0(); // make servo 0
	CALL       _servoRotate0+0
;u1.c,86 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;u1.c,87 :: 		Lcd_Cmd(_LCD_CLEAR); //clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;u1.c,88 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  //Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;u1.c,90 :: 		buzzerOff();
	CALL       _buzzerOff+0
;u1.c,91 :: 		while(1)
L_main13:
;u1.c,93 :: 		Lcd_Out(1,5,"WELCOME!"); //display welcome
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,94 :: 		buzzerOff();
	CALL       _buzzerOff+0
;u1.c,95 :: 		PORTB.f2=1;  //green light on  (road side)
	BSF        PORTB+0, 2
;u1.c,96 :: 		PORTB.f4=1;  //red light on (train side)
	BSF        PORTB+0, 4
;u1.c,98 :: 		if(PORTD.f0==1)                //if first switch was triggered
	BTFSS      PORTD+0, 0
	GOTO       L_main15
;u1.c,100 :: 		inp1=1;                      //record value in inp1
	MOVLW      1
	MOVWF      _inp1+0
	MOVLW      0
	MOVWF      _inp1+1
;u1.c,101 :: 		}
L_main15:
;u1.c,103 :: 		if(inp1==1)                   //indicate first senser was passed by train
	MOVLW      0
	XORWF      _inp1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      1
	XORWF      _inp1+0, 0
L__main51:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;u1.c,104 :: 		{if(PORTD.f1==1)             //if second switch was triggered (train detect by 2nd senser)
	BTFSS      PORTD+0, 1
	GOTO       L_main17
;u1.c,106 :: 		inp2=1;                //record value in inp2
	MOVLW      1
	MOVWF      _inp2+0
	MOVLW      0
	MOVWF      _inp2+1
;u1.c,107 :: 		}
L_main17:
;u1.c,108 :: 		}
L_main16:
;u1.c,110 :: 		if(PORTD.f5==1)            //if 6th switch was triggered     (train detect by first sensor of the other side)
	BTFSS      PORTD+0, 5
	GOTO       L_main18
;u1.c,112 :: 		inp4=1;                  //record value in inp4
	MOVLW      1
	MOVWF      _inp4+0
	MOVLW      0
	MOVWF      _inp4+1
;u1.c,113 :: 		}
L_main18:
;u1.c,115 :: 		if(inp4==1)                //indicate the first sensor from the other side pass the train
	MOVLW      0
	XORWF      _inp4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVLW      1
	XORWF      _inp4+0, 0
L__main52:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;u1.c,117 :: 		if(PORTD.f4==1)           //if 5th switch was triggered (train detect by next sensor in other side)
	BTFSS      PORTD+0, 4
	GOTO       L_main20
;u1.c,119 :: 		inp3=1;                  //record value in inp3
	MOVLW      1
	MOVWF      _inp3+0
	MOVLW      0
	MOVWF      _inp3+1
;u1.c,120 :: 		}
L_main20:
;u1.c,121 :: 		}
L_main19:
;u1.c,124 :: 		if(inp2==1)               //if train was detected by second sensors
	MOVLW      0
	XORWF      _inp2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      1
	XORWF      _inp2+0, 0
L__main53:
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;u1.c,126 :: 		if(inp1==1)            //if train detect by first senser
	MOVLW      0
	XORWF      _inp1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      1
	XORWF      _inp1+0, 0
L__main54:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;u1.c,131 :: 		PORTB.f2=0;           //turn off green light in traffic light
	BCF        PORTB+0, 2
;u1.c,132 :: 		PORTB.f1=1;          //turn on the orange light
	BSF        PORTB+0, 1
;u1.c,133 :: 		Delay_ms(1500);      //give a delay of 1s
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;u1.c,135 :: 		buzzerOn();       //turn on the buzzer
	CALL       _buzzerOn+0
;u1.c,136 :: 		ledstop();           // show"STOP"
	CALL       _ledstop+0
;u1.c,138 :: 		PORTB.f1=0;          //turn off orange light
	BCF        PORTB+0, 1
;u1.c,139 :: 		PORTB.f4=0;          //turn off Red light (Train Side)
	BCF        PORTB+0, 4
;u1.c,140 :: 		PORTB.f5=1;          //turn on Green light (Train Side)
	BSF        PORTB+0, 5
;u1.c,141 :: 		PORTB.f0=1;          //turn on the red light in traffic light
	BSF        PORTB+0, 0
;u1.c,142 :: 		servoRotate90();     //rotate the servos (close the gates)
	CALL       _servoRotate90+0
;u1.c,145 :: 		while(PORTD.f3==0)      //while the 3rd from the RHS is not detect the train
L_main24:
	BTFSC      PORTD+0, 3
	GOTO       L_main25
;u1.c,147 :: 		ledstop();
	CALL       _ledstop+0
;u1.c,149 :: 		PORTB.f0=1;             //turn on the red lights
	BSF        PORTB+0, 0
;u1.c,150 :: 		PORTB.f5=1;          //turn on Green light (Train Side)
	BSF        PORTB+0, 5
;u1.c,151 :: 		}
	GOTO       L_main24
L_main25:
;u1.c,153 :: 		while(PORTD.f3==1)     //while the 3rd from the RHS is detect the train
L_main26:
	BTFSS      PORTD+0, 3
	GOTO       L_main27
;u1.c,155 :: 		ledstop();
	CALL       _ledstop+0
;u1.c,157 :: 		PORTB.f0=1;            //turn on the red lights
	BSF        PORTB+0, 0
;u1.c,158 :: 		PORTB.f5=1;          //turn on Green light (Train Side)
	BSF        PORTB+0, 5
;u1.c,159 :: 		}
	GOTO       L_main26
L_main27:
;u1.c,163 :: 		PORTB.f0=1;            //trun the red light on
	BSF        PORTB+0, 0
;u1.c,164 :: 		delay_ms(300);         //wait for 0.8s
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
	NOP
;u1.c,165 :: 		PORTB.f0=0;            //turn off the red light
	BCF        PORTB+0, 0
;u1.c,167 :: 		PORTB.f1=1;            //turn the orange light on
	BSF        PORTB+0, 1
;u1.c,168 :: 		Delay_ms(1500);        //wait for 2s
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
	NOP
;u1.c,170 :: 		servoRotate0();        // initiate the servo again (open the rail roads)
	CALL       _servoRotate0+0
;u1.c,171 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;u1.c,172 :: 		buzzerOff();       //turn on the buzzer
	CALL       _buzzerOff+0
;u1.c,175 :: 		PORTB.f1=0;            //turn off the orange lights
	BCF        PORTB+0, 1
;u1.c,176 :: 		PORTB.f5=0;          //turn off Green light (Train Side)
	BCF        PORTB+0, 5
;u1.c,178 :: 		inp1=0 ;            //return inp1 value back to zero
	CLRF       _inp1+0
	CLRF       _inp1+1
;u1.c,179 :: 		inp2=0 ;            //return inp2 value back to zero
	CLRF       _inp2+0
	CLRF       _inp2+1
;u1.c,180 :: 		inp3=0 ;            //return inp3 value back to zero
	CLRF       _inp3+0
	CLRF       _inp3+1
;u1.c,181 :: 		inp4=0 ;            //return inp4 value back to zero
	CLRF       _inp4+0
	CLRF       _inp4+1
;u1.c,183 :: 		}
	GOTO       L_main30
L_main22:
;u1.c,186 :: 		Lcd_Out(1,5,"WELCOME!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,188 :: 		PORTB.f2=1;          //turn on green lights
	BSF        PORTB+0, 2
;u1.c,189 :: 		PORTB.f1=0;          //other lights are off
	BCF        PORTB+0, 1
;u1.c,190 :: 		PORTB.f0=0;
	BCF        PORTB+0, 0
;u1.c,191 :: 		}
L_main30:
;u1.c,192 :: 		}
	GOTO       L_main31
L_main21:
;u1.c,195 :: 		Lcd_Out(1,5,"WELCOME!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,197 :: 		PORTB.f2=1;       //turn green light on
	BSF        PORTB+0, 2
;u1.c,198 :: 		PORTB.f1=0;
	BCF        PORTB+0, 1
;u1.c,199 :: 		PORTB.f0=0;       //other lights are off
	BCF        PORTB+0, 0
;u1.c,200 :: 		}
L_main31:
;u1.c,202 :: 		if(inp3==1)        //if train detect by 2nd sensor from the RHS side
	MOVLW      0
	XORWF      _inp3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      1
	XORWF      _inp3+0, 0
L__main55:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;u1.c,204 :: 		if(inp4==1)      //if train detects by 1st sensor from RHS side
	MOVLW      0
	XORWF      _inp4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      1
	XORWF      _inp4+0, 0
L__main56:
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;u1.c,207 :: 		PORTB.f2=0;      //turn off green light
	BCF        PORTB+0, 2
;u1.c,208 :: 		PORTB.f1=1;       //turn on the orange light
	BSF        PORTB+0, 1
;u1.c,209 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
	NOP
;u1.c,211 :: 		buzzerOn();       //turn on the buzzer
	CALL       _buzzerOn+0
;u1.c,212 :: 		ledstop();         //show "STOP"
	CALL       _ledstop+0
;u1.c,214 :: 		PORTB.f1=0;        //turn off the orange light
	BCF        PORTB+0, 1
;u1.c,215 :: 		PORTB.f4=0;          //turn off Red light (Train Side)
	BCF        PORTB+0, 4
;u1.c,216 :: 		PORTB.f5=1;          //turn on Green light (Train Side)
	BSF        PORTB+0, 5
;u1.c,217 :: 		PORTB.f0=1;        //turn on red light
	BSF        PORTB+0, 0
;u1.c,218 :: 		servoRotate90();     //initiate the servo (roads are closed)
	CALL       _servoRotate90+0
;u1.c,220 :: 		while(PORTD.f2==0)     //while train not detect by 3rd sensor from LHS
L_main35:
	BTFSC      PORTD+0, 2
	GOTO       L_main36
;u1.c,222 :: 		ledstop();
	CALL       _ledstop+0
;u1.c,223 :: 		PORTB.f0=1;     //turn on the red lights
	BSF        PORTB+0, 0
;u1.c,224 :: 		PORTB.f5=1;          //turn on Green light (Train Side)
	BSF        PORTB+0, 5
;u1.c,225 :: 		}
	GOTO       L_main35
L_main36:
;u1.c,227 :: 		while(PORTD.f2==1)     //while train detect by 3rd sensor from LHS
L_main37:
	BTFSS      PORTD+0, 2
	GOTO       L_main38
;u1.c,229 :: 		ledstop();
	CALL       _ledstop+0
;u1.c,230 :: 		PORTB.f0=1;        //turn on the red lights
	BSF        PORTB+0, 0
;u1.c,231 :: 		PORTB.f5=1;          //turn on Green light (Train Side)
	BSF        PORTB+0, 5
;u1.c,232 :: 		}
	GOTO       L_main37
L_main38:
;u1.c,234 :: 		PORTB.f0=1;              //turn on red lights
	BSF        PORTB+0, 0
;u1.c,235 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	DECFSZ     R11+0, 1
	GOTO       L_main39
	NOP
	NOP
;u1.c,236 :: 		PORTB.f0=0;             //turn off red lights
	BCF        PORTB+0, 0
;u1.c,238 :: 		PORTB.f1=1;             //turn on the orange lights
	BSF        PORTB+0, 1
;u1.c,239 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
	NOP
;u1.c,240 :: 		servoRotate0();        //initiate servo (open the roads)
	CALL       _servoRotate0+0
;u1.c,241 :: 		buzzerOff();       //turn on the buzzer
	CALL       _buzzerOff+0
;u1.c,242 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;u1.c,243 :: 		PORTB.f1=0;             //turn off the orange lights
	BCF        PORTB+0, 1
;u1.c,244 :: 		PORTB.f5=0;          //turn off Green light (Train Side)
	BCF        PORTB+0, 5
;u1.c,246 :: 		inp1=0 ;                   //return inp1 value back to zero
	CLRF       _inp1+0
	CLRF       _inp1+1
;u1.c,247 :: 		inp2=0 ;                   //return inp2 value back to zero
	CLRF       _inp2+0
	CLRF       _inp2+1
;u1.c,248 :: 		inp3=0 ;                   //return inp3 value back to zero
	CLRF       _inp3+0
	CLRF       _inp3+1
;u1.c,249 :: 		inp4=0 ;                   //return inp4 value back to zero
	CLRF       _inp4+0
	CLRF       _inp4+1
;u1.c,251 :: 		}
	GOTO       L_main41
L_main33:
;u1.c,254 :: 		Lcd_Out(1,5,"WELCOME!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,255 :: 		PORTB.f2=1;           //turn on the green lights
	BSF        PORTB+0, 2
;u1.c,256 :: 		PORTB.f1=0;
	BCF        PORTB+0, 1
;u1.c,257 :: 		PORTB.f0=0;          //other lights are off
	BCF        PORTB+0, 0
;u1.c,258 :: 		}
L_main41:
;u1.c,259 :: 		}
	GOTO       L_main42
L_main32:
;u1.c,262 :: 		Lcd_Out(1,5,"WELCOME!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_u1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;u1.c,263 :: 		PORTB.f2=1;        //turn on the green lights
	BSF        PORTB+0, 2
;u1.c,264 :: 		PORTB.f1=0;
	BCF        PORTB+0, 1
;u1.c,265 :: 		PORTB.f0=0;        //other lights are off
	BCF        PORTB+0, 0
;u1.c,266 :: 		}
L_main42:
;u1.c,267 :: 		}
	GOTO       L_main13
;u1.c,268 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
