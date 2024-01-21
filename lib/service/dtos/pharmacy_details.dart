import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_address.dart';

part 'pharmacy_details.g.dart';

@JsonSerializable()
class PharmacyDetails extends Equatable {
  const PharmacyDetails({
    this.acceptInvalidAddress,
    this.active,
    this.address,
    this.checkoutPharmacy,
    this.defaultTimeZone,
    this.deliverableStates = const [],
    this.deliverySubsidyAmount,
    this.id,
    this.importActive,
    this.localId,
    this.marketplacePharmacy,
    this.name,
    this.pharmacist,
    this.pharmacyChainId,
    this.pharmacyHours,
    this.pharmacyLoginCode,
    this.pharmacySystem,
    this.pharmacyType,
    this.postalCodes,
    this.primaryPhoneNumber,
    this.testPharmacy,
  });

  final bool? acceptInvalidAddress;
  final bool? active;
  final PharmacyAddress? address;
  final bool? checkoutPharmacy;
  // TODO - Reach out to BE team to confirm type
  final dynamic defaultTimeZone;
  // type?
  final List<dynamic> deliverableStates;
  // type?
  final dynamic deliverySubsidyAmount;
  final String? id;
  final bool? importActive;
  final String? localId;
  final bool? marketplacePharmacy;
  final String? name;
  // type?
  final dynamic pharmacist;
  final String? pharmacyChainId;
  final String? pharmacyHours;
  final dynamic pharmacyLoginCode;
  final String? pharmacySystem;
  final String? pharmacyType;
  final dynamic postalCodes;
  final String? primaryPhoneNumber;
  final bool? testPharmacy;

  factory PharmacyDetails.fromJson(Map<String, dynamic> json) =>
      _$PharmacyDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyDetailsToJson(this);

  @override
  List<Object?> get props => [
        acceptInvalidAddress,
        active,
        address,
        checkoutPharmacy,
        defaultTimeZone,
        deliverableStates,
        deliverySubsidyAmount,
        id,
        importActive,
        localId,
        marketplacePharmacy,
        name,
        pharmacist,
        pharmacyChainId,
        pharmacyHours,
        pharmacyLoginCode,
        pharmacySystem,
        pharmacyType,
        postalCodes,
        primaryPhoneNumber,
        testPharmacy,
      ];
}
