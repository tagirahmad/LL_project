import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final initializationSettingsIOS = IOSInitializationSettings();

    final initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotificationPeriodically(int id, String title, DateTime date,
      {String? body}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'remindDebt', 'remindDebt', 'Напоминание о долге');

    const iOSPlatformChannelSpecifics =
        IOSNotificationDetails(subtitle: 'remindDebt');

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(date, tz.local).subtract(const Duration(days: 3)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
