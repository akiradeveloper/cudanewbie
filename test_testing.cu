#include <testing/unittest/assertions.h>

int main(void){
  ASSERT_EQUAL(10, 10);
  int xs[2] = {1,2};
  int ys[2] = {1,3};
  thrust::host_vector<int> h_xs(xs, xs+2);
  thrust::host_vector<int> h_ys(ys, ys+2);
  ASSERT_EQUAL(h_xs, h_ys);
  return 0;
}
