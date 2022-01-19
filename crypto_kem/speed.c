#include "api.h"
#include "hal.h"
#include "randombytes.h"
#include "sendfn.h"

#include <stdint.h>
#include <string.h>

#include "poly.h"

#define printcycles(S, U) send_unsignedll((S), (U))

int main(void)
{
  unsigned char key_a[CRYPTO_BYTES], key_b[CRYPTO_BYTES];
  unsigned char sk[CRYPTO_SECRETKEYBYTES];
  unsigned char pk[CRYPTO_PUBLICKEYBYTES];
  unsigned char ct[CRYPTO_CIPHERTEXTBYTES];
  //unsigned char cpa_r[32];

  unsigned long long t0, t1;
  int i;

  hal_setup(CLOCK_BENCHMARK);

  for(i=0;i<100;i++)
    hal_send_str("==========================");



  for(i=0;i<CRYPTO_ITERATIONS;i++) {
    memset(key_a, 0, sizeof key_a);
    memset(key_b, 0, sizeof key_a);
    memset(sk, 0, sizeof sk);
    memset(pk, 0, sizeof pk);
    memset(ct, 0, sizeof ct);

    // Key-pair generation
    t0 = hal_get_time();
    crypto_kem_keypair(pk, sk);
    t1 = hal_get_time();
    printcycles("cca keypair cycles:", t1-t0);

    // Encapsulation
    t0 = hal_get_time();
    crypto_kem_enc(ct, key_a, pk);
    t1 = hal_get_time();
    printcycles("encaps cycles:", t1-t0);
	
    // Decapsulation
    t0 = hal_get_time();
    crypto_kem_dec(key_b, ct, sk);
    t1 = hal_get_time();
    printcycles("decaps cycles:", t1-t0);
	
    if(memcmp(key_a, key_b, CRYPTO_BYTES)) {
      hal_send_str("ERROR KEYS\n");
    }
    else {
      hal_send_str("OK KEYS\n");
    }
	
	polyvec aa;
    uint16_t skpv[SABER_K][SABER_N];
    uint16_t res[SABER_K][SABER_N];

    t0 = hal_get_time();
    MatrixVectorMul(&aa, skpv, res, SABER_Q-1, 0);
    t1 = hal_get_time();
    printcycles("matrix vector mul cycles:", t1-t0);

    #ifdef TMVP  
	poly r, a, b;
	randombytes((unsigned char *)&a, sizeof(poly));
    randombytes((unsigned char *)&b, sizeof(poly));
    t0 = hal_get_time();
    pol_mul(&r, &a, &b);
    t1 = hal_get_time();
    printcycles("tmvp polymul cycles:", t1-t0);
    #endif

    hal_send_str("#");
  }
  while(1);
  return 0;
}
