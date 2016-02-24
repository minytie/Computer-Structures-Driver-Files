//main.c for lab6
#include <f3d_uart.h>
#include <stdio.h>
#include <f3d_gyro.h>
#include <f3d_led.h>
#include <f3d_user_btn.h>

void delay(void) {
  int i = 5000000;
  while (i-- > 0) {
    asm("nop"); /* This stops it optimising code out */
  }
}

int main(void){
  f3d_uart_init();
  delay();
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);
  f3d_gyro_init();
 
  
  while(1) {
    delay();
    float test[3];
    f3d_gyro_getdata(test);
    delay();

    if(test[0]!=0) {
      printf("hello");
    }
    else
      printf("x = %f ||  y=%f || z=%f \n", test[0], test[1], test[2]);
  }
}

void assert_failed(uint8_t* file, uint32_t line) {
/* Infinite loop */
/* Use GDB to find out why we're here */
  while (1);
}
