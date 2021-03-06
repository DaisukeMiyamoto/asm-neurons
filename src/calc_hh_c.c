//
// Created by nebula on 6/10/17.
//
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "benchmark_utils.h"
#include "hh.h"


#ifdef USE_FLOAT
#define EXP(x) expf((x))
typedef float FLOAT;
#else
#define EXP(x) exp((x))
typedef double FLOAT;
#endif


static FLOAT v_trap (FLOAT x, FLOAT y) { return( (fabs(x/y) > 1e-6)? ( x/(EXP(x/y) - 1.0) ) : ( y*(1. - x/y/2.) ) ); }
static FLOAT calc_alpha_n (FLOAT v) { return( 0.01  * v_trap(-(v+55.), 10.) );   }
static FLOAT calc_beta_n  (FLOAT v) { return( 0.125 * EXP( -(v+65.) / 80.) );    }
static FLOAT calc_alpha_m (FLOAT v) { return( 0.1   * v_trap(-(v+40.), 10.));    }
static FLOAT calc_beta_m  (FLOAT v) { return( 4.    * EXP( -(v+65) / 18.) );     }
static FLOAT calc_alpha_h (FLOAT v) { return( 0.07  * EXP( -(v+65) / 20.) );     }
static FLOAT calc_beta_h  (FLOAT v) { return( 1. / (EXP( -(v+35) / 10.) + 1.) ); }



double calc_hh_c_core(double *hh_v, double *hh_m, double *hh_n, double *hh_h, const double *const_table)
{
    double dm, dn, dh, m, h, n, v;
    m = *hh_m;
    h = *hh_h;
    n = *hh_n;
    v = *hh_v;

    dm = (calc_alpha_m(v) * (1.0 - m) - calc_beta_m(v) * (m)) * const_table[HH_CONST_DT];
    m += dm;

    dn = (calc_alpha_n(v) * (1.0 - n) - calc_beta_n(v) * (n)) * const_table[HH_CONST_DT];
    n += dn;

    dh = (calc_alpha_h(v) * (1.0 - h) - calc_beta_h(v) * (h)) * const_table[HH_CONST_DT];
    h += dh;

    v += const_table[HH_CONST_DT] * const_table[HH_CONST_CM_INV]
            * (const_table[HH_CONST_GK] * n * n * n * n * (const_table[HH_CONST_E_K] - v)
               + const_table[HH_CONST_GNA] * m * m * m * h * (const_table[HH_CONST_E_NA] - v)
               + const_table[HH_CONST_GM] * (const_table[HH_CONST_REST] - v)
               + const_table[HH_CONST_I_INJ]);

    *hh_m = m;
    *hh_n = n;
    *hh_h = h;
    return(v);
}

void calc_hh_c(int max_step, int n_cell, const double *const_table, double *data_array)
{
    int step, i;
    double *m_array, *n_array, *h_array;
    data_array += n_cell;

    m_array = (double *)malloc(n_cell * sizeof(double));
    n_array = (double *)malloc(n_cell * sizeof(double));
    h_array = (double *)malloc(n_cell * sizeof(double));
    init_double(n_cell, m_array, calc_alpha_m(-65.0) / (calc_alpha_m(-65.0) + calc_beta_m(-65.0)));
    init_double(n_cell, n_array, calc_alpha_n(-65.0) / (calc_alpha_n(-65.0) + calc_beta_n(-65.0)));
    init_double(n_cell, h_array, calc_alpha_h(-65.0) / (calc_alpha_h(-65.0) + calc_beta_h(-65.0)));

    for (step = 0; step < (max_step-1); step++)
    {
        for (i = 0; i < n_cell; i++)
        {
            *(data_array) = calc_hh_c_core(data_array - n_cell, &(m_array[i]), &(n_array[i]), &(h_array[i]), const_table);
            data_array++;
        }
        //printf("%d: %f %f %f %f\n", step, *(data_array-1), m_array[0], n_array[0], h_array[0]);
    }

    free(m_array);
    free(n_array);
    free(h_array);
}
