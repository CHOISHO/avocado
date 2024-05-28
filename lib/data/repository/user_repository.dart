import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/util/api.dart';
import 'package:avocado/util/shared_preferences.dart';

part 'user_repository.g.dart';

@riverpod
class UserRepository extends _$UserRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';

  @override
  void build() {}

  Future<String?> create() async {
    try {
      var response = await ApiUtil.get(_url, '/auth/create');

      String token = response['token'];

      await FirebaseAuth.instance.signInWithCustomToken(token);

      await SharedPreferencesUtil().setString('token', token);

      return token;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<void> login(String token) async {
    try {
      String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

      if (idToken != null) {
        var user = await ApiUtil.post(_url, '/auth/login', {'token': idToken});

        // TODO: user 정보 저장
      } else {
        throw 'idToken 이 존재하지 않습니다.';
      }
    } catch (error) {
      Logger().e(error);
      // TODO: 로그인 error 처리
    }
  }
}