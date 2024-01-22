import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nimble_code_exercise/app/environment/environment.dart';
import 'package:nimble_code_exercise/app/user/ph_user.dart';
import 'package:nimble_code_exercise/service/clients/medication_client.dart';
import 'package:nimble_code_exercise/service/clients/pharmacy_client.dart';
import 'package:nimble_code_exercise/service/models/position.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  Environment? getEnvironment() {
    try {
      return read<Environment>();
    } catch (e) {
      return null;
    }
  }

  PharmacyClient getPharmacyClient() {
    try {
      return getEnvironment()!.pharmacyClient;
    } catch (e) {
      return PharmacyClient.construct();
    }
  }

  MedicationClient getMedicationClient() {
    try {
      return getEnvironment()!.medicationClient;
    } catch (e) {
      return MedicationClient.construct();
    }
  }

  Position? getUserPosition() {
    try {
      return read<PHUser>().position;
    } catch (e) {
      return null;
    }
  }

  void pushScreen(String location) {
    if (kIsWeb) {
      GoRouter.of(this).go(location);
    } else {
      GoRouter.of(this).push(location);
    }
  }

  void popScreen() {
    if (kIsWeb) {
      Navigator.of(this).pop();
    } else {
      GoRouter.of(this).pop();
    }
  }
}
