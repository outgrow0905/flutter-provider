import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:open_weather/pages/home_page.dart';
import 'package:open_weather/providers/temp_settings/temp_settings_provider.dart';
import 'package:open_weather/providers/theme/theme_provider.dart';
import 'package:open_weather/providers/weather/weather_provider.dart';
import 'package:open_weather/repositories/weather_repository.dart';
import 'package:open_weather/services/weather_api_services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherRepository>(
          create: (context) => WeatherRepository(
            weatherApiServices: WeatherApiServices(
              httpClient: http.Client(),
            ),
          ),
        ),
        StateNotifierProvider<WeatherProvider, WeatherState>(
            create: (context) => WeatherProvider()),
        StateNotifierProvider<TempSettingsProvider, TempSettingsState>(
            create: (context) => TempSettingsProvider()),
        StateNotifierProvider<ThemeProvider, ThemeState>(
            create: (context) => ThemeProvider()),
      ],
      builder: (context, child) => MaterialApp(
        // builder를 쓰면서 중간에 하나의 위젯이 끼워진것 처럼 같은 depth이지만 ThemeState를 watch 할 수 있다.
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: context.watch<ThemeState>().appTheme == AppTheme.light
                  ? Colors.red
                  : Colors.blue),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
