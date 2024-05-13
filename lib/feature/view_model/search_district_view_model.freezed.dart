// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_district_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchDistrictViewModelState _$SearchDistrictViewModelStateFromJson(
    Map<String, dynamic> json) {
  return _SearchDistrictViewModelState.fromJson(json);
}

/// @nodoc
mixin _$SearchDistrictViewModelState {
  int get currentPage => throw _privateConstructorUsedError;
  List<District> get districts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchDistrictViewModelStateCopyWith<SearchDistrictViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDistrictViewModelStateCopyWith<$Res> {
  factory $SearchDistrictViewModelStateCopyWith(
          SearchDistrictViewModelState value,
          $Res Function(SearchDistrictViewModelState) then) =
      _$SearchDistrictViewModelStateCopyWithImpl<$Res,
          SearchDistrictViewModelState>;
  @useResult
  $Res call({int currentPage, List<District> districts});
}

/// @nodoc
class _$SearchDistrictViewModelStateCopyWithImpl<$Res,
        $Val extends SearchDistrictViewModelState>
    implements $SearchDistrictViewModelStateCopyWith<$Res> {
  _$SearchDistrictViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? districts = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      districts: null == districts
          ? _value.districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchDistrictViewModelStateImplCopyWith<$Res>
    implements $SearchDistrictViewModelStateCopyWith<$Res> {
  factory _$$SearchDistrictViewModelStateImplCopyWith(
          _$SearchDistrictViewModelStateImpl value,
          $Res Function(_$SearchDistrictViewModelStateImpl) then) =
      __$$SearchDistrictViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, List<District> districts});
}

/// @nodoc
class __$$SearchDistrictViewModelStateImplCopyWithImpl<$Res>
    extends _$SearchDistrictViewModelStateCopyWithImpl<$Res,
        _$SearchDistrictViewModelStateImpl>
    implements _$$SearchDistrictViewModelStateImplCopyWith<$Res> {
  __$$SearchDistrictViewModelStateImplCopyWithImpl(
      _$SearchDistrictViewModelStateImpl _value,
      $Res Function(_$SearchDistrictViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? districts = null,
  }) {
    return _then(_$SearchDistrictViewModelStateImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      districts: null == districts
          ? _value._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchDistrictViewModelStateImpl
    implements _SearchDistrictViewModelState {
  _$SearchDistrictViewModelStateImpl(
      {this.currentPage = 1, final List<District> districts = const []})
      : _districts = districts;

  factory _$SearchDistrictViewModelStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SearchDistrictViewModelStateImplFromJson(json);

  @override
  @JsonKey()
  final int currentPage;
  final List<District> _districts;
  @override
  @JsonKey()
  List<District> get districts {
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districts);
  }

  @override
  String toString() {
    return 'SearchDistrictViewModelState(currentPage: $currentPage, districts: $districts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDistrictViewModelStateImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage,
      const DeepCollectionEquality().hash(_districts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDistrictViewModelStateImplCopyWith<
          _$SearchDistrictViewModelStateImpl>
      get copyWith => __$$SearchDistrictViewModelStateImplCopyWithImpl<
          _$SearchDistrictViewModelStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchDistrictViewModelStateImplToJson(
      this,
    );
  }
}

abstract class _SearchDistrictViewModelState
    implements SearchDistrictViewModelState {
  factory _SearchDistrictViewModelState(
      {final int currentPage,
      final List<District> districts}) = _$SearchDistrictViewModelStateImpl;

  factory _SearchDistrictViewModelState.fromJson(Map<String, dynamic> json) =
      _$SearchDistrictViewModelStateImpl.fromJson;

  @override
  int get currentPage;
  @override
  List<District> get districts;
  @override
  @JsonKey(ignore: true)
  _$$SearchDistrictViewModelStateImplCopyWith<
          _$SearchDistrictViewModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
