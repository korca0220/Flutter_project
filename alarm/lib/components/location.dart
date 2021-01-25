import 'package:geolocator/geolocator.dart';
import 'dart:io';

class Location {
  Location({this.latitude, this.longitude});

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationAccuracy accuracy;
      if (Platform.isAndroid) {
        accuracy = LocationAccuracy.best;
      } else if (Platform.isIOS) {
        accuracy = LocationAccuracy.low;
      }
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: accuracy);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
