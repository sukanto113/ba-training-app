import 'package:flutter/material.dart';

class CenterDemo2 extends StatelessWidget {
  const CenterDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: const Center(
            widthFactor: 1,
            child: Text("Hello World!"),
          ),
        ),
      ),
    );
  }
}