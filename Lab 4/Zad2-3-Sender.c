#include<unistd.h>
#include<signal.h>
#include<stdio.h>

int main(){
	printf("PID: ");
	int x;
	scanf("%d", &x);
	for(int i=0; i<10000; i++){
        	kill(x, SIGUSR1);
	}
	printf("Done\n");
	return 0;
}
