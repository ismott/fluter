int exec(int a, int b, int Function(int, int) fn) {
  return fn(a, b);
}

main() {
  final r = exec(5, 2, (c, d) => c + d);
  print(r);
}
