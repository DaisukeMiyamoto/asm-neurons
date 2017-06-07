#ifndef ASM_NEURONS_IZ_H
#define ASM_NEURONS_IZ_H

#define IZ_CONST_DT 0
#define IZ_CONST_A 1
#define IZ_CONST_B 2
#define IZ_CONST_C 3
#define IZ_CONST_D 4
#define IZ_CONST_I 5
#define IZ_CONST_V_1 6
#define IZ_CONST_V_2 7
#define IZ_CONST_V_3 8
#define IZ_CONST_TH 9

#define IZ_FLOP_PER_STEP 14

void calc_iz_c(int max_step, int n_cell, double *iz_const, double *iz_v, double *iz_u);
void calc_iz_asm1(int max_step, int n_cell, double *iz_const, double *iz_v, double *iz_u);
void calc_iz_asm2(int max_step, int n_cell, double *iz_const, double *iz_v, double *iz_u);
void calc_iz_asm3(int max_step, int n_cell, double *iz_const, double *iz_v, double *iz_u);


#endif //ASM_NEURONS_IZ_H
