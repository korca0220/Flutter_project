import 'package:alarm/screens/alarm_screen.dart';
import 'package:alarm/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alarm/components/alarm_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AlarmData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
        routes: {
          '/main': (context) => MainScreen(),
          '/alarm': (context) => AlarmScreen(),
        },
      ),
    );
  }
}
