#include <thrust/random.h>
#include <thrust/iterator/counting_iterator.h>
#include <thrust/transform.h>
#include <thrust/device_vector.h>
#include <thrust/functional.h>
#include <iostream>

struct randf :public thrust::unary_function<int, float> {
  int seed;
  randf(int seed_)
  :seed(seed_){}
   
  __device__ __host__
  float operator()(int ind){
    thrust::default_random_engine rng(seed);
    rng.discard(1 * ind);
    thrust::uniform_real_distribution<float> u01(0,1);
    return u01(rng);
  }
};

int main(void){
  thrust::device_vector<float> output(2);
  for(int i=0; i<10; i++){
    thrust::transform(thrust::counting_iterator<int>(0),
                      thrust::counting_iterator<int>(2),
                      output.begin(),
                      randf(i+1)); // seed of 0 and 1 somehow returns the same number
    std::cout << output[0] << " " << 
                 output[1] << std::endl;
  }
  return 0;
}
