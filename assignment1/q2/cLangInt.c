#include<stdio.h>
#include<time.h>
#include<stdlib.h>

struct timespec totalStart, totalEnd, meatStart, meatEnd;

int main(int argc, char* argv[]){
	/*
	 * NOTE:
	 *
	 * 1. Pass the value of N(size) as command line argument 
	 * 2. Here, it is assumed that matrix A is stored in row major method and matrix B is stored in column major method.
	 * The result i.e. C will be in row major.
	 */
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &totalStart);
	double totalStartt, totalEndt, meatStartt, meatEndt;
	int i;
	int sum;
	i = atoi(argv[1]);
	// Memory Allocation	
	int* A = (int*) malloc((i*i)* sizeof(int));
	int* B = (int*) malloc((i*i)* sizeof(int));
	int* C = (int*) malloc((i*i)* sizeof(int));
	// Assignment of random values
	for(int j=0; j<i*i;j++){
		A[j] = rand()%10001;
		B[j] = rand()%10001;
	}
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &meatStart);
	//Multiplication Block
	for(int j=0; j<i;j++){
		for(int k=0;k<i;k++){
			sum = 0;
			for(int l=0;l<i;l++)
				sum += A[j*i+l]*B[k*i+l]; // A is in row major and B is in column major
			C[j*i+k] = sum;
		}
	}
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &meatEnd);
	//deallocation of memory
	free(A);
	free(B);
	free(C);
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &totalEnd);
	// Note that the execution of code after this line is not included in total time.
	// As this is that part of code which is just to convert timings to redable format.
	totalStartt = totalStart.tv_sec + ((double)totalStart.tv_nsec * 1.0e-9);
	totalEndt = totalEnd.tv_sec + ((double)totalEnd.tv_nsec * 1.0e-9);
	meatStartt = meatStart.tv_sec + ((double)meatStart.tv_nsec * 1.0e-9);
	meatEndt = meatEnd.tv_sec + ((double)meatEnd.tv_nsec * 1.0e-9);
	printf("Total Execution Time on CPU:	%.9lf\n",totalEndt-totalStartt);
	printf("Multiplication Time on CPU:	%.9lf\n", meatEndt-meatStartt);
	return 0;
}
