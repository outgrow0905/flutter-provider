import 'package:flutter/material.dart';
import 'package:open_weather/providers/temp_settings/temp_settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celsius/Fahrenheit (Default: Celsius)'),
          trailing: Switch(
            value: context.watch<TempSettingsState>().celsius,
            onChanged: (value) {
              context.read<TempSettingsProvider>().toggleCelsius();
            },
          ),
        ),
      ),
    );
  }
}
