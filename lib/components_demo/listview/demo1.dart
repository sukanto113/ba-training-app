import 'package:flutter/material.dart';

class ListviewDemo1 extends StatelessWidget {
  const ListviewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: const [
            Text("item 1"),
            Text("item 2"),
            Text("item 3"),
            Text("item 4"),
            Text("item 5"),
            Text("item 6"),
            Text("item 7"),
            Text("item 8"),
            Text("item 9"),
            Text("item 10"),
          ],
        ),
      ),
    );
  }
}