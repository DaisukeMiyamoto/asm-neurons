#include "iz.h"

void calc_iz_c(int max_step, int n_cell, double *iz_const, double *iz_v, double *iz_u) {

    int i;

    for (i = 0; i < max_step * n_cell; i++, iz_v++, iz_u++)
    {
        double dv, du;
        double tmp_v = *iz_v;
        double tmp_u = *iz_u;
        double *next_v = iz_v + n_cell;
        double *next_u = iz_u + n_cell;

        //dv = (iz_v_1 * tmp_v * tmp_v + iz_v_2 * tmp_v + iz_v_3 - tmp_u + iz_i) * dt;
        dv = (iz_const[IZ_CONST_V_1] * tmp_v * tmp_v
              + iz_const[IZ_CONST_V_2] * tmp_v
              + iz_const[IZ_CONST_V_3]
              - tmp_u
              + iz_const[IZ_CONST_I]
             ) * iz_const[IZ_CONST_DT];
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

        //du = (iz_a * (iz_b * iz_v - iz_u)) * dt;
        du = (iz_const[IZ_CONST_A] * (iz_const[IZ_CONST_B] * tmp_v - tmp_u)) * iz_const[IZ_CONST_DT];
        /*
        d[32] = iz_b * iz_v;
        d[32] -= iz_u;
        d[32] *= iz_a;
        d[32] *= dt;
        */
        //printf("%.4f %.4f %.4f, %.4f %.4f %.4f\n", iz_v, dv, d[30], iz_u, du, d[32]);

        *next_v = tmp_v + dv;
        *next_u = tmp_u + du;

        if (*next_v > iz_const[IZ_CONST_TH]) {
            *next_v = iz_const[IZ_CONST_C];
            *next_u += iz_const[IZ_CONST_D];
        }
    }
}

