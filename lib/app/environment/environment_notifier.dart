import 'package:flutter/material.dart';
import 'package:nimble_code_exercise/app/environment/environment.dart';

class EnvironmentNotifier extends ChangeNotifier {
  EnvironmentNotifier({required Environment initialEnvironment})
      : environment = initialEnvironment;

  Environment environment;

  updateEnvironment(Environment newEnvironment) {
    environment = newEnvironment;
    notifyListeners();
  }
}
