#include <thrust/tuple.h>
#include <iostream>

int main(void){
  std::cout << thrust::make_tuple(1,1) + thrust::make_tuple(2,3) << std::endl;
  return 0;
}

