#include <string.h>
#include <stdint.h>
#include "SABER_indcpa.h"
#include "poly.h"
#include "pack_unpack.h"
#include "poly_mul.h"
#include "fips202.h"
#include "SABER_params.h"
#include "randombytes.h"



/*-----------------------------------------------------------------------------------
	This routine generates a=[Matrix K x K] of 256-coefficient polynomials 
-------------------------------------------------------------------------------------*/

#define h1 4 //2^(EQ-EP-1)

#define h2 ( (1<<(SABER_EP-2)) - (1<<(SABER_EP-SABER_ET-1)) + (1<<(SABER_EQ-SABER_EP-1)) )

void MatrixVectorMul(polyvec *a, uint16_t bw_ar[SABER_K][7][9][N_SB_16], uint16_t res[SABER_K][SABER_N], int16_t transpose);

void InnerProd(uint16_t pkcl[SABER_K][SABER_N],	uint16_t bw_ar[SABER_K][7][9][N_SB_16], uint16_t res[SABER_N]);

void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec);

void GenMatrix(polyvec *a, const unsigned char *seed);

void GenMatrix(polyvec *a, const unsigned char *seed)
{
  unsigned char buf[SABER_GENMATRIX_BYTE_BANK_LEN];

  uint16_t temp_ar[SABER_N];

  int i,j,k;

  shake128(buf,SABER_GENMATRIX_BYTE_BANK_LEN,seed,SABER_SEEDBYTES);

  for(i=0;i<SABER_K;i++)
  {
    for(j=0;j<SABER_K;j++)
    {
	BS2POL(buf+(i*SABER_K+j)*SABER_GENMATRIX_ONEVECTOR,temp_ar);
	for(k=0;k<SABER_N;k++){
		a[i].vec[j].coeffs[k] = (temp_ar[k])& (SABER_Q-1);
	}
    }
  }


}


void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk)
{
  polyvec a[SABER_K];

  uint16_t skpv[SABER_K][SABER_N];

  unsigned char seed[SABER_SEEDBYTES];
  unsigned char noiseseed[SABER_COINBYTES];
  int32_t i,j;
  uint16_t res[SABER_K][SABER_N];
  uint16_t bw_ar[SABER_K][7][9][N_SB_16];

  randombytes(seed, SABER_SEEDBYTES);
  shake128(seed, SABER_SEEDBYTES, seed, SABER_SEEDBYTES); 
  randombytes(noiseseed, SABER_COINBYTES);

  GenMatrix(a, seed);

  GenSecret(skpv,noiseseed);


	for(i=0;i<SABER_K;i++)
		CVF_256_422(bw_ar[i], (const uint16_t *)skpv[i]) ;
	for(i=0;i<SABER_K;i++){
		for(j=0;j<SABER_N;j++){
			res[i][j]=0;
		}
	}
	
	MatrixVectorMul(a,bw_ar,res,1);

	for(i=0;i<SABER_K;i++){ 
		for(j=0;j<SABER_N;j++){
			res[i][j]=res[i][j] + h1;
			res[i][j]=(res[i][j]>>(SABER_EQ-SABER_EP));
		}
	}

	POLVEC2BS(sk, skpv, SABER_Q);

	POLVEC2BS(pk, res, SABER_P); 

	for(i=0;i<SABER_SEEDBYTES;i++){ 
		pk[SABER_POLYVECCOMPRESSEDBYTES + i]=seed[i];
	}
}


