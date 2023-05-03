import 'package:flutter/material.dart';

import '../widgets/counter_controller.dart';
import '../widgets/counter_layout.dart';
import '../widgets/counter_value.dart';


class SetStateCounterAppDemo extends StatelessWidget {
  const SetStateCounterAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: CounterWithSetState()),
      ),
    );
  }
}
class CounterWithSetState extends StatefulWidget {
  const CounterWithSetState({super.key});

  @override
  State<CounterWithSetState> createState() => _CounterWithSetStateState();
}

class _CounterWithSetStateState extends State<CounterWithSetState> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return CounterAppLayout(
      counterValue: CounterValueWidget(value: _value),
      counterController: CounterControllerWidget(
        onDecrementPressed: () {
          setState(() {
            _value--;
          });
        },
        onResetPressed: () {
          setState(() {
            _value = 0;
          });
        },
        onIncrementPressed: () {
          setState(() {
            _value++;
          });
        },
      ),
    );
  }
}
