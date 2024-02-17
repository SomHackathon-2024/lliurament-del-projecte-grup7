import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';
import '../components/map_google.dart';

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Text('Page 1'),
    Container(
      height: double.infinity,
      child: Column(
        children: [
          Text('Page 2'),
          Expanded( // Wrap the MapSample widget with Expanded
            child: MapSample(),
          ),
        ],
      ),
    ),
    Text('Page 3'),
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
        title: Text('Display Screen'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
