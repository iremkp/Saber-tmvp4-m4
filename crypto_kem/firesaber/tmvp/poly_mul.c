#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "poly_mul.h"

extern void asm_polymul_256(uint16_t *r, const uint16_t *a, const uint16_t *b);

void pol_mul(uint16_t* a, uint16_t* b, uint16_t* res, uint32_t start)
{
    (void)start;  // silence 'unused var' warning to stay close to the ref code
    asm_polymul_256(res, a, b);
}
