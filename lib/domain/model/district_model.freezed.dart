// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  String get administrativeArea => throw _privateConstructorUsedError;
  String get subLocality => throw _privateConstructorUsedError;
  String get thoroughfare => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call(
      {String administrativeArea, String subLocality, String thoroughfare});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? administrativeArea = null,
    Object? subLocality = null,
    Object? thoroughfare = null,
  }) {
    return _then(_value.copyWith(
      administrativeArea: null == administrativeArea
          ? _value.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String,
      subLocality: null == subLocality
          ? _value.subLocality
          : subLocality // ignore: cast_nullable_to_non_nullable
              as String,
      thoroughfare: null == thoroughfare
          ? _value.thoroughfare
          : thoroughfare // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictImplCopyWith<$Res>
    implements $DistrictCopyWith<$Res> {
  factory _$$DistrictImplCopyWith(
          _$DistrictImpl value, $Res Function(_$DistrictImpl) then) =
      __$$DistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String administrativeArea, String subLocality, String thoroughfare});
}

/// @nodoc
class __$$DistrictImplCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$DistrictImpl>
    implements _$$DistrictImplCopyWith<$Res> {
  __$$DistrictImplCopyWithImpl(
      _$DistrictImpl _value, $Res Function(_$DistrictImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? administrativeArea = null,
    Object? subLocality = null,
    Object? thoroughfare = null,
  }) {
    return _then(_$DistrictImpl(
      administrativeArea: null == administrativeArea
          ? _value.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String,
      subLocality: null == subLocality
          ? _value.subLocality
          : subLocality // ignore: cast_nullable_to_non_nullable
              as String,
      thoroughfare: null == thoroughfare
          ? _value.thoroughfare
          : thoroughfare // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictImpl implements _District {
  const _$DistrictImpl(
      {required this.administrativeArea,
      required this.subLocality,
      required this.thoroughfare});

  factory _$DistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictImplFromJson(json);

  @override
  final String administrativeArea;
  @override
  final String subLocality;
  @override
  final String thoroughfare;

  @override
  String toString() {
    return 'District(administrativeArea: $administrativeArea, subLocality: $subLocality, thoroughfare: $thoroughfare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictImpl &&
            (identical(other.administrativeArea, administrativeArea) ||
                other.administrativeArea == administrativeArea) &&
            (identical(other.subLocality, subLocality) ||
                other.subLocality == subLocality) &&
            (identical(other.thoroughfare, thoroughfare) ||
                other.thoroughfare == thoroughfare));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, administrativeArea, subLocality, thoroughfare);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      __$$DistrictImplCopyWithImpl<_$DistrictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictImplToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District(
      {required final String administrativeArea,
      required final String subLocality,
      required final String thoroughfare}) = _$DistrictImpl;

  factory _District.fromJson(Map<String, dynamic> json) =
      _$DistrictImpl.fromJson;

  @override
  String get administrativeArea;
  @override
  String get subLocality;
  @override
  String get thoroughfare;
  @override
  @JsonKey(ignore: true)
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
