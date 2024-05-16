// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_alarm_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddAlarmViewModelState _$AddAlarmViewModelStateFromJson(
    Map<String, dynamic> json) {
  return _AddAlarmViewModelState.fromJson(json);
}

/// @nodoc
mixin _$AddAlarmViewModelState {
  AlarmModel get alarm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddAlarmViewModelStateCopyWith<AddAlarmViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAlarmViewModelStateCopyWith<$Res> {
  factory $AddAlarmViewModelStateCopyWith(AddAlarmViewModelState value,
          $Res Function(AddAlarmViewModelState) then) =
      _$AddAlarmViewModelStateCopyWithImpl<$Res, AddAlarmViewModelState>;
  @useResult
  $Res call({AlarmModel alarm});

  $AlarmModelCopyWith<$Res> get alarm;
}

/// @nodoc
class _$AddAlarmViewModelStateCopyWithImpl<$Res,
        $Val extends AddAlarmViewModelState>
    implements $AddAlarmViewModelStateCopyWith<$Res> {
  _$AddAlarmViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarm = null,
  }) {
    return _then(_value.copyWith(
      alarm: null == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as AlarmModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlarmModelCopyWith<$Res> get alarm {
    return $AlarmModelCopyWith<$Res>(_value.alarm, (value) {
      return _then(_value.copyWith(alarm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddAlarmViewModelStateImplCopyWith<$Res>
    implements $AddAlarmViewModelStateCopyWith<$Res> {
  factory _$$AddAlarmViewModelStateImplCopyWith(
          _$AddAlarmViewModelStateImpl value,
          $Res Function(_$AddAlarmViewModelStateImpl) then) =
      __$$AddAlarmViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AlarmModel alarm});

  @override
  $AlarmModelCopyWith<$Res> get alarm;
}

/// @nodoc
class __$$AddAlarmViewModelStateImplCopyWithImpl<$Res>
    extends _$AddAlarmViewModelStateCopyWithImpl<$Res,
        _$AddAlarmViewModelStateImpl>
    implements _$$AddAlarmViewModelStateImplCopyWith<$Res> {
  __$$AddAlarmViewModelStateImplCopyWithImpl(
      _$AddAlarmViewModelStateImpl _value,
      $Res Function(_$AddAlarmViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarm = null,
  }) {
    return _then(_$AddAlarmViewModelStateImpl(
      alarm: null == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as AlarmModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddAlarmViewModelStateImpl implements _AddAlarmViewModelState {
  const _$AddAlarmViewModelStateImpl({this.alarm = const AlarmModel()});

  factory _$AddAlarmViewModelStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddAlarmViewModelStateImplFromJson(json);

  @override
  @JsonKey()
  final AlarmModel alarm;

  @override
  String toString() {
    return 'AddAlarmViewModelState(alarm: $alarm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAlarmViewModelStateImpl &&
            (identical(other.alarm, alarm) || other.alarm == alarm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, alarm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAlarmViewModelStateImplCopyWith<_$AddAlarmViewModelStateImpl>
      get copyWith => __$$AddAlarmViewModelStateImplCopyWithImpl<
          _$AddAlarmViewModelStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddAlarmViewModelStateImplToJson(
      this,
    );
  }
}

abstract class _AddAlarmViewModelState implements AddAlarmViewModelState {
  const factory _AddAlarmViewModelState({final AlarmModel alarm}) =
      _$AddAlarmViewModelStateImpl;

  factory _AddAlarmViewModelState.fromJson(Map<String, dynamic> json) =
      _$AddAlarmViewModelStateImpl.fromJson;

  @override
  AlarmModel get alarm;
  @override
  @JsonKey(ignore: true)
  _$$AddAlarmViewModelStateImplCopyWith<_$AddAlarmViewModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
