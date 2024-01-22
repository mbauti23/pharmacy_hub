import 'package:equatable/equatable.dart';
import 'package:nimble_code_exercise/app/utils/location_utils.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_details/pharmacy_details.dart';

class PharmacyWithLocation extends Equatable {
  const PharmacyWithLocation({
    this.name,
    this.pharmacyId,
    this.longitude,
    this.latitude,
  });

  final String? name;
  final String? pharmacyId;
  final double? longitude;
  final double? latitude;

  double distanceAwayFrom(double userLong, double userLat) {
    try {
      return LocationUtils.calculateHaversineDistance(
        userLat,
        userLong,
        latitude!,
        longitude!,
      );
    } catch (e) {
      return double.infinity;
    }
  }

  static PharmacyWithLocation fromPharmacyAndDetails(
    PharmacyDetails pharmacyDetails,
  ) {
    return PharmacyWithLocation(
      name: pharmacyDetails.name,
      pharmacyId: pharmacyDetails.id,
      longitude: pharmacyDetails.address?.longitude,
      latitude: pharmacyDetails.address?.latitude,
    );
  }

  @override
  List<Object?> get props => [name, pharmacyId, longitude, latitude];
}
