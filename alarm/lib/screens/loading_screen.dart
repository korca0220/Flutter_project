import 'package:flutter/material.dart';
import 'package:alarm/components/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:alarm/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = "loading_screen";

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  void _getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitPulse(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
