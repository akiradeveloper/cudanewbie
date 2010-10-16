// transform sample

#include <thrust/transform.h>
#include <thrust/functional.h>
#include <thrust/transform_reduce.h>
#include <thrust/device_vector.h>

#include <iostream>

void print_array(int* data, int len){
  for(int i=0; i<len; i++){
    std::cout << data[i];
  }
  std::cout << std::endl;
}

// create my function
// which triple the given value
struct multi3 : public thrust::unary_function<int, int> {
  __host__ __device__
  int operator()(const int &x) {
    return x*3;
  }
};

int main(void){
  int len = 3;
  int data[] = {1,2,3};
  multi3 op; // create functional object
  thrust::transform(
    data,
    data+len,
    data,
    op);
  print_array(data, len);

  thrust::device_vector<float> dv;
  dv.push_back(1.0F);
  float sum = thrust::transform_reduce(dv.begin(), dv.end(), thrust::negate<float>(), 0.0F, thrust::plus<float>());
  std::cout << sum << std::endl;
  return 0;
}
    

  

