// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_district_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchDistrictViewModelStateImpl _$$SearchDistrictViewModelStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchDistrictViewModelStateImpl(
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
      districts: (json['districts'] as List<dynamic>?)
              ?.map((e) => District.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SearchDistrictViewModelStateImplToJson(
        _$SearchDistrictViewModelStateImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'districts': instance.districts,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchDistrictViewModelHash() =>
    r'd7f75016098d515eb2b21c648e7cf411fa901c1f';

/// See also [SearchDistrictViewModel].
@ProviderFor(SearchDistrictViewModel)
final searchDistrictViewModelProvider = AutoDisposeNotifierProvider<
    SearchDistrictViewModel, SearchDistrictViewModelState>.internal(
  SearchDistrictViewModel.new,
  name: r'searchDistrictViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchDistrictViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchDistrictViewModel
    = AutoDisposeNotifier<SearchDistrictViewModelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
