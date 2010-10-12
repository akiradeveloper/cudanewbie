// is reduce in thrust foldl or foldr?
// => it is foldl in Haskell
#include <thrust/reduce.h>
#include <thrust/functional.h>

#include <iostream>

void print_array(int* data, int len){
  for(int i=0; i<len; i++){
    std::cout << data[i];
  }
  std::cout << std::endl;
}

struct div_func : public thrust::binary_function<float, float, float> {
  __host__ __device__
  float operator()(const float &result, const float &arg){
    return result / arg;
  }
};
  
int main(void){
  int len = 3;
  int data[] = {1,2,3};
  div_func op;
  // 24 / 1 / 2 / 3 = 4
  float result = thrust::reduce(data, data+len, 24, op);
  print_array(data, len);
  std::cout << result << std::endl;
  return 0;
}
