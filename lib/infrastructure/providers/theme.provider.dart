import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false;
  bool get theme => isDarkTheme;

  switchTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}