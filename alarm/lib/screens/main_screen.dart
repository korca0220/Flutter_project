import 'package:flutter/material.dart';
import 'package:alarm/widgets/weather_widget.dart';
import 'package:provider/provider.dart';
import 'package:alarm/components/weather.dart';

class MainScreen extends StatefulWidget {
  static const String id = "main_screen";
  final locationWeatherData;
  MainScreen({this.locationWeatherData});

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
    WeatherWidget()
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherModel>(context, listen: false)
        .updateCurrentWeatherData(widget.locationWeatherData);
  }

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
