class Babies {
  final int age;

  Babies({required this.age});

  Future<int> getBabies() async {
    await Future.delayed(const Duration(seconds: 3));

    if (age > 1 && age < 5) {
      return 4;
    } else if (age <= 1) {
      return 1;
    } else {
      return 2;
    }
  }

  Stream<String> bark() async* {
    for (int i = 0; i < age; i++) {
      await Future.delayed(const Duration(seconds: 2));
      yield 'bark $i times';
    }
  }
}
