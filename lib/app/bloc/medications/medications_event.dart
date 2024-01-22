part of 'medications_bloc.dart';

sealed class MedicationsEvent {
  const MedicationsEvent();
}

class FetchMedicationsEvent extends MedicationsEvent {}
