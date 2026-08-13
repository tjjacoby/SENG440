#include <stdio.h>

int addition_seng440( int arg_1, int arg_2) {
  int sum;
  
  sum = arg_1 + arg_2;
  
  return( sum);
} /* END of addition_seng440() */

int main( void) {
  int arg_1, arg_2, sum;
  
  printf( "arg_1 = ");
  scanf( "%i", &arg_1);
  printf( "arg_2 = ");
  scanf( "%i", &arg_2);

  sum = addition_seng440( arg_1, arg_2);
  printf( "sum = %i\n", sum);

  return( sum);
} /* END of main() */