import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class Foo with ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: ChangeNotifierProvider<Foo>(
        create: (_) => Foo(),
        child: Consumer(builder: (_, Foo foo, __) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(foo.value, style: const TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => foo.changeValue(),
                  child: const Text('change value'),
                )
              ],
            ),
          );
        }),
        // builder: (context, child) {
        //   return Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(context.watch<Foo>().value,
        //             style: const TextStyle(fontSize: 20)),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         ElevatedButton(
        //           onPressed: () => context.read<Foo>().changeValue(),
        //           child: const Text('change value'),
        //         )
        //       ],
        //     ),
        //   );
        // },
      ),
    );
  }
}
