import 'package:nimble_code_exercise/service/clients/medication_client.dart';
import 'package:nimble_code_exercise/service/clients/pharmacy_client.dart';

class Environment {
  const Environment({
    required this.pharmacyClient,
    required this.medicationClient,
  });
  final PharmacyClient pharmacyClient;
  final MedicationClient medicationClient;
}
