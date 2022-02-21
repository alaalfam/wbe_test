import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/core/app.dart';
import 'package:web_test/providers/db_provider.dart';

class SplashScreen extends StatefulWidget {
  final String initialUrl;

  const SplashScreen({
    Key? key,
    required this.initialUrl,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final dbProvider = DBProvider();

  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    dbProvider.initialize().then((_) {
      setState(() => isInitialized = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: dbProvider,
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: isInitialized
            ? MyApp(initialUrl: widget.initialUrl)
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
