import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_13/counter.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('show me counter page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              // - The provider you are trying to read is in a different route.
              // Providers are "scoped". So if you insert of provider inside a route, then
              // other routes will not be able to access that provider.
              '${context.watch<Counter>().count}',
              style: const TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
