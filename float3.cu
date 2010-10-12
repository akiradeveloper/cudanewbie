#include <iostream>
#include <assert.h>

int main(void){
  float2 p1;
  p1.x = 10;
  p1.y = 20;
  float2 p2;
  p2.x = 10;
  p2.y = 20;
  assert(p1==p2);
  return 0;
}
