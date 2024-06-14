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
      englishStreetNameAddress: json['engAddr'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toInt() ?? null,
      longitude: (json['longitude'] as num?)?.toInt() ?? null,
      x: (json['x'] as num?)?.toInt() ?? null,
      y: (json['y'] as num?)?.toInt() ?? null,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'siNm': instance.administrativeArea,
      'sggNm': instance.subLocality,
      'emdNm': instance.thoroughfare,
      'jibunAddr': instance.streetAddress,
      'roadAddr': instance.streetNameAddress,
      'engAddr': instance.englishStreetNameAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'x': instance.x,
      'y': instance.y,
    };
