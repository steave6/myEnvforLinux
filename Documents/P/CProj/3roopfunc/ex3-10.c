#include <stdio.h>

int main(int argc, char const *argv[]) {
  int i;

  i = 0;
  while (1) {
    printf("%d", i);
    if (i == 5) {
      i = 0;
      break;
    }
    i++;
  }
  
  return 0;
}
