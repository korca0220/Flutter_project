import 'package:alarm/components/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alarm/widgets/weather_widget.dart';
import 'package:alarm/widgets/alarm_list_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:alarm/widgets/notification_widgets.dart';
import 'package:alarm/widgets/alarm_add_button.dart';
import 'package:alarm/components/alarm.dart';
import 'package:alarm/widgets/alarm_tile_widget.dart';

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
  final List<AlarmInfo> alarmList = <AlarmInfo>[];

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

  Widget getButton() {
    Widget button;
    setState(() {
      if (_selectedPageIndex == 0) {
        button = AddAlarmButton();
      } else if (_selectedPageIndex == 1) {
        button = null;
      }
    });
    return button;
  }

  FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin;

  @override
  void initState() {
    super.initState();
    _localNotificationPluginSettings();
    _requestPermissions();
  }

  void _localNotificationPluginSettings() {
    var androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSetting = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
    );
    _flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void _requestPermissions() {
    _flutterLocalNotificationPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    _flutterLocalNotificationPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
  }

  Future onSelectNotification(String payload) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('Hi'),
              content: Text('Payload: $payload'),
              actions: [
                CupertinoDialogAction(
                  child: Text('ok'),
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    print('main bulild on');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Alarm and Weather",
          ),
        ),
        floatingActionButton: getButton(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: "Alarm",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny),
              label: "Weather",
            ),
          ],
        ),
        body: getPage());
  }
}
