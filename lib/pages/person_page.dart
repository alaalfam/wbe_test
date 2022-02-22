import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_test/db/db.dart';
import 'package:web_test/providers/person_provider.dart';

class PersonPage extends StatelessWidget {
  final String id;

  const PersonPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PersonProvider(
        context: context,
        id: id,
        db: DB.instance,
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
              : LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                          minWidth: constraints.maxWidth,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  decoration: const InputDecoration(
                                    label: Text('ID'),
                                    border: OutlineInputBorder(),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(' ')
                                  ],
                                  controller: context
                                      .watch<PersonProvider>()
                                      .idController,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: context
                                    .watch<PersonProvider>()
                                    .showPersonById,
                                child: const Text('Show a person by Id'),
                              ),
                              const SizedBox(height: 250),
                              Row(
                                children: [
                                  Column(
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
                                  Column(
                                    children: [
                                      Text(person.car.id),
                                      const SizedBox(height: 16),
                                      Text(person.car.name),
                                      const SizedBox(height: 16),
                                      Text(person.car.year),
                                      const SizedBox(height: 16),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
