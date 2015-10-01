#include <stdlib.h>
#include <stdio.h>

#define STUDENT_ID		0xB0329001

#define DIGIT_LEN		4
#define NUM_BUTTONS		4

main ()
{
	int i;
	int key;

	printf ("The password for you: ");

	srandom (STUDENT_ID);
	for (i=0; i<NUM_BUTTONS; i++) {
		key = random() % NUM_BUTTONS;
		printf ("%d ", key);
	}//end for i

	printf ("\n");
	return 0;
}




