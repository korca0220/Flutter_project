import 'package:flutter/material.dart';
import 'package:alarm/components/weather.dart';
import 'package:provider/provider.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    final currentConditionIcon =
        Provider.of<WeatherModel>(context).getWeatherIcon();
    final currentTempMessage = Provider.of<WeatherModel>(context).getMessage();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '서울 ${Provider.of<WeatherModel>(context).temperature}°',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              currentConditionIcon,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              currentTempMessage,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
