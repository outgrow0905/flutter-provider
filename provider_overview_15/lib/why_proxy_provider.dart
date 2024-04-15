// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translation {
  Translation(this._value);
  final int _value;

  String get title => 'You clicked $_value times';
}

class WhyProxyProvider extends StatefulWidget {
  const WhyProxyProvider({super.key});

  @override
  State<WhyProxyProvider> createState() => _WhyProxyProviderState();
}

class _WhyProxyProviderState extends State<WhyProxyProvider> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('$counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why ProxyProvider'),
      ),
      body: Provider(
        create: (BuildContext context) {
          return Translation(counter);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShowTranslations(),
              const SizedBox(
                height: 20,
              ),
              IncreaseButton(increment: increment)
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You clicked 0 times',
      // context.read<Translation>().title,
      style: TextStyle(fontSize: 30),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  final VoidCallback increment;

  const IncreaseButton({super.key, required this.increment});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: increment,
        child: const Text(
          'INCREASE',
          style: TextStyle(fontSize: 20),
        ));
  }
}
