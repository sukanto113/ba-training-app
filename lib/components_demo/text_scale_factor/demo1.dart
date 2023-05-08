
import 'package:flutter/material.dart';

class ScaleFactorDemo extends StatelessWidget {
  const ScaleFactorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DemoWidget(),
      ),
    );
  }
}

class DemoWidget extends StatelessWidget {
  const DemoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).textScaleFactor.clamp(0.8, 0.9);
    final newMediaQueryData =
        MediaQuery.of(context).copyWith(textScaleFactor: scale);
    return MediaQuery(
      data: newMediaQueryData,
      child: Center(
        child: Text(
          "Hello world!",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
