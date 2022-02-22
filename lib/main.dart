import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web_test/core/splash.dart';
import 'package:web_test/models/person.dart';

void main() {
  Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  runApp(const SplashScreen());
}
