import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/user_repository.dart';
import 'package:avocado/util/shared_preferences.dart';

part 'splash_view_model.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  void build() {
    return;
  }

  Future<void> auth() async {
    // TODO:
    // try {
    //   String? tokenFromLocalStorage =
    //       SharedPreferencesUtil().getString('token');

    //   if (tokenFromLocalStorage == null) {
    //     var token = await ref.read(userRepositoryProvider.notifier).create();

    //     if (token != null) {
    //       await ref.read(userRepositoryProvider.notifier).login(token);
    //     } else {
    //       throw 'token 이 없습니다.';
    //     }
    //   } else {
    //     await ref
    //         .read(userRepositoryProvider.notifier)
    //         .login(tokenFromLocalStorage);
    //   }
    // } catch (e) {
    //   Logger().d(e);
    // }
  }
}
