import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:web_test/pages/home_page.dart';
import 'package:web_test/pages/person_page.dart';

class MyApp extends StatelessWidget {

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      initialUrl: '/',
      mode: VRouterMode.history,
      routes: [
        VWidget(
          path: '/',
          widget: const MyHomePage(),
          stackedRoutes: [
            VWidget.builder(
              path: ':id',
              builder: (context, state) =>
                  PersonPage(id: state.pathParameters['id']!),
            ),
          ],
        ),
        VRouteRedirector(
          path: '*/*',
          redirectTo: '/',
        ),
      ],
    );
  }
}
