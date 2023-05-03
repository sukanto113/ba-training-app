import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RowDemo1 extends StatelessWidget {
  const RowDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Text("cell 1"),
            Text("cell 2"),
            Text("cell 3"),
          ],
        ),
      ),
    );
  }
}
