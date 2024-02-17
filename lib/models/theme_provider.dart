import 'package:flutter/material.dart';
import 'theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  Locale _locale = const Locale('en');

  ThemeData get themeData => _themeData;
  Locale get locale => _locale;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void toggleLanguage(Locale lc) {
    locale = lc;
  }
}