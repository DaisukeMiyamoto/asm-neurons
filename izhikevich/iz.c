#include <stdio.h>
#include <stdlib.h>

int main()
{
  int i;                     // x20
  const int maxstep = 2000;        // x21
  const double dt   = 0.1;         // d10
  const double iz_a = 0.02;        // d11
  const double iz_b = 0.2;         // d12
  const double iz_c = -65.0;       // d13
  const double iz_d = 8.0;         // d14
  const double iz_i = 10.0;        // d15
  const double iz_v_1 = 0.04;      // d16
  const double iz_v_2 = 5.0;       // d17
  const double iz_v_3 = 140.0;     // d18
  const double iz_th = 30.0;       // d19
  double iz_v = -65.0;       // d20
  double iz_u = iz_v * iz_b; // d21
  //double d[40];
  
  for (i=0; i<maxstep; i++)
    {
      double dv, du;
      printf("%d %f\n", i, iz_v);
      dv = (iz_v_1 * iz_v * iz_v + iz_v_2 * iz_v + iz_v_3 - iz_u + iz_i) * dt;
      /*
      d[30] = iz_v * iz_v;
      d[30] *= iz_v_1;
      d[31] = iz_v_2 * iz_v;
      d[30] += d[31];
      d[30] += iz_v_3;
      d[30] -= iz_u;
      d[30] += iz_i;
      d[30] *= dt;
      */

      du = (iz_a * (iz_b * iz_v - iz_u)) * dt;
      /*
      d[32] = iz_b * iz_v;
      d[32] -= iz_u;
      d[32] *= iz_a;
      d[32] *= dt;
      */
      //printf("%.4f %.4f %.4f, %.4f %.4f %.4f\n", iz_v, dv, d[30], iz_u, du, d[32]);

      iz_v += dv;
      iz_u += du;
      
      if (iz_v > iz_th)
	{
	  iz_v = iz_c;
	  iz_u += iz_d;
	}
    }
}
