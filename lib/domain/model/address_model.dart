import 'package:freezed_annotation/freezed_annotation.dart';

part 'Address_model.freezed.dart';
part 'Address_model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String city,
    required String district,
    required String street,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
