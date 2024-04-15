import 'package:flutter/material.dart';
import 'package:provider_overview_03/model/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Template'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dog dog = Dog(name: 'Latte', breed: 'Mix', age: 3);

  @override
  void initState() {
    dog.addListener(dogListener);
    super.initState();
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '- name: ${dog.name}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            BreedAndAge(dog: dog)
          ],
        ),
      ),
    );
  }

  void dogListener() {
    print('age: ${dog.age}');
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${dog.breed}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Age(dog: dog)
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;
  const Age({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${dog.age}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () => dog.grow(),
            child: const Text(
              'grow',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
