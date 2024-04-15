import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_11/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider(
          create: (context) => Counter(),
          child: Builder(builder: (context) {
            // Builder를 쓰면 하나의 위젯을 중간에 끼워넣는 역할을 수행할수 있음
            // 여기서도 context.watch는 오류가 나야 정상이지만, Builder로 감싸면서 해결
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${context.watch<Counter>().counter}'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => context.read<Counter>().increment(),
                    child: const Text('Increment'))
              ],
            );
          }),
        ),
      ),
    );
  }
}
