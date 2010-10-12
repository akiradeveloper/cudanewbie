#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/scatter.h>

#include <iostream>

int main(void){
  int input[10] = {1,0,2,0,3,0,4,0,5,0};
  int map[10] =   {0,5,1,6,2,7,3,8,4,9};

  thrust::device_vector<int> dmap(map, map+10);
  thrust::device_vector<int> output(10);
  thrust::scatter(input, input+10, dmap.begin(), output.begin());
  for(int i=0; i<10; i++){
    std::cout << output[i];
  }
  std::cout << std::endl;
  return 0;
}
