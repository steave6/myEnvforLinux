#include <stdio.h>

int main(int argc, char const *argv[]) {
  int i, j, k;

  for ( i = 0; i < 2; i++) {
    for ( j = 0; j < 2; j++) {
      for ( k = 0; k < 2; k++) {
        printf("%d ", i * j + k);
      }
    }
  }
  return 0;
}
