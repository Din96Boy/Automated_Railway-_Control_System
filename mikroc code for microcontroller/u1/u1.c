unsigned int inp1,inp2,inp3,inp4,inp5,inp6;           //six variables to assign sensor trigger values

void servoRotate0() {       //functon for servo to start
unsigned int i;
for(i=0;i<50;i++)
{
PORTB.f6 = 1;
Delay_us(800);
PORTB.f6 = 0;
Delay_us(19200);
}
}
void servoRotate90() {      //function to servo to rotate
unsigned int j;
for(j=0;j<50;j++)
{
PORTB.f6 = 1;
Delay_us(1500);
PORTB.f6 = 0;
Delay_us(18500);
}
}
void buzzerOn()
{

PORTC.f0 = 1;

}

void buzzerOff()
{
PORTC.f0 = 0;
}


void ledstop()
{
  Lcd_Cmd(_LCD_CLEAR);
             Delay_ms(100);
             Lcd_Out(1,5,"STOP!");
             Lcd_Out(2,2,"train alert");
             Delay_ms(1000);

             Lcd_Out(1,5,"     ");
             Lcd_Out(2,2,"           ");
             Delay_ms(500);
}

// Establish LCD module connections
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;
// End LCD module connections



void main() {
 TRISB=0X00;              //select port b as output
 TRISC=0X00;             //select port c as output
 TRISD=0XFF;            //select port d as input
 
 PORTB=0X00;            //initial value of port b is zero
 PORTD=0X00;           //initial value of port d is zero
 PORTC=0X00;           //initial vlaue of port c is zero
 
 //UART1_Init(9600); //initiaze UART Module at 9600bps
 //Delay_ms(100); //stabilizing the UART module
 
 inp1=0;
 inp2=0;
 inp3=0;
 inp4=0;              //initiate variables values as zero
 inp5=0;
 inp6=0;
 servoRotate0(); // make servo 0
 
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR); //clear LCD
 Lcd_Cmd(_LCD_CURSOR_OFF);  //Cursor off
 
 buzzerOff();
 while(1)
 {
 Lcd_Out(1,5,"WELCOME!"); //display welcome
 buzzerOff();
 PORTB.f2=1;  //green light on  (road side)
 PORTB.f4=1;  //red light on (train side)
 
  if(PORTD.f0==1)                //if first switch was triggered
  {
    inp1=1;                      //record value in inp1
  }
   
   if(inp1==1)                   //indicate first senser was passed by train
   {if(PORTD.f1==1)             //if second switch was triggered (train detect by 2nd senser)
       {
        inp2=1;                //record value in inp2
       }
   }
   
   if(PORTD.f5==1)            //if 6th switch was triggered     (train detect by first sensor of the other side)
     {
     inp4=1;                  //record value in inp4
     }
  
   if(inp4==1)                //indicate the first sensor from the other side pass the train
   {
    if(PORTD.f4==1)           //if 5th switch was triggered (train detect by next sensor in other side)
    {
    inp3=1;                  //record value in inp3
    }
  }


  if(inp2==1)               //if train was detected by second sensors
  {
            if(inp1==1)            //if train detect by first senser
            {
             

             
             PORTB.f2=0;           //turn off green light in traffic light
             PORTB.f1=1;          //turn on the orange light
             Delay_ms(1500);      //give a delay of 1s
             
             buzzerOn();       //turn on the buzzer
             ledstop();           // show"STOP"
             
             PORTB.f1=0;          //turn off orange light
             PORTB.f4=0;          //turn off Red light (Train Side)
             PORTB.f5=1;          //turn on Green light (Train Side)
             PORTB.f0=1;          //turn on the red light in traffic light
             servoRotate90();     //rotate the servos (close the gates)

             
             while(PORTD.f3==0)      //while the 3rd from the RHS is not detect the train
             {
             ledstop();

             PORTB.f0=1;             //turn on the red lights
             PORTB.f5=1;          //turn on Green light (Train Side)
             }
             
             while(PORTD.f3==1)     //while the 3rd from the RHS is detect the train
             {
             ledstop();

             PORTB.f0=1;            //turn on the red lights
             PORTB.f5=1;          //turn on Green light (Train Side)
             }
             

             
             PORTB.f0=1;            //trun the red light on
             delay_ms(300);         //wait for 0.8s
             PORTB.f0=0;            //turn off the red light
             
             PORTB.f1=1;            //turn the orange light on
             Delay_ms(1500);        //wait for 2s
             
             servoRotate0();        // initiate the servo again (open the rail roads)
             Lcd_Cmd(_LCD_CLEAR);
             buzzerOff();       //turn on the buzzer

             
             PORTB.f1=0;            //turn off the orange lights
             PORTB.f5=0;          //turn off Green light (Train Side)
             
              inp1=0 ;            //return inp1 value back to zero
              inp2=0 ;            //return inp2 value back to zero
              inp3=0 ;            //return inp3 value back to zero
              inp4=0 ;            //return inp4 value back to zero

            }
            else                  //if train wasnt detect by first sensor
            {
             Lcd_Out(1,5,"WELCOME!");

             PORTB.f2=1;          //turn on green lights
             PORTB.f1=0;          //other lights are off
             PORTB.f0=0;
            }
  }
  else      //if train wasnt detect by second sensor
   {
   Lcd_Out(1,5,"WELCOME!");

   PORTB.f2=1;       //turn green light on
   PORTB.f1=0;
   PORTB.f0=0;       //other lights are off
   }
   
   if(inp3==1)        //if train detect by 2nd sensor from the RHS side
  {
            if(inp4==1)      //if train detects by 1st sensor from RHS side
            {
      
             PORTB.f2=0;      //turn off green light
             PORTB.f1=1;       //turn on the orange light
             Delay_ms(1500);
             
             buzzerOn();       //turn on the buzzer
             ledstop();         //show "STOP"
             
             PORTB.f1=0;        //turn off the orange light
             PORTB.f4=0;          //turn off Red light (Train Side)
             PORTB.f5=1;          //turn on Green light (Train Side)
             PORTB.f0=1;        //turn on red light
             servoRotate90();     //initiate the servo (roads are closed)
             
             while(PORTD.f2==0)     //while train not detect by 3rd sensor from LHS
             {
             ledstop();
             PORTB.f0=1;     //turn on the red lights
             PORTB.f5=1;          //turn on Green light (Train Side)
             }

             while(PORTD.f2==1)     //while train detect by 3rd sensor from LHS
             {
             ledstop();
             PORTB.f0=1;        //turn on the red lights
             PORTB.f5=1;          //turn on Green light (Train Side)
             }
             
             PORTB.f0=1;              //turn on red lights
             delay_ms(300);
             PORTB.f0=0;             //turn off red lights
             
             PORTB.f1=1;             //turn on the orange lights
             Delay_ms(1500);
             servoRotate0();        //initiate servo (open the roads)
             buzzerOff();       //turn on the buzzer
             Lcd_Cmd(_LCD_CLEAR);
             PORTB.f1=0;             //turn off the orange lights
             PORTB.f5=0;          //turn off Green light (Train Side)
             
              inp1=0 ;                   //return inp1 value back to zero
              inp2=0 ;                   //return inp2 value back to zero
              inp3=0 ;                   //return inp3 value back to zero
              inp4=0 ;                   //return inp4 value back to zero

            }
            else                    //if tran wasnt detect by 1st sensor from RH
            {
             Lcd_Out(1,5,"WELCOME!");
             PORTB.f2=1;           //turn on the green lights
             PORTB.f1=0;
             PORTB.f0=0;          //other lights are off
            }
  }
  else        //if train wasnt detect by 2nd senor from rhs
   {
   Lcd_Out(1,5,"WELCOME!");
   PORTB.f2=1;        //turn on the green lights
   PORTB.f1=0;
   PORTB.f0=0;        //other lights are off
   }
 }
}