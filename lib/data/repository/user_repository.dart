import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/domain/model/user_model.dart';
import 'package:avocado/util/api.dart';
import 'package:avocado/util/shared_preferences.dart';

part 'user_repository.g.dart';

@riverpod
class UserRepository extends _$UserRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';

  @override
  UserModel build() {
    return UserModel();
  }

  Future<String?> create() async {
    try {
      var response = await ApiUtil.get(_url, '/auth/create');

      String token = response['token'];

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCustomToken(token);

      var idToken = await userCredential.user?.getIdToken();

      if (idToken != null) {
        await SharedPreferencesUtil().setString('token', idToken);
      }

      return idToken;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<void> login(String idToken) async {
    try {
      var user = await ApiUtil.post(_url, '/auth/login', {'token': idToken});

      state = state.copyWith(idToken: idToken);

      // TODO: user 정보 저장
    } catch (error) {
      Logger().e(error);
      // TODO: 로그인 error 처리
    }
  }
}
