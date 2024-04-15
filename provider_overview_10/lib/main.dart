import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_10/model/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (BuildContext context) {
        return Dog(breed: 'breed5', name: 'latte5', age: 3);
      },
      child: MaterialApp(
        title: 'Template',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Template'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Selector<Dog, String>(
        // 마치 context.select<Dog, String>과 비슷하게 보임
        selector: (BuildContext context, Dog dog) => dog.name,
        builder: (BuildContext context, String dogName, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                child!,
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '- name: $dogName',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const BreedAndAge()
              ],
            ),
          );
        },
        child: const Text(
          'I like dogs.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, String>(
      selector: (BuildContext context, Dog dog) => dog.breed,
      builder: (_, String dogBreed, __) {
        return Column(
          children: [
            Text(
              '- breed: $dogBreed',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Age()
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, int>(
      selector: (BuildContext context, Dog dog) => dog.age,
      builder: (_, int dogAge, __) {
        return Column(
          children: [
            Text(
              '- age: $dogAge',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => context.read<Dog>().grow(),
                child: const Text(
                  'grow',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        );
      },
    );
  }
}
