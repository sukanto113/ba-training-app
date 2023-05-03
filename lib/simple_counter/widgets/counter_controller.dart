import 'package:flutter/material.dart';

class CounterControllerWidget extends StatelessWidget {
  final VoidCallback onDecrementPressed;
  final VoidCallback onResetPressed;
  final VoidCallback onIncrementPressed;

  const CounterControllerWidget({
    super.key,
    required this.onDecrementPressed,
    required this.onResetPressed,
    required this.onIncrementPressed,
  });

  @override
  Widget build(BuildContext context) {
    print("CounterController build called. ${DateTime.now()}");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onDecrementPressed,
          icon: const Icon(Icons.remove),
        ),
        IconButton(
          onPressed: onResetPressed,
          icon: const Icon(Icons.replay_outlined),
        ),
        IconButton(
          onPressed: onIncrementPressed,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
