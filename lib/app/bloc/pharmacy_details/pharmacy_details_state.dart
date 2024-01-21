part of 'pharmacy_details_bloc.dart';

sealed class PharmacyDetailsState extends Equatable {
  const PharmacyDetailsState();

  @override
  List<Object?> get props => [];
}

final class InitialPharmacyDetailsState extends PharmacyDetailsState {}

final class LoadingPharmacyDetailsState extends PharmacyDetailsState {}

final class LoadedPharmacyDetailsState extends PharmacyDetailsState {
  const LoadedPharmacyDetailsState(this.pharmacyDetails);
  final PharmacyDetails pharmacyDetails;

  @override
  List<Object?> get props => [pharmacyDetails];
}

final class ErrorPharmacyDetailsState extends PharmacyDetailsState {}
