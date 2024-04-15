import 'package:flutter/material.dart';
import 'package:provider_overview_15/change_notifier_provider_change_notifier_proxy_provider.dart';
import 'package:provider_overview_15/change_notifier_provider_proxy_provider.dart';
import 'package:provider_overview_15/proxy_provider_create_update.dart';
import 'package:provider_overview_15/proxy_provider_proxy_provider.dart';
import 'package:provider_overview_15/why_proxy_provider.dart';
import 'package:provider_overview_15/proxy_provider_update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            shrinkWrap: true,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WhyProxyProvider(),
                  ),
                ),
                child: const Text(
                  'Why ProxyProvider',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProviderUpdate(),
                  ),
                ),
                child: const Text(
                  'Why ProxyProvider Update',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProviderCreateUpdate(),
                  ),
                ),
                child: const Text(
                  'Why ProxyProvider Create And Update',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProviderProxyProvider(),
                  ),
                ),
                child: const Text(
                  'ProxyProvider ProxyProvider',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const ChangeNotifierProviderChangeNotifierProxyProvider(),
                  ),
                ),
                child: const Text(
                  'ChangeNotifierProvider And ChangeNotifierProxyProvider',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChangeNotifierProviderProxyProvider(),
                  ),
                ),
                child: const Text(
                  'ChangeNotifierProvider And ProxyProvider',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
