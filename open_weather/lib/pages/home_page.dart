import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_weather/constants/constants.dart';
import 'package:open_weather/pages/search_page.dart';
import 'package:open_weather/pages/settings_page.dart';
import 'package:open_weather/providers/temp_settings/temp_settings_provider.dart';
import 'package:open_weather/providers/weather/weather_provider.dart';
import 'package:open_weather/widgets/error_dialog.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;

  Widget _showWeather() {
    final weatherState = context.watch<WeatherState>();

    if (weatherState.status == WeatherStatus.initial) {
      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    if (weatherState.status == WeatherStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (weatherState.status == WeatherStatus.error &&
        weatherState.weather.name == '') {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => errorDialog(context, weatherState.error.errMsg),
      );

      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    if (weatherState.status == WeatherStatus.error) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => errorDialog(context, weatherState.error.errMsg),
      );
    }

    return Center(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          Text(
            weatherState.weather.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TimeOfDay.fromDateTime(weatherState.weather.lastUpdated)
                    .format(context),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '(${weatherState.weather.country})',
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                showTemperature(weatherState.weather.temp),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    showTemperature(weatherState.weather.tempMax),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    showTemperature(weatherState.weather.tempMin),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              showIcon(weatherState.weather.icon),
              Expanded(
                flex: 3,
                child: formatText(weatherState.weather.description),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }

  String showTemperature(double temperature) {
    final celius = context.watch<TempSettingsState>().celsius;

    if (celius) {
      return '${temperature.toStringAsFixed(2)} ℃';
    }

    return '${((temperature * 9 / 5) + 32).toStringAsFixed(2)} 𝙛';
  }

  Widget showIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/image/loading.gif',
      image: 'http://$kIconHost/img/wn/$icon@4x.png',
      width: 96,
      height: 96,
    );
  }

  Widget formatText(String descrition) {
    final formattedString = descrition.titleCase;
    return Text(
      formattedString,
      style: const TextStyle(
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              _city = await Navigator.push(
                  // 이게 뭐지
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ));

              print('city: $_city');

              if (null != _city) {
                await context.read<WeatherProvider>().fetchWeather(_city!);
              }
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                )),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: _showWeather(),
      ),
    );
  }
}
