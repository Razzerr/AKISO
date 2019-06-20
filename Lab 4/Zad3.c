#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

bool background = false;

int lsh_cd (char **args){
    if (args[1]==NULL){
        fprintf(stderr, "lsh: didn't provide directory\n");
    } else {
        if (chdir(args[1])!=0){
            perror("lsh");
        }
    }
    return 1;
}

int lsh_exit (char **args){
    return 0;
}

char *builtInStr[] = {
    "cd",
    "exit"
};

int (*builtInFunc[])(char **) = {
    &lsh_cd,
    &lsh_exit
};

int lshNumFunc(){
    return sizeof(builtInStr)/sizeof(char *);
}

int lshLaunch(char **args){
    int numberOfArgs = 0;
    pid_t pid;
    int status;

    for (int i = 0; args[i]!=NULL; i++){
        numberOfArgs++;
    }

    if (strcmp(args[numberOfArgs-1], "&") == 0){
        background = true;
        args[numberOfArgs-1] = NULL;
    } else {
    background = false;
    }

    pid = fork();
    if (pid==0){
        if (background) {
            fclose(stdout);
            fclose(stderr);
        }
        if (execvp(args[0], args) == -1){
            perror("lsh");
        }
        exit(EXIT_FAILURE);
    } else if (pid < 0){
        perror("lsh");
    } else {
        if (!background){
            do{
                waitpid(pid, &status, WUNTRACED);
            } while (!WIFEXITED(status) && !WIFSIGNALED(status));
        }
    }
    return 1;
}

int lshExecute(char **args){
    int i;

    if (args[0] == NULL){
        return 1;
    }

    for (i = 0; i<lshNumFunc(); i++){
        if (strcmp(args[0], builtInStr[i]) == 0){
            return (*builtInFunc[i])(args);
        }
    }
    return lshLaunch(args);
}

char *lshReadLine(void){
    int ctrlD = 0;
    char *line = NULL;
	size_t bufsize = 0;
	ctrlD = getline(&line, &bufsize, stdin);
	if (ctrlD == -1) {
	exit(EXIT_SUCCESS);
	}
	return line;
}

#define LSH_BUFSIZE 64
#define LSH_DELIM " \t\r\n\a"
char **lshGetArgs(char *line){
	int bufsize = LSH_BUFSIZE, position = 0;
	char **tokens = malloc(bufsize * sizeof(char*));
	char *token;

	if(!tokens){
        fprintf(stderr, "lsh: allocation error\n");
        exit(EXIT_FAILURE);
	}

	token = strtok(line, LSH_DELIM);
	while(token != NULL){
        tokens[position] = token;
        position++;

        if(position>=bufsize){
            bufsize+=LSH_BUFSIZE;
            tokens = realloc(tokens, bufsize * sizeof(char*));

            if(!tokens){
                fprintf(stderr, "lsh: allocation error\n");
                exit(EXIT_FAILURE);
            }
        }
    	token = strtok(NULL, LSH_DELIM);
	}
	tokens[position] = NULL;
	return tokens;
}

void lsh(){
	int state;
	char *line;
	char **args;
	char cwd[1024];

	do{
        printf( "%s > ", getcwd(cwd, sizeof(cwd)));
        line = lshReadLine();
        args = lshGetArgs(line);
        state = lshExecute(args);

        free(line);
        free(args);
	}while(state);
}

int main(int argc, char **argv){
    lsh();
    return EXIT_SUCCESS;
}
