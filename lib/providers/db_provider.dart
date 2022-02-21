import 'package:flutter/material.dart';
import 'package:web_test/db/db.dart';

class DBProvider extends ChangeNotifier {
  final db = DB.instance;

  Future<void> initialize() async {
    await db.initialize();
  }
}
