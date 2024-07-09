// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_detail_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDetailViewModelStateImpl
    _$$NotificationDetailViewModelStateImplFromJson(
            Map<String, dynamic> json) =>
        _$NotificationDetailViewModelStateImpl(
          rainningDisrtictCount:
              (json['rainningDisrtictCount'] as num?)?.toInt() ?? 0,
          isOverRainningHeavily:
              json['isOverRainningHeavily'] as bool? ?? false,
          weather: (json['weather'] as List<dynamic>?)
                  ?.map((e) =>
                      AlarmWeatherModel.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$NotificationDetailViewModelStateImplToJson(
        _$NotificationDetailViewModelStateImpl instance) =>
    <String, dynamic>{
      'rainningDisrtictCount': instance.rainningDisrtictCount,
      'isOverRainningHeavily': instance.isOverRainningHeavily,
      'weather': instance.weather,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationDetailViewModelHash() =>
    r'a00879c17ff2490d56039c9a7bd79df7c6e5613f';

/// See also [NotificationDetailViewModel].
@ProviderFor(NotificationDetailViewModel)
final notificationDetailViewModelProvider = AutoDisposeNotifierProvider<
    NotificationDetailViewModel, NotificationDetailViewModelState>.internal(
  NotificationDetailViewModel.new,
  name: r'notificationDetailViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationDetailViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationDetailViewModel
    = AutoDisposeNotifier<NotificationDetailViewModelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
