#include <stdio.h>

int main(int argc, char const *argv[]) {
  int i, j;

  i = 1;
  while (i < 10) {
    j = 1;
    while (j < 10) {
      printf("%02d", i * j);
      j++;
    }
    printf("\n");
    i++;
  }
  
  return 0;
}
