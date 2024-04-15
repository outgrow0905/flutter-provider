import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_16/providers/counter.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {
    if (context.read<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtherPage(),
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigate'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: const TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherPage'),
      ),
      body: const Center(
        child: Text(
          'Other',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
