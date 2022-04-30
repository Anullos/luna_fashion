import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messagesStreamController =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messagesStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    debugPrint('onBackground message: $message');
    //_messagesStreamController.add(message.notification!.title ?? 'No titulo');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    debugPrint('onMessage message: ${message.notification!.title}');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    debugPrint('onMessageOpenApp message: ${message.notification}');
  }

  static Future initialize() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    //Push notifications
    await FirebaseMessaging.instance.subscribeToTopic('ORDERS');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Local notifications
  }

  static void closeStreams() {
    _messagesStreamController.close();
  }
}
