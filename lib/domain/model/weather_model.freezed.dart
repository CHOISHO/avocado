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
  String get huminity => throw _privateConstructorUsedError;
  String get precipitationPerHour => throw _privateConstructorUsedError;
  String get precipitationProbability => throw _privateConstructorUsedError;
  String get precipitationType => throw _privateConstructorUsedError;
  String get sky => throw _privateConstructorUsedError;
  String get snowPerHour => throw _privateConstructorUsedError;
  String get temperaturePerHour => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  WeatherType get type => throw _privateConstructorUsedError;
  String get wave => throw _privateConstructorUsedError;
  String get windDirection => throw _privateConstructorUsedError;
  String get windSpeed => throw _privateConstructorUsedError;
  String get windSpeedToEastWest => throw _privateConstructorUsedError;
  String get windSpeedToSouthNorth => throw _privateConstructorUsedError;

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
      String huminity,
      String precipitationPerHour,
      String precipitationProbability,
      String precipitationType,
      String sky,
      String snowPerHour,
      String temperaturePerHour,
      String time,
      WeatherType type,
      String wave,
      String windDirection,
      String windSpeed,
      String windSpeedToEastWest,
      String windSpeedToSouthNorth});

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
    Object? huminity = null,
    Object? precipitationPerHour = null,
    Object? precipitationProbability = null,
    Object? precipitationType = null,
    Object? sky = null,
    Object? snowPerHour = null,
    Object? temperaturePerHour = null,
    Object? time = null,
    Object? type = null,
    Object? wave = null,
    Object? windDirection = null,
    Object? windSpeed = null,
    Object? windSpeedToEastWest = null,
    Object? windSpeedToSouthNorth = null,
  }) {
    return _then(_value.copyWith(
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
      huminity: null == huminity
          ? _value.huminity
          : huminity // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationPerHour: null == precipitationPerHour
          ? _value.precipitationPerHour
          : precipitationPerHour // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationProbability: null == precipitationProbability
          ? _value.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationType: null == precipitationType
          ? _value.precipitationType
          : precipitationType // ignore: cast_nullable_to_non_nullable
              as String,
      sky: null == sky
          ? _value.sky
          : sky // ignore: cast_nullable_to_non_nullable
              as String,
      snowPerHour: null == snowPerHour
          ? _value.snowPerHour
          : snowPerHour // ignore: cast_nullable_to_non_nullable
              as String,
      temperaturePerHour: null == temperaturePerHour
          ? _value.temperaturePerHour
          : temperaturePerHour // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WeatherType,
      wave: null == wave
          ? _value.wave
          : wave // ignore: cast_nullable_to_non_nullable
              as String,
      windDirection: null == windDirection
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as String,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as String,
      windSpeedToEastWest: null == windSpeedToEastWest
          ? _value.windSpeedToEastWest
          : windSpeedToEastWest // ignore: cast_nullable_to_non_nullable
              as String,
      windSpeedToSouthNorth: null == windSpeedToSouthNorth
          ? _value.windSpeedToSouthNorth
          : windSpeedToSouthNorth // ignore: cast_nullable_to_non_nullable
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
      String huminity,
      String precipitationPerHour,
      String precipitationProbability,
      String precipitationType,
      String sky,
      String snowPerHour,
      String temperaturePerHour,
      String time,
      WeatherType type,
      String wave,
      String windDirection,
      String windSpeed,
      String windSpeedToEastWest,
      String windSpeedToSouthNorth});

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
    Object? huminity = null,
    Object? precipitationPerHour = null,
    Object? precipitationProbability = null,
    Object? precipitationType = null,
    Object? sky = null,
    Object? snowPerHour = null,
    Object? temperaturePerHour = null,
    Object? time = null,
    Object? type = null,
    Object? wave = null,
    Object? windDirection = null,
    Object? windSpeed = null,
    Object? windSpeedToEastWest = null,
    Object? windSpeedToSouthNorth = null,
  }) {
    return _then(_$WeatherImpl(
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
      huminity: null == huminity
          ? _value.huminity
          : huminity // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationPerHour: null == precipitationPerHour
          ? _value.precipitationPerHour
          : precipitationPerHour // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationProbability: null == precipitationProbability
          ? _value.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationType: null == precipitationType
          ? _value.precipitationType
          : precipitationType // ignore: cast_nullable_to_non_nullable
              as String,
      sky: null == sky
          ? _value.sky
          : sky // ignore: cast_nullable_to_non_nullable
              as String,
      snowPerHour: null == snowPerHour
          ? _value.snowPerHour
          : snowPerHour // ignore: cast_nullable_to_non_nullable
              as String,
      temperaturePerHour: null == temperaturePerHour
          ? _value.temperaturePerHour
          : temperaturePerHour // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WeatherType,
      wave: null == wave
          ? _value.wave
          : wave // ignore: cast_nullable_to_non_nullable
              as String,
      windDirection: null == windDirection
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as String,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as String,
      windSpeedToEastWest: null == windSpeedToEastWest
          ? _value.windSpeedToEastWest
          : windSpeedToEastWest // ignore: cast_nullable_to_non_nullable
              as String,
      windSpeedToSouthNorth: null == windSpeedToSouthNorth
          ? _value.windSpeedToSouthNorth
          : windSpeedToSouthNorth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {this.district = const District(),
      this.huminity = '',
      this.precipitationPerHour = '',
      this.precipitationProbability = '',
      this.precipitationType = '',
      this.sky = '',
      this.snowPerHour = '',
      this.temperaturePerHour = '',
      this.time = '',
      this.type = WeatherType.initial,
      this.wave = '',
      this.windDirection = '',
      this.windSpeed = '',
      this.windSpeedToEastWest = '',
      this.windSpeedToSouthNorth = ''});

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  @JsonKey()
  final District district;
  @override
  @JsonKey()
  final String huminity;
  @override
  @JsonKey()
  final String precipitationPerHour;
  @override
  @JsonKey()
  final String precipitationProbability;
  @override
  @JsonKey()
  final String precipitationType;
  @override
  @JsonKey()
  final String sky;
  @override
  @JsonKey()
  final String snowPerHour;
  @override
  @JsonKey()
  final String temperaturePerHour;
  @override
  @JsonKey()
  final String time;
  @override
  @JsonKey()
  final WeatherType type;
  @override
  @JsonKey()
  final String wave;
  @override
  @JsonKey()
  final String windDirection;
  @override
  @JsonKey()
  final String windSpeed;
  @override
  @JsonKey()
  final String windSpeedToEastWest;
  @override
  @JsonKey()
  final String windSpeedToSouthNorth;

  @override
  String toString() {
    return 'Weather(district: $district, huminity: $huminity, precipitationPerHour: $precipitationPerHour, precipitationProbability: $precipitationProbability, precipitationType: $precipitationType, sky: $sky, snowPerHour: $snowPerHour, temperaturePerHour: $temperaturePerHour, time: $time, type: $type, wave: $wave, windDirection: $windDirection, windSpeed: $windSpeed, windSpeedToEastWest: $windSpeedToEastWest, windSpeedToSouthNorth: $windSpeedToSouthNorth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.huminity, huminity) ||
                other.huminity == huminity) &&
            (identical(other.precipitationPerHour, precipitationPerHour) ||
                other.precipitationPerHour == precipitationPerHour) &&
            (identical(
                    other.precipitationProbability, precipitationProbability) ||
                other.precipitationProbability == precipitationProbability) &&
            (identical(other.precipitationType, precipitationType) ||
                other.precipitationType == precipitationType) &&
            (identical(other.sky, sky) || other.sky == sky) &&
            (identical(other.snowPerHour, snowPerHour) ||
                other.snowPerHour == snowPerHour) &&
            (identical(other.temperaturePerHour, temperaturePerHour) ||
                other.temperaturePerHour == temperaturePerHour) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wave, wave) || other.wave == wave) &&
            (identical(other.windDirection, windDirection) ||
                other.windDirection == windDirection) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windSpeedToEastWest, windSpeedToEastWest) ||
                other.windSpeedToEastWest == windSpeedToEastWest) &&
            (identical(other.windSpeedToSouthNorth, windSpeedToSouthNorth) ||
                other.windSpeedToSouthNorth == windSpeedToSouthNorth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      district,
      huminity,
      precipitationPerHour,
      precipitationProbability,
      precipitationType,
      sky,
      snowPerHour,
      temperaturePerHour,
      time,
      type,
      wave,
      windDirection,
      windSpeed,
      windSpeedToEastWest,
      windSpeedToSouthNorth);

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
      final String huminity,
      final String precipitationPerHour,
      final String precipitationProbability,
      final String precipitationType,
      final String sky,
      final String snowPerHour,
      final String temperaturePerHour,
      final String time,
      final WeatherType type,
      final String wave,
      final String windDirection,
      final String windSpeed,
      final String windSpeedToEastWest,
      final String windSpeedToSouthNorth}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  District get district;
  @override
  String get huminity;
  @override
  String get precipitationPerHour;
  @override
  String get precipitationProbability;
  @override
  String get precipitationType;
  @override
  String get sky;
  @override
  String get snowPerHour;
  @override
  String get temperaturePerHour;
  @override
  String get time;
  @override
  WeatherType get type;
  @override
  String get wave;
  @override
  String get windDirection;
  @override
  String get windSpeed;
  @override
  String get windSpeedToEastWest;
  @override
  String get windSpeedToSouthNorth;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
