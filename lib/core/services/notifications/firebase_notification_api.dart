import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

String? fcmToken;

final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class FirebaseNotificationApi {
  final _firebaseMessage = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessage.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    await _firebaseMessage.subscribeToTopic('bulka');
    _createNotificationChannel();
    fcmToken = await _firebaseMessage.getToken();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(handleOnMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleOnAppOpenedMessage);
  }
}

Future<void> handleOnMessage(RemoteMessage message) async {
  log("handle on message ${message.toString()}  ${DateTime.now()}");
  log(message.data.toString());
  log(message.category.toString());
  log(message.contentAvailable.toString());
  log(message.messageId.toString());
  log(message.notification!.body.toString());
  log(message.notification!.title.toString());
  log(message.from.toString());
  _showForegroundNotification(message);
}

Future<void> handleOnAppOpenedMessage(RemoteMessage message) async {
  log("handle on app message opened ${message.toString()} ${DateTime.now()}");
  log(message.data.toString());
  log(message.category.toString());
  log(message.contentAvailable.toString());
  log(message.messageId.toString());
  log(message.notification!.body.toString());
  log(message.notification!.title.toString());
  log(message.from.toString());

  _showForegroundNotification(message);
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log("handle background message ${message.toString()} ${DateTime.now()}");
  log(message.data.toString());
  log(message.category.toString());
  log(message.contentAvailable.toString());
  log(message.messageId.toString());
  log(message.notification!.body.toString());
  log(message.notification!.title.toString());
  log(message.from.toString());

  _showForegroundNotification(message);
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;
  _showForegroundNotification(message);
}

void _showForegroundNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'high_importance_channel', // Make sure this channel ID matches the one you created
    'High Importance Notifications',
    channelDescription: 'This channel is used for important notifications.',
    importance: Importance.max,
    priority: Priority.high,
    icon: '@mipmap/ic_launcher', // Make sure this icon exists in your resources
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: DarwinNotificationDetails(),
  );

  await _localNotificationsPlugin.show(
    message.messageId.hashCode,
    message.notification?.title,
    message.notification?.body,
    platformChannelSpecifics,
  );
}

void _createNotificationChannel() {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // Same as above
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    enableVibration: true,
    playSound: true,
  );

  _localNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}
