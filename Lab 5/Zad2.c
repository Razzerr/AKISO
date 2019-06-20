#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <pthread.h>

pthread_mutex_t lock;
int m1dim[2];
int m2dim[2];
int mFdim[2];
int **matrix1;
int **matrix2;
int **matrixFin;
int workingRow=0;

int macierz1_data[2];
int macierz2_data[2];


void *runner();

void main(int argc, char *argv[]){
	srand(time(0));

	if (argc != 6){
		printf("Usage: %s <1st matrix width> <1st matrix length> <2nd matrix width> <2nd matrix length> <number of threads>\n", argv[0]);
		exit(1);
	}

	if((atoi(argv[1])!=atoi(argv[4])) || atoi(argv[5])==0){
		printf("Incorrect data provided!\n");
		exit(1);
	}

	m1dim[0] = atoi(argv[2]);
	m1dim[1] = atoi(argv[1]);
	m2dim[0] = atoi(argv[4]);
	m2dim[1] = atoi(argv[3]);
	mFdim[0] = atoi(argv[2]);
	mFdim[1] = atoi(argv[3]);
	int threadsNo = atoi(argv[5]);

	matrix1 = malloc(sizeof(int *) * m1dim[0]);
	matrix2 = malloc(sizeof(int *) * m2dim[0]);
	matrixFin = malloc(sizeof(int *) * mFdim[0]);

	for (int i = 0; i<m1dim[0]; i++){
		printf("|");
		matrix1[i] = malloc(sizeof(int) * m1dim[1]);
		for (int j = 0; j<m1dim[1]; j++){
			matrix1[i][j] = rand()%2;
			printf("%d ", matrix1[i][j]);
		}
		printf("|\n");
	}
	printf("x\n");
	
	for (int i = 0; i<m2dim[0]; i++){
		printf("|");
		matrix2[i] = malloc(sizeof(int) * m2dim[1]);
		for (int j = 0; j<m2dim[1]; j++){
			matrix2[i][j] = rand()%2;
			printf("%d ", matrix2[i][j]);
		}
		printf("|\n");
	}
	printf("=\n");	
	
	if (pthread_mutex_init(&lock, NULL) != 0){
		printf("\n mutex init failed\n");
		exit(1);
	}

	pthread_t tid[threadsNo];

	int err;
	for (int i = 0; i < threadsNo; i++){
		err = pthread_create(&(tid[i]), NULL, runner, NULL);
		if (err != 0){
			printf("\nCan't create thread %d", i);
		}
	}

	for (int i = 0; i < threadsNo; i++){
		pthread_join(tid[i], NULL);
	}

	pthread_mutex_destroy(&lock);

	for (int i = 0; i<mFdim[0]; i++){
		printf("|");
		for (int j = 0; j<mFdim[1]; j++){
			printf("%d ", matrixFin[i][j]);
		}
		printf("|\n");
	}
}

void *runner(){
	while (1){
		pthread_mutex_lock(&lock);
		int wr = workingRow;
		workingRow++;
		pthread_mutex_unlock(&lock);
		
		if (wr >= mFdim[0]){ break;}
		matrixFin[wr] = malloc(sizeof(int) * mFdim[1]);
		
    		for (int n = 0; n < mFdim[1]; n++){
			matrixFin[wr][n] = 0;
			for (int j = 0; j < m1dim[1]; j++){
	    			if(matrix1[wr][j]*matrix2[j][n] == 1){
				matrixFin[wr][n] = 1;
				break;
				}
			}
		}
	}
}
