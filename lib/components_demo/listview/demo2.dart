import 'package:flutter/material.dart';

class ListviewDemo2 extends StatelessWidget {
  const ListviewDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 200,
          itemBuilder: (context, index) {
            return Text("data ${index + 1}");
          },
        ),
      ),
    );
  }
}
