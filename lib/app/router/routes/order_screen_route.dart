import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nimble_code_exercise/app/bloc/medications/medications_bloc.dart';
import 'package:nimble_code_exercise/app/bloc/medications/selections/selections_cubit.dart';
import 'package:nimble_code_exercise/app/pages/order/order_screen.dart';
import 'package:nimble_code_exercise/app/router/ph_paths.dart';
import 'package:nimble_code_exercise/app/utils/context_extension.dart';

class OrderScreenRoute extends GoRoute {
  OrderScreenRoute()
      : super(
          path: PharmacyHubPaths.order.path,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) =>
                    MedicationsBloc(context.getMedicationClient())
                      ..add(FetchMedicationsEvent()),
              ),
              BlocProvider(
                create: (context) => SelectionsCubit(),
              ),
            ],
            child: OrderScreen(
              pharmacyId: state.pathParameters['pharmacyId'],
            ),
          ),
        );
}
