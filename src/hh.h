//
// Created by nebula on 6/10/17.
//

#ifndef ASM_NEURONS_HH_H
#define ASM_NEURONS_HH_H

#define HH_CONST_DT 0
#define HH_CONST_CM_INV 1
#define HH_CONST_GK 2
#define HH_CONST_E_K 3
#define HH_CONST_GNA 4
#define HH_CONST_E_NA 5
#define HH_CONST_GM 6
#define HH_CONST_REST 7
#define HH_CONST_I_INJ 8

#define HH_FLOP_PER_STEP 200
#define HH_FAILED_THRESHOLD 1.0


void calc_hh_c(int max_step, int n_cell, const double *const_table, double *data_array);

#endif //ASM_NEURONS_HH_H
