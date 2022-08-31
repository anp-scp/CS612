#include<stdio.h>

int main(){
	//C program to display first five numbers of fibonacci series
	int i;
	int arr[5];
	arr[0] = 0;
	arr[1] = 1;
	for(i=2; i<5;i++){
		arr[i] = arr[i-2] + arr[i-1];
	}
	for(i=0; i<5;i++){
		printf("%d ", arr[i]);
	}
	printf("\n");
	return 0;
}
