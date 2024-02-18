import 'package:flutter/material.dart';
import 'package:hack24/models/language/strings.dart';
import 'package:hack24/models/theme_provider.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppStrings.getString(
              Provider.of<ThemeProvider>(context).locale,
              'title'
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppStrings.getString(
              Provider.of<ThemeProvider>(context).locale,
              'search'
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppStrings.getString(
              Provider.of<ThemeProvider>(context).locale,
              'profile'
          ),
        ),
      ],
    );
  }
}
