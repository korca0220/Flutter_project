import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  final locationWeather;
  WeatherWidget({this.locationWeather});

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
