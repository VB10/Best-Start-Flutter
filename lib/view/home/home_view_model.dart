import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel {
  final String _key = 'counter';

  /// Random Value Generator
  /// params: value Int
  /// return : int random number generator
  int randomValue({int value}) => Random().nextInt(value ?? 100);

  Future<void> setValueOnPrefences(int value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, value);
  }

  Future<int> getValueOnPrefences() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }
}
