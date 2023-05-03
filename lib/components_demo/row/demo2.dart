// Demo of rendering problem inside row. Rendering problem aries if
// Expanded widget removed from the hierarchy.
import 'package:flutter/material.dart';

class RowDemo2 extends StatelessWidget {
  const RowDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Row(
            children: const [
              FlutterLogo(),
              Expanded(
                child: Text(
                    "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
              ),
              Icon(Icons.sentiment_very_satisfied),
            ],
          ),
        ),
      ),
    );
  }
}
