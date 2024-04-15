import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class Translations {
  Translations(this._value);
  final int _value;

  String get title => 'You clicked $_value times';
}

class ChangeNotifierProviderProxyProvider extends StatefulWidget {
  const ChangeNotifierProviderProxyProvider({super.key});

  @override
  State<ChangeNotifierProviderProxyProvider> createState() =>
      _ChangeNotifierProviderProxyProviderState();
}

class _ChangeNotifierProviderProxyProviderState
    extends State<ChangeNotifierProviderProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why ChangeNotifierProviderProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Counter(),
            ),
            ProxyProvider<Counter, Translations>(
                update: (BuildContext context, Counter counter,
                        Translations? translations) =>
                    Translations(counter.counter))
          ],
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(),
              SizedBox(
                height: 20,
              ),
              IncreaseButton()
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
    final title = context.watch<Translations>().title;

    return Text(
      title,
      style: const TextStyle(fontSize: 28.0),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<Counter>().increment(),
      child: const Text(
        'INCREASE',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
