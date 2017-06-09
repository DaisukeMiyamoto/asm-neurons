//
// Created by nebula on 6/10/17.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

#include "benchmark_utils.h"


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


double getTime()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return(tv.tv_sec + (double)tv.tv_usec*1e-6);

}
