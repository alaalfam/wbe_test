import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web_test/models/person.dart';

class DB {
  static final DB instance = DB._();
  DB._();
  static const boxName = 'person';
  
  late Box<Person> personDB;
  Future<void> initialize() async {
    personDB = await openHiveBox(boxName);
    // personDB = await Hive.openBox<Person>('person');
  }

  Person? getPersonById(final String id) {
    return personDB.get(id);
  }

  void addPerson(final Person person) {
    personDB.put(person.id, person);
  }

  int get personCount => personDB.length;

  void dispose() {
    personDB.close();
  }

  Future<Box<Person>> openHiveBox(String boxName) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    return await Hive.openBox(boxName);
  }
}
