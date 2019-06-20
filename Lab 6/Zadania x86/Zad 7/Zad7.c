#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void main(void)
{
    char input[128];
    for(int x = 0; x<128; x++){
	input[x]='\0';
    }   
    fgets(input, 128, stdin);
    for(int x = 0; x<128; x++){
	printf("%c",input[x]);
    }   

    int i = 0;
    int opStart = 0;
    float tempfloat = 0;
    int decimalflag = 0;
    while(input[i]!=10){
	printf("Iteracja: %i, %f\n", i, (float)(input[i]-48));
	if(input[i] == ' ' && opStart==0){
	    asm("FLD %[t];"::[t] "m"(tempfloat));
	    tempfloat = 0;
	    decimalflag = 0;
	} else if (input[i] == '.') {
	    decimalflag = 1;
	} else if (input[i]>47 && input[i]<58){
	    if (decimalflag == 0){
		tempfloat = tempfloat*10 + (float)(input[i]-48);
	    } else {
		tempfloat = tempfloat + (float)(input[i]-48)/(pow(10,decimalflag));
		decimalflag++;
	    }
	} else {
	    opStart = 1;
	    switch(input[i]){
		case '*':
			asm("FMULP");
			break;
		case '+':
			asm("FADDP;");
			break;
		case '/':
			asm("FDIVP;");
			break;
		case '-':
			asm("FSUBP;");
			break;
	    }
	}	
	i++;
    }
    asm("fst %[t];":[t] "=m"(tempfloat));;
    printf("Your result is: %f", tempfloat);
    return;
}
