import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
class District with _$District {
  const factory District({
    required String administrativeArea,
    required String subLocality,
    required String thoroughfare,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);
}
