#ifndef SQRT_OPT_H
#define SQRT_OPT_H

// https://gcc.gnu.org/onlinedocs/gcc-4.6.1/gcc/Vector-Extensions.html
typedef float v4sf __attribute__ ((vector_size (16)));
typedef int v4si __attribute__ ((vector_size (16)));


template <size_t LOOPS = 2>
float sqrt1(float * a) {
  float root;
  // from here
  // TODO: your code
  int * ai = reinterpret_cast<int *>(a);
  int * initial = reinterpret_cast<int *>(&root);
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
  root = * reinterpret_cast<float *>(initial);
  for(size_t i = 0; i < LOOPS; i++) {
    root = 0.5 * (root + (* a / root));
  }
  // std::cout << "Square of " << * a << " is: " << root << std::endl;
  // to here
  return root;
}

template <size_t LOOPS = 2>
void sqrt2(float * __restrict__ a, float * __restrict__ root) {
  // from here
  // TODO: your code
  for(size_t i = 0; i < 4; i++) {
    int * ai = reinterpret_cast<int *>(&a[i]);
    int * initial = reinterpret_cast<int *>(&root[i]);
    * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
    root[i] = * reinterpret_cast<float *>(initial);
  }
  for(size_t j = 0; j < LOOPS; j++) {
    root[0] = 0.5 * (root[0] + (a[0] / root[0]));
    root[1] = 0.5 * (root[1] + (a[1] / root[1]));
    root[2] = 0.5 * (root[2] + (a[2] / root[2]));
    root[3] = 0.5 * (root[3] + (a[3] / root[3]));
  }
  std::cout << "Sqrt of " << a[3] << " is: " << root[3] << std::endl;
  // to here
}


template <size_t LOOPS = 2>
void v4sf_sqrt(v4sf *  __restrict__  a, v4sf *  __restrict__  root) {
  // from here
  // TODO: your code
  v4si * ai = reinterpret_cast<v4si *>(a);
  v4si * initial = reinterpret_cast<v4si *>(root);
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
  root = reinterpret_cast<v4sf *>(initial);
  for (size_t i = 0; i < LOOPS; i++) {
    * root = 0.5 * (* root + (* a / * root));
  }
  /**
  float * aF = reinterpret_cast<float *>(a);
  float * rootF = reinterpret_cast<float *>(root);
  std::cout << "Sqrt of " << aF[0] << " is: " << rootF[0] << std::endl;
  std::cout << "Sqrt of " << aF[1] << " is: " << rootF[1] << std::endl;
  std::cout << "Sqrt of " << aF[2] << " is: " << rootF[2] << std::endl;
  std::cout << "Sqrt of " << aF[3] << " is: " << rootF[3] << std::endl;
  **/
  // to here
}


// wrapper für v4sf_sqrt
template <size_t LOOPS = 2>
void sqrt3(float *  __restrict__  a, float *  __restrict__  root) {
  v4sf *as = reinterpret_cast<v4sf *>(a);
  v4sf_sqrt<LOOPS>(as, reinterpret_cast<v4sf *>(root) );
}

#endif

