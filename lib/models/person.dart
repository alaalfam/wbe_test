import 'package:hive/hive.dart';

part 'person.g.dart';

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

  @HiveField(4)
  final Car car;

  Person({
    required this.id,
    required this.name,
    required this.emailAddress,
    required this.age,
    required this.car,
  });
}

@HiveType(typeId: 1)
class Car extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String year;

  Car({
    required this.id,
    required this.name,
    required this.year,
  });
}
