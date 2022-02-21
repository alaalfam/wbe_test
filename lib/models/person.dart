import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String emailAddress;

  @HiveField(3)
  final int age;

  Person({
    required this.id,
    required this.name,
    required this.emailAddress,
    required this.age,
  });
}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  Person read(BinaryReader reader) {
    return Person(
      id: reader.read(),
      name: reader.read(),
      emailAddress: reader.read(),
      age: reader.read(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Person obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.emailAddress);
    writer.write(obj.age);
  }
}
