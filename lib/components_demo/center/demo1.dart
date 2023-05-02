import 'package:flutter/material.dart';

class CenterDemo1 extends StatelessWidget {
  const CenterDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Hello World!")),
      ),
    );
  }
}
