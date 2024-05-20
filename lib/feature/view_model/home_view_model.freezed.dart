// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeViewModelState _$HomeViewModelStateFromJson(Map<String, dynamic> json) {
  return _HomeViewModelState.fromJson(json);
}

/// @nodoc
mixin _$HomeViewModelState {
  Weather? get weather => throw _privateConstructorUsedError;
  List<AlarmModel> get alarms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeViewModelStateCopyWith<HomeViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewModelStateCopyWith<$Res> {
  factory $HomeViewModelStateCopyWith(
          HomeViewModelState value, $Res Function(HomeViewModelState) then) =
      _$HomeViewModelStateCopyWithImpl<$Res, HomeViewModelState>;
  @useResult
  $Res call({Weather? weather, List<AlarmModel> alarms});

  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class _$HomeViewModelStateCopyWithImpl<$Res, $Val extends HomeViewModelState>
    implements $HomeViewModelStateCopyWith<$Res> {
  _$HomeViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = freezed,
    Object? alarms = null,
  }) {
    return _then(_value.copyWith(
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      alarms: null == alarms
          ? _value.alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<AlarmModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get weather {
    if (_value.weather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.weather!, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeViewModelStateImplCopyWith<$Res>
    implements $HomeViewModelStateCopyWith<$Res> {
  factory _$$HomeViewModelStateImplCopyWith(_$HomeViewModelStateImpl value,
          $Res Function(_$HomeViewModelStateImpl) then) =
      __$$HomeViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Weather? weather, List<AlarmModel> alarms});

  @override
  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class __$$HomeViewModelStateImplCopyWithImpl<$Res>
    extends _$HomeViewModelStateCopyWithImpl<$Res, _$HomeViewModelStateImpl>
    implements _$$HomeViewModelStateImplCopyWith<$Res> {
  __$$HomeViewModelStateImplCopyWithImpl(_$HomeViewModelStateImpl _value,
      $Res Function(_$HomeViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = freezed,
    Object? alarms = null,
  }) {
    return _then(_$HomeViewModelStateImpl(
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      alarms: null == alarms
          ? _value._alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<AlarmModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeViewModelStateImpl implements _HomeViewModelState {
  const _$HomeViewModelStateImpl(
      {this.weather = null, final List<AlarmModel> alarms = const []})
      : _alarms = alarms;

  factory _$HomeViewModelStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeViewModelStateImplFromJson(json);

  @override
  @JsonKey()
  final Weather? weather;
  final List<AlarmModel> _alarms;
  @override
  @JsonKey()
  List<AlarmModel> get alarms {
    if (_alarms is EqualUnmodifiableListView) return _alarms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alarms);
  }

  @override
  String toString() {
    return 'HomeViewModelState(weather: $weather, alarms: $alarms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewModelStateImpl &&
            (identical(other.weather, weather) || other.weather == weather) &&
            const DeepCollectionEquality().equals(other._alarms, _alarms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, weather, const DeepCollectionEquality().hash(_alarms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeViewModelStateImplCopyWith<_$HomeViewModelStateImpl> get copyWith =>
      __$$HomeViewModelStateImplCopyWithImpl<_$HomeViewModelStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeViewModelStateImplToJson(
      this,
    );
  }
}

abstract class _HomeViewModelState implements HomeViewModelState {
  const factory _HomeViewModelState(
      {final Weather? weather,
      final List<AlarmModel> alarms}) = _$HomeViewModelStateImpl;

  factory _HomeViewModelState.fromJson(Map<String, dynamic> json) =
      _$HomeViewModelStateImpl.fromJson;

  @override
  Weather? get weather;
  @override
  List<AlarmModel> get alarms;
  @override
  @JsonKey(ignore: true)
  _$$HomeViewModelStateImplCopyWith<_$HomeViewModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
