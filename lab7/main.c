/* main.c --- 
 * 
 * Filename: main.c
 * Description: 
 * Author: Robert
 * Maintainer: 
 * Created: Thu Jan 10 11:23:43 2013
/* Code: */

#include <stm32f30x.h>  // Pull in include files for F30x standard drivers 
#include <f3d_led.h>     // Pull in include file for the local drivers
#include <f3d_uart.h>
#include <f3d_gyro.h>
#include <f3d_lcd_sd.h>
#include <stdio.h>

//adding an additional library for Math.max
#include <math.h>

#define TIMER 20000

int main(void) { 
  // If you have your inits set up, this should turn your LCD screen red

  //inits
  f3d_lcd_init();
  f3d_uart_init();
  f3d_gyro_init();

  //printf("passed inits");
  //buffers
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);

  f3d_lcd_fillScreen(BLACK);

  //gryo float data
  float data[3];

  //for the strings that print out
  char data_string_x[30]; 
  char data_string_y[30]; 
  char data_string_z[30]; 

  while(1){
    //collects data and mutates data variable
  f3d_gyro_getdata(data);

  sprintf(data_string_x, "x = %4f", data[0]);
  sprintf(data_string_y, "y = %4f", data[1]);
  sprintf(data_string_z, "z = %4f", data[2]);

  
  f3d_lcd_drawString(30,10,data_string_x, BLUE, BLACK);   
  f3d_lcd_drawString(30,20,data_string_y, YELLOW, BLACK);   
  f3d_lcd_drawString(30,30,data_string_z, RED, BLACK);   
  
  //bar info by gleb
  
  // f3d_lcd_setAddrWindow(x1,256-gyrodata,x2,y2,MADCTLGRAPHICS);
  //don't forget to have a threshold for gyrodata.
  //

  int x = data[0]*2.5; 
  int y = data[1]*2.5; 
  int z = data[2]*2.5; 

  int inc, size; 

  for(inc = 69; inc < 98; inc++){
    if(x>=0){
      for(size = 64; size < x+64; size++) {
	f3d_lcd_drawPixel(size,inc,BLUE);
      }
    }else{
      for(size = 64; size > x+64; size--) {
	f3d_lcd_drawPixel(size,inc,BLUE);
      }
    }

  }


  for(inc = 98; inc < 127; inc++){
    if(y>=0){
      for(size = 64; size < y+64; size++) {
	f3d_lcd_drawPixel(size,inc,YELLOW);
      }
    }else{
      for(size = 64; size > y+64; size--) {
	f3d_lcd_drawPixel(size,inc,YELLOW);
      }
    }
  }


  for(inc = 127; inc < 160; inc++) {
    if(z>=0){
      for(size = 64; size < z+64; size++) {
	f3d_lcd_drawPixel(size,inc,RED);
      }
    }else{
      for(size = 64; size > z+64 && size >= 0; size--) {
	f3d_lcd_drawPixel(size,inc,RED);
      }

    }

  }

  int row, col;

  f3d_lcd_setAddrWindow (0,40,ST7735_width-1,ST7735_height-1,MADCTLGRAPHICS);
  for (row=0;row<ST7735_width;row++) {
    for (col=0;col<ST7735_height; col++) {
      f3d_lcd_pushColor(BLACK,1);
    }
  }

  

  }//end of while loop


  }//end of main function


  /* 
  while(1){
  f3d_lcd_fillScreen(RED);
  f3d_lcd_fillScreen2(BLUE); 
  }
  */
 
/*
  //methods
  while(1) {
  f3d_lcd_fillScreen(RED); 
  f3d_lcd_fillScreen(BLUE); 
  f3d_lcd_fillScreen(GREEN);
  f3d_lcd_fillScreen(CYAN);
  f3d_lcd_fillScreen(WHITE);
  f3d_lcd_fillScreen(YELLOW);
  f3d_lcd_fillScreen(BLACK);
  f3d_lcd_fillScreen(MAGENTA);
}
*/
 


#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) {
/* Infinite loop */
/* Use GDB to find out why we're here */
  while (1);
}
#endif

/* main.c ends here */
