import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/order/orders_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/pharmacies/pharmacies_bloc.dart';
import 'package:nimble_code_exercise/app/environment/environment.dart';
import 'package:nimble_code_exercise/app/environment/environment_notifier.dart';
import 'package:nimble_code_exercise/app/router/ph_router.dart';
import 'package:nimble_code_exercise/app/theme/ph_theme.dart';
import 'package:nimble_code_exercise/app/user/ph_user.dart';
import 'package:nimble_code_exercise/service/clients/medication_client.dart';
import 'package:nimble_code_exercise/service/clients/pharmacy_client.dart';
import 'package:nimble_code_exercise/service/models/position.dart';
import 'package:provider/provider.dart';

class PharmacyHubApp extends StatelessWidget {
  const PharmacyHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    final pharmacyClient = PharmacyClient.construct();
    final initialEnvironment = Environment(
      pharmacyClient: pharmacyClient,
      medicationClient: MedicationClient.construct(),
    );
    return ChangeNotifierProvider(
      create: (context) =>
          EnvironmentNotifier(initialEnvironment: initialEnvironment),
      child: Provider(
        create: (context) => PHUser(
          const Position(
            latitude: 37.48771670017411,
            longitude: -122.22652739630438,
          ),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => OrdersBloc()..add(FetchOrdersEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  PharmaciesBloc(pharmacyClient)..add(FetchPharmaciesEvent()),
            ),
          ],
          child: MaterialApp.router(
            theme: PhTheme.create(),
            routerConfig: PHRouter().getRouter(),
          ),
        ),
      ),
    );
  }
}
