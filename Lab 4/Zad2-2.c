#include<unistd.h>
#include<signal.h>
#include<stdio.h>

int main(){
        setuid(0); //sets user ID to 0 (root)
        int i = kill(9, 1);
	printf("%d",i);
	return 0;
}

//sudo chown root:root Zad2-2.exec (root user is the owner)
//sudo chmod 4755 Zad2-2.exec (root has full access, group and others can read and execute)
