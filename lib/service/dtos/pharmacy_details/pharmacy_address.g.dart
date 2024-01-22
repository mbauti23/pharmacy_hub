// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyAddress _$PharmacyAddressFromJson(Map<String, dynamic> json) =>
    PharmacyAddress(
      addressType: json['addressType'] as String?,
      city: json['city'] as String?,
      externalId: json['externalId'] as String?,
      googlePlaceId: json['googlePlaceId'] as String?,
      isValid: json['isValid'] as bool?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      postalCode: json['postalCode'] as String?,
      streetAddress1: json['streetAddress1'] as String?,
      streetAddress2: json['streetAddress2'] as String?,
      usTerritory: json['usTerritory'] as String?,
    );

Map<String, dynamic> _$PharmacyAddressToJson(PharmacyAddress instance) =>
    <String, dynamic>{
      'addressType': instance.addressType,
      'city': instance.city,
      'externalId': instance.externalId,
      'googlePlaceId': instance.googlePlaceId,
      'isValid': instance.isValid,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'postalCode': instance.postalCode,
      'streetAddress1': instance.streetAddress1,
      'streetAddress2': instance.streetAddress2,
      'usTerritory': instance.usTerritory,
    };
