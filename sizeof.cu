#include <iostream>

#include <thrust/device_vector.h>

int main(void){
  thrust::device_vector<short> vec(10);
  std::cout << sizeof(vec) << std::endl;
  return 0;
}


