import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_overview_19/success_page.dart';

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

  Future<void> getResult(BuildContext context, searchTerm) async {
    _state = AppState.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    try {
      if (searchTerm == 'fail') {
        throw 'Something went wrong';
      }

      _state = AppState.success;
      notifyListeners();

      // api call (비지니스로직)에서 context를 참조하고 경계가 없어져 지저분하다.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessPage(),
        ),
      );
    } catch (e) {
      _state = AppState.error;
      notifyListeners();

      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Something went wrong!'),
          );
        },
      );
    }
  }
}
