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
      isEditMode: json['isEditMode'] as bool? ?? false,
      selectedIndex: (json['selectedIndex'] as num?)?.toInt() ?? null,
    );

Map<String, dynamic> _$$AddAlarmViewModelStateImplToJson(
        _$AddAlarmViewModelStateImpl instance) =>
    <String, dynamic>{
      'alarm': instance.alarm,
      'isEditMode': instance.isEditMode,
      'selectedIndex': instance.selectedIndex,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addAlarmViewModelHash() => r'580c7ce053b23dd46a05a07f4f3641ef9b51096e';

/// See also [AddAlarmViewModel].
@ProviderFor(AddAlarmViewModel)
final addAlarmViewModelProvider =
    NotifierProvider<AddAlarmViewModel, AddAlarmViewModelState>.internal(
  AddAlarmViewModel.new,
  name: r'addAlarmViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addAlarmViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddAlarmViewModel = Notifier<AddAlarmViewModelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
