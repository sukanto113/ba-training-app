import 'package:flutter/material.dart';

class ContainerDemo1 extends StatelessWidget {
  const ContainerDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("App Bar")),
        body: Container(
          height: 48,
          width: 48,
          color: Colors.amber,
        ),
      ),
    );
  }
}
