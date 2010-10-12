#include <iostream>
typedef float4 Real3;

void puts(Real3 v){
  std::cout << "(" << v.x << " " << v.y << " " << v.z << ")" << std::endl;
}

Real3 operator+(Real3 v1, Real3 v2){
  Real3 p;
  p.x = v1.x + v2.x;
  p.y = v1.y + v2.y;
  p.z = v1.z = v2.z;
  return p;
}

Real3 genReal3(float x, float y, float z){
  Real3 p;
  p.x = x;
  p.y = y;
  p.z = z;
  return p; 
}

int main(void){
  Real3 p = genReal3(10,20,30);

  puts(p);

  Real3 q = genReal3(40,50,60);
  
  puts(p+q);
  
  return 0;
}
  
