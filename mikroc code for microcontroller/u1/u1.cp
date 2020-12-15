#line 1 "E:/UWU/3.1/Embedded Systems/project/final1/trafficlight1 - Copy/u2/u1/u1.c"
unsigned int inp1,inp2,inp3,inp4,inp5,inp6;

void servoRotate0() {
unsigned int i;
for(i=0;i<50;i++)
{
PORTB.f6 = 1;
Delay_us(800);
PORTB.f6 = 0;
Delay_us(19200);
}
}
void servoRotate90() {
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




void main() {
 TRISB=0X00;
 TRISC=0X00;
 TRISD=0XFF;

 PORTB=0X00;
 PORTD=0X00;
 PORTC=0X00;




 inp1=0;
 inp2=0;
 inp3=0;
 inp4=0;
 inp5=0;
 inp6=0;
 servoRotate0();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 buzzerOff();
 while(1)
 {
 Lcd_Out(1,5,"WELCOME!");
 buzzerOff();
 PORTB.f2=1;
 PORTB.f4=1;

 if(PORTD.f0==1)
 {
 inp1=1;
 }

 if(inp1==1)
 {if(PORTD.f1==1)
 {
 inp2=1;
 }
 }

 if(PORTD.f5==1)
 {
 inp4=1;
 }

 if(inp4==1)
 {
 if(PORTD.f4==1)
 {
 inp3=1;
 }
 }


 if(inp2==1)
 {
 if(inp1==1)
 {



 PORTB.f2=0;
 PORTB.f1=1;
 Delay_ms(1500);

 buzzerOn();
 ledstop();

 PORTB.f1=0;
 PORTB.f4=0;
 PORTB.f5=1;
 PORTB.f0=1;
 servoRotate90();


 while(PORTD.f3==0)
 {
 ledstop();

 PORTB.f0=1;
 PORTB.f5=1;
 }

 while(PORTD.f3==1)
 {
 ledstop();

 PORTB.f0=1;
 PORTB.f5=1;
 }



 PORTB.f0=1;
 delay_ms(300);
 PORTB.f0=0;

 PORTB.f1=1;
 Delay_ms(1500);

 servoRotate0();
 Lcd_Cmd(_LCD_CLEAR);
 buzzerOff();


 PORTB.f1=0;
 PORTB.f5=0;

 inp1=0 ;
 inp2=0 ;
 inp3=0 ;
 inp4=0 ;

 }
 else
 {
 Lcd_Out(1,5,"WELCOME!");

 PORTB.f2=1;
 PORTB.f1=0;
 PORTB.f0=0;
 }
 }
 else
 {
 Lcd_Out(1,5,"WELCOME!");

 PORTB.f2=1;
 PORTB.f1=0;
 PORTB.f0=0;
 }

 if(inp3==1)
 {
 if(inp4==1)
 {

 PORTB.f2=0;
 PORTB.f1=1;
 Delay_ms(1500);

 buzzerOn();
 ledstop();

 PORTB.f1=0;
 PORTB.f4=0;
 PORTB.f5=1;
 PORTB.f0=1;
 servoRotate90();

 while(PORTD.f2==0)
 {
 ledstop();
 PORTB.f0=1;
 PORTB.f5=1;
 }

 while(PORTD.f2==1)
 {
 ledstop();
 PORTB.f0=1;
 PORTB.f5=1;
 }

 PORTB.f0=1;
 delay_ms(300);
 PORTB.f0=0;

 PORTB.f1=1;
 Delay_ms(1500);
 servoRotate0();
 buzzerOff();
 Lcd_Cmd(_LCD_CLEAR);
 PORTB.f1=0;
 PORTB.f5=0;

 inp1=0 ;
 inp2=0 ;
 inp3=0 ;
 inp4=0 ;

 }
 else
 {
 Lcd_Out(1,5,"WELCOME!");
 PORTB.f2=1;
 PORTB.f1=0;
 PORTB.f0=0;
 }
 }
 else
 {
 Lcd_Out(1,5,"WELCOME!");
 PORTB.f2=1;
 PORTB.f1=0;
 PORTB.f0=0;
 }
 }
}
