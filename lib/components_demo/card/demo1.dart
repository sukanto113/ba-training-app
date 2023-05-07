import 'package:flutter/material.dart';

class CardDemo1 extends StatelessWidget {
  const CardDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Click Me!"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}