import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
class District with _$District {
  const factory District({
    @Default('') String administrativeArea,
    @Default('') String subLocality,
    @Default('') String thoroughfare,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);
}
