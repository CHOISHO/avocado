import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
class District with _$District {
  const factory District({
    @Default('') @JsonKey(name: 'siNm') String administrativeArea,
    @Default('') @JsonKey(name: 'sggNm') String subLocality,
    @Default('') @JsonKey(name: 'emdNm') String thoroughfare,
    @Default('') @JsonKey(name: 'jibunAddr') String streetAddress,
    @Default('') @JsonKey(name: 'roadAddr') String streetNameAddress,
    @Default('') @JsonKey(name: 'engAddr') String englishStreetNameAddress,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}
