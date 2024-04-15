// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translation {
  Translation(this._value);
  final int _value;

  String get title => 'You clicked $_value times';
}

class ProxyProviderUpdate extends StatefulWidget {
  const ProxyProviderUpdate({super.key});

  @override
  State<ProxyProviderUpdate> createState() => _ProxyProviderUpdateState();
}

class _ProxyProviderUpdateState extends State<ProxyProviderUpdate> {
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
      body: ProxyProvider0<Translation>(
        // 지금은 increment 호출 시, ProxyProviderUpdate가 전체 리빌드 된다.
        // 그에따라 update가 호출되는 것이다.
        // 이 말은 Translation이 increment 호출시마다 매번 새로 생성된다는 의미이다.
        update: (BuildContext context, Translation? value) {
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
    return Text(
      context.watch<Translation>().title,
      style: const TextStyle(fontSize: 30),
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
