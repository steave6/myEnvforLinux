#include <stdio.h>

void print_numbers(void);

int main(int argc, char const *argv[]) {
  print_numbers ();
  print_numbers ();
  print_numbers ();
  return 0;
}

void print_numbers(void) {
  int i;

  for (i = 0; i < 10; i++) {
    printf("%d ", i);
  }
  printf("\n");
}
