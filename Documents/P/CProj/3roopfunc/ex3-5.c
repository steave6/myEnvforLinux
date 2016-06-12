#include <stdio.h>

int main(int argc, char const *argv[]) {
  int i;

  i = 0;
  while (i < 10)
    printf("%d", i++);

  printf("\n");
  return 0;
}
