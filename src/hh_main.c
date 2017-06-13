#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "benchmark_utils.h"
#include "hh.h"

double *check_calc(void (*func)(int max_step, int n_cell, const double *const_table, double *data_array),
                   int max_step, int n_cell, double *const_table,
                   double *answer_array, int debug, char *title)
{
    double start, end;
    double *data_array;
    double *tmp_data_array;
    int array_size;

    array_size = max_step * n_cell;
    data_array = (double *) malloc(array_size * sizeof(double));
    init_double(array_size, data_array, -65.0);
    tmp_data_array = data_array;

    start = getTime();
    func(max_step, n_cell, const_table, data_array);
    end = getTime();

    printf("# %s: Time=%.2f sec (%.1f MFLOPS)\n",
           title,
           end - start,
           1.0 * max_step * n_cell * HH_FLOP_PER_STEP / (end - start + 0.00001) / 1000 / 1000);

    if (debug >= 2) print_double(n_cell, max_step, data_array);
    if (answer_array != NULL) {
        double diff = diff_double(array_size, answer_array, tmp_data_array);
        printf("diff = %f\n", diff);
        if (debug >= 1 && diff > HH_FAILED_THRESHOLD)
        {
            printf("TEST FAILED\n");
            exit(-1);
        }
    }

    return(tmp_data_array);
}


int main(int argc, char **argv)
{
    int max_step = 10000;
    int n_cell = 10000;
    int debug = 0;

    if (argc >= 2) max_step = atoi(argv[1]);
    if (argc >= 3) n_cell = atoi(argv[2]);
    if (argc >= 4) debug = atoi(argv[3]);

    double const_table[10];
    double *answer_array;

    const_table[HH_CONST_DT] = 0.025;
    const_table[HH_CONST_CM_INV] = 1.0;
    const_table[HH_CONST_GK] = 36.0;
    const_table[HH_CONST_E_K] = -77.0;
    const_table[HH_CONST_GNA] = 120.0;
    const_table[HH_CONST_E_NA] = 50.0;
    const_table[HH_CONST_GM] = 0.3;
    const_table[HH_CONST_REST] = -54.3;
    const_table[HH_CONST_I_INJ] = 5;


    printf("# %d Step, %d Cells\n", max_step, n_cell);

    answer_array = check_calc(calc_hh_c, max_step, n_cell, const_table, NULL, debug, "C   ");

    free(answer_array);

}
