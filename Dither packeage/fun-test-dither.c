// This is a more "fun" test client for the image dithering module
// Click [RUN (>)], not [I/O TEST]

#include "image-io.h"
#include "image-dither.h"

int main(void) {

  // see https://student.cs.uwaterloo.ca/~cs136/current/assignments/images/
  // for more images you can load
  struct image *img = image_load_library(1);
  
  image_dither(img);
  
  image_save_to_web(img, "1.png");
  
  image_destroy(img);
}
