import 'package:flutter/material.dart';

class FittedBoxDemo1 extends StatelessWidget {
  const FittedBoxDemo1({super.key});

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
              fit: BoxFit.fill,
              // alignment: Alignment.bottomCenter,
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
