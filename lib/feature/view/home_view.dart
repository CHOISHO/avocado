import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/feature/view_model/home_view_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 타입
    dynamic data = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(
            'assets/icons/Logo.svg',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  print('TAP');
                },
                child: SvgPicture.asset('assets/icons/setting.svg')),
          )
        ],
      ),
      body: Container(
        child: switch (data) {
          AsyncData(:final value) => shadowCard(Text('Activity: $value')),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
