import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Handles background messages
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // Handle background message
}

// Handles messages when the app is opened from a terminated state
Future<void> handleOnAppOpenedMessage(RemoteMessage message) async {
  // Handle message
}
String? fcmToken = 'null';

class FirebaseNotificationApi {
  static const String _channelId = 'high_importance_channel';
  static const String _channelName = 'High Importance Notifications';
  static const String _channelDescription =
      'This channel is used for important notifications.';
  static const String _notificationIcon = '@drawable/ic_notification';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initializes notification settings
  Future<void> initNotification() async {
    await _requestPermissions();
    await _subscribeToTopic();
    await _getFcmToken();

    _initializeLocalNotifications();
    _createNotificationChannel();

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(_handleMessageInForeground);
    FirebaseMessaging.onMessageOpenedApp.listen(handleOnAppOpenedMessage);
  }

  // Requests notification permissions from the user
  Future<void> _requestPermissions() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // Subscribes to a specific topic
  Future<void> _subscribeToTopic() async {
    await _firebaseMessaging.subscribeToTopic('yelzamni');
  }

  // Retrieves the FCM token and prints it
  Future<void> _getFcmToken() async {
    fcmToken = await _firebaseMessaging.getToken();
    debugPrint(fcmToken ?? 'Failed to get FCM token');
  }

  // Initializes local notifications settings
  void _initializeLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    _localNotificationsPlugin.initialize(initializationSettings);
  }

  // Creates a notification channel for Android
  void _createNotificationChannel() {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.max,
    );

    _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Handles foreground messages and displays notifications
  Future<void> _handleMessageInForeground(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      icon: _notificationIcon,
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _localNotificationsPlugin.show(
      message.messageId.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
    );
  }
}
