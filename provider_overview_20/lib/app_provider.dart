import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'success_page.dart';

enum AppState {
  initial,
  loading,
  success,
  error,
}

class AppProvider with ChangeNotifier {
  AppState _state = AppState.initial;
  AppState get state => _state;

  Future<void> getResult(searchTerm) async {
    _state = AppState.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    // try {
    if (searchTerm == 'fail') {
      _state = AppState.error;
      notifyListeners();
      return;
    }

    _state = AppState.success;
    notifyListeners();
  }
}
