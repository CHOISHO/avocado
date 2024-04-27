// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  District get district => throw _privateConstructorUsedError;
  String get temperature => throw _privateConstructorUsedError;
  String get precipitationProbability => throw _privateConstructorUsedError;
  String get precipitation => throw _privateConstructorUsedError;
  String get huminity => throw _privateConstructorUsedError;
  String get baseTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {District district,
      String temperature,
      String precipitationProbability,
      String precipitation,
      String huminity,
      String baseTime});

  $DistrictCopyWith<$Res> get district;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? district = null,
    Object? temperature = null,
    Object? precipitationProbability = null,
    Object? precipitation = null,
    Object? huminity = null,
    Object? baseTime = null,
  }) {
    return _then(_value.copyWith(
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationProbability: null == precipitationProbability
          ? _value.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as String,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as String,
      huminity: null == huminity
          ? _value.huminity
          : huminity // ignore: cast_nullable_to_non_nullable
              as String,
      baseTime: null == baseTime
          ? _value.baseTime
          : baseTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res> get district {
    return $DistrictCopyWith<$Res>(_value.district, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {District district,
      String temperature,
      String precipitationProbability,
      String precipitation,
      String huminity,
      String baseTime});

  @override
  $DistrictCopyWith<$Res> get district;
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? district = null,
    Object? temperature = null,
    Object? precipitationProbability = null,
    Object? precipitation = null,
    Object? huminity = null,
    Object? baseTime = null,
  }) {
    return _then(_$WeatherImpl(
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationProbability: null == precipitationProbability
          ? _value.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as String,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as String,
      huminity: null == huminity
          ? _value.huminity
          : huminity // ignore: cast_nullable_to_non_nullable
              as String,
      baseTime: null == baseTime
          ? _value.baseTime
          : baseTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {this.district = const District(),
      this.temperature = '',
      this.precipitationProbability = '',
      this.precipitation = '',
      this.huminity = '',
      this.baseTime = ''});

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  @JsonKey()
  final District district;
  @override
  @JsonKey()
  final String temperature;
  @override
  @JsonKey()
  final String precipitationProbability;
  @override
  @JsonKey()
  final String precipitation;
  @override
  @JsonKey()
  final String huminity;
  @override
  @JsonKey()
  final String baseTime;

  @override
  String toString() {
    return 'Weather(district: $district, temperature: $temperature, precipitationProbability: $precipitationProbability, precipitation: $precipitation, huminity: $huminity, baseTime: $baseTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(
                    other.precipitationProbability, precipitationProbability) ||
                other.precipitationProbability == precipitationProbability) &&
            (identical(other.precipitation, precipitation) ||
                other.precipitation == precipitation) &&
            (identical(other.huminity, huminity) ||
                other.huminity == huminity) &&
            (identical(other.baseTime, baseTime) ||
                other.baseTime == baseTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, district, temperature,
      precipitationProbability, precipitation, huminity, baseTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {final District district,
      final String temperature,
      final String precipitationProbability,
      final String precipitation,
      final String huminity,
      final String baseTime}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  District get district;
  @override
  String get temperature;
  @override
  String get precipitationProbability;
  @override
  String get precipitation;
  @override
  String get huminity;
  @override
  String get baseTime;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
