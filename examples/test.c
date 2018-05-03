void *malloc(int n);
int printf(char *s, ... );
int a, *b, **c;

int main(void){
	printf("starting\n");
	a = 5;
	b = malloc (sizeof a);
	c = malloc (sizeof a);
	if (a < 10)
		if (a <= 10)
		   if (a > 1)	   
			   if (a >= 1)
				   if (a != 1)
					   if (a == 5)
						   while (a != -1){
							   printf("in while\n");
							   *b = a;
							   printf ("b = %d\n", *b);
							   a = a -1;
						   }
	*c = b;
	**c = a;
	printf("**c = %d\n", **c);
}
