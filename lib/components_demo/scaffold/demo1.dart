import 'package:flutter/material.dart';

class ScaffoldDemo1 extends StatelessWidget {
  const ScaffoldDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text("Hello World!"),
      ),
    );
  }
}