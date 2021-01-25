import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

Future<void> showNotification(
    FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin) async {
  const AndroidNotificationDetails android = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  const IOSNotificationDetails ios = IOSNotificationDetails();
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: android, iOS: ios);
  await _flutterLocalNotificationPlugin
      .show(0, 'test', 'test', platformChannelSpecifics, payload: 'item x');
}

Future<void> dailyAtTimeNotification(
    FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin) async {
  const AndroidNotificationDetails android = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  const IOSNotificationDetails ios = IOSNotificationDetails();
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: android, iOS: ios);
  await _flutterLocalNotificationPlugin.zonedSchedule(
      0, 'test', 'test', _setNotiTime(), platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time);
}

tz.TZDateTime _setNotiTime() {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

  final now = tz.TZDateTime.now(tz.local);
  var scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 10, 0);

  return scheduledDate;
}
