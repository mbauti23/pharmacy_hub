import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nimble_code_exercise/app/bloc/pharmacies/pharmacies_bloc.dart';
import 'package:nimble_code_exercise/app/pages/home/home_screen.dart';
import 'package:nimble_code_exercise/app/router/ph_paths.dart';
import 'package:nimble_code_exercise/app/utils/context_extension.dart';

class HomeScreenRoute extends GoRoute {
  HomeScreenRoute()
      : super(
            path: PharmacyHubPaths.home.path,
            builder: (context, state) => BlocProvider(
                  create: (context) =>
                      PharmaciesBloc(context.getPharmacyClient())
                        ..add(FetchPharmaciesEvent()),
                  child: const HomeScreen(),
                ));
}
