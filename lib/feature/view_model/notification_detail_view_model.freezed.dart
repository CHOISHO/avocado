// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationDetailViewModelState _$NotificationDetailViewModelStateFromJson(
    Map<String, dynamic> json) {
  return _NotificationDetailViewModelState.fromJson(json);
}

/// @nodoc
mixin _$NotificationDetailViewModelState {
  int get rainningDisrtictCount => throw _privateConstructorUsedError;
  bool get isOverRainningHeavily => throw _privateConstructorUsedError;
  List<AlarmWeatherModel> get weather => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDetailViewModelStateCopyWith<NotificationDetailViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDetailViewModelStateCopyWith<$Res> {
  factory $NotificationDetailViewModelStateCopyWith(
          NotificationDetailViewModelState value,
          $Res Function(NotificationDetailViewModelState) then) =
      _$NotificationDetailViewModelStateCopyWithImpl<$Res,
          NotificationDetailViewModelState>;
  @useResult
  $Res call(
      {int rainningDisrtictCount,
      bool isOverRainningHeavily,
      List<AlarmWeatherModel> weather});
}

/// @nodoc
class _$NotificationDetailViewModelStateCopyWithImpl<$Res,
        $Val extends NotificationDetailViewModelState>
    implements $NotificationDetailViewModelStateCopyWith<$Res> {
  _$NotificationDetailViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rainningDisrtictCount = null,
    Object? isOverRainningHeavily = null,
    Object? weather = null,
  }) {
    return _then(_value.copyWith(
      rainningDisrtictCount: null == rainningDisrtictCount
          ? _value.rainningDisrtictCount
          : rainningDisrtictCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOverRainningHeavily: null == isOverRainningHeavily
          ? _value.isOverRainningHeavily
          : isOverRainningHeavily // ignore: cast_nullable_to_non_nullable
              as bool,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<AlarmWeatherModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationDetailViewModelStateImplCopyWith<$Res>
    implements $NotificationDetailViewModelStateCopyWith<$Res> {
  factory _$$NotificationDetailViewModelStateImplCopyWith(
          _$NotificationDetailViewModelStateImpl value,
          $Res Function(_$NotificationDetailViewModelStateImpl) then) =
      __$$NotificationDetailViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rainningDisrtictCount,
      bool isOverRainningHeavily,
      List<AlarmWeatherModel> weather});
}

/// @nodoc
class __$$NotificationDetailViewModelStateImplCopyWithImpl<$Res>
    extends _$NotificationDetailViewModelStateCopyWithImpl<$Res,
        _$NotificationDetailViewModelStateImpl>
    implements _$$NotificationDetailViewModelStateImplCopyWith<$Res> {
  __$$NotificationDetailViewModelStateImplCopyWithImpl(
      _$NotificationDetailViewModelStateImpl _value,
      $Res Function(_$NotificationDetailViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rainningDisrtictCount = null,
    Object? isOverRainningHeavily = null,
    Object? weather = null,
  }) {
    return _then(_$NotificationDetailViewModelStateImpl(
      rainningDisrtictCount: null == rainningDisrtictCount
          ? _value.rainningDisrtictCount
          : rainningDisrtictCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOverRainningHeavily: null == isOverRainningHeavily
          ? _value.isOverRainningHeavily
          : isOverRainningHeavily // ignore: cast_nullable_to_non_nullable
              as bool,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<AlarmWeatherModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDetailViewModelStateImpl
    implements _NotificationDetailViewModelState {
  const _$NotificationDetailViewModelStateImpl(
      {this.rainningDisrtictCount = 0,
      this.isOverRainningHeavily = false,
      final List<AlarmWeatherModel> weather = const []})
      : _weather = weather;

  factory _$NotificationDetailViewModelStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NotificationDetailViewModelStateImplFromJson(json);

  @override
  @JsonKey()
  final int rainningDisrtictCount;
  @override
  @JsonKey()
  final bool isOverRainningHeavily;
  final List<AlarmWeatherModel> _weather;
  @override
  @JsonKey()
  List<AlarmWeatherModel> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  String toString() {
    return 'NotificationDetailViewModelState(rainningDisrtictCount: $rainningDisrtictCount, isOverRainningHeavily: $isOverRainningHeavily, weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDetailViewModelStateImpl &&
            (identical(other.rainningDisrtictCount, rainningDisrtictCount) ||
                other.rainningDisrtictCount == rainningDisrtictCount) &&
            (identical(other.isOverRainningHeavily, isOverRainningHeavily) ||
                other.isOverRainningHeavily == isOverRainningHeavily) &&
            const DeepCollectionEquality().equals(other._weather, _weather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rainningDisrtictCount,
      isOverRainningHeavily, const DeepCollectionEquality().hash(_weather));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDetailViewModelStateImplCopyWith<
          _$NotificationDetailViewModelStateImpl>
      get copyWith => __$$NotificationDetailViewModelStateImplCopyWithImpl<
          _$NotificationDetailViewModelStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDetailViewModelStateImplToJson(
      this,
    );
  }
}

abstract class _NotificationDetailViewModelState
    implements NotificationDetailViewModelState {
  const factory _NotificationDetailViewModelState(
          {final int rainningDisrtictCount,
          final bool isOverRainningHeavily,
          final List<AlarmWeatherModel> weather}) =
      _$NotificationDetailViewModelStateImpl;

  factory _NotificationDetailViewModelState.fromJson(
          Map<String, dynamic> json) =
      _$NotificationDetailViewModelStateImpl.fromJson;

  @override
  int get rainningDisrtictCount;
  @override
  bool get isOverRainningHeavily;
  @override
  List<AlarmWeatherModel> get weather;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDetailViewModelStateImplCopyWith<
          _$NotificationDetailViewModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
