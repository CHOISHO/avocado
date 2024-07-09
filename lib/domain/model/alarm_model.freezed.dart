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
  String? get id => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;
  District? get district1 => throw _privateConstructorUsedError;
  District? get district2 => throw _privateConstructorUsedError;
  District? get district3 => throw _privateConstructorUsedError;
  AlarmPeriodType get period => throw _privateConstructorUsedError;
  DateTime? get customPeriod => throw _privateConstructorUsedError;
  bool get isActivated => throw _privateConstructorUsedError;

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
      {String? id,
      int? time,
      District? district1,
      District? district2,
      District? district3,
      AlarmPeriodType period,
      DateTime? customPeriod,
      bool isActivated});

  $DistrictCopyWith<$Res>? get district1;
  $DistrictCopyWith<$Res>? get district2;
  $DistrictCopyWith<$Res>? get district3;
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
    Object? id = freezed,
    Object? time = freezed,
    Object? district1 = freezed,
    Object? district2 = freezed,
    Object? district3 = freezed,
    Object? period = null,
    Object? customPeriod = freezed,
    Object? isActivated = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      district1: freezed == district1
          ? _value.district1
          : district1 // ignore: cast_nullable_to_non_nullable
              as District?,
      district2: freezed == district2
          ? _value.district2
          : district2 // ignore: cast_nullable_to_non_nullable
              as District?,
      district3: freezed == district3
          ? _value.district3
          : district3 // ignore: cast_nullable_to_non_nullable
              as District?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AlarmPeriodType,
      customPeriod: freezed == customPeriod
          ? _value.customPeriod
          : customPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district1 {
    if (_value.district1 == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district1!, (value) {
      return _then(_value.copyWith(district1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district2 {
    if (_value.district2 == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district2!, (value) {
      return _then(_value.copyWith(district2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district3 {
    if (_value.district3 == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district3!, (value) {
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
      {String? id,
      int? time,
      District? district1,
      District? district2,
      District? district3,
      AlarmPeriodType period,
      DateTime? customPeriod,
      bool isActivated});

  @override
  $DistrictCopyWith<$Res>? get district1;
  @override
  $DistrictCopyWith<$Res>? get district2;
  @override
  $DistrictCopyWith<$Res>? get district3;
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
    Object? id = freezed,
    Object? time = freezed,
    Object? district1 = freezed,
    Object? district2 = freezed,
    Object? district3 = freezed,
    Object? period = null,
    Object? customPeriod = freezed,
    Object? isActivated = null,
  }) {
    return _then(_$AlarmModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      district1: freezed == district1
          ? _value.district1
          : district1 // ignore: cast_nullable_to_non_nullable
              as District?,
      district2: freezed == district2
          ? _value.district2
          : district2 // ignore: cast_nullable_to_non_nullable
              as District?,
      district3: freezed == district3
          ? _value.district3
          : district3 // ignore: cast_nullable_to_non_nullable
              as District?,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AlarmPeriodType,
      customPeriod: freezed == customPeriod
          ? _value.customPeriod
          : customPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlarmModelImpl implements _AlarmModel {
  const _$AlarmModelImpl(
      {this.id = null,
      this.time = null,
      this.district1 = null,
      this.district2 = null,
      this.district3 = null,
      this.period = AlarmPeriodType.everyday,
      this.customPeriod = null,
      this.isActivated = true});

  factory _$AlarmModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlarmModelImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final int? time;
  @override
  @JsonKey()
  final District? district1;
  @override
  @JsonKey()
  final District? district2;
  @override
  @JsonKey()
  final District? district3;
  @override
  @JsonKey()
  final AlarmPeriodType period;
  @override
  @JsonKey()
  final DateTime? customPeriod;
  @override
  @JsonKey()
  final bool isActivated;

  @override
  String toString() {
    return 'AlarmModel(id: $id, time: $time, district1: $district1, district2: $district2, district3: $district3, period: $period, customPeriod: $customPeriod, isActivated: $isActivated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.district1, district1) ||
                other.district1 == district1) &&
            (identical(other.district2, district2) ||
                other.district2 == district2) &&
            (identical(other.district3, district3) ||
                other.district3 == district3) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.customPeriod, customPeriod) ||
                other.customPeriod == customPeriod) &&
            (identical(other.isActivated, isActivated) ||
                other.isActivated == isActivated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, time, district1, district2,
      district3, period, customPeriod, isActivated);

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
      {final String? id,
      final int? time,
      final District? district1,
      final District? district2,
      final District? district3,
      final AlarmPeriodType period,
      final DateTime? customPeriod,
      final bool isActivated}) = _$AlarmModelImpl;

  factory _AlarmModel.fromJson(Map<String, dynamic> json) =
      _$AlarmModelImpl.fromJson;

  @override
  String? get id;
  @override
  int? get time;
  @override
  District? get district1;
  @override
  District? get district2;
  @override
  District? get district3;
  @override
  AlarmPeriodType get period;
  @override
  DateTime? get customPeriod;
  @override
  bool get isActivated;
  @override
  @JsonKey(ignore: true)
  _$$AlarmModelImplCopyWith<_$AlarmModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlarmWeatherModel _$AlarmWeatherModelFromJson(Map<String, dynamic> json) {
  return _AlarmWeatherModel.fromJson(json);
}

/// @nodoc
mixin _$AlarmWeatherModel {
  String get district => throw _privateConstructorUsedError;
  List<Weather>? get data => throw _privateConstructorUsedError;
  bool get needUmbrella => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmWeatherModelCopyWith<AlarmWeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmWeatherModelCopyWith<$Res> {
  factory $AlarmWeatherModelCopyWith(
          AlarmWeatherModel value, $Res Function(AlarmWeatherModel) then) =
      _$AlarmWeatherModelCopyWithImpl<$Res, AlarmWeatherModel>;
  @useResult
  $Res call({String district, List<Weather>? data, bool needUmbrella});
}

/// @nodoc
class _$AlarmWeatherModelCopyWithImpl<$Res, $Val extends AlarmWeatherModel>
    implements $AlarmWeatherModelCopyWith<$Res> {
  _$AlarmWeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? district = null,
    Object? data = freezed,
    Object? needUmbrella = null,
  }) {
    return _then(_value.copyWith(
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Weather>?,
      needUmbrella: null == needUmbrella
          ? _value.needUmbrella
          : needUmbrella // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlarmWeatherModelImplCopyWith<$Res>
    implements $AlarmWeatherModelCopyWith<$Res> {
  factory _$$AlarmWeatherModelImplCopyWith(_$AlarmWeatherModelImpl value,
          $Res Function(_$AlarmWeatherModelImpl) then) =
      __$$AlarmWeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String district, List<Weather>? data, bool needUmbrella});
}

/// @nodoc
class __$$AlarmWeatherModelImplCopyWithImpl<$Res>
    extends _$AlarmWeatherModelCopyWithImpl<$Res, _$AlarmWeatherModelImpl>
    implements _$$AlarmWeatherModelImplCopyWith<$Res> {
  __$$AlarmWeatherModelImplCopyWithImpl(_$AlarmWeatherModelImpl _value,
      $Res Function(_$AlarmWeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? district = null,
    Object? data = freezed,
    Object? needUmbrella = null,
  }) {
    return _then(_$AlarmWeatherModelImpl(
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Weather>?,
      needUmbrella: null == needUmbrella
          ? _value.needUmbrella
          : needUmbrella // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlarmWeatherModelImpl implements _AlarmWeatherModel {
  _$AlarmWeatherModelImpl(
      {this.district = '',
      final List<Weather>? data = null,
      this.needUmbrella = false})
      : _data = data;

  factory _$AlarmWeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlarmWeatherModelImplFromJson(json);

  @override
  @JsonKey()
  final String district;
  final List<Weather>? _data;
  @override
  @JsonKey()
  List<Weather>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool needUmbrella;

  @override
  String toString() {
    return 'AlarmWeatherModel(district: $district, data: $data, needUmbrella: $needUmbrella)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmWeatherModelImpl &&
            (identical(other.district, district) ||
                other.district == district) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.needUmbrella, needUmbrella) ||
                other.needUmbrella == needUmbrella));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, district,
      const DeepCollectionEquality().hash(_data), needUmbrella);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmWeatherModelImplCopyWith<_$AlarmWeatherModelImpl> get copyWith =>
      __$$AlarmWeatherModelImplCopyWithImpl<_$AlarmWeatherModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlarmWeatherModelImplToJson(
      this,
    );
  }
}

abstract class _AlarmWeatherModel implements AlarmWeatherModel {
  factory _AlarmWeatherModel(
      {final String district,
      final List<Weather>? data,
      final bool needUmbrella}) = _$AlarmWeatherModelImpl;

  factory _AlarmWeatherModel.fromJson(Map<String, dynamic> json) =
      _$AlarmWeatherModelImpl.fromJson;

  @override
  String get district;
  @override
  List<Weather>? get data;
  @override
  bool get needUmbrella;
  @override
  @JsonKey(ignore: true)
  _$$AlarmWeatherModelImplCopyWith<_$AlarmWeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
