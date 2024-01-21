import 'package:flutter/material.dart';
import 'package:nimble_code_exercise/app/environment/environment.dart';
import 'package:nimble_code_exercise/app/environment/environment_notifier.dart';
import 'package:nimble_code_exercise/app/router/ph_router.dart';
import 'package:nimble_code_exercise/service/clients/medication_client.dart';
import 'package:nimble_code_exercise/service/clients/pharmacy_client.dart';
import 'package:provider/provider.dart';

class PharmacyHubApp extends StatelessWidget {
  const PharmacyHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    final initialEnvironment = Environment(
      pharmacyClient: PharmacyClient.construct(),
      medicationClient: MedicationClient.construct(),
    );
    return ChangeNotifierProvider(
      create: (context) =>
          EnvironmentNotifier(initialEnvironment: initialEnvironment),
      child: MaterialApp.router(
        routerConfig: PHRouter().getRouter(),
      ),
    );
  }
}

// Circle View Jan 18
// Des plaines Jan 18
// All Jan 18