///////////////////////////////////////////////////////////////////////////// 
// INTEGRITY STATEMENT (v3)
//
// By signing your name and ID below you are stating that you have agreed
// to the online academic integrity statement:
// https://student.cs.uwaterloo.ca/~cs136/current/assignments/integrity.shtml
/////////////////////////////////////////////////////////////////////////////
// I received help from and/or collaborated with: 
//
// None
//  
// Name:Shonn Li
// login ID: s854li
/////////////////////////////////////////////////////////////////////////////  

#include "image-dither.h"
#include "cs136-trace.h"
#include "image-io.h"
#include "round.h"
#include <stdio.h>
#include <assert.h>

// total_max(img, x, y, total) checks to see if total passed 
//    the color setting for pixel and modifies the 
//    pixel as accordingly using img, x, y.
// Effect: Modify img
void total_max(struct image* img, int x, int y, int total) {
  if (total > 255) {
    image_set_pixel(img, x, y, 255);
  } else if (total < 0) {
    image_set_pixel(img, x, y, 0);
  } else {
    image_set_pixel(img, x, y, total);
  }
}

// right(img, x, y, pixel) does the right of 
//   the pixel by Floyd- Steinberg dithering.
// Effects: modify img
void right(struct image* img, int x, int y, int pixel) {
  //trace_int(x);
  //trace_int(y);
  int right = div_round((pixel * 7), 16);
  int right_origin = image_get_pixel(img, x + 1, y);
  //trace_int(right);
  total_max(img, x + 1, y, right_origin + right);
}

// right_corner(img, x, y, pixel) does the right corner
//    of the pixel by Floyd- Steinberg dithering.
// Effects: modify img
void right_corner(struct image* img, int x, int y, int pixel) {
  int right_corner = div_round((pixel * 1), 16);
  int right_corner_origin = image_get_pixel(img, x + 1, y + 1);
  //trace_int(right_corner);
  total_max(img, x + 1, y + 1, right_corner_origin + right_corner);
}

// bottom(img, x, y, pixel) does the bottom of 
//   the pixel by Floyd- Steinberg dithering.
// Effects: modify img
void bottom(struct image* img, int x, int y, int pixel) {
  int bottom = div_round((pixel * 5), 16);
  int bottom_origin = image_get_pixel(img, x, y + 1);
  //trace_int(bottom);
  total_max(img, x, y + 1, bottom_origin + bottom);
}

// left_corner(img, x, y, pixel) does the left_corner 
//   of the pixel by Floyd- Steinberg dithering.
// Effects: modify img
void left_corner(struct image* img, int x, int y, int pixel) {
  int left_corner = div_round((pixel * 3), 16);
  //trace_int(left_corner);
  int left_corner_origin = image_get_pixel(img, x - 1, y + 1);
  total_max(img, x - 1, y + 1, left_corner_origin + left_corner);
}


// distributor(img, x, y, pixel, indicator) distrubutes the  
//   pixel at (x,y) by Floyd-Steinberg dithering.
// Note: indicator = 1 means right only
//       indicator = 2 means no right and right corners
//       indicator = 3 means no left corners
//       indicator = 4 means all 
// Effects: modify img
// Require: 1 <= indicator <= 3 
void distributor(struct image* img, int x, int y, int pixel, int indicator) {
  assert(1 <= indicator);
  assert(indicator <= 4);
  //trace_msg("distributor here");
  if (indicator == 1) {
    //trace_msg("(indicator == 1)");
    right(img, x, y, pixel);
  } else if (indicator == 2) {
    //trace_msg("(indicator == 2)");
    bottom(img, x, y, pixel);
    left_corner(img, x, y, pixel);
  } else if (indicator == 3) {
    //trace_msg("(indicator == 3)");
    right(img, x, y, pixel);
    right_corner(img, x, y, pixel);
    bottom(img, x, y, pixel);
  } else {
    //trace_msg("(indicator == 4)");
    right(img, x, y, pixel);
    right_corner(img, x, y, pixel);
    bottom(img, x, y, pixel);
    left_corner(img, x, y, pixel);
  }
}

// diluter(img, x , y, n) dilutes the n to 0 or 255 and modifies the pixel
//   with corresponding n color. Also, it returns positive or negative n
//   depending on which side it diluted.
// Effects: Modify color. 
int diluter(struct image* img, int x, int y, int n) {
  //trace_int(n);
  if (n <= 127) {
    //trace_msg("(n <= 127)");
    image_set_pixel(img, x, y, 0);
    return n;
  } else {
    //trace_msg("(n <= 255)");
    image_set_pixel(img, x, y, 255);
    return (n - 255);
  }
}

void image_dither(struct image *img) {
  int width = image_get_width(img);
  int height = image_get_height(img);
  //trace_int(width);
  //trace_int(height);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      //image_trace(img);
      //trace_int(x);
      //trace_int(y);
      if ((x == width - 1) && (y == height - 1)) {
        trace_msg("(x == width - 1) && (y == height - 1");
        diluter(img, x, y, image_get_pixel(img, x, y));
      } else if (y == height - 1) {
        //trace_msg("(y == height - 1");
        int pixel = diluter(img, x, y, image_get_pixel(img, x, y));
        int indicator = 1;
        distributor(img, x, y, pixel, indicator);
      } else if (x == width - 1) {
        //trace_msg("(x == width - 1)");
        int pixel = diluter(img, x, y, image_get_pixel(img, x, y));
        int indicator = 2;
        distributor(img, x, y, pixel, indicator);
      } else if (x == 0) {
        //trace_msg("(x == 0)");
        int pixel = diluter(img, x, y, image_get_pixel(img, x, y));
        int indicator = 3;
        distributor(img, x, y, pixel, indicator);
      } else {
        //trace_msg("else");
        int pixel = diluter(img, x, y, image_get_pixel(img, x, y));
        int indicator = 4;
        distributor(img, x, y, pixel, indicator);
      }
    }
  }
  //image_trace(img);
}
