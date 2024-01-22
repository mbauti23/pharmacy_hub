// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmaciesResponse _$PharmaciesResponseFromJson(Map<String, dynamic> json) =>
    PharmaciesResponse(
      pharmacies: (json['pharmacies'] as List<dynamic>?)
              ?.map((e) => Pharmacy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PharmaciesResponseToJson(PharmaciesResponse instance) =>
    <String, dynamic>{
      'pharmacies': instance.pharmacies,
    };
