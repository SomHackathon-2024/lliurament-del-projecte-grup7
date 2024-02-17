import 'package:flutter/material.dart';

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
          label: 'Page 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Page 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Page 3',
        ),
      ],
    );
  }
}
