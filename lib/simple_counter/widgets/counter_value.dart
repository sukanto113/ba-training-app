import 'package:flutter/material.dart';

class CounterValueWidget extends StatelessWidget {
  final int? value;
  const CounterValueWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    print("CounterValue build called. ${DateTime.now()}");
    return Text(
      '$value',
      style: const TextStyle(fontSize: 50),
    );
  }
}
