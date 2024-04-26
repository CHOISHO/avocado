import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/data/repository/weather_repository.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 타입
    dynamic data = ref.watch(weatherRepositoryProvider);

    return Scaffold(
      body: Container(
        child: switch (data) {
          AsyncData(:final value) => Text('Activity: $value'),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
