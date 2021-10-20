#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
  char *heap_buf = (char*)malloc(32 * sizeof(char));
  memcpy(heap_buf + 30, "overflow", 8);
  free(heap_buf);

  return 0;
}
