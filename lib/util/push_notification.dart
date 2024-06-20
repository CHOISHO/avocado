import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:avocado/feature/widget/show_modal.dart';
import 'package:avocado/main.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationUtil {
  factory PushNotificationUtil() {
    return _instance;
  }

  PushNotificationUtil._internal();

  static final PushNotificationUtil _instance =
      PushNotificationUtil._internal();

  Future<bool> get permissionStatusIsDenied => Permission.notification.isDenied;

  static AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'weather_alarm_channel',
    'Weather Alarm Notification',
    description: 'Weather Alarm Notification', // description
    importance: Importance.high,
  );

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final StreamController<String?> selectNotificationStream =
      StreamController<String?>.broadcast();

  Future<String?> getDeviceToken() async => await firebaseMessaging.getToken();

  Future<bool> handlePermission() async {
    bool isPermitted = true;

    if (Platform.isAndroid) {
      final int sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;

      PermissionStatus permissionStatus = await Permission.notification.status;

      if (sdkInt >= 33) {
        // Android Version 13 이상
        if (permissionStatus == PermissionStatus.denied) {
          isPermitted = false;
          await Permission.notification.request();
        }
      } else {
        // Android Version 12 이하
        if (permissionStatus == PermissionStatus.denied) {
          isPermitted = false;
          await openAppSettings();
        }
      }
    }

    return isPermitted;
  }

  Future<void> init() async {
    // INFO: Add On Background Notification Listener
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    // INFO: Add On Foreground Notification Listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    // INFO: Add On Tap Status Bar Background Notification Listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('---------------------------$message');

      showModal(
          navigatorKey.currentState!.overlay!.context,
          const Center(
            child: Text('------------------STATUS BAR BACKGROUND ON CLICKED'),
          ));
    });

    // INFO:
    // 1. Define On Tap Floating Foreground Notification, Floating Background Notification Listener
    selectNotificationStream.stream.listen((String? payload) async {
      if (payload == null) {
        return;
      }

      Map<String, dynamic> parsedPayload = jsonDecode(payload);
      print('---------------------------$payload');

      await _flutterLocalNotificationsPlugin.cancel(parsedPayload['id']!);
      // await _flutterLocalNotificationsPlugin.cancelAll();
      await showModal(
          navigatorKey.currentState!.overlay!.context,
          const Center(
            child: Text('------------------FOREGROUND, Floating Background'),
          ));
    });

    // 2. Add On Tap Floating Foreground Notification, Floating Background Notification Listener
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        Map<String, dynamic> payload = {
          'id': notificationResponse.id,
          'payload': notificationResponse.payload,
        };

        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            selectNotificationStream.add(jsonEncode(payload));
            break;
          case NotificationResponseType.selectedNotificationAction:
            selectNotificationStream.add(jsonEncode(payload));
            break;
        }
      },
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  }
}

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  Logger().d('BACKGROUD');
  print('-----------------------BACKGROUD');

  PushNotificationUtil().showNotification(message);
}
