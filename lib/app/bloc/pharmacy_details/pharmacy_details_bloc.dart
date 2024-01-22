import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nimble_code_exercise/service/clients/pharmacy_client.dart';
import 'package:nimble_code_exercise/service/dtos/pharmacy_details/pharmacy_details.dart';

part 'pharmacy_details_event.dart';
part 'pharmacy_details_state.dart';

class PharmacyDetailsBloc
    extends Bloc<PharmacyDetailsEvent, PharmacyDetailsState> {
  PharmacyDetailsBloc(this.pharmacyClient)
      : super(InitialPharmacyDetailsState()) {
    on<FetchPharmacyDetailsEvent>(_fetchPharmacyDetails);
  }

  final PharmacyClient pharmacyClient;

  Future<void> _fetchPharmacyDetails(
    FetchPharmacyDetailsEvent event,
    Emitter<PharmacyDetailsState> emit,
  ) async {
    try {
      emit(LoadingPharmacyDetailsState());
      final response =
          await pharmacyClient.getPharmacyDetailsResponse(event.pharmacyId);
      emit(LoadedPharmacyDetailsState(response.value!));
    } catch (e) {
      emit(ErrorPharmacyDetailsState());
    }
  }
}
