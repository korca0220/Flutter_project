import 'package:flutter/material.dart';
import 'package:alarm/components/weather.dart';
import 'package:provider/provider.dart';

import 'package:alarm/screens/main_screen.dart';

import 'components/weather.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherModel(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoadingScreen()),
    );
  }
}
