#include <stdio.h>

int main(int argc, char const *argv[]) {
  /* code */
  int i;
  for (i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      printf("Even:%d\n", i);
    }else
    {
      printf("Odd:%d\n", i);
    }

  }
  return 0;
}
