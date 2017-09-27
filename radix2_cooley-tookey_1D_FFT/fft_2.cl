
// perform the butterfly computation. 
__kernel void fft_2( __global float2* data_in, __global float2* data_out)
{
	int gId = get_global_id(0);
	float2 in0, in1;
	in0 = data_in[gId];
	in1 = data_in[gId+1];
	float2 V;
	V = in0;
	in0 = V + in1;
	in1 = V - in1;
	data_out[gId] = in0;
	data_out[gId+1] = in1;
}
