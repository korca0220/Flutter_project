import 'package:flutter/material.dart';
import 'package:alarm/components/const.dart';

class WeatherWidget extends StatefulWidget {
  final String weatherIconString;
  final String weatherMessage;
  final int weatherTemperature;
  WeatherWidget(
      {this.weatherIconString, this.weatherMessage, this.weatherTemperature});

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('서울 ${widget.weatherTemperature}'),
            SizedBox(
              height: 10,
            ),
            Text(widget.weatherIconString, style: kWeatherTextStyle),
            SizedBox(
              height: 10,
            ),
            Text(widget.weatherMessage, style: kWeatherMessageTextStyle)
          ],
        ),
      ),
    );
  }
}
