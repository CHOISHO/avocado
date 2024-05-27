import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/feature/view_model/splash_view_model.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(); // 애니메이션을 반복합니다.

    final animation1 = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 0.17), // 0도에서 180도
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.17, end: 0.17), // 180도에서 360도
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.17, end: 0), // 360도에서 540도
        weight: 1.0,
      ),
    ]).animate(controller);

    // TODO:
    // useEffect(() {
    //   Future<void> auth() async {
    //     await ref.read(splashViewModelProvider.notifier).auth();
    //   }

    //   auth();

    //   return null;
    // }, const []);

    return Container(
      color: AvocadoColors.white,
      child: Center(
        child: AnimatedBuilder(
          animation: animation1,
          child: SvgPicture.asset('assets/icons/umbrella.svg'),
          builder: (context, child) {
            return Transform.rotate(
              angle: animation1.value, // 2π radians = 360 degrees
              child: child,
            );
          },
        ),
      ),
    );
  }
}
