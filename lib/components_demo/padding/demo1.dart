import 'package:flutter/material.dart';

class PaddingDemo1 extends StatelessWidget {
  const PaddingDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 100,
          width: 100,
          color: Colors.red,
          padding: const EdgeInsets.all(10),
          child: const Text("Hello World"),
        ),
      ),
    );
  }
}
