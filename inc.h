__global__ 
void inc(int *array, int len){
  int i;
  int tid = threadIdx.x + blockDim.x * blockIdx.x;
  int nthreads = blockDim.x * gridDim.x;
  int part = len / nthreads;
  for (i = part*tid; i<part*(tid+1); i++){
    array[i]++;
  }
}
