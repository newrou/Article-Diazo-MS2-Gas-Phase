#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(int argc, char *argv[]) {
    long i;
    double Collision[7] = { 0.00, 0.01, 0.10, 1.00, 10.00, 20.00, 40.00 };
    double mk[5] = { 1.2552, 1.1840, 1.2130, 1.7501, 469.4836 };
    double Ev,T,L,K;

    for(i=0;i<5;i++) {
	L=log(mk[i]);
	K=(20000 + 96485.342*Collision[i])/160000;
	printf("%ld %5.2f %12.4f %f %f\n",i,Collision[i],mk[i],L,K);
    }
}