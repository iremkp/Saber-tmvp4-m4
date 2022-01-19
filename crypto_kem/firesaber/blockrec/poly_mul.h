#include "SABER_params.h"
#define N_SB (SABER_N >> 2)
#define N_SB_RES (2*N_SB-1)
#define N_SB_16 (N_SB >> 2)
#define N_SB_16_RES (2*N_SB_16-1)
#define NUM_POLY_MID 9


void pol_mul(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n);
	
void CVF_256_422(uint16_t bw_ar[7][9][N_SB_16], const uint16_t *b);

void CMF_256_422(uint16_t w_ar[7][NUM_POLY_MID][N_SB_16], const uint16_t* a1, uint16_t bw_ar[7][9][N_SB_16]);

void interpol_224(uint16_t *result, uint16_t w_ar[7][NUM_POLY_MID][N_SB_16]);