void indcpa_kem_enc(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{ 
	uint32_t i,j,k;
	polyvec a[SABER_K];	
	unsigned char seed[SABER_SEEDBYTES];
	uint16_t pkcl[SABER_K][SABER_N]; 
	uint16_t skpv1[SABER_K][SABER_N];
	uint16_t message[SABER_KEYBYTES*8];
	uint16_t res[SABER_K][SABER_N];
	uint16_t vprime[SABER_N];
	unsigned char msk_c[SABER_SCALEBYTES_KEM];
	uint16_t bw_ar[SABER_K][7][9][N_SB_16];
		
	for(i=0;i<SABER_SEEDBYTES;i++){ 
		seed[i]=pk[ SABER_POLYVECCOMPRESSEDBYTES + i]; 
	}

	GenMatrix(a, seed);				

	GenSecret(skpv1,noiseseed);

	for(i=0;i<SABER_K;i++)
		CVF_256_422(bw_ar[i], (const uint16_t *)skpv1[i]);

	for(i=0;i<SABER_K;i++){
		for(j=0;j<SABER_N;j++){
			res[i][j]=0;
		}
	}
	
	MatrixVectorMul(a, bw_ar, res,0);	

	for(i=0;i<SABER_K;i++){ 
		for(j=0;j<SABER_N;j++){
			res[i][j]=res[i][j]+ h1;
			res[i][j]=(res[i][j]>> (SABER_EQ-SABER_EP));
		}
	}
	POLVEC2BS(ciphertext, res, SABER_P);

	BS2POLVEC(pk,pkcl,SABER_P);  

	for(i=0;i<SABER_N;i++)
		vprime[i]=0;

	for(i=0;i<SABER_K;i++){
		for(j=0;j<SABER_N;j++){
			skpv1[i][j]=skpv1[i][j] & ((SABER_P-1));
		}
	}

	InnerProd(pkcl,bw_ar,vprime);
	
	for(i=0;i<SABER_N;i++)
		vprime[i]=vprime[i]+h1;

	for(j=0; j<SABER_KEYBYTES; j++)
	{
		for(i=0; i<8; i++)
		{
			message[8*j+i] = ((message_received[j]>>i) & 0x01);
		}
	}

	for(i=0; i<SABER_N; i++)
	{
		message[i] = (message[i]<<(SABER_EP-1));		
	}
	
	for(k=0;k<SABER_N;k++)
	{
		vprime[k]=( (vprime[k] - message[k]) & ((SABER_P-1)) )>>(SABER_EP-SABER_ET);
	}

	#if Saber_type == 1
		SABER_pack_3bit(msk_c, vprime);
	#elif Saber_type == 2
		SABER_pack_4bit(msk_c, vprime);
	#elif Saber_type == 3
		SABER_pack_6bit(msk_c, vprime);
	#endif

	for(j=0;j<SABER_SCALEBYTES_KEM;j++){
		ciphertext[SABER_POLYVECCOMPRESSEDBYTES + j] = msk_c[j];
	}
}


void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char message_dec[])
{
	uint32_t i,j;
	uint16_t sksv[SABER_K][SABER_N]; 
	uint16_t pksv[SABER_K][SABER_N];
	uint8_t scale_ar[SABER_SCALEBYTES_KEM];
	uint16_t v[SABER_N];
	uint16_t op[SABER_N];
	uint16_t bw_ar[SABER_K][7][9][N_SB_16];
	
	BS2POLVEC(sk, sksv, SABER_Q); 
	BS2POLVEC(ciphertext, pksv, SABER_P); 

	for(i=0;i<SABER_N;i++)
		v[i]=0;

	for(i=0;i<SABER_K;i++){
		for(j=0;j<SABER_N;j++){
			sksv[i][j]=sksv[i][j] & ((SABER_P-1));
		}
	}

	for(i=0;i<SABER_K;i++)
			CVF_256_422(bw_ar[i], (const uint16_t *)sksv[i]);

	InnerProd(pksv, bw_ar,v);

	for(i=0;i<SABER_SCALEBYTES_KEM;i++){
		scale_ar[i]=ciphertext[SABER_POLYVECCOMPRESSEDBYTES+i];
	}

	#if Saber_type == 1
		SABER_un_pack3bit(scale_ar, op);
	#elif Saber_type == 2
		SABER_un_pack4bit(scale_ar, op);
	#elif Saber_type == 3
		SABER_un_pack6bit(scale_ar, op);
	#endif

	for(i=0;i<SABER_N;i++){
		v[i]= ( ( v[i] + h2 - (op[i]<<(SABER_EP-SABER_ET)) ) & (SABER_P-1) ) >> (SABER_EP-1);
	}
	
	POL2MSG(v, message_dec);
}

void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec){

	int32_t i,j;

	for(j=0; j<SABER_KEYBYTES; j++)
	{
		message_dec[j] = 0;
		for(i=0; i<8; i++)
		message_dec[j] = message_dec[j] | (message_dec_unpacked[j*8 + i] <<i);
	} 

}

	void MatrixVectorMul(polyvec *a, uint16_t bw_ar[SABER_K][7][9][N_SB_16], uint16_t res[SABER_K][SABER_N], int16_t transpose){

	int32_t i,j,k,l;
	uint16_t w_ar[7][NUM_POLY_MID][N_SB_16];
	
	if(transpose==1){
		for(i=0;i<SABER_K;i++){
			for(l=0;l<7;l++){
				for(j=0;j<NUM_POLY_MID;j++){
					for(k=0;k<N_SB_16;k++){
						w_ar[l][j][k]=0;
					}
				}
			}
			for(j=0;j<SABER_K;j++){
				CMF_256_422(w_ar, (const uint16_t *)&a[j].vec[i], bw_ar[j]);
					if(j==SABER_K-1)
						interpol_224(res[i],w_ar);							
				}
			}
		}
		else{
			for(i=0;i<SABER_K;i++){
				for(l=0;l<7;l++){
					for(j=0;j<NUM_POLY_MID;j++){
						for(k=0;k<N_SB_16;k++){
							w_ar[l][j][k]=0;
						}
					}
				}
				for(j=0;j<SABER_K;j++){
					CMF_256_422(w_ar,(const uint16_t *)&a[i].vec[j], bw_ar[j]);
					if(j==SABER_K-1)
						interpol_224(res[i],w_ar);		
				}
			}
		}
	}

	void InnerProd(uint16_t pkcl[SABER_K][SABER_N],	uint16_t bw_ar[SABER_K][7][9][N_SB_16], uint16_t res[SABER_N]){

	uint16_t i,j,k;
	uint16_t w_ar[7][NUM_POLY_MID][N_SB_16];
	
				for(i=0;i<7;i++){
					for(j=0;j<NUM_POLY_MID;j++){
						for(k=0;k<N_SB_16;k++){
							w_ar[i][j][k]=0;
						}
					}
				}
				for(j=0;j<SABER_K;j++){
					CMF_256_422(w_ar,(const uint16_t *)pkcl[j], bw_ar[j]);
					if(j==SABER_K-1)
						interpol_224(res, w_ar);	
				}
	}



