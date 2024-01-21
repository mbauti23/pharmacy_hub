import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_address.g.dart';

@JsonSerializable()
class PharmacyAddress extends Equatable {
  const PharmacyAddress({
    this.addressType,
    this.city,
    this.externalId,
    this.googlePlaceId,
    this.isValid,
    this.latitude,
    this.longitude,
    this.postalCode,
    this.streetAddress1,
    this.streetAddress2,
    this.usTerritory,
  });

  final String? addressType;
  final String? city;
  final String? externalId;
  final String? googlePlaceId;
  final bool? isValid;
  final double? latitude;
  final double? longitude;
  final String? postalCode;
  final String? streetAddress1;
  final String? streetAddress2;
  final String? usTerritory;

  factory PharmacyAddress.fromJson(Map<String, dynamic> json) =>
      _$PharmacyAddressFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyAddressToJson(this);

  @override
  List<Object?> get props => [
        addressType,
        city,
        externalId,
        googlePlaceId,
        isValid,
        latitude,
        longitude,
        postalCode,
        streetAddress1,
        streetAddress2,
        usTerritory,
      ];
}
