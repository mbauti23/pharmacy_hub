// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyDetails _$PharmacyDetailsFromJson(Map<String, dynamic> json) =>
    PharmacyDetails(
      acceptInvalidAddress: json['acceptInvalidAddress'] as bool?,
      active: json['active'] as bool?,
      address: json['address'] == null
          ? null
          : PharmacyAddress.fromJson(json['address'] as Map<String, dynamic>),
      checkoutPharmacy: json['checkoutPharmacy'] as bool?,
      defaultTimeZone: json['defaultTimeZone'],
      deliverableStates:
          json['deliverableStates'] as List<dynamic>? ?? const [],
      deliverySubsidyAmount: json['deliverySubsidyAmount'],
      id: json['id'] as String?,
      importActive: json['importActive'] as bool?,
      localId: json['localId'] as String?,
      marketplacePharmacy: json['marketplacePharmacy'] as bool?,
      name: json['name'] as String?,
      pharmacist: json['pharmacist'],
      pharmacyChainId: json['pharmacyChainId'] as String?,
      pharmacyHours: json['pharmacyHours'] as String?,
      pharmacyLoginCode: json['pharmacyLoginCode'],
      pharmacySystem: json['pharmacySystem'] as String?,
      pharmacyType: json['pharmacyType'] as String?,
      postalCodes: json['postalCodes'],
      primaryPhoneNumber: json['primaryPhoneNumber'] as String?,
      testPharmacy: json['testPharmacy'] as bool?,
    );

Map<String, dynamic> _$PharmacyDetailsToJson(PharmacyDetails instance) =>
    <String, dynamic>{
      'acceptInvalidAddress': instance.acceptInvalidAddress,
      'active': instance.active,
      'address': instance.address,
      'checkoutPharmacy': instance.checkoutPharmacy,
      'defaultTimeZone': instance.defaultTimeZone,
      'deliverableStates': instance.deliverableStates,
      'deliverySubsidyAmount': instance.deliverySubsidyAmount,
      'id': instance.id,
      'importActive': instance.importActive,
      'localId': instance.localId,
      'marketplacePharmacy': instance.marketplacePharmacy,
      'name': instance.name,
      'pharmacist': instance.pharmacist,
      'pharmacyChainId': instance.pharmacyChainId,
      'pharmacyHours': instance.pharmacyHours,
      'pharmacyLoginCode': instance.pharmacyLoginCode,
      'pharmacySystem': instance.pharmacySystem,
      'pharmacyType': instance.pharmacyType,
      'postalCodes': instance.postalCodes,
      'primaryPhoneNumber': instance.primaryPhoneNumber,
      'testPharmacy': instance.testPharmacy,
    };
