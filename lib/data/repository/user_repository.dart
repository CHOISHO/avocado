import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/domain/model/user_model.dart';
import 'package:avocado/util/api.dart';
import 'package:avocado/util/push_notification.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
class UserRepository extends _$UserRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';

  @override
  UserModel build() {
    return UserModel();
  }

  Future<String?> create() async {
    try {
      var response = await ApiUtil.get(
        url: _url,
        path: '/auth/create',
      );

      String token = response['token'];

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCustomToken(token);

      var idToken = await userCredential.user?.getIdToken();

      return idToken;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<void> login(String idToken) async {
    try {
      var deviceToken = await PushNotificationUtil().getDeviceToken();

      var user = await ApiUtil.post(
        url: _url,
        path: '/auth/login',
        body: {
          'idToken': idToken,
          'deviceToken': deviceToken,
        },
      );

      state = state.copyWith(idToken: idToken);
    } catch (error) {
      Logger().e(error);
      // TODO: 로그인 error 처리
    }
  }
}
