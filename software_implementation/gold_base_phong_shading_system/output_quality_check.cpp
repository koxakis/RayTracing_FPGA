 
#include <iostream>
#include <cmath>
#include <fstream>
#include <sstream>
#include <stdio.h>


#define WIDTH 1920
#define HEIGHT 1080

// Culculate and return PSNR
double checkPSNR (unsigned char *tocheck, unsigned char *golden)
{
	double PSNR = 0;
	double t;

	// calculate psnr                                                           
	for(uint32_t i=3; i<HEIGHT; i++) 
		{                                                   
			for(uint32_t j=0; j<WIDTH; j++) 
				{                                               
					t = pow((tocheck[i*WIDTH+j] - golden[i*WIDTH+j]), 2);                  
					PSNR += t;                                                          
				}                                                                       
		}                                                                           
																																								
	PSNR /= (double)(WIDTH*HEIGHT);                                                
	PSNR = 10*log10(65536/PSNR); 

	return PSNR;
}

int main(int argc, char const *argv[])
{
	unsigned char golden[WIDTH * HEIGHT];	
	unsigned char tocheck[WIDTH * HEIGHT];
	FILE *fin = NULL;
	FILE *fgld = NULL;

	if ( argc != 3)
		{
			std::cout << "ERROR: Input arguments should be ./check_out GOLD_FILE SAMPLE_FILE \n";
			return -1;
		}

	// Open Gold file pointer
	fgld = fopen(argv[1], "r");
	if (fgld == NULL) 
		{
			perror("fopen");
			exit(EXIT_FAILURE);
		}

	// Open input to check file pointer
	fin = fopen(argv[2], "r");
	if (fin == NULL) 
		{
			perror("fopen");
			exit(EXIT_FAILURE);
		}

	// Read input and golden output
	uint32_t checkreturn;
	checkreturn = fread((void *)tocheck, sizeof(unsigned char), (size_t)(HEIGHT*WIDTH), fin);
	if ( checkreturn == 0 )
		{
			perror("fread in\n");
			exit(EXIT_FAILURE);
		}
	checkreturn = fread((void *)golden, sizeof(unsigned char), (size_t)(HEIGHT*WIDTH), fgld);
	if ( checkreturn == 0 )
		{
			perror("fread gold\n");
			exit(EXIT_FAILURE);
		}	
		
	// Input and golden files no longer needed
	fclose(fin);
	fclose(fgld);

	// Check PSNR
	double PSNR;
	PSNR = checkPSNR(tocheck, golden);

	printf("PSNR: %lf\n", PSNR);                                          
	return 0;
}


