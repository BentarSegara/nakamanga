import 'package:flutter/material.dart';
import 'package:nakamanga/pages/home_page.dart';
import 'package:nakamanga/providers/theme_provider.dart';
import 'package:nakamanga/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLightMode = context.watch<ThemeProvider>().isLightMode;
    return MaterialApp(
      title: 'Nakamanga',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isLightMode ? ThemeMode.light : ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
