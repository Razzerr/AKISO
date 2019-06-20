#include<stdio.h>
#include<signal.h>
#include<unistd.h>

int counter=0;

void signalhandler(int signumber){
	printf("Caught %d-SIGUSR1 \n", counter);
	counter++;
}

int main(){
	int pid = getpid();
	printf("Process ID: %d\n", pid);

	while(1){
		signal(SIGUSR1, signalhandler);
	}	
	return 0;
}
