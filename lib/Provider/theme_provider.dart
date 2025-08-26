import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.system;

  void main;

  changeTheme(ThemeMode newTheme) {
    if(currentTheme == newTheme){
      return;
    }
    currentTheme = newTheme;
    notifyListeners();
  }
}
