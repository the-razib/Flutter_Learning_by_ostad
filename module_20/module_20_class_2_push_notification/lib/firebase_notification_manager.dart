import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseNotificationManager {
  static Future<void> initialize() async {
    FirebaseMessaging.instance.requestPermission();

    // background
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessage);

    // foreground
    FirebaseMessaging.onMessage.listen(_onMessage);

    // terminated
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  static void _onMessage(RemoteMessage message) {
    if (kDebugMode) {
      print(message.data);
      print(message.notification?.title);
      print(message.notification?.body);
    }
  }

  static Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  static Future<String?> onTokenRefresh() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((String? token) {});
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  if (kDebugMode) {
    print('Got a new message');
    print(message.data);
    print(message.notification?.title);
    print(message.notification?.body);
  }
}
