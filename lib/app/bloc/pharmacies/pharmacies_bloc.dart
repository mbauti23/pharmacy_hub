import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimble_code_exercise/service/clients/pharmacy_client.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy.dart';

part 'pharmacies_event.dart';
part 'pharmacies_state.dart';

class PharmaciesBloc extends Bloc<PharmaciesEvent, PharmaciesState> {
  PharmaciesBloc(this.client) : super(InitialPharmaciesState()) {
    on<FetchPharmaciesEvent>(_fetchPharmacies);
  }

  final PharmacyClient client;

  Future<void> _fetchPharmacies(
      FetchPharmaciesEvent event, Emitter<PharmaciesState> emit) async {
    try {
      emit(LoadingPharmaciesState());
      final pharmaciesResponse = await client.getPharmaciesResponse();
      emit(LoadedPharmaciesState(pharmaciesResponse.pharmacies));
    } catch (e) {
      emit(ErrorPharmaciesState());
    }
  }
}
