#include <stdio.h>

float function1(float); //ln(x)
float function2(float); //e^x
float function3(float); //sinh(x)
float function4(float); //sinh^-1(x)
float test_function(float);

int main()
{

	printf("%f\n", function1(3.14));
	printf("%f\n", function2(3.14));
	printf("%f\n", function3(3.14));
	printf("%f\n", function4(3.14));
	printf("%f\n", test_function(3.14));

	return 0;

}
