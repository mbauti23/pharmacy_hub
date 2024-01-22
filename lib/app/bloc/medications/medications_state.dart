part of 'medications_bloc.dart';

sealed class MedicationsState extends Equatable {
  const MedicationsState();

  @override
  List<Object?> get props => [];
}

final class InitialMedicationsState extends MedicationsState {}

final class LoadingMedicationsState extends MedicationsState {}

final class LoadedMedicationsState extends MedicationsState {
  const LoadedMedicationsState(this.medications);
  final List<String> medications;

  @override
  List<Object?> get props => [medications];
}

final class ErrorMedicationsState extends MedicationsState {}
