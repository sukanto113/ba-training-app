import 'package:flutter/material.dart';

class ScaffoldDemo2 extends StatelessWidget {
  const ScaffoldDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("App Bar")),
        body: const Text("Hello World!"),
      ),
    );
  }
}