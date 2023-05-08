import 'package:flutter/material.dart';

class AssetImageDemo1 extends StatelessWidget {
  const AssetImageDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            child: Image(
              image: AssetImage("images/pngegg.png"),
            ),
          ),
        ),
      ),
    );
  }
}
