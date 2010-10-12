#include <iostream>
#include <string>

template<typename Iterator>
std::string to_s(Iterator begin, Iterator end){
  std::string s = "[";
  for(int i=0; i<(end-begin); i++){
    std::cout << begin[i] << std::endl;
    s += lexical_cast<std::string>(begin[i]);
    std::cout << s << std::endl;
  }
  s += "]";
  return s;
}

int main(void){
  int x[3] = {1,2,3};
  std::cout << to_s(x, x+3) << std::endl;
  return 0;
}
