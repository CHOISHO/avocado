import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/user_repository.dart';
import 'package:avocado/util/shared_preferences.dart';

part 'splash_view_model.g.dart';

enum AuthStatus {
  success,
  fail,
}

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  void build() {
    return;
  }

  Future<AuthStatus> auth() async {
    try {
      String? tokenFromLocalStorage =
          SharedPreferencesUtil().getString('token');

      if (tokenFromLocalStorage == null) {
        var token = await ref.read(userRepositoryProvider.notifier).create();

        if (token != null) {
          await ref.read(userRepositoryProvider.notifier).login();
        } else {
          throw 'token 이 없습니다.';
        }
      } else {
        await ref.read(userRepositoryProvider.notifier).login();
      }

      return AuthStatus.success;
    } catch (e) {
      Logger().d(e);
      return AuthStatus.fail;
    }
  }
}
