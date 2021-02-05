// This is a lightweight "image" module for working with greyscale images

// notes: the x/y axis for working with images is slightly different
//        than cartesian coordinates

//        (0, 0) is in the upper-left ------------------------------+
//        |                                                         |
//        +---------------------- bottom-right is (width-1, height-1) 
//
//        pixels are shades of grey from 0 [black] .. 255 [white]

// The following applies to all functions: 
// requires: all image parameters are valid
//           all grey parameters are between 0..255 (inclusive)

struct image;

// BLACK and WHITE are 0 and 255 respectively, but use these constants
//   in your code instead of the values 0 and 255
extern const int BLACK;
extern const int WHITE;

// image_create(width, height, grey) creates a new image with the given
//   dimensions (width x height) and solid grey colour
// requires: 0 < width, height
// effects: allocates memory (you *must* call image_destroy)
struct image *image_create(int width, int height, int grey);

// image_destroy(img) destroys img
// effects: deallocates memory (img is no longer valid)
void image_destroy(struct image *img);

// image_get_width(img) gets the width of img
int image_get_width(const struct image *img);

// image_get_height(img) gets the height of img
int image_get_height(const struct image *img);

// image_get_pixel(img, x, y) gets the greyscale value of the pixel
//   located at (x, y) in img
// requires: 0 <= x < image_get_width(img)
//           0 <= y < image_get_height(img)
int image_get_pixel(const struct image *img, int x, int y);

// image_set_pixel(img, x, y, grey) sets the greyscale value of the pixel
//   located at (x, y) in img
// requires: 0 <= x < image_get_width(img)
//           0 <= y < image_get_height(img)
// effects: modifies img
void image_set_pixel(struct image *img, int x, int y, int grey);

// image_trace(img) displays the image pixel values to "tracing output"
//   to facilitate testing without interfering with our testing
void image_trace(const struct image *img);

/////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING FUNCTIONS ARE "OPTIONAL" FUNCTIONS YOU MAY
// USE IF YOU WISH -- THEY _SHOULD_ WORK IN OUR SEASHELL ENVIRONMENT
// BUT THERE MAY BE UNFORSEEN COMPLICATIONS

// image_load_library(image_id) creates a new image from the image
//   in the cs136 image library here:
//   https://student.cs.uwaterloo.ca/~cs136/current/assignments/images/
// requires: there must be an image_id.png in the above folder
// effects: allocates memory (you *must* call image_destroy)
struct image *image_load_library(int image_id);

// image_save_to_web(img, "filename.png") saves your img to your
//   personal web page with the given filename.
//   http://student.cs.uwaterloo.ca/~YOURID/filename.png
// effects: creates a file
// requires: filename_png is a string in the form "filename.png"
//           that only uses letters and numbers in the filename
void image_save_to_web(const struct image *img, const char *filename_png);


//////////////////////////////////////////////////////////////////////////
// portions of this module are based on https://github.com/nothings/stb //
//////////////////////////////////////////////////////////////////////////
