part of 'pharmacy_details_bloc.dart';

sealed class PharmacyDetailsEvent {
  const PharmacyDetailsEvent();
}

class FetchPharmacyDetailsEvent extends PharmacyDetailsEvent {
  const FetchPharmacyDetailsEvent(this.pharmacyId);
  final String pharmacyId;
}
