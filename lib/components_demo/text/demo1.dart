// Demo of a selectable text.
import 'package:flutter/material.dart';

class TextDemo1 extends StatelessWidget {
  const TextDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SelectionArea(
            child: Text("Selectable text"),
          ),
        ),
      ),
    );
  }
}
