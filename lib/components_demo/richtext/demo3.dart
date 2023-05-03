import 'package:flutter/material.dart';

class RichTextDemo3 extends StatelessWidget {
  const RichTextDemo3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: 'This is'),
                TextSpan(
                  text: ' blue',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(
                  text: ' red',
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(text: ' text'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
