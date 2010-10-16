#include <thrust/for_each.h>
#include <thrust/functional.h>
#include <thrust/device_vector.h>

struct array_reduce :public thrust::unary_function<int, void> {
  thrust::device_vector<int> reducer;
  array_reduce(thrust::device_vector<int> reducer_)
  :reducer(reducer_){}
  
  __device__
  void operator()(int i){
    reducer[i]++;
  }
};

int main(void){
  thrust::device_vector<int> d_xs(3);

  int in[] = {0,0,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2};
  thrust::device_vector<int> d_in(in, in+23);
  thrust::for_each(d_in.begin(), d_in.end(), array_reduce(d_xs));
  
  return 0;
}
