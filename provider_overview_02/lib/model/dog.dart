// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dog {
  final String name;
  int age;
  final String breed;

  Dog({
    required this.name,
    this.age = 1,
    required this.breed,
  });

  void grow() {
    age++;
    print('age: $age');
  }
}
