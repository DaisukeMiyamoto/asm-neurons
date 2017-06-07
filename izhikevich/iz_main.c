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

int main() {
    const int max_step = 10;
    const int n_cell = 2;
    double iz_const[10];
    double *iz_v;
    double *iz_u;
    int array_size = max_step * n_cell;

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

    iz_v = (double *) malloc(array_size * sizeof(double));
    init_double(array_size, iz_v, -65.0);
    iz_u = (double *) malloc(array_size * sizeof(double));
    init_double(array_size, iz_u, -13.0);

    calc_iz_c(max_step, n_cell, iz_const, iz_v, iz_u);

    print_double(n_cell, max_step, iz_v);
    // print_double(n_cell, max_step, iz_u);

}
