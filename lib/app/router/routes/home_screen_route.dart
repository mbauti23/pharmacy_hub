import 'package:go_router/go_router.dart';
import 'package:nimble_code_exercise/app/pages/home/home_screen.dart';
import 'package:nimble_code_exercise/app/router/ph_paths.dart';

class HomeScreenRoute extends GoRoute {
  HomeScreenRoute()
      : super(
          path: PharmacyHubPaths.home.path,
          builder: (context, state) => const HomeScreen(),
        );
}
