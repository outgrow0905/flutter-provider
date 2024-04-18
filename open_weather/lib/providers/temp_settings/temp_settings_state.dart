part of 'temp_settings_provider.dart';

class TempSettingsState extends Equatable {
  final bool celsius;

  const TempSettingsState({
    this.celsius = true,
  });

  factory TempSettingsState.initial() => const TempSettingsState(celsius: true);

  @override
  List<Object> get props => [celsius];

  TempSettingsState copyWith({
    bool? celsius,
  }) {
    return TempSettingsState(
      celsius: celsius ?? this.celsius,
    );
  }
}
