#include <unistd.h>

int main(){
	char *arguments[2] = {"bash", NULL};
	setuid(0);
	execvp("/bin/bash", arguments);
	return 0;
}

//sudo chown root:root Zad1.exec (root user is the owner)
//sudo chmod 4755 Zad1.exec (root has full access, group and others can read and execute)
