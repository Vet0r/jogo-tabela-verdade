import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SnapshotSharedPreferences extends ChangeNotifier {
  SharedPreferences? _sp;

  SharedPreferences? get sharedPrefs => _sp;

  void changeSP(SharedPreferences newSp) {
    _sp = newSp;
    notifyListeners();
  }
}
