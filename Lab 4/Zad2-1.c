#include<stdio.h>
#include<signal.h>
#include<unistd.h>

void signalhandler(int);

int main(){
int i = getpid();

while(1){
printf("Process id is %d, still working\n", i);
sleep(1);
signal(SIGHUP, signalhandler);
signal(SIGINT, signalhandler);
signal(SIGQUIT, signalhandler);
signal(SIGILL, signalhandler);
signal(SIGTRAP, signalhandler);
signal(SIGABRT, signalhandler);
signal(SIGKILL, signalhandler);
signal(SIGUSR1, signalhandler);
signal(SIGBUS, signalhandler);
signal(SIGFPE, signalhandler);
signal(SIGSEGV, signalhandler);
}

return 0;
}

void signalhandler(int signumber){
printf("Caught signal %d, doing nothing...\n", signumber);
}
