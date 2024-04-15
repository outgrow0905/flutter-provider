import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class Translations with ChangeNotifier {
  late int _value;

  void update(Counter counter) {
    _value = counter.counter;
    notifyListeners();
  }

  String get title => 'You clicked $_value times';
}

class ChangeNotifierProviderChangeNotifierProxyProvider extends StatefulWidget {
  const ChangeNotifierProviderChangeNotifierProxyProvider({super.key});

  @override
  State<ChangeNotifierProviderChangeNotifierProxyProvider> createState() =>
      _ChangeNotifierProviderChangeNotifierProxyProviderState();
}

class _ChangeNotifierProviderChangeNotifierProxyProviderState
    extends State<ChangeNotifierProviderChangeNotifierProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why ProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<Counter>(
              create: (context) => Counter(),
            ),
            ChangeNotifierProxyProvider<Counter, Translations>(
                create: (context) => Translations(),
                update: (
                  BuildContext context,
                  Counter counter,
                  Translations? translations,
                ) {
                  translations!.update(counter);
                  return translations;
                }),
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
