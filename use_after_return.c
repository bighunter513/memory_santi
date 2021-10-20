#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int *ptr;

void get_pointer()
{
  int local[10];
  ptr = &local[0];
  return;
}

int main()
{
  get_pointer();

  printf("%d\n", *ptr);

  return 0;
}
