void main() {
  String? name = null;
  print(name?.length);

  String name2 = name ?? 'Dart';
  print(name2);

  if (name2 == 'Dart')
    print('name2 is Dart');
  else
    print('name2 is not Dart');

  for (int i = 0; i < 5; i++) {
    print(i);
  }

  for (int i in [1, 2, 3, 4, 5]) {
    print(i);
  }
}