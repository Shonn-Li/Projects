// This is a helper module for the image module that facilitates:
// * loading images (as a sequence of ints) from input
// * printing images (as a sequence of ints) to output

// INPUT FORMAT:
//   width height
//   followed by width * height integers, each 0..255

// OUTPUT FORMAT:
//   width height (printed as "%d %d\n")
//   followed by height lines, each containing width integers
// each line has a space between integers, but no space after the last int
// that appears on each line (e.g., "%d %d %d......%d %d\n")

#include "image.h"

// image_load_from_input() creates a new image from input
// notes: first integers must be width then height
//        followed by width * height integers, each 0..255
// effects: allocates memory (you *must* call image_destroy)
struct image *image_load_from_input(void);

// image_print(img) prints img to output as a sequence of integers
// effects: produces output
void image_print(const struct image *img);
