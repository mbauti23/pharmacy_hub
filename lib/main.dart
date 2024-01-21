import 'package:flutter/material.dart';
import 'package:nimble_code_exercise/app/pharmacy_hub_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const PharmacyHubApp());
}
