// scan sample

#include <thrust/scan.h>
#include <iostream>

void print_array(int* data, int len){
  for(int i=0; i<len; i++){
    std::cout << data[i];
  }
  std::cout << std::endl;
}
int main(void){
  const int len = 6; 
  int data[len] = {1,0,2,2,1,3};

  int inout[len];
  thrust::inclusive_scan(data, data+len, inout);
  print_array(inout, len);

  int exout[len];
  thrust::exclusive_scan(data, data+len, exout);
  print_array(exout, len);
  return 0;
}


