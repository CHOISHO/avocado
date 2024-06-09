import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/util/api.dart';

part 'district_repository.g.dart';

@riverpod
class DistrictRepository extends _$DistrictRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';
  final String _version = '';

  @override
  void build() {}

  Future<List<District>> getDistricts(String keyword, int currentPage) async {
    try {
      var response = await ApiUtil.get(
        url: _url,
        path: '$_version/district/getDistricts',
        queryParameters: {
          'currentPage': currentPage.toString(),
          'keyword': keyword,
        },
      );

      if (response['data'] == null) {
        throw '데이터가 없습니다.';
      }

      List<District> districts = [];

      for (final districtData in response['data']) {
        districts.add(District.fromJson(districtData));
      }

      return districts;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
