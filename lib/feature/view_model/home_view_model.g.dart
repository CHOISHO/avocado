// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeViewModelStateImpl _$$HomeViewModelStateImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeViewModelStateImpl(
      weather: json['weather'] == null
          ? const Weather()
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomeViewModelStateImplToJson(
        _$HomeViewModelStateImpl instance) =>
    <String, dynamic>{
      'weather': instance.weather,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeViewModelHash() => r'6c40cd95ba152bf984129e6463bd07d1df33545e';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider = AutoDisposeAsyncNotifierProvider<HomeViewModel,
    HomeViewModelState>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeAsyncNotifier<HomeViewModelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
