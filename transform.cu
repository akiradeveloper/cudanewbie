// transform sample

#include <thrust/transform.h>
#include <thrust/functional.h>

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
  return 0;
}
    

  

