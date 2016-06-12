#include <stdio.h>

int main(int argc, char const *argv[]) {
  int i;

  i = 0;
  do {
    printf("%d", i++);
  } while(i < 10);

  printf("\n");
  return 0;
}
