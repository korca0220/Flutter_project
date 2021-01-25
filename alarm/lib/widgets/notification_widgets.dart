import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> showNotification(
    FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await _flutterLocalNotificationPlugin
      .show(0, 'test', 'test', platformChannelSpecifics, payload: 'item x');
}
