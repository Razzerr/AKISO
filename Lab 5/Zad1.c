#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

char buffer[128]; //przechowuje tymczasowe zmienne dla funkcji scanf
char character[1];

//Czyszczenie bufora
void clearBuffer(){
    for(int i = 0; i < 128; i++)
        buffer[i]='\0';
}

//Oblicznie wielkości tablicy
int arraySize(char *array) {
    int index = 0;
    while (array[index]) {
        index++;
    }
    return index;
}

//Konwersja liczby z systemu decymalnego do dowolnego innego systemu
void decToDifferentBase(int decimal, int base) {
    if(decimal == 0) {
        int temp = 48;
        write(1, &temp, 1);
    } else {
        int index = 0;
        int converted[128];
        while (decimal) {
            converted[index] = (decimal % base) + 48;
            index++;
            decimal = decimal / base;
        }
        converted[index] = 0;
        int temp;
        for (; index >= 0; index--) {
            temp = converted[index];
            if (temp >= 58) {	
                temp += 7;
            }
            write(1, &temp, sizeof(temp));
        }
    }
}

//Zamiana stringa na int
int strToInt(char* s) {
    int result = 0;
    int sign = 0; //0 - liczba dodatnia ; 1 - liczba ujemna
    int index = 0;

    if(s[0]=='-')
    {
          index++;
          sign = 1;
    }
    while(s[index]!='\0')
    {
      result = 10*result+s[index]-48;
      index++;
    }
    return sign ? -result : result;
}

//Zmiana hex jako string na int
int hexStrToInt(const char *s) {
 int result = 0;
 int c;
  while (*s) {
   result = result << 4;
   if (c=(*s-'0'),(c>=0 && c <=9)) result|=c;
   else if (c=(*s-'a'),(c>=0 && c <=5)) result|=(c+10);
   else if (c=(*s-'A'),(c>=0 && c <=5)) result|=(c+10);
   else break;
   s++;
  }
  return result;
}

//Zamiana bin na dec
int binIntToDecInt(int bin) {
  int result = 0;
  int i = 0;
  int temp = 0;
  while (bin!=0)
  {
      temp = bin%10;
      bin /= 10;
      result += temp*(pow(2, i));
      ++i;
  }
  return result;
}

//MyScanf
void myscanf(char *format, ...) {
    char *p = (char*)&format + sizeof(char *);
    if ('%' == *format)
    {
	int I=0;
        format++;
        switch (*format)
        {
            case 's':
		clearBuffer();
                I=0;
                char *string = *(char**)p;
                while(read(0, character, sizeof(character))>0){
                    if(character[0]=='\n'){
			string[I] = '\0';
                        break;
                    }
                    string[I]=character[0];
                    I++;
                }
            break;
            case 'x':
                clearBuffer();
                I=0;
                while(read(0, character, sizeof(character))>0){
                    if(character[0]=='\n'){
                        break;
                    }
                    buffer[I]=character[0];
                    I++;
                }
                int **h=(int**)p;
                *h[0]=hexStrToInt(buffer);
            break;
            case 'd':
                clearBuffer();
		I=0;
                while(read(0, character, 1)>0){
                    if(character[0]=='\n'){
                        break;
                    }
                    buffer[I]=character[0];
                    I++;
                }
                int **x=(int**)p;
                *x[0]=strToInt(buffer);
            break;
            case 'b':
                clearBuffer();
                I=0;
                while(read(0, character, sizeof(character))>0){
                    if(character[0]=='\n'){
                        break;
                    }
                    buffer[I]=character[0];
                    I++;
                }
                int **b=(int**)p;
                *b[0]=binIntToDecInt(strToInt(buffer));
            break;
        }
    }
}

//MyPrintf
int myprintf(char *format, ...) {
  char *p = (char*)&format + sizeof(char *);
    while (*format) {
        if (*format == '%') {
            format++;
            switch (*format) {
                case 's':
                    write(1, *((char**)p), arraySize(*((char**)p)));
                    p += sizeof(char*);
                    break;
                case 'd':
                    decToDifferentBase(*((int*)p), 10);
                    p += sizeof(int);
                    break;
                case 'b':
                    decToDifferentBase(*((int*)p), 2);
                    p += sizeof(int);
                    break;
                case 'x':
                    decToDifferentBase(*((int*)p), 16);
                    p += sizeof(int);
                    break;
                default:
                    break;
            }
        } else {
            write(1, format, 1);
        }
        format++;
    }
    p = 0;
    return 1;
}

int main(int argc, char *argv[]) {

	int test=0;
 	char testchar[128];

	myprintf("Provide a decimal number:\n");
	myscanf("%d", &test);
	myprintf("You provided number: \n%d (in base 10)\n%b (in base 2)\n%x (in base 16)\n", test, test, test);

	myprintf("Provide a binary number:\n");
	myscanf("%b", &test);
	myprintf("You provided number: \n%d (in base 10)\n%b (in base 2)\n%x (in base 16)\n", test, test, test);

	myprintf("Provide a hexadecimal number:\n");
	myscanf("%x", &test);
	myprintf("You provided number: \n%d (in base 10)\n%b (in base 2)\n%x (in base 16)\n", test, test, test);

  	myprintf("Provide any string\n");
  	myscanf("%s", testchar);
  	myprintf("String you provided: %s\n", testchar);


	return 0;
}
