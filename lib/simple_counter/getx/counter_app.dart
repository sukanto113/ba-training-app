import 'package:get/get.dart';

import 'counter_controller.dart';
import 'package:ba_training_app/simple_counter/widgets/counter_controller.dart';
import 'package:ba_training_app/simple_counter/widgets/counter_layout.dart';
import 'package:ba_training_app/simple_counter/widgets/counter_value.dart';
import 'package:flutter/material.dart';

class GetXCounterAppDemo extends StatelessWidget {
  const GetXCounterAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: CounterWithGetX()),
      ),
    );
  }
}

class CounterWithGetX extends StatelessWidget {
  CounterWithGetX({super.key});
  final counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    // counterController.value.
    return CounterAppLayout(
      counterValue: Obx(
        () => CounterValueWidget(value: counterController.value.toInt()),
      ),
      counterController: CounterControllerWidget(
        onDecrementPressed: () {
          counterController.decrement();
        },
        onResetPressed: () {
          counterController.reset();
        },
        onIncrementPressed: () {
          counterController.increment();
        },
      ),
    );
  }
}
