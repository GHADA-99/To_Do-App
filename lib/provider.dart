import 'package:flutter/material.dart';

class MyAppProvider extends ChangeNotifier{
  String languageCode='en';
  ThemeMode themeMode=ThemeMode.light;
  void getLanguage(String appLanguage){
    languageCode=appLanguage;
    notifyListeners();
  }
  void getTheme(ThemeMode theme){
    theme=themeMode;
    notifyListeners();
  }
}