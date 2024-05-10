import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/district_repository.dart';

part 'search_district_view_model.g.dart';

@riverpod
class SearchDistrictViewModel extends _$SearchDistrictViewModel {
  @override
  void build() {}

  Future<List<dynamic>> searchDistricts() async {
    await ref.read(districtRepositoryProvider.notifier).getDistricts('신정동', 1);
    return [];
  }
}
