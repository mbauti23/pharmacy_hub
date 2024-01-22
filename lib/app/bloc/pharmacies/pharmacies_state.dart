part of 'pharmacies_bloc.dart';

sealed class PharmaciesState extends Equatable {
  const PharmaciesState();

  @override
  List<Object?> get props => [];
}

final class InitialPharmaciesState extends PharmaciesState {}

final class LoadingPharmaciesState extends PharmaciesState {}

final class LoadedPharmaciesState extends PharmaciesState {
  const LoadedPharmaciesState(this.pharmacies);
  final List<PharmacyWithLocation> pharmacies;

  @override
  List<Object?> get props => [pharmacies];
}

final class ErrorPharmaciesState extends PharmaciesState {}
