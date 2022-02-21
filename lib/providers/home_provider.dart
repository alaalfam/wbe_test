import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:web_test/db/db.dart';
import 'package:web_test/models/person.dart';

class HomeProvider extends ChangeNotifier {
  final BuildContext context;
  final idController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final DB db;

  HomeProvider({
    required this.context,
    required this.db,
  });

  void showPersonData() {
    final id = idController.text;
    final fullName = fullNameController.text;
    final emailAddress = emailController.text;
    final age = ageController.text;
    final person = Person(
      id: id,
      name: fullName,
      emailAddress: emailAddress,
      age: int.parse(age),
    );
    if (id.isNotEmpty) {
      db.addPerson(person);
      context.vRouter.to(id);
    }
  }

  void showPersonById() {
    final id = idController.text;
    if (id.isNotEmpty) {
      context.vRouter.to('/$id');
    }
  }
}
