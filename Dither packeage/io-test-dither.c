// This is a test client for the image dithering module
// Click [I/O TEST]

#include "image-io.h"
#include "image-dither.h"

int main(void) {

  struct image *img = image_load_from_input();
  
  image_dither(img);
  
  image_print(img);
  
  // to "save" your image to your website, uncomment the following line:
  // image_save_to_web(img, "test1.png");
  
  image_destroy(img);
}
