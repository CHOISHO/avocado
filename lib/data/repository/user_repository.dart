import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/domain/model/user_model.dart';
import 'package:avocado/util/api.dart';

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
      var user = await ApiUtil.post(
        url: _url,
        path: '/auth/login',
        body: {
          'token': idToken,
        },
      );

      state = state.copyWith(idToken: idToken);
      Logger().d(idToken);
      // TODO: user 정보 저장
    } catch (error) {
      Logger().e(error);
      // TODO: 로그인 error 처리
    }
  }
}
