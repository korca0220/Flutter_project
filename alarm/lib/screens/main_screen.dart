import 'package:alarm/components/weather.dart';
import 'package:flutter/material.dart';
import 'package:alarm/widgets/weather_widget.dart';
import 'package:alarm/widgets/alarm_list_widget.dart';

class MainScreen extends StatefulWidget {
  static const String id = "main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;
  String _currentWeatherIcon = '';
  String _currentWeatherMessage = '';
  int _currentTemperature = 0;

  void _onItemTapped(int index) async {
    setState(() {
      _selectedPageIndex = index;
    });
    if (index == 1) {
      await updateWeatherData();
    }
  }

  Future<dynamic> updateWeatherData() async {
    var weather = await WeatherModel().getLocationWeather();
    setState(() {
      _currentWeatherIcon = WeatherModel().getWeatherIcon(weather);
      _currentWeatherMessage = WeatherModel().getMessage(weather);
      _currentTemperature = WeatherModel().getTemperature(weather);
    });
    return weather;
  }

  Widget getPage() {
    Widget page;
    if (_selectedPageIndex == 0) {
      page = AlarmListWidget();
    } else if (_selectedPageIndex == 1) {
      page = WeatherWidget(
        weatherIconString: _currentWeatherIcon,
        weatherMessage: _currentWeatherMessage,
        weatherTemperature: _currentTemperature,
      );
    }
    return page;
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
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_sunny), label: "Weather"),
          ],
        ),
        body: getPage());
  }
}
