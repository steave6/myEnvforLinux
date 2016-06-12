#include <stdio.h>

void foo(int n) {
  if (n < 50) {
    foo(n + 10);
    printf("%d ", n);
  }
}

int main () 
{
  foo(1);
  return 0;
}
