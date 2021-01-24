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
    var locationWeathereData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen(
        locationWeatherData: locationWeathereData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitPulse(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
