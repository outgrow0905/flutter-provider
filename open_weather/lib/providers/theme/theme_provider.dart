import 'package:equatable/equatable.dart';
import 'package:open_weather/providers/weather/weather_provider.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:open_weather/constants/constants.dart';

part 'theme_state.dart';

class ThemeProvider extends StateNotifier<ThemeState> with LocatorMixin {
  ThemeProvider() : super(ThemeState.initial());

  @override
  void update(Locator watch) {
    final currentTemp = watch<WeatherState>().weather.temp;
    if (kWarmOrNot < currentTemp) {
      state = state.copyWith(appTheme: AppTheme.light);
    } else {
      state = state.copyWith(appTheme: AppTheme.dark);
    }
    print('theme: $state');
  }
}
