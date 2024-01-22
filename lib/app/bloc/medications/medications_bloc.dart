import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimble_code_exercise/service/clients/medication_client.dart';

part 'medications_event.dart';
part 'medications_state.dart';

class MedicationsBloc extends Bloc<MedicationsEvent, MedicationsState> {
  MedicationsBloc(this.client) : super(InitialMedicationsState()) {
    on<FetchMedicationsEvent>(_fetchMedications);
  }

  final MedicationClient client;

  Future<void> _fetchMedications(
    FetchMedicationsEvent event,
    Emitter<MedicationsState> emit,
  ) async {
    try {
      emit(LoadingMedicationsState());
      final String medicationsResponse = await client.getMedicationList();
      final medicationsList = medicationsResponse.split(',\n');
      emit(LoadedMedicationsState(medicationsList));
    } catch (e) {
      emit(ErrorMedicationsState());
    }
  }
}
