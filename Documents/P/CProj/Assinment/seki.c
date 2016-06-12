#include <stdio.h>

int main() 
{
  int i,b;
  int a[5] = {5,4,10,3,2};

  b = 1;
  for(i = 0; i < 5; i++) {
    printf("%d\n", a[i]);
    b = b * a[i];
  }
  printf("%d ", b);

  return 0;
}
