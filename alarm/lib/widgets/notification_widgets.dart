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
    FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin,
    DateTime date) async {
  const AndroidNotificationDetails android = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  const IOSNotificationDetails ios = IOSNotificationDetails();
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: android, iOS: ios);
  await _flutterLocalNotificationPlugin.zonedSchedule(
      0, 'test', 'test', _setNotiTime(date), platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time);
}

tz.TZDateTime _setNotiTime(DateTime date) {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

  final now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate = tz.TZDateTime.from(date, tz.local);

  return scheduledDate;
}
