import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:avocado/feature/view/notification_detail_view.dart';
import 'package:avocado/feature/widget/show_modal.dart';
import 'package:avocado/main.dart';

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
    description: 'Weather Alarm Notification',
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
      // showNotificationDetailView(message);
    });

    // INFO:
    // 1. Define On Tap Floating Foreground Notification, Floating Background Notification Listener
    selectNotificationStream.stream.listen((String? message) async {
      showNotificationDetailView(message);
    });

    // 2. Add On Tap Floating Foreground Notification, Floating Background Notification Listener
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        Map<String, dynamic> payload = {
          'notificationId': notificationResponse.id,
          'payload': jsonDecode(notificationResponse.payload ?? ''),
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

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> showNotification(RemoteMessage message) async {
    Map<String, dynamic> data = message.data;
    String title = data['title'] ?? '';
    String body = data['body'] ?? '';
    String alarmId = data['alarmId'] ?? '';

    if (title.isNotEmpty && body.isNotEmpty && alarmId.isNotEmpty) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      var random = Random().nextInt(100);

      _flutterLocalNotificationsPlugin.show(
        random,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(
          {
            'title': title,
            'body': body,
            'alarmId': alarmId,
          },
        ),
      );
    }
  }

  Future<void> showNotificationDetailView(String? message) async {
    try {
      if (message == null) {
        return;
      }

      await _flutterLocalNotificationsPlugin.cancelAll();

      var parsedMessage = jsonDecode(message);

      if (parsedMessage['payload'] != null &&
          parsedMessage['payload']['alarmId'] != null) {
        await showModal(
          navigatorKey.currentState!.overlay!.context,
          NotificationDetailView(
            alarmId: parsedMessage['payload']['alarmId'],
          ),
        );
      }
    } catch (e) {}
  }
}

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  PushNotificationUtil().showNotification(message);
}
