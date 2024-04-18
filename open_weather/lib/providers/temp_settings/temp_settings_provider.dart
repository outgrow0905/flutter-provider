import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:equatable/equatable.dart';

part 'temp_settings_state.dart';

class TempSettingsProvider extends StateNotifier<TempSettingsState>
    with LocatorMixin {
  TempSettingsProvider() : super(TempSettingsState.initial());

  void toggleCelsius() {
    state = state.copyWith(celsius: !state.celsius);
  }
}
