import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/util/api.dart';

part 'district_repository.g.dart'; // 자동 생성될 파일

@riverpod
class DistrictRepository extends _$DistrictRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';
  final String _version = '';

  @override
  void build() {}

  Future<List<dynamic>> getDistricts(String keyword, int currentPage) async {
    var response = await ApiUtil.get(_url, '$_version/district/getDistricts', {
      'currentPage': currentPage.toString(),
      'keyword': keyword,
    });

    //TODO: 지역 데이터 파싱

    return [];
  }
}
