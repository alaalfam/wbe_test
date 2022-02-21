import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_test/db/db.dart';
import 'package:web_test/providers/home_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(
        context: context,
        db: DB.instance,
      ),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Flutter Demo Home Page'),
          ),
          body: LayoutBuilder(
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
                            controller:
                                context.watch<HomeProvider>().idController,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  label: Text('Full name'),
                                  border: OutlineInputBorder(),
                                ),
                                controller: context
                                    .watch<HomeProvider>()
                                    .fullNameController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  label: Text('Email address'),
                                  border: OutlineInputBorder(),
                                ),
                                controller: context
                                    .watch<HomeProvider>()
                                    .emailController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  label: Text('age'),
                                  border: OutlineInputBorder(),
                                ),
                                controller:
                                    context.watch<HomeProvider>().ageController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed:
                              context.watch<HomeProvider>().showPersonData,
                          child: const Text('Register a person'),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed:
                              context.watch<HomeProvider>().showPersonById,
                          child: const Text('Show a person by Id'),
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
