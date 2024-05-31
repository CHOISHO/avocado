import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/feature/view/home/home_view.dart';
import 'package:avocado/feature/view/permission_check_view/permission_check_view.dart';
import 'package:avocado/feature/view_model/home_view_model.dart';
import 'package:avocado/feature/view_model/splash_view_model.dart';
import 'package:avocado/feature/widget/show_modal.dart';
import 'package:avocado/util/location.dart';
import 'package:avocado/util/push_notification.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(); // 애니메이션을 반복합니다.

    final animation = TweenSequence<double>([
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
    ]).animate(animationController);

    useEffect(() {
      Future<void> auth() async {
        var authStatus =
            await ref.read(splashViewModelProvider.notifier).auth();

        if (authStatus == AuthStatus.success) {
          if (await PushNotificationUtil().permissionStatusIsDenied ||
              await LocationUtil().permissionStatusIsDenied) {
            await showModal(context, const PermissionCheckView());
          }

          if (!ref.watch(homeViewModelProvider).isLoading) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
          }
        } else {
          // TODO: error popup
        }
      }

      auth();

      return null;
    }, const []);

    return Container(
      color: AvocadoColors.white,
      child: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: SvgPicture.asset('assets/icons/umbrella.svg'),
          builder: (context, child) {
            return Transform.rotate(
              angle: animation.value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
