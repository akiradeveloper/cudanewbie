#include <thrust/tuple.h>
#include <iostream>

template<typename T>
bool equal(T a, T b){
  std::cout << a.size << std::endl;
  return false;
}



int main(void){
  thrust::tuple<int, int> t = thrust::make_tuple(1,2);
  std::cout << t.get<0>() << t.get<1>() << std::endl;
  std::cout << (t == t) << std::endl; 
  thrust::tuple<thrust::tuple<int,int>, int> t2 = thrust::make_tuple(t, 3);
  std::cout << (t == t2.get<0>()) << std::endl;
  
  return 0;
}

