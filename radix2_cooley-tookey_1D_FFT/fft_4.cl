
__kernel void fft_4( __global float2* data_in, __global float2* data_out)
{
	int gId = get_global_id(0);
	float2 in0,in1,in2,in3;
	float2 V0,V1,V2,V3;
	
	in0 = data_in[gId];
	in1 = data_in[gId+1];
	in2 = data_in[gId+2];
	in3 = data_in[gId+3];
	
	//intermediate step 
	V0 = in0 + in2;
	V2 = in0 - in2;
	V1 = in1 + in3;
	
	//handle the multiplication by -j
	V3.x = in1.y - in3.y;
	V3.y = in3.x - in1.x;
	
	// perform the final butterfly. 
	in0 = V0 + V1;
	in2 = V0 - V1;
	in1 = V2 + V3;
	in3 = V2 - V3;

	data_out[gId] = in0;
	data_out[gId+1] = in1;
	data_out[gId+2] = in2;
	data_out[gId+3] = in3;
}
