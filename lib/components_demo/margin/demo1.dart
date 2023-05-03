import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MarginDemo1 extends StatelessWidget {
  const MarginDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 100,
          width: 100,
          color: Colors.red,
          margin: const EdgeInsets.all(20),
          child: const Text("Hello World"),
        ),
      ),
    );
  }
}
