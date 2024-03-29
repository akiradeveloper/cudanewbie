#include <thrust/sort.h>
#include <thrust/iterator/transform_iterator.h>
#include <thrust/iterator/zip_iterator.h>
#include <thrust/tuple.h>
#include <thrust/device_vector.h>
#include <thrust/functional.h>
#include <iostream>

int main(void){
  int keys[2] = {2,1};
  thrust::device_vector<int> d_keys(keys, keys+2);
  int values[2] = {1,2};
  thrust::device_vector<int> d_values(values, values+2);
  int values2[2] = {3,4};
  thrust::device_vector<int> d_values2(values2, values2+2);
  thrust::sort_by_key(
    thrust::make_transform_iterator(d_keys.begin(), thrust::absolute_value<int>()),
    thrust::make_transform_iterator(d_keys.end(), thrust::absolute_value<int>()),
    // thrust::make_zip_iterator(thrust::make_tuple(d_keys.begin(), d_values.begin(), d_values2.begin())));
    thrust::make_zip_iterator(thrust::make_tuple(thrust::make_tuple(d_keys.begin(), d_values.begin()), d_values2.begin())));        
  std::cout << d_keys[0] << d_keys[1] << std::endl;
  std::cout << d_values[0] << d_values[1] << std::endl;
  std::cout << d_values2[0] << d_values2[1] << std::endl;
  return 0;
} 
