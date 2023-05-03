import 'package:flutter/material.dart';

class SizeBoxDemo1 extends StatelessWidget {
  const SizeBoxDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 100,
          width: 100,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
