import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IconButtonDemo1 extends StatelessWidget {
  const IconButtonDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IconButton(
            onPressed: () {
              print("Clicked on icon button");
            },
            icon: const Icon(Icons.volume_up),
          ),
        ),
      ),
    );
  }
}
