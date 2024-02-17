import 'package:flutter/material.dart';
import 'package:hack24/components/box/rounded_box.dart';
import 'package:hack24/components/button/rounded_button.dart';
import 'package:hack24/models/language/strings.dart';
import 'package:provider/provider.dart';
import '../models/theme_provider.dart';
import '../screens/display_screen.dart';

class HomeScreen extends StatelessWidget {
  Locale _selectedLocale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayScreen()),
                );
              },
              child: Text('Go to Display Screen'),
            ),
            RoundedBox(
              child: Text(AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'go_to_display_screen')),
              color: Theme.of(context).colorScheme.primary,
            ),
            RoundedButton(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 20),
            DropdownButton<Locale>(
              value: Provider.of<ThemeProvider>(context).locale,
              items: [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('es'),
                  child: Text('Spanish'),
                ),
              ],
              /*onChanged: (selectedLocale) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleLanguage(selectedLocale!);
                print(AppStrings.getString(context, 'go_to_display_screen'));
              },*/
              onChanged: (selectedLocale) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleLanguage(selectedLocale!);
                print(AppStrings.getString(
                    selectedLocale, 'go_to_display_screen'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
