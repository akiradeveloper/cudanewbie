#include <thrust/device_vector.h>
#include <thrust/sort.h>
#include <iostream>
int main(void){
  int xs[3] = {2,3,1};
  thrust::device_vector<int> d_xs(xs, xs+3);
  thrust::sort_by_key(d_xs.begin(), d_xs.end(), d_xs.begin());
  std::cout << d_xs[0] << d_xs[1] << d_xs[2] << std::endl;
  return 0;
}
  

