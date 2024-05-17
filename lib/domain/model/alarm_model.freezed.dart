// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlarmModel _$AlarmModelFromJson(Map<String, dynamic> json) {
  return _AlarmModel.fromJson(json);
}

/// @nodoc
mixin _$AlarmModel {
  String get time => throw _privateConstructorUsedError;
  District get district1 => throw _privateConstructorUsedError;
  District get district2 => throw _privateConstructorUsedError;
  District get district3 => throw _privateConstructorUsedError;
  AlarmPeriodType get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmModelCopyWith<AlarmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmModelCopyWith<$Res> {
  factory $AlarmModelCopyWith(
          AlarmModel value, $Res Function(AlarmModel) then) =
      _$AlarmModelCopyWithImpl<$Res, AlarmModel>;
  @useResult
  $Res call(
      {String time,
      District district1,
      District district2,
      District district3,
      AlarmPeriodType period});

  $DistrictCopyWith<$Res> get district1;
  $DistrictCopyWith<$Res> get district2;
  $DistrictCopyWith<$Res> get district3;
}

/// @nodoc
class _$AlarmModelCopyWithImpl<$Res, $Val extends AlarmModel>
    implements $AlarmModelCopyWith<$Res> {
  _$AlarmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? district1 = null,
    Object? district2 = null,
    Object? district3 = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      district1: null == district1
          ? _value.district1
          : district1 // ignore: cast_nullable_to_non_nullable
              as District,
      district2: null == district2
          ? _value.district2
          : district2 // ignore: cast_nullable_to_non_nullable
              as District,
      district3: null == district3
          ? _value.district3
          : district3 // ignore: cast_nullable_to_non_nullable
              as District,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AlarmPeriodType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res> get district1 {
    return $DistrictCopyWith<$Res>(_value.district1, (value) {
      return _then(_value.copyWith(district1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res> get district2 {
    return $DistrictCopyWith<$Res>(_value.district2, (value) {
      return _then(_value.copyWith(district2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res> get district3 {
    return $DistrictCopyWith<$Res>(_value.district3, (value) {
      return _then(_value.copyWith(district3: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlarmModelImplCopyWith<$Res>
    implements $AlarmModelCopyWith<$Res> {
  factory _$$AlarmModelImplCopyWith(
          _$AlarmModelImpl value, $Res Function(_$AlarmModelImpl) then) =
      __$$AlarmModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String time,
      District district1,
      District district2,
      District district3,
      AlarmPeriodType period});

  @override
  $DistrictCopyWith<$Res> get district1;
  @override
  $DistrictCopyWith<$Res> get district2;
  @override
  $DistrictCopyWith<$Res> get district3;
}

/// @nodoc
class __$$AlarmModelImplCopyWithImpl<$Res>
    extends _$AlarmModelCopyWithImpl<$Res, _$AlarmModelImpl>
    implements _$$AlarmModelImplCopyWith<$Res> {
  __$$AlarmModelImplCopyWithImpl(
      _$AlarmModelImpl _value, $Res Function(_$AlarmModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? district1 = null,
    Object? district2 = null,
    Object? district3 = null,
    Object? period = null,
  }) {
    return _then(_$AlarmModelImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      district1: null == district1
          ? _value.district1
          : district1 // ignore: cast_nullable_to_non_nullable
              as District,
      district2: null == district2
          ? _value.district2
          : district2 // ignore: cast_nullable_to_non_nullable
              as District,
      district3: null == district3
          ? _value.district3
          : district3 // ignore: cast_nullable_to_non_nullable
              as District,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AlarmPeriodType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlarmModelImpl implements _AlarmModel {
  const _$AlarmModelImpl(
      {this.time = '',
      this.district1 = const District(),
      this.district2 = const District(),
      this.district3 = const District(),
      this.period = AlarmPeriodType.everyday});

  factory _$AlarmModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlarmModelImplFromJson(json);

  @override
  @JsonKey()
  final String time;
  @override
  @JsonKey()
  final District district1;
  @override
  @JsonKey()
  final District district2;
  @override
  @JsonKey()
  final District district3;
  @override
  @JsonKey()
  final AlarmPeriodType period;

  @override
  String toString() {
    return 'AlarmModel(time: $time, district1: $district1, district2: $district2, district3: $district3, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmModelImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.district1, district1) ||
                other.district1 == district1) &&
            (identical(other.district2, district2) ||
                other.district2 == district2) &&
            (identical(other.district3, district3) ||
                other.district3 == district3) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, district1, district2, district3, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmModelImplCopyWith<_$AlarmModelImpl> get copyWith =>
      __$$AlarmModelImplCopyWithImpl<_$AlarmModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlarmModelImplToJson(
      this,
    );
  }
}

abstract class _AlarmModel implements AlarmModel {
  const factory _AlarmModel(
      {final String time,
      final District district1,
      final District district2,
      final District district3,
      final AlarmPeriodType period}) = _$AlarmModelImpl;

  factory _AlarmModel.fromJson(Map<String, dynamic> json) =
      _$AlarmModelImpl.fromJson;

  @override
  String get time;
  @override
  District get district1;
  @override
  District get district2;
  @override
  District get district3;
  @override
  AlarmPeriodType get period;
  @override
  @JsonKey(ignore: true)
  _$$AlarmModelImplCopyWith<_$AlarmModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
