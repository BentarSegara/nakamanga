import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isLightMode = true;

  void setTheme() {
    _isLightMode = !_isLightMode;
    notifyListeners();
  }

  bool get isLightMode => _isLightMode;
}
