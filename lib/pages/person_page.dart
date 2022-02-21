import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/providers/db_provider.dart';
import 'package:web_test/providers/person_provider.dart';

class PersonPage extends StatelessWidget {
  final String id;

  const PersonPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonProvider(
        id: id,
        db: context.read<DBProvider>().db,
      ),
      builder: (context, _) {
        final person = context.watch<PersonProvider>().person;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Flutter Demo ID Page'),
          ),
          body: (person == null)
              ? const Center(
                  child: Text('Loading...'),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(person.id),
                      const SizedBox(height: 16),
                      Text(person.name),
                      const SizedBox(height: 16),
                      Text(person.emailAddress),
                      const SizedBox(height: 16),
                      Text(person.age.toString()),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
