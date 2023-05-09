import 'package:flutter/material.dart';

class CircularProgressIndicatiorDemo1 extends StatelessWidget {
  const CircularProgressIndicatiorDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              CircularProgressIndicator(value: .7),
              SizedBox(height: 20),
              LinearProgressIndicator(),
              SizedBox(height: 20),
              LinearProgressIndicator(value: .7,),
            ],
          ),
        ),
      ),
    );
  }
}
