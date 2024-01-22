import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nimble_code_exercise/app/pharmacy_hub_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  // For Web URLs
  setPathUrlStrategy();
  runApp(const PharmacyHubApp());
}
