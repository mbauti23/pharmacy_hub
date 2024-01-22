import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nimble_code_exercise/app/router/ph_paths.dart';
import 'package:nimble_code_exercise/app/router/routes/home_screen_route.dart';
import 'package:nimble_code_exercise/app/router/routes/order_screen_route.dart';
import 'package:nimble_code_exercise/app/router/routes/pharmacy_details_screen_route.dart';

class PHRouter {
  GoRouter getRouter() {
    return GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      initialLocation: PharmacyHubPaths.home.path,
      routes: [
        HomeScreenRoute(),
        PharmacyDetailsRoute(),
        OrderScreenRoute(),
      ],
      errorBuilder: HomeScreenRoute().builder,
    );
  }
}
