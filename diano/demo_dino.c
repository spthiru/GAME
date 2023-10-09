#include<htc.h>
__CONFIG(0X1F7A);
#define _XTAL_FREQ 20000000
#define RS RC0
#define RW RC1
#define EN RC2
void score();
int dino_jump();
void game_over();
void start_game();
void reset_game();
void delay();
int i=-1;
int j=0;
int c=0;
void lcd_command(unsigned char data)
{
	RS = 0;
	RW = 0;
	EN = 1;
	PORTD = data;
	__delay_ms(20);
	EN = 0;
}
void lcd_data(unsigned char data1)
{
	RS = 1;
	RW = 0;
	EN = 1;
	PORTD = data1;
	__delay_ms(20);
	EN = 0;
}
void character(unsigned char *obj,char location)  
{
	lcd_command(0x40+location*8);
	__delay_ms(20);
	for(int i=0;i<8;i++)
		lcd_data(obj[i]);
	__delay_ms(20);
}
int main()
{
	TRISC = 0;	//Output mode set in PORTC
	TRISD = 0;	//Output mode set in PORTD
	TRISC3 = 1;	//Input mode set in PORTC3 pin
	TRISC4 =1;	//Input mode set in PORTC4 pin
	char arr[8]={0x03,0x02,0x13,0x16,0x1E,0x0E,0x0A,0x0A};//dino
	character(arr,0);
	char arr1[8]={0x0E,0x0E,0x04,0x1E,0x04,0x04,0x1E,0x00};//Dino jumping
	character(arr1,1);
	char arr2[8]={0x14,0x14,0x15,0x15,0x1D,0x06,0X04,0x1F};//Tree
	character(arr2,2);
	char arr3[8]={0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};//Empty
	character(arr3,3);
	lcd_command(0x01);	//Display clear
	lcd_command(0x0C);	//Display shifting
	lcd_command(0x38);	//Function set bit (8 bit ,16x2,2line)
	start_game();			// Start game function
	lcd_command(0xc0);	//Disply 2 line data set
	lcd_data(0);
	lcd_command(0xcf);	
	lcd_data(2);
	int i=0;
	__delay_ms(200);	//Delay 200 millisecound
	lcd_command(0x01);  //Disply clear bit 
	while(1)
	{
	
		if(RC3 == 1)
		{
			dino_jump();
		}
		score();	//Score function
		lcd_data(3);	
		lcd_command(0xcf - c);
		lcd_data(3);
		__delay_ms(100);
		lcd_data(3);
		lcd_command(0xcf - c);
		lcd_data(2);
		c++;
			if(RC3 == 1)
			dino_jump();
		if(c>15 && RC3 == 0)
		{
			game_over();
		}
		if(c>15)
		{
			lcd_command(0xc0);
			lcd_data(3);
			c=0;
			lcd_command(0xc0);
			lcd_data(0);
		}
	

	}
}
void score()
{
	char *num="0123456789";
	char *name="score : ";
	lcd_command(0x82);
	for(int j=0;j<7;j++)
		lcd_data(name[j]);
	lcd_command(0x8A);
	lcd_data(num[j]);
	lcd_command(0x8B);
	lcd_data(num[i]);
	__delay_ms(100);
	if(i>10)
	{
		i=0;
		j++;
		if(j==9)
			j=0;
	}
}
int dino_jump()
{
			lcd_command(0xc0);
			lcd_data(3);
			lcd_command(0x81);
			lcd_data(1);
			lcd_command(0x81);
			lcd_data(3);
			lcd_command(0xc0);
			lcd_data(0);
			return(i++);
				
}
void game_over()
{
	lcd_command(0x01);
	lcd_command(0x80);
	char *stop="  GAME OVER  ";
	for(int i=0;i<14;i++)
	{
		lcd_data(stop[i]);
		__delay_ms(300);
	}
	reset_game();
}
void start_game()
{
	lcd_command(0x01);
	lcd_command(0x80);
		char *start="  START GAME  ";
	for(int i=0;i<14;i++)
	{
		lcd_data(start[i]);
		__delay_ms(300);
	}
}
void reset_game()
{
		
		lcd_command(0x01);
	lcd_command(0x80);
	char *reset="  RESTART GAME  ";
	for(int i=0;i<16;i++)
	{
		lcd_data(reset[i]);
		__delay_ms(300);
	}	
	while(1)
	{
			if(RC4==1)
			{
				lcd_command(0x01);
				c=0;
				i=0;
				j==0;
				main();
			}
	}
}	
void delay()
{
	TMR1CS=0;
	T1CKPS0=1;
	T1CKPS1=1;
	TMR1ON=1;
	TMR1L=0XDC;
	TMR1H=0X0B;
	while(!TMR1IF==1);
	TMR1IF=0;
	TMR1ON=0;	
}
