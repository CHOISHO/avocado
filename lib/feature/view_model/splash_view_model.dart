import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/user_repository.dart';

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
      User? user = FirebaseAuth.instance.currentUser;
      String? idToken = await user?.getIdToken(true);

      if (idToken == null) {
        String? token =
            await ref.read(userRepositoryProvider.notifier).create();

        if (token != null) {
          await ref.read(userRepositoryProvider.notifier).login(token);
        } else {
          throw 'token 이 없습니다.';
        }
      } else {
        await ref.read(userRepositoryProvider.notifier).login(idToken);
      }

      return AuthStatus.success;
    } catch (e) {
      Logger().d(e);
      return AuthStatus.fail;
    }
  }
}
