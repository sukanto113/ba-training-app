import 'package:flutter/material.dart';

class FittedBoxDemo2 extends StatelessWidget {
  const FittedBoxDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 300,
            width: 200,
            color: Colors.grey,
            child: FittedBox(
              alignment: Alignment.bottomCenter,
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
