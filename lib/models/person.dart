import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Person {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String emailAddress;

  @HiveField(3)
  final int age;

  const Person({
    required this.id,
    required this.name,
    required this.emailAddress,
    required this.age,
  });
}
