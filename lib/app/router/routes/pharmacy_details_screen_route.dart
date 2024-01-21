import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nimble_code_exercise/app/bloc/pharmacy_details/pharmacy_details_bloc.dart';
import 'package:nimble_code_exercise/app/pages/pharmacy_details/pharmacy_details_screen.dart';
import 'package:nimble_code_exercise/app/router/ph_paths.dart';
import 'package:nimble_code_exercise/app/utils/context_extension.dart';

class PharmacyDetailsRoute extends GoRoute {
  PharmacyDetailsRoute()
      : super(
            path: PharmacyHubPaths.pharmacyDetails.path,
            builder: (context, state) => BlocProvider(
                  create: (context) =>
                      PharmacyDetailsBloc(context.getPharmacyClient())
                        ..add(FetchPharmacyDetailsEvent(
                            state.pathParameters['pharmacyId'] ?? '')),
                  child: const PharmacyDetailsScreen(),
                ));
}
