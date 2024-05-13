import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/district_repository.dart';
import 'package:avocado/domain/model/district_model.dart';

part 'search_district_view_model.freezed.dart';
part 'search_district_view_model.g.dart';

@freezed
class SearchDistrictViewModelState with _$SearchDistrictViewModelState {
  factory SearchDistrictViewModelState({
    @Default(1) int currentPage,
    @Default([]) List<District> districts,
  }) = _SearchDistrictViewModelState;

  factory SearchDistrictViewModelState.fromJson(Map<String, dynamic> json) =>
      _$SearchDistrictViewModelStateFromJson(json);
}

@riverpod
class SearchDistrictViewModel extends _$SearchDistrictViewModel {
  @override
  SearchDistrictViewModelState build() {
    return SearchDistrictViewModelState();
  }

  Future<void> searchDistricts(String keyword) async {
    List<District> districts = await ref
        .read(districtRepositoryProvider.notifier)
        .getDistricts(keyword, state.currentPage);

    state = state.copyWith(districts: districts);
  }
}
