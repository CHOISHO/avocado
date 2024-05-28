import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PushNotificationUtil {
  factory PushNotificationUtil() {
    return _instance;
  }

  PushNotificationUtil._internal();

  static final PushNotificationUtil _instance =
      PushNotificationUtil._internal();

  Future<bool> get permissionStatusIsDenied => Permission.notification.isDenied;

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
}
