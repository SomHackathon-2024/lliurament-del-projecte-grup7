import 'package:flutter/material.dart';
import 'package:hack24/models/theme/theme.dart';
import 'package:hack24/models/theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMataro',
      theme: Provider.of<ThemeProvider>(context).themeData,
      locale: Provider.of<ThemeProvider>(context).locale,
      home: SplashScreen(),//HomeScreen(),
    );
  }
}