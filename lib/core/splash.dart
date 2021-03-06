import 'package:flutter/material.dart';
import 'package:web_test/core/app.dart';
import 'package:web_test/db/db.dart';

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
  final db = DB.instance;

  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    db.initialize().then((_) {
      setState(() => isInitialized = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: isInitialized
          ? MyApp(initialUrl: widget.initialUrl)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
