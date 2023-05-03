import 'package:flutter/material.dart';

class RenderingProblemDemo1 extends StatelessWidget {
  const RenderingProblemDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: const [
                FlutterLogo(),
                Text(
                    "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                Icon(Icons.sentiment_very_satisfied),
              ],
            ),
            Row(
              children: const [
                FlutterLogo(),
                Expanded(
                  child: Text(
                      "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                ),
                Icon(Icons.sentiment_very_satisfied),
              ],
            )
          ],
        ),
      ),
    );
  }
}
