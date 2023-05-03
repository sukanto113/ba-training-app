// Demo of textDirection property of Row
import 'package:flutter/material.dart';

class RowDemo3 extends StatelessWidget {
  const RowDemo3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Row(
            textDirection: TextDirection.rtl,
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
