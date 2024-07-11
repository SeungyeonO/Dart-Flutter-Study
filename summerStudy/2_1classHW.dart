var add = (int a, int b) => a + b;

int someFn(int Function(int, int) givenFn, int a, int b) {
  return givenFn(a, b);
}

void main() {
  print(someFn(add, 1, 2));
}
