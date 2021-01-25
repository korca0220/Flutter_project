import 'package:alarm/components/network_helper.dart';
import 'package:alarm/components/location.dart';

const apikey = "a34d08a1378757bdb49971185eaf046a";
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var currentLocationWeather = await networkHelper.getData();
    return currentLocationWeather;
  }

  String getWeatherIcon(dynamic weatherData) {
    final int _condition = weatherData['weather'][0]['id'];
    if (_condition < 300) {
      return '🌩';
    } else if (_condition < 400) {
      return '🌧';
    } else if (_condition < 600) {
      return '☔️';
    } else if (_condition < 700) {
      return '☃️';
    } else if (_condition < 800) {
      return '🌫';
    } else if (_condition == 800) {
      return '☀️';
    } else if (_condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(dynamic weatherData) {
    final int _temperature = weatherData['main']['temp'].toInt();
    if (_temperature > 25) {
      return 'It\'s 🍦 time';
    } else if (_temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (_temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  int getTemperature(dynamic weatherData) {
    final int _temperature = weatherData['main']['temp'].toInt();
    return _temperature;
  }
}
