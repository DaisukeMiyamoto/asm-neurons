#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "iz.h"

double diff_double(int size, double *array1, double *array2) {
    int i;
    double diff = 0.0;
    for (i = 0; i < size; i++) {
        diff += fabs(*array1 - *array2);
        array1++;
        array2++;
    }
    return diff;
}

void init_double(int size, double *array1, double value) {
    int i;
    for (i = 0; i < size; i++) {
        *array1 = value;
        array1++;
    }
}

void print_double(int x_size, int y_size, double *array) {
    int i, j;
    for (i = 0; i < y_size; i++) {
        for (j = 0; j < x_size; j++) {
            printf(" %9.5f", *array);
            array++;
        }
        printf("\n");
    }
}


#include <sys/time.h>
double getTime()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return(tv.tv_sec + (double)tv.tv_usec*1e-6);

}

double *check_calc(void (*func)(int max_step, int n_cell, double *iz_const, double *iz_v, double *iz_u),
                   int max_step, int n_cell, double *iz_const,
                   double *answer, int debug, char *title)
{
    double start, end;
    double *iz_v;
    double *iz_u;
    int array_size;

    array_size = max_step * n_cell;
    iz_v = (double *) malloc(array_size * sizeof(double));
    init_double(array_size, iz_v, -65.0);
    iz_u = (double *) malloc(array_size * sizeof(double));
    init_double(array_size, iz_u, -13.0);

    start = getTime();
    func(max_step, n_cell, iz_const, iz_v, iz_u);
    end = getTime();

    printf("# %s: Time=%.2f sec (%.1f MFLOPS)\n",
           title,
           end - start,
           1.0 * max_step * n_cell * IZ_FLOP_PER_STEP / (end - start + 0.00001) / 1000 / 1000);

    if (debug == 1)
    {
        print_double(n_cell, max_step, iz_v);
        if (answer != NULL) printf("diff = %f\n", diff_double(array_size, answer, iz_v));
    }

    free(iz_u);
    return(iz_v);
}

int main(int argc, char **argv)
{
    int max_step = 10000;
    int n_cell = 10000;
    int debug = 0;

    if (argc >= 3)
    {
        max_step = atoi(argv[1]);
        n_cell = atoi(argv[2]);
    }
    if (argc >= 4)
    {
        debug = 1;
    }
    double iz_const[10];
    double *answer_iz_v;

    iz_const[IZ_CONST_DT] = 0.1;
    iz_const[IZ_CONST_A] = 0.02;
    iz_const[IZ_CONST_B] = 0.2;
    iz_const[IZ_CONST_C] = -65.0;
    iz_const[IZ_CONST_D] = 8.0;
    iz_const[IZ_CONST_I] = 10.0;
    iz_const[IZ_CONST_V_1] = 0.04;
    iz_const[IZ_CONST_V_2] = 5.0;
    iz_const[IZ_CONST_V_3] = 140.0;
    iz_const[IZ_CONST_TH] = 30.0;

    printf("# %d Step, %d Cells\n", max_step, n_cell);

    answer_iz_v = check_calc(calc_iz_c, max_step, n_cell, iz_const, NULL, debug, "C   ");

#ifdef USE_ASM
#ifdef __aarch64__
    free(check_calc(calc_iz_asm1, max_step, n_cell, iz_const, answer_iz_v, debug, "ASM1"));
    free(check_calc(calc_iz_asm2, max_step, n_cell, iz_const, answer_iz_v, debug, "ASM2"));
    //free(check_calc(calc_iz_asm3, max_step, n_cell, iz_const, answer_iz_v, debug, "ASM3"));
#endif
#endif

}
