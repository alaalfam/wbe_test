import 'package:flutter/material.dart';
import 'package:web_test/db/db.dart';
import 'package:web_test/models/person.dart';

class PersonProvider extends ChangeNotifier {
  final String id;
  final DB db;

  PersonProvider({
    required this.id,
    required this.db,
  }) {
    _initModel();
  }

  Future<void> _initModel() async {
    _person = db.getPersonById(id);
    notifyListeners();
  }

  Person? _person;

  Person? get person => _person;
}
