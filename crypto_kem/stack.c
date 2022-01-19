#include "api.h"
#include "randombytes.h"
#include "hal.h"
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "poly.h"
#define MAX_SIZE 0x16000
#include "sendfn.h"

#define printcycles(S, U) send_unsignedll((S), (U))

uint16_t x[SABER_N];
uint16_t y[SABER_N];
uint16_t z[SABER_N];
uint16_t check[SABER_N * 2 - 1];

unsigned int canary_size = MAX_SIZE;
volatile unsigned char *p;
unsigned long long c;
uint8_t canary = 0x42;

unsigned char key_a[CRYPTO_BYTES], key_b[CRYPTO_BYTES];
unsigned char pk[CRYPTO_PUBLICKEYBYTES];
unsigned char sendb[CRYPTO_CIPHERTEXTBYTES];
unsigned char sk_a[CRYPTO_SECRETKEYBYTES];
unsigned char sk[CRYPTO_SECRETKEYBYTES];
unsigned char ct[CRYPTO_CIPHERTEXTBYTES];
unsigned long long stack_key_gen, stack_encaps, stack_decaps, stack_key_gen_cpa, stack_enc_cpa, stack_dec_cpa, stack_tmvp_polymul;

#define FILL_STACK()                                                           \
  p = &a;                                                                      \
  while (p > &a - canary_size)                                                 \
    *(p--) = canary;
#define CHECK_STACK()                                                          \
  c = canary_size;                                                             \
  p = &a - canary_size + 1;                                                    \
  while (*p == canary && p < &a) {                                             \
    p++;                                                                       \
    c--;                                                                       \
  }                                                                            

static int test_keys(void) {
  volatile unsigned char a;
  // Key-pair generation
  FILL_STACK()
  crypto_kem_keypair(pk, sk_a);
  CHECK_STACK()
  if(c >= canary_size) return -1; 
  stack_key_gen = c;
  
  // Encapsulation
  FILL_STACK()
  crypto_kem_enc(sendb, key_b, pk);
  CHECK_STACK()
  if(c >= canary_size) return -1; 
  stack_encaps = c;

  // Decapsulation
  FILL_STACK()
  crypto_kem_dec(key_a, sendb, sk_a);
  CHECK_STACK()
  if(c >= canary_size) return -1; 
  stack_decaps = c;
   
  
  #ifdef TMVP
  FILL_STACK()
  pol_mul(z, x, y);
  CHECK_STACK()
  if(c >= canary_size) return -1; 
  stack_tmvp_polymul = c;
  #endif
   //#endif
  if (memcmp(key_a, key_b, CRYPTO_BYTES)){
    return -1;
  } else {    
    printcycles("cca key gen stack usage:", stack_key_gen);
    printcycles("encapsulation stack usage:", stack_encaps);
    printcycles("decapsulation stack usage:", stack_decaps);
	#ifdef TMVP
	printcycles("tmvp polymul stack usage:", stack_tmvp_polymul);
  #endif
    send_USART_str("OK KEYS\n");
    return 0;
  }
}

int main(void) {
  clock_setup(CLOCK_FAST);
  gpio_setup();
  usart_setup(115200);
  rng_enable();

  // marker for automated benchmarks
  send_USART_str("==========================");
  canary_size = MAX_SIZE;
  while(test_keys()){
    canary_size -= 0x1000;
    if(canary_size == 0) {
      send_USART_str("failed to measure stack usage.\n");
      break;
    }
  }
  // marker for automated benchmarks
  send_USART_str("#");

  while (1);

  return 0;
}
