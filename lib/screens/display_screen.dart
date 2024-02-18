import 'package:flutter/material.dart';
import 'package:hack24/models/language/strings.dart';
import 'package:hack24/models/theme_provider.dart';
import 'package:hack24/screens/pages/Recompenses.dart';
import 'package:hack24/screens/pages/main_screen.dart';
import 'package:hack24/screens/pages/publication_screen.dart';
import 'package:provider/provider.dart';
import '../components/bottom_navigation.dart';
import '../components/map_google.dart';

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    mainScreen(),
    Container(
      height: double.infinity,
      child: const Column(
        children: [
          Expanded( // Wrap the MapSample widget with Expanded
            child: MapSample(),
          ),
        ],
      ),
    ),
    RewardsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
            AppStrings.getString(
              Provider.of<ThemeProvider>(context).locale,
              'appName',
            ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
