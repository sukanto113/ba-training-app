import 'package:flutter/material.dart';

class ScaffoldDemo3 extends StatelessWidget {
  const ScaffoldDemo3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("App Bar")),
        body: const Text("Hello World!"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
