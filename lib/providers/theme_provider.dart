import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0F172A)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0F172A),
      foregroundColor: Colors.white,
    ),
  );
}
