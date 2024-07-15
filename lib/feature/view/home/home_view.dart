import 'package:flutter/material.dart';

import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/feature/view/home/private_widget/add_alarm_button_widget.dart';
import 'package:avocado/feature/view/home/private_widget/alarm_list_widget.dart';
import 'package:avocado/feature/view/home/private_widget/home_header_widget.dart';
import 'package:avocado/feature/view/home/private_widget/weather_card_widget.dart';
import 'package:avocado/feature/widget/show_modal.dart';
import 'package:avocado/util/push_notification.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future<void> setupInteractedMessage() async {
        String? initialMessage =
            await PushNotificationUtil().getInitialMessage();

        if (initialMessage != null) {
          PushNotificationUtil().showNotificationDetailView(initialMessage);
        }
      }

      setupInteractedMessage();

      return null;
    }, []);

    return Scaffold(
      backgroundColor: AvocadoColors.grey05,
      floatingActionButton: const AddAlarmButtonWidget(),
      body: const Column(
        children: [
          HomeHeaderWidget(),
          WeatherCardWidget(),
          AlarmListWidget(),
        ],
      ),
    );
  }
}
