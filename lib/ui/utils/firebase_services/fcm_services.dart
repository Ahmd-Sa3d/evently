

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FcmServices{
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> init()async{
    await requestPermission();
  }
  static Future<void> requestPermission()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }

}