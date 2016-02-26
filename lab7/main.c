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

#define TIMER 20000

int main(void) { 
  // If you have your inits set up, this should turn your LCD screen red

  //inits
  f3d_lcd_init();
  f3d_uart_init();
  f3d_gyro_init();

  printf("passed inits");
  //buffers
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);

  f3d_lcd_fillScreen(BLACK);

  float data[3];
  char data_string_x[30]; 
  char data_string_y[30]; 
  char data_string_z[30]; 

  while(1){
  f3d_gyro_getdata(data);

  sprintf(data_string_x, "x = %6f", data[0]);
  sprintf(data_string_y, "y = %6f", data[1]);
  sprintf(data_string_z, "z = %6f", data[2]);

  
  f3d_lcd_drawString(30,50,data_string_x, WHITE, BLACK);   
  f3d_lcd_drawString(30,60,data_string_y, WHITE, BLACK);   
  f3d_lcd_drawString(30,70,data_string_z, WHITE, BLACK);   
  
  //bar info by gleb
  
  //f3d_lcd_setAddrWindow(x1,256-gyrodata,x2,y2,MADCTLGRAPHICS);
  

  }


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
 
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) {
/* Infinite loop */
/* Use GDB to find out why we're here */
  while (1);
}
#endif

/* main.c ends here */
