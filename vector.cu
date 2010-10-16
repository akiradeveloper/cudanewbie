#include <thrust/device_vector.h>
#include <iostream>

int main(void){
  int xs[2] = {1,2};
  thrust::device_vector<int> d_xs(xs, xs+2);
  thrust::device_vector<int> d_ys(xs, xs+2);
  std::cout << (d_xs == d_xs) << std::endl;
  if(d_xs != d_xs){
    std::cout << "FALSE" << std::endl;
  }
  if(d_xs != d_ys){
    std::cout << "FALSE" << std::endl;
  }
  std::cout << true << std::endl;
  std::cout << false << std::endl;
  return 0;
}
