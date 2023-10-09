#include <htc.h>

#define __XTAL_FREQ 20000000
#define RS RC0 
#define RW RC1
#define EN RC2
#define BUTTON RC3
int j=0;
void delay();
void lcd_command(unsigned char);
void lcd_data(unsigned char);
void start();
void jump();
void gameover();
void moving_tree();
void score();
void dino(unsigned char *obj,char num)
{
		lcd_command(0x40+num*8);
		delay();
    	for(int i=0;i<8;i++)
    	{
	    	lcd_data(obj[i]);
	    	delay();
    	}
    	lcd_command(0xc0);
}
void main()
{
	TRISD=0;
	TRISC0=0;
    TRISC1=0;
    TRISC2=0;
    TRISC3=1;
    char object[8]={0x03,0x02,0x13,0x16,0x1F,0x0E,0x0A,0x0A};
	character(object,0);
	char object1[8]={0x0E,0x0E,0x04,0x1E,0x04,0x04,0x1E,0x00};
	character(object1,1);
	char object2[8]={0x14,0x14,0x15,0x15,0x1D,0x06,0X04,0x1F};
	character(object2,2);
	char object3[8]={0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
	character(object3,3);
    lcd_command(0x01);
    lcd_command(0x0c);
    lcd_command(0x38);
    lcd_command(0xc0);
    lcd_data(0);
    lcd_command(0xcf);
    lcd_data(2);
    lcd_command(0x01);
    delay();
    while(1)
    {
	    if(BUTTON==1)
	    {
		    jump();
	    }
	    //score();
	    lcd_data(3);
	    lcd_command(0xcf-j);
	    lcd_data(3);
	    delay();
	    lcd_command(0xcf-j);
	    lcd_data(2);
	    j++;
	    if(j>15&&BUTTON==0)
	    {
		    gameover();
		    lcd_command(0x01);
		    main();
	    }
	    if(j>15)
	    {
		 lcd_command(0xc0);
		 lcd_data(3);
		 j=0;
		 lcd_command(0xc0);
		 lcd_data(0);  
	    }
	    if(BUTTON==1)
	    {
		    jump();
	    }
    }
}
void lcd_data(unsigned char data)
{
	RS=1;
	RW=0;
	EN=1;
	PORTD=data;
	delay();
	EN=0;
}
void lcd_command(unsigned char data)
{
	RS=0;
	RW=0;
	EN=1;
	PORTD=data;
	delay();
	EN=0;
}
void delay()
{
	TMR1CS=0;
	T1CKPS0=1;
	T1CKPS1=1;
	TMR1H=0x0b;
	TMR1L=0xdc;
	TMR1ON=1;
	while(!TMR1IF);
	TMR1IF=0;
	TMR1ON=0;
}
void jump()
{
	lcd_command(0xc0);
	lcd_data(3);
	lcd_command(0x81);
	lcd_data(1);
    delay();
    for(int i=0;i<8;i++)
    {
	    lcd_data(object1[i]);
    }
    lcd_command(0x81);
    lcd_data(3);
    lcd_command(0xc0);
    lcd_data(0);

}
void gameover()
{
	lcd_command(0x80);
	    lcd_data(' ');
	    lcd_data(' ');
	    lcd_data(' '); 
		lcd_data('G');
		lcd_data('A');
		lcd_data('M');  
	    lcd_data('E');
	    lcd_data(' ');
	    lcd_data('O');
	  	lcd_data('V');
	  	lcd_data('E');
	  	lcd_data('R');  
		lcd_data(0);
}
void moving_tree()
{
		lcd_command(0x40);
    	for(int i=0;i<8;i++)
    	{
	    	lcd_data(*object[i]);
	    }
    	lcd_command(0xcf);
    	lcd_command(0x07);
    	lcd_data(0); 	  	
}
void start()
{
		lcd_command(0x80);
	    lcd_data(' ');
	    lcd_data(' ');
	    lcd_data('S');
	    lcd_data('T');
	    lcd_data('A');
	    lcd_data('R');
	    lcd_data('T');
	    lcd_data(' '); 
		lcd_data('G');
		lcd_data('A');
		lcd_data('M');  
	    lcd_data('E');
	    lcd_data(' ');
		delay();
}
void score()
{
	int i=0;
	lcd_command(0x85);
	lcd_data('s');
	lcd_data('c');
	lcd_data('o');
	lcd_data('r');
	lcd_data('e');
	lcd_data(':');
}
