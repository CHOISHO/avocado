// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_alarm_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddAlarmViewModelStateImpl _$$AddAlarmViewModelStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AddAlarmViewModelStateImpl(
      alarm: json['alarm'] == null
          ? const AlarmModel()
          : AlarmModel.fromJson(json['alarm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddAlarmViewModelStateImplToJson(
        _$AddAlarmViewModelStateImpl instance) =>
    <String, dynamic>{
      'alarm': instance.alarm,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addAlarmViewModelHash() => r'f8392c6c65b9890aa1153ddf8470a6a1f7d41bdb';

/// See also [AddAlarmViewModel].
@ProviderFor(AddAlarmViewModel)
final addAlarmViewModelProvider = AutoDisposeNotifierProvider<AddAlarmViewModel,
    AddAlarmViewModelState>.internal(
  AddAlarmViewModel.new,
  name: r'addAlarmViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addAlarmViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddAlarmViewModel = AutoDisposeNotifier<AddAlarmViewModelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member