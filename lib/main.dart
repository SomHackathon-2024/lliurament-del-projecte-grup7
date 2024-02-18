import 'package:flutter/material.dart';
import 'package:hack24/models/theme/theme.dart';
import 'package:hack24/models/theme_provider.dart';
import 'package:provider/provider.dart';
import 'models/obj/user_data.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyMataro',
      theme: Provider.of<ThemeProvider>(context).themeData,
      locale: Provider.of<ThemeProvider>(context).locale,
      home: SplashScreen(),//HomeScreen(),
    );
  }
}