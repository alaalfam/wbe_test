// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web_test/core/splash.dart';
import 'package:web_test/models/person.dart';

Future<void> main() async {
  final initialUrl = window.location.pathname;
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  runApp(SplashScreen(initialUrl: initialUrl!));
}
