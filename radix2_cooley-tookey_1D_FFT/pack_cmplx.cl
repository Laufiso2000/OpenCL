// OpenCL doesn't support complex numbers.  This Kernel pairs each complex number
// in a two element vecotr, where each elemnt is a floating point value.  
// Float2 is a built-in data type that which stores two floating point values
// in a vector.


__kernel void pack_cmplx(__global float* data_in, __global float2* data_out, int N)
{
int x = get_global_id(0);
float2 cmplxNum;
cmplxNum.x = data_in[x];
cmplxNum.y = data_int[x+N];
data_out[x] = cmplxNum;
}

