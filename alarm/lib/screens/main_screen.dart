import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String id = "main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  List<Widget> _pages = [
    Container(
      child: Center(
        child: Text("tttt"),
      ),
    ),
    Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('서울'),
            Icon(
              Icons.wb_cloudy,
              size: 40,
            ),
            Text('흐림')
          ],
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alarm and Weather",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.alarm_add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Alarm"),
          BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: "Weather"),
        ],
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
