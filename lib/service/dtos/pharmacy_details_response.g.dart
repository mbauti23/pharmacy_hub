// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyDetailsResponse _$PharmacyDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PharmacyDetailsResponse(
      details: json['details'] as String?,
      generatedTs: json['generatedTs'] as String?,
      href: json['href'] as String?,
      responseCode: json['responseCode'] as String?,
      value: json['value'] == null
          ? null
          : PharmacyDetails.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PharmacyDetailsResponseToJson(
        PharmacyDetailsResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
      'generatedTs': instance.generatedTs,
      'href': instance.href,
      'responseCode': instance.responseCode,
      'value': instance.value,
    };
