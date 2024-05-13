// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      administrativeArea: json['siNm'] as String? ?? '',
      subLocality: json['sggNm'] as String? ?? '',
      thoroughfare: json['emdNm'] as String? ?? '',
      streetAddress: json['jibunAddr'] as String? ?? '',
      streetNameAddress: json['roadAddr'] as String? ?? '',
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'siNm': instance.administrativeArea,
      'sggNm': instance.subLocality,
      'emdNm': instance.thoroughfare,
      'jibunAddr': instance.streetAddress,
      'roadAddr': instance.streetNameAddress,
    };
