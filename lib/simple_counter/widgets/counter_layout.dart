
import 'package:flutter/material.dart';

class CounterAppLayout extends StatelessWidget {
  const CounterAppLayout({
    super.key,
    required this.counterValue,
    required this.counterController,
  });

  final Widget counterValue;
  final Widget counterController;

  @override
  Widget build(BuildContext context) {
    print("CounterAppLayout build called. ${DateTime.now()}");

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        counterValue,
        const SizedBox(height: 20),
        counterController,
      ],
    );
  }
}
