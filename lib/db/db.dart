import 'package:web_test/models/person.dart';

class DB {
  static final DB instance = DB._();
  DB._();

  final Map<String, Person> _personStorage = {};
  
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    final localDB = <String, Person>{};
    _personStorage.addAll(localDB);
  }

  Person? getPersonById(final String id) {
    return _personStorage[id];
  }

  void addPerson(final Person person) {
    _personStorage.addAll({person.id: person});
  }
}
