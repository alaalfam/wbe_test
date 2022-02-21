import 'package:hive/hive.dart';
import 'package:web_test/models/person.dart';

class DB {
  static final DB instance = DB._();
  DB._();

  late Box<Person> personDB;
  Future<void> initialize() async {
    personDB = await Hive.openBox<Person>('person');
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
}
