import 'package:flutter/material.dart';

class ElevatedButtonDemo1 extends StatelessWidget {
  const ElevatedButtonDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Click Me!"),
          ),
        ),
      ),
    );
  }
}
