//
// Created by nebula on 6/10/17.
//

#ifndef ASM_NEURONS_HH_H
#define ASM_NEURONS_HH_H

#define HH_FLOP_PER_STEP 200
#define HH_FAILED_THRESHOLD 1.0

void calc_hh_c(int max_step, int n_cell, const double *const_table, double *data_array);

#endif //ASM_NEURONS_HH_H
