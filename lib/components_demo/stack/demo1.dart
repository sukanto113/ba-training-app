import 'package:flutter/material.dart';

class StackDemo1 extends StatelessWidget {
  const StackDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: SizedBox(
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  color: Colors.green,
                  child: const SizedBox(
                    width: 150,
                    height: 190,
                  ),
                ),
              ),
              const Positioned(
                left: 50,
                right: 50,
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
