/* main.c ---
*
* Filename: main.c
* Description: main program to build a compass
* Author: Robert Mulligan
* Maintainer: Robert Mulligan
* Created: Thu Feb 7 2016
/* Code: */

#include <stm32f30x.h> // Pull in include files for F30x standard drivers
#include <f3d_uart.h>
#include <f3d_user_btn.h>
#include <f3d_lcd_sd.h>
#include <f3d_i2c.h>
#include <f3d_accel.h>
#include <f3d_mag.h>
#include <stdio.h>
#include <math.h>


#define TIMER 20000

int main(void) {


f3d_uart_init();

  f3d_lcd_init();
  delay(10);

  // Set up your inits before you go ahead
  f3d_i2c1_init();
  delay(10); 
  f3d_accel_init();
  delay(10);
  f3d_mag_init();
  delay(10); 

  // Setup buffers
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);


  f3d_lcd_fillScreen(BLACK);

  // floats arrays
  float mag_data[3];
  float accel_data[3];

  // strings for printing
  unsigned char string_roll[50];
  unsigned char string_pitch[50];
  unsigned char string_heading[50];
  unsigned char string_heading_degrees[50];

  float roll;
  float pitch;
  float heading;

  while(1) {
  
    f3d_accel_read(accel_data); 
    f3d_mag_read(mag_data);

    float x_a = accel_data[0];
    float y_a = accel_data[1];
    float z_a = accel_data[2];

    pitch = atanf( x_a / sqrt(y_a * y_a + z_a * z_a));
    roll  = atanf( y_a / sqrt(x_a * x_a + z_a * z_a));
 
    sprintf( string_pitch, "Pitch = %f", pitch);
    sprintf( string_roll, "Roll = %f",   roll); 

    f3d_lcd_drawString(10,60, string_roll, WHITE, BLACK);
    f3d_lcd_drawString(10,70, string_pitch, WHITE, BLACK);

    float x_m = mag_data[0];
    float y_m = mag_data[1];
    float z_m = mag_data[2];
 
    /* float M_x = (x_m*cos(pitch) + z_m*sin(pitch)); */
    /* float M_y = (x_m*sin(roll)*sin(pitch) + y_m*cos(roll) + z_m*sin(roll)*cos(pitch)); */
    /* float M_z = -(x_m*cos(roll)*sin(pitch) + y_m*sin(roll) + z_m*cos(roll)*cos(pitch)); *
    
    /* if(M_x > 0 && M_y >= 0){ */
    /* heading = atan(M_y/M_x); */
    /* }else if(M_x<0){ */
    /* heading = (M_PI + atan(M_y/M_x)); */
    /* }else if(M_x > 0 && M_y <= 0){ */
    /* heading = (2*M_PI + atan(M_y/M_x)); */
    /* }else if(M_x = 0 && M_y < 0){ */
    /* heading = M_PI/2; */
    /* }else if(M_x = 0 && M_y > 0){ */
    /* heading = M_PI*1.5; */
    /* }else{ */
    /* f3d_lcd_drawString(20,100, "Failure" , WHITE, BLACK); */
    /* } */

    float Xh = x_m * cos(pitch) + z_m * sin(pitch);
    float Yh = x_m * sin(roll)*sin(pitch) + y_m * cos(roll) - z_m * sin(roll) * cos(pitch);

    heading = atan(Yh/Xh);

    //Equations 2;
    // page 7 on the LSM 303DLH for tilt compensate 
    //Xh and Yh of equations 2 you can get heading = arctan2(Yh, Xh)*180/M_PI + 
    
    sprintf(string_heading,"Heading is %f", heading);
    f3d_lcd_drawString(10, 120, string_heading, WHITE, BLACK);

    sprintf(string_heading_degrees,"Heading in degrees is %f", (heading * (180 / M_PI) )); 
    f3d_lcd_drawString(10, 130, string_heading_degrees, WHITE, BLACK); 
  }
}

/*
  unsigned char string_mag_data[50];
  unsigned char string_accel_data[50];
  
  while(1) {
  

  f3d_accel_read(accel_data); 
  f3d_mag_read(mag_data);
  
  
  sprintf(string_mag_data,"mag_data:\nx = %4f\ny = %4f\nz = %4f", mag_data[0],mag_data[1],mag_data[2]); 
  sprintf(string_accel_data,"Accel_data:\nx = %4f\ny = %4f\nz = %4f", accel_data[0], accel_data[1], accel_data[2]); 
  
  
  f3d_lcd_drawString(10, 40, string_mag_data, WHITE, BLACK); 
  f3d_lcd_drawString(10, 100, string_accel_data, WHITE, BLACK);
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
