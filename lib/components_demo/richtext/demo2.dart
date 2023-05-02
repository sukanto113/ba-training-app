// Demo of selectable rich text
import 'package:flutter/material.dart';

class RichTextDemo2 extends StatelessWidget {
  const RichTextDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SelectableText.rich(TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: 'Selectable '),
              TextSpan(
                text: 'bold',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' text!'),
            ],
          )),
        ),
      ),
    );
  }
}
