import 'package:flutter/material.dart';

class RichTextDemo1 extends StatelessWidget {
  const RichTextDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: 'Hello '),
                TextSpan(
                    text: 'bold',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' world!'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
